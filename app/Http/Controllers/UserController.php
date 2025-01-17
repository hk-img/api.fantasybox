<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Traits\SettingsTrait;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view(Request $request)
    {
        $collection = DB::table('users')->join('user_verify', 'user_verify.userid', '=', 'users.id')->select('users.*', 'user_verify.mobile_verify', 'user_verify.mobile_verify', 'user_verify.email_verify', 'user_verify.pan_verify', 'user_verify.bank_verify', 'user_verify.aadhar_verify')->get()->skip(7);
        return view('admin.user.viewusers', compact('collection'));
    }

    public function edit(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {

            $input = $request->all();
            $validator = Validator::make($input, [
                'mobile' => 'required|unique:users,mobile,' . $id,
                'email' => 'required|unique:users,email,' . $id,
                'refer_code' => 'required|unique:users,refer_code,' . $id,
                'team' => 'required|unique:users,team,' . $id,
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            if ($input['type'] == NULL) {
                $input['percentage'] = NULL;
            }
            if (!empty($request->image)) {
                $image = $request->image;
                $destination = public_path('/users/profile/');
                $filename = 'USER' . Auth::user()->id . '.png';
                $info = pathinfo($filename);
                $imageNamee = $info['filename'];
                $newfilename = $imageNamee . Auth::user()->id . time() . "." . $info['extension'];
                $image->move($destination, $newfilename);
                $request->user()->image = asset('public/users/profile/' . $newfilename);
                $input['image'] = asset('public/users/profile/' . $newfilename);
            }
            unset($input['_token']);
            DB::table('users')->where('id', $id)->update($input);
            return redirect()->route('user.view')->with('success', 'Successfully Updated !');
        } else {
            $collection = DB::table('users')->where('id', $id)->first();
            return view('admin.user.edituser', compact('collection'));
        }
    }

    public function actdect(Request $request, $id)
    {
        $id = base64_decode($id);
        $find = DB::table('users')->where('id', $id)->first();

        if (!empty($find)) {
            if ($find->status == 1) {
                DB::table('users')->where('id', $id)->update(['status' => 0]);
                $explodearray[] = $id;
                $data['subject'] = '🚫 User Blocked Successfully 🚫';
                $data['content'] = '🛑 You have been blocked from accessing certain features of the app. If you have any questions or concerns, please contact our support team. 📞';
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

                return redirect()->back()->with('error', 'Successfully Blocked');
            } else {
                DB::table('users')->where('id', $id)->update(['status' => 1]);
                $explodearray[] = $id;
                $data['subject'] = '✅ User Unblocked Successfully';
                $data['content'] = '🎉 Good news! You have been unblocked and can now access all features of the app again. If you have any questions or concerns, please contact our support team. 📞';
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

                return redirect()->back()->with('success', 'Successfully UnBlocked');
            }
        }
    }

    public function viewallreferal(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('users')->join('user_verify', 'user_verify.userid', '=', 'users.id')->where('refer_id', $id)->select('users.*', 'user_verify.mobile_verify', 'user_verify.mobile_verify', 'user_verify.email_verify', 'user_verify.pan_verify', 'user_verify.bank_verify', 'user_verify.aadhar_verify')->get()->skip(7);
        return view('admin.user.viewallreferal', compact('collection'));
    }

    public function viewtransaction(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('transactions')->where('userid', $id)->get();
        return view('admin.user.viewtransaction', compact('collection'));
    }

    public function getuserdetail(Request $request, $id)
    {
        $id = base64_decode($id);
        $collection = DB::table('users')->where('id', $id)->first();
        $pancard = DB::table('pancard')->where('userid', $id)->first();
        $aadharcard = DB::table('aadharcard')->where('userid', $id)->first();
        $bank = DB::table('bank')->where('userid', $id)->first();
        $userbalance = DB::table('userbalance')->where('user_id', $id)->first();
        return view('admin.user.getuserdetail', compact('collection', 'pancard', 'aadharcard', 'bank', 'userbalance'));
    }

    public function userswallet(Request $request)
    {
        $balances = DB::table('userbalance')
            ->selectRaw('SUM(balance) as total_balance, SUM(winning) as total_winning, SUM(bonus) as total_bonus')
            ->first();
        $collection = DB::table('users')->join('userbalance', 'userbalance.user_id', '=', 'users.id')->select('users.*', 'userbalance.balance', 'userbalance.winning', 'userbalance.bonus')->get();
        return view('admin.user.userswallet', compact('collection', 'balances'));
    }

    public function adminwallet(Request $request)
    {
        $collection = DB::table('adminwallets')->join('users', 'adminwallets.userid', '=', 'users.id')->select('adminwallets.*', 'users.team', 'users.email', 'users.mobile')->get();
        return view('admin.user.adminwallet', compact('collection'));
    }

    public function addadminwallet(Request $request)
    {
        $collection = DB::table('users')->get();
        return view('admin.user.addadminwallet', compact('collection'));
    }

    public function creditamount(Request $request)
    {
        $input = $request->all();
        $finduserbalanace = DB::table('userbalance')->where('user_id', $input['userid'])->first();
        $bonusbal = $finduserbalanace->bonus;
        $balancebal = $finduserbalanace->balance;
        $winningbal = $finduserbalanace->winning;
        unset($input['_token']);
        if (($input['type'] == 'add_fund')) {
            $balancebal += $input['amount'];
            $transactiondata['addfund_amt'] = $input['amount'];
        } else if (($input['type'] == 'bonus')) {
            $bonusbal += $input['amount'];
            $transactiondata['bonus_amt'] = $input['amount'];
        } else {
            $winningbal += $input['amount'];
            $transactiondata['win_amt'] = $input['amount'];
        }
        $update['bonus'] = $bonusbal;
        $update['balance'] = $balancebal;
        $update['winning'] = $winningbal;
        $nowtotalbal = $bonusbal + $balancebal + $winningbal;
        $input['moneytype'] = 'addmoney';
        DB::table('userbalance')->where('user_id', $input['userid'])->update($update);
        DB::table('adminwallets')->insert($input);
        //entry in transactions//
        $getlasttransactionid = DB::table('transactions')->select('id')->orderBy('id', 'DESC')->first();
        if (!empty($getlasttransactionid)) {
            $tid = $getlasttransactionid->id + 1;
        } else {
            $tid = 1;
        }
        if (($input['type'] == 'add_fund')) {
            $transactiondata['type'] = 'Add Fund Adjustments';
        } else if (($input['type'] == 'bonus')) {
            $transactiondata['type'] = 'Bonus Adjustments';
        } else {
            $transactiondata['type'] = 'Winning Adjustment';
        }
        $transactiondata['amount'] = $input['amount'];
        $transactiondata['total_available_amt'] = $nowtotalbal;
        $transactiondata['transaction_id'] = (SettingsTrait::settings('short_name') ?? '') . '-' . $tid . time();
        $transactiondata['transaction_by'] = SettingsTrait::settings('short_name');
        $transactiondata['userid'] = $input['userid'];
        $transactiondata['paymentstatus'] = 'confirmed';
        $transactiondata['bal_bonus_amt'] = $bonusbal;
        $transactiondata['bal_win_amt'] = $winningbal;
        $transactiondata['bal_fund_amt'] = $balancebal;
        DB::table('transactions')->insert($transactiondata);
        $data21['userid'] = $input['userid'];
        $data21['seen'] = 0;
        $data21['title'] = '₹' . $input['amount'] . ' has been added to your wallet successfully.';
        DB::table('notifications')->insert($data21);
        $explodearray[] = $input['userid'];
        $amountAdded = $input['amount'];
        $data['subject'] = '💰 Money Added to Wallet';
        $data['content'] = "🎉 You've received ₹ {$amountAdded} in your wallet!\n\nYour wallet has been topped up successfully.";
        SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

        DB::commit();
        return redirect()->back()->with('success', 'Money has been successfully transferred to user wallet');
    }

    public function debitamount(Request $request)
    {
        $input = $request->all();
        $finduserbalanace = DB::table('userbalance')->where('user_id', $input['userid'])->first();
        $bonusbal = $finduserbalanace->bonus;
        $balancebal = $finduserbalanace->balance;
        $winningbal = $finduserbalanace->winning;
        unset($input['_token']);
        if (($input['type'] == 'add_fund')) {
            if ($balancebal < $input['amount']) {
                return redirect()->back()->with('error', 'You can debit only ' . $balancebal);
            }
            $balancebal -= $input['amount'];
            $transactiondata['addfund_amt'] = $input['amount'];
        } else if (($input['type'] == 'bonus')) {
            if ($bonusbal < $input['amount']) {
                return redirect()->back()->with('error', 'You can debit only ' . $bonusbal);
            }
            $bonusbal -= $input['amount'];
            $transactiondata['bonus_amt'] = $input['amount'];
        } else {
            if ($winningbal < $input['amount']) {
                return redirect()->back()->with('error', 'You can debit only ' . $winningbal);
            }
            $winningbal -= $input['amount'];
            $transactiondata['win_amt'] = $input['amount'];
        }
        $update['bonus'] = $bonusbal;
        $update['balance'] = $balancebal;
        $update['winning'] = $winningbal;
        $nowtotalbal = $bonusbal + $balancebal + $winningbal;
        $input['moneytype'] = 'deductmoney';
        DB::table('userbalance')->where('user_id', $input['userid'])->update($update);
        DB::table('adminwallets')->insert($input);
        //entry in transactions//
        $getlasttransactionid = DB::table('transactions')->select('id')->orderBy('id', 'DESC')->first();
        if (!empty($getlasttransactionid)) {
            $tid = $getlasttransactionid->id + 1;
        } else {
            $tid = 1;
        }
        if (($input['type'] == 'add_fund')) {
            $transactiondata['type'] = 'Deduct Fund';
        } else if (($input['type'] == 'bonus')) {
            $transactiondata['type'] = 'Deduct From Bonus';
        } else {
            $transactiondata['type'] = 'Deduct From Winning';
        }
        $transactiondata['amount'] = $input['amount'];
        $transactiondata['total_available_amt'] = $nowtotalbal;
        $transactiondata['transaction_id'] = (SettingsTrait::settings('short_name') ?? '') . '-' . $tid . time();
        $transactiondata['transaction_by'] = SettingsTrait::settings('short_name');
        $transactiondata['userid'] = $input['userid'];
        $transactiondata['paymentstatus'] = 'confirmed';
        $transactiondata['bal_bonus_amt'] = $bonusbal;
        $transactiondata['bal_win_amt'] = $winningbal;
        $transactiondata['bal_fund_amt'] = $balancebal;
        DB::table('transactions')->insert($transactiondata);
        $data21['userid'] = $input['userid'];
        $data21['seen'] = 0;
        $data21['title'] = '₹' . $input['amount'] . ' has been debited to your wallet successfully.';
        DB::table('notifications')->insert($data21);
        $explodearray[] = $input['userid'];
        $amountDebited = $input['amount'];
        $data['subject'] = '💳 Debit from Wallet';
        $data['content'] = "💸 ₹ {$amountDebited} has been debited from your wallet.\n\nYour wallet has been updated accordingly.";
        SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

        DB::commit();
        return redirect()->back()->with('success', 'Money has been successfully deducted to user wallet');
    }
}
