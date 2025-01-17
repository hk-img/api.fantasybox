<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\SettingsTrait;
use App\Traits\MailTrait;

class VerificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function viewpan(Request $request)
    {
        if (isset($request->status)) {
            $status = $request->status;
        } else {
            $status = 0;
        }
        $collection = DB::table('pancard')->join('users', 'users.id', '=', 'pancard.userid')->select(
            'pancard.*',
            'users.id as uid',
            'users.email',
            'users.mobile'
        )->where('pancard.status', $status)->get();
        return view('admin.verification.panview', compact('collection'));
    }

    public function editpan(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('pancard')->where('id', $id)->first();
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $input['status'] = -1;
            DB::table('user_verify')->where('userid', $collection->userid)->update(['pan_verify' => 2]);
            DB::table('pancard')->where('id', $id)->update($input);
            $userdetail = User::where('id', $collection->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Pancard Rejected -' . env('APP_NAME');
            $data['content'] = MailTrait::documentreject('Pancard', $input['comment'], env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $collection->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '❌ PAN Card Document Rejected ❌';
            $data['content'] = "Dear {$appName} User,

We regret to inform you that your PAN card document has been rejected due to the following reason:

{$input['comment']}

Please review your submission and make the necessary corrections. If you believe this is in error or need further assistance, please contact our support team.

Thank you for using {$appName}.";

            $test = SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('error', 'Successfully Rejected !');
        } else {
            return view('admin.verification.editpan', compact('collection'));
        }
    }

    public function approvepan(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('pancard')->where('id', $id)->first();

        if (!empty($find)) {
            DB::table('user_verify')->where('userid', $find->userid)->update(['pan_verify' => 1]);
            SettingsTrait::awardBonus($find->userid, 'pan_bonus');
            DB::table('pancard')->where('id', $id)->update(['status' => 1, 'comment' => NULL]);
            $userdetail = User::where('id', $find->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Pancard Approved -' . env('APP_NAME');
            $data['content'] = MailTrait::documentapprove('Pancard', env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '✔️ PAN Card Document Approved ✔️';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that your PAN card document has been approved .

Thank you for your submission. If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Approved');
        }
    }

    public function viewbank(Request $request)
    {
        if (isset($request->status)) {
            $status = $request->status;
        } else {
            $status = 0;
        }
        $collection = DB::table('bank')->join('users', 'users.id', '=', 'bank.userid')->select(
            'bank.*',
            'users.id as uid',
            'users.email',
            'users.mobile'
        )->where('bank.status', $status)->get();
        return view('admin.verification.bankview', compact('collection'));
    }

    public function editbank(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('bank')->where('id', $id)->first();
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $input['status'] = -1;
            DB::table('user_verify')->where('userid', $collection->userid)->update(['bank_verify' => 2]);
            DB::table('bank')->where('id', $id)->update($input);
            $userdetail = User::where('id', $collection->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Bank Detail Rejected -' . env('APP_NAME');
            $data['content'] = MailTrait::documentreject('Bank', $input['comment'], env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $collection->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '❌ Bank Account Document Rejected ❌';
            $data['content'] = "Dear {$appName} User,

We regret to inform you that your Bank Account document has been rejected due to the following reason:

{$input['comment']}

Please review your submission and make the necessary corrections. If you believe this is in error or need further assistance, please contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('error', 'Successfully Rejected !');
        } else {
            return view('admin.verification.editbank', compact('collection'));
        }
    }

    public function approvebank(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('bank')->where('id', $id)->first();
        if (!empty($find)) {
            DB::table('user_verify')->where('userid', $find->userid)->update(['bank_verify' => 1]);
            SettingsTrait::awardBonus($find->userid, 'bank_bonus');
            DB::table('bank')->where('id', $id)->update(['status' => 1, 'comment' => NULL]);
            $userdetail = User::where('id', $find->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Bank Approved -' . env('APP_NAME');
            $data['content'] = MailTrait::documentapprove('Bank', env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '✔️ Bank Account Document Approved ✔️';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that your Bank Account Document has been approved .

Thank you for your submission. If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Approved');
        }
    }

    public function viewaadhar(Request $request)
    {
        if (isset($request->status)) {
            $status = $request->status;
        } else {
            $status = 0;
        }
        $collection = DB::table('aadharcard')->join('users', 'users.id', '=', 'aadharcard.userid')->select(
            'aadharcard.*',
            'users.id as uid',
            'users.email',
            'users.mobile'
        )->where('aadharcard.status', $status)->get();
        return view('admin.verification.aadharview', compact('collection'));
    }

    public function editaadhar(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('aadharcard')->where('id', $id)->first();
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $input['status'] = -1;
            DB::table('user_verify')->where('userid', $collection->userid)->update(['aadhar_verify' => 2]);
            DB::table('aadharcard')->where('id', $id)->update($input);
            $userdetail = User::where('id', $collection->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Aadhar Card Rejected -' . env('APP_NAME');
            $data['content'] = MailTrait::documentreject('Aadhar Card', $input['comment'], env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $collection->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '❌ Aadhar Card Document Rejected ❌';
            $data['content'] = "Dear {$appName} User,

We regret to inform you that your Aadhar card document has been rejected due to the following reason:

{$input['comment']}

Please review your submission and make the necessary corrections. If you believe this is in error or need further assistance, please contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('error', 'Successfully Rejected !');
        } else {
            return view('admin.verification.editaadhar', compact('collection'));
        }
    }

    public function approveaadhar(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('aadharcard')->where('id', $id)->first();

        if (!empty($find)) {
            DB::table('user_verify')->where('userid', $find->userid)->update(['aadhar_verify' => 1]);
            SettingsTrait::awardBonus($find->userid, 'aadhar_bonus');
            DB::table('aadharcard')->where('id', $id)->update(['status' => 1, 'comment' => NULL]);
            $userdetail = User::where('id', $find->userid)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Aadhar Card Approved -' . env('APP_NAME');
            $data['content'] = MailTrait::documentapprove('Aadhar Card', env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '✔️ Aadhar Card Document Approved ✔️';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that your Aadhar card document has been approved .

Thank you for your submission. If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Approved');
        }
    }

    public function receivedfund(Request $request)
    {
        if (isset($request->status)) {
            $status = $request->status;
        } else {
            $status = 'success';
        }
        if ($status == 'pending') {
            $collection = DB::table('paymentprocess')->join('users', 'users.id', '=', 'paymentprocess.userid')->select(
                'paymentprocess.*',
                'users.id as uid',
                'users.email',
                'users.mobile'
            )->where('paymentprocess.status', $status)->where('returnid', '!=', NULL)->get();
        } else {
            $collection = DB::table('paymentprocess')->join('users', 'users.id', '=', 'paymentprocess.userid')->select(
                'paymentprocess.*',
                'users.id as uid',
                'users.email',
                'users.mobile'
            )->where('paymentprocess.status', $status)->get();
        }
        return view('admin.verification.receivedfund', compact('collection'));
    }

    public function viewwithdrawal(Request $request)
    {
        if (isset($request->status)) {
            $status = $request->status;
        } else {
            $status = 0;
        }
        $collection = DB::table('withdraw')->join('users', 'users.id', '=', 'withdraw.user_id')->select(
            'withdraw.*',
            'users.id as uid',
            'users.email',
            'users.mobile'
        )->where('withdraw.status', $status)->get();
        return view('admin.verification.withdrawalview', compact('collection'));
    }

    public function approvewithdrawal(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('withdraw')->where('id', $id)->first();

        if (!empty($find)) {
            DB::table('withdraw')->where('id', $id)->update(['status' => 1]);
            $userdetail = User::where('id', $find->user_id)->first();
            $data['email'] = $userdetail->email;
            $data['subject'] = 'Withdraw Request Approved- ' . env('APP_NAME');
            $content = 'Your ₹ ' . $find->amount . ' Request Approved Successfully. Your Amount Transferred to Linked Bank Account. <br><span style="color:red">Please note that if the amount is not credited to your bank account, it may take 5-7 working days.</span>';
            $data['content'] = MailTrait::commonmailformat($content, env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->user_id;
            $appName = env('APP_NAME');

            $data['subject'] = '✔️ Withdraw Request Approved ✔️';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that Your ₹ $find->amount Request Approved Successfully. Your Amount Transferred to Linked Bank Account. Please note that if the amount is not credited to your bank account, it may take 5-7 working days.' .

If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Approved');
        }
    }

    public function rejectwithdrawal(Request $request)
    {
        $id = $request->withid;
        $find = DB::table('withdraw')->where('id', $id)->first();
        if (!empty($find)) {
            $datas['comment'] = $request->comment;
            $datas['approved_date'] = date('Y-m-d');
            $datas['status'] = -1;
            $uid = $find->user_id;
            $amount = $find->amount;
            DB::table('withdraw')->where('id', $id)->update($datas);
            $finduserdetails = DB::table('users')->where('id', $uid)->first();
            $currentwinning = DB::table('userbalance')->where('user_id', $uid)->first();
            $userrbal = [];
            $userrbal['winning'] = $currentwinning->winning + $amount;
            DB::table('userbalance')->where('user_id', $uid)->update($userrbal);
            $tdataa['paymentstatus'] = 'Cancel';
            $tdataa['created_at'] = date('Y-m-d H:i:s');
            $tdataa['transaction_id'] = (SettingsTrait::settings('short_name') ?? '') . '-Cancel-' . time();
            $tdataa['transaction_by'] = (SettingsTrait::settings('short_name') ?? '') . '';
            $tdataa['amount'] = $amount;
            $tdataa['win_amt'] = $amount;
            $tdataa['bal_win_amt'] = $userrbal['winning'];
            $tdataa['bal_fund_amt'] = $currentwinning->balance;
            $tdataa['bal_bonus_amt'] = $currentwinning->bonus;
            $tdataa['total_available_amt'] = $userrbal['winning'] + $currentwinning->balance + $currentwinning->bonus;
            $tdataa['userid'] = $uid;
            $tdataa['type'] = 'withdraw cancel';
            $findtransactiondetails = DB::table('transactions')->insert($tdataa);
            $data['email'] = $finduserdetails->email;
            $data['subject'] = 'Withdraw Request Rejected - ' . env('APP_NAME');
            $content = 'Your withdrawal request of ₹ ' . $amount . ' has been canceled and the amount has been returned to your wallet. <br><span style="color:red">For Reason: </span>' . $datas['comment'];
            $data['content'] = MailTrait::commonmailformat($content, env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->user_id;
            $appName = env('APP_NAME');

            $data['subject'] = '❌ Withdraw Request Rejected ❌';
            $data['content'] = "Dear {$appName} User,

We regret to inform you that Your withdrawal request of ₹ $amount has been canceled and the amount has been returned to your wallet. The following reason:

{$datas['comment']}

If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Rejected');
        }
    }


    public function approveManualAdd(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('paymentprocess')->where('id', $id)->where('status', 'pending')->first();
        if (!empty($find)) {
            DB::table('paymentprocess')->where('id', $id)->update(['status' => 'success']);
            $finduserdetails = DB::table('users')->where('id', $find->userid)->first();
            $currentbalance = DB::table('userbalance')->where('user_id', $find->userid)->first();
            $userrbal = [];
            $userrbal['balance'] = $currentbalance->balance + $find->amount;
            DB::table('userbalance')->where('user_id', $find->userid)->update($userrbal);

            $trdata = array();
            $trdata['type'] = 'Cash added';
            $txnid = $find->orderid;
            $trdata['transaction_id'] = $txnid;
            $trdata['userid'] = $find->userid;
            $trdata['amount'] = $find->amount;
            $trdata['addfund_amt'] = $find->amount;
            $trdata['bal_fund_amt'] = $userrbal['balance'];
            $trdata['bal_win_amt'] = $currentbalance->winning;
            $trdata['bal_bonus_amt'] = $currentbalance->bonus;
            $trdata['total_available_amt'] = $userrbal['balance'] + $currentbalance->winning + $currentbalance->bonus;
            $trdata['transaction_by'] = $find->paymentmethod;
            $trdata['paymentstatus'] = 'confirmed';
            DB::table('transactions')->insert($trdata);

            $data['email'] = $finduserdetails->email;
            $data['subject'] = 'Add Money Request Approved- ' . env('APP_NAME');
            $content = 'Your ₹ ' . $find->amount . ' Request Approved Successfully. Your Amount Added to Your Wallet. <br><span style="color:red">Please note that if the amount is not credited to your Wallet, it may take 12 Hour.</span>';
            $data['content'] = MailTrait::commonmailformat($content, env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '✔️ Add Money Request Approved ✔️';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that Your ₹ $find->amount Request Approved Successfully. Your Amount Transferred to Your Wallet. Please note that if the amount is not credited to your bank account, it may take 12 Hours.' .

If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Approved');
        }
    }

    public function rejectManualAdd(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('paymentprocess')->where('id', $id)->where('status', 'pending')->first();
        if (!empty($find)) {
            DB::table('paymentprocess')->where('id', $id)->update(['status' => 'failed']);
            $finduserdetails = DB::table('users')->where('id', $find->userid)->first();

            $data['email'] = $finduserdetails->email;
            $data['subject'] = 'Add Money Request Rejected- ' . env('APP_NAME');
            $content = 'Your ₹ ' . $find->amount . ' Request Rejected Successfully. Your Details are Incorrect.';
            $data['content'] = MailTrait::commonmailformat($content, env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            $explodearray[] = $find->userid;
            $appName = env('APP_NAME');

            $data['subject'] = '❌ Add Money Request Rejected ❌';
            $data['content'] = "Dear {$appName} User,

We are pleased to inform you that Your ₹ $find->amount Request Rejected Successfully. Yout Details are Incorrect' .

If you have any further questions or need assistance, please don't hesitate to contact our support team.

Thank you for using {$appName}.";

            SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            return redirect()->back()->with('success', 'Successfully Rejected');
        }
    }


}
