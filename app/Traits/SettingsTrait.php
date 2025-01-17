<?php

namespace App\Traits;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use URL;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;
use Transliterator;
use Firebase;
use Push;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

include(app_path() . '/sendnotification/firebase.php');
include(app_path() . '/sendnotification/push.php');
trait SettingsTrait
{
    public static function settings($title)
    {
        $settingvalue = DB::table('settings')
            ->where('name', $title)
            ->first();
        return $settingvalue->value;
    }

    public static function getfantasy()
    {
        switch (true) {
            case Auth::user()->hasRole('superadmin'):
                $fantasy = DB::table('fantasy')->where('name', '!=', 'Stock')->get();
                break;

            case Auth::user()->hasRole('admin'):
                $fantasy = DB::table('fantasy')->where('status', 1)->where('name', '!=', 'Stock')->get();
                break;

            case Auth::user()->hasRole('cricket'):
                $fantasy = DB::table('fantasy')->where('name', 'Cricket')->get();
                break;

            case Auth::user()->hasRole('football'):
                $fantasy = DB::table('fantasy')->where('name', 'Football')->get();
                break;

            case Auth::user()->hasRole('basketball'):
                $fantasy = DB::table('fantasy')->where('name', 'Basketball')->get();
                break;

            case Auth::user()->hasRole('kabaddi'):
                $fantasy = DB::table('fantasy')->where('name', 'Kabaddi')->get();
                break;

            case Auth::user()->hasRole('stock'):
                $fantasy = DB::table('fantasy')->where('name', 'Stock')->get();
                break;

            default:
                abort(403, 'Unauthorized');
                break;
        }
        return $fantasy;
    }


    public static function logoUpload($file, $destinationPath, $filename)
    {
        $extension = $file->getClientOriginalExtension();
        $ext = array("png", "PNG", "jpg", 'jpeg', 'JPG', "JPEG");

        if (!in_array($extension, $ext)) {
            return false;
        }

        $resi = $destinationPath . '/' . $filename;
        $upload_success = $file->move($destinationPath, $filename);

        return $filename;
    }

    public static function sendTextSmsNew($otp, $mobile)
    {
        $mobile = str_replace('$$', ',', $mobile);
        $txtmsg = rawurlencode('Your secure otp is '.$otp.'. Please do not share your otp with anyone. Regards, '.env('APP_NAME'));
        $url = "http://sms.bulksmsserviceproviders.com/api/send_http.php?authkey=718d1067e29c468eb61abf38d1f402cd&mobiles=$mobile&message=$txtmsg&sender=AGFCPL&route=B";
        // $url = "http://sms.bulksmsserviceproviders.com/api/send_http.php?authkey=d56c3e523d660a27783cbc5ffe06f459&mobiles=$mobile&message=$txtmsg&sender=AGFCPL&route=B";
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_exec($ch);
        curl_close($ch);
    }

    public static function creditdebit($type)
    {
        $arr_cr = ['Add Fund Adjustments', 'Winning Adjustment', 'Signup Bonus', 'Email Bonus', 'Mobile Bonus', 'Pan Bonus', 'Bank Bonus', 'Aadhar Bonus', 'Refund', 'withdraw cancel', 'Influencer Bonus'];

        if (in_array($type, $arr_cr)) {
            return 'Credit';
        } else {
            return 'Debit';
        }
    }

    public static function total_amount_withdraw_in_week()
    {
        date_default_timezone_set('Asia/Kolkata');
        $data = DB::table('withdraw')
            ->whereBetween('created_at', [now()->subDays(6), now()])
            ->where('status', 1)
            ->get()
            ->groupBy(function ($val) {
                return \Carbon\Carbon::parse($val->created_at)->format('d M');
            });

        $start = now()->subDays(6);
        $today = now();

        while ($start <= $today) {
            $new_data[$start->format('d M')] = 0;

            $start = $start->addDays();
        }

        foreach ($data as $day => $value) {

            $new_data[$day] = $value->sum('amount');
        }
        return [array_keys($new_data), array_values($new_data)];
    }

    public static function total_amount_received_in_week()
    {
        // Set the timezone
        date_default_timezone_set('Asia/Kolkata');

        // Calculate date range for the last 7 days including today
        $start = now()->subDays(6);
        $today = now();

        // Initialize an array to hold the data for each date
        $new_data = [];
        while ($start <= $today) {
            $new_data[$start->format('M d')] = 0;
            $start = $start->addDay(); // Use addDay() instead of addDays(1)
        }
        // Query the database for payment data
        $data = DB::table('paymentprocess')
            ->whereBetween('created_at', [now()->subDays(6), now()])
            ->where('status', 'success')
            ->get();

        // Populate the $new_data array with sums of amounts for each date
        foreach ($data as $row) {
            $date = \Carbon\Carbon::parse($row->created_at)->format('M d');
            $new_data[$date] += $row->amount;
        }
        // dd(array_keys($new_data));
        // Return the array keys (dates) and values (total amounts)
        return [array_keys($new_data), array_values($new_data)];
    }

    public static function sendnotification($title, $message, $include_image, $push_type, $users)
    {
        $firebase = new Firebase();
        $push = new Push();
        $payload = array();
        $push->setTitle($title);
        $push->setMessage($message);
        if ($include_image != "") {
            $push->setImage('http://api.androidhive.info/images/minion.jpg');
        } else {
            $push->setImage('');
        }
        $push->setIsBackground(FALSE);
        $push->setPayload($payload);
        $push->setNotificationType('');
        $json = '';
        $response = '';
        if ($push_type == 'All') {
            $json = $push->getPush();
            $response = $firebase->sendToTopic('All', $json);
        } else if ($push_type == 'individual') {
            $regarray = array();
            $findappids = DB::table('devicetoken')->whereIn('userid', $users)->get();
            if (!empty($findappids)) {
                foreach ($findappids as $app) {
                    $regarray[] = $app->device_token;
                }
            }
            $json = $push->getPush();
            $response = $firebase->sendMultiple($regarray, $json);
        }
    }

    public static function awardBonus($userID, $type)
    {
        $User = User::find($userID);
        $checkbonus = DB::table('user_verify')->where('userid', $userID)->where(str_replace('_', '', $type), 1)->first();
        if ($User && empty($checkbonus)) {
            $Wintype = DB::table('generaltabs')->where('type', $type)->first();
            if ($Wintype->amount != 0) {
                $currentbalance = DB::table('userbalance')->where('user_id', $userID)->first();
                $userrbal = [];
                $userrbal['bonus'] = $currentbalance->bonus + $Wintype->amount;
                DB::table('userbalance')->where('user_id', $userID)->update($userrbal);
                if ($type != 'refer_bonus') {
                    DB::table('user_verify')->where('userid', $userID)->update([str_replace('_', '', $type) => 1]);
                }
                $tdataa['paymentstatus'] = 'confirmed';
                $tdataa['created_at'] = date('Y-m-d H:i:s');
                $tdataa['transaction_id'] = (SettingsTrait::settings('short_name') ?? '') . '-EBONUS-' . time() . $userID . '-' . mt_rand(1000, 9999);
                $tdataa['transaction_by'] = (SettingsTrait::settings('short_name') ?? '') . '';
                $tdataa['amount'] = $Wintype->amount;
                $tdataa['bonus_amt'] = $Wintype->amount;
                $tdataa['bal_bonus_amt'] = $userrbal['bonus'];
                $tdataa['bal_fund_amt'] = $currentbalance->balance;
                $tdataa['bal_win_amt'] = $currentbalance->winning;
                $tdataa['total_available_amt'] = $userrbal['bonus'] + $currentbalance->balance + $currentbalance->winning;
                $tdataa['userid'] = $userID;
                $tdataa['type'] = ucwords(str_replace('_', ' ', $type));
                DB::table('transactions')->insert($tdataa);
                $Notification['userid'] = $userID;
                $Notification['title'] = 'You have got ₹' . $Wintype->amount . ' for ' . $tdataa['type'] . '.';
                DB::table('notifications')->insert($Notification);
                $explodearray[] = $userID;
                $referralBonusAmount = $Wintype->amount;
                $data['subject'] = "💰 {$Wintype->name} Added to Wallet";
                $data['content'] = "🎉 Congratulations! You've received a {$Wintype->name} of ₹ {$referralBonusAmount} in your wallet. Enjoy your rewards! 💸";
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            }
        }
    }

    public static function sortBySubArrayValue(&$array, $key, $dir = 'asc')
    {

        $sorter = array();
        $rebuilt = array();
        reset($array);
        foreach ($array as $ii => $value) {
            $sorter[$ii] = $value[$key];
        }

        if ($dir == 'asc') asort($sorter);
        if ($dir == 'desc') arsort($sorter);

        foreach ($sorter as $ii => $value) {
            $rebuilt[$ii] = $array[$ii];
        }
        $array = $rebuilt;
    }
}
