<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Traits\MailTrait;
use App\Traits\SettingsTrait;
use App\Models\User;
use App\Models\Devicetoken;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            if ($request->type == 'specific') {
                if (empty($input['uservalues'])) {
                    return redirect()->back()->with('error', 'Please select users');
                }
                $explodearray = explode(',', $input['uservalues']);
                if (!empty($explodearray)) {
                    foreach ($explodearray as $earray) {
                        $finduseremail = User::where('id', $earray)->select('email')->first();
                        if (!empty($finduseremail)) {
                            if (!empty($finduseremail->email)) {
                                $data['email'] = $finduseremail->email;
                                $data['subject'] = $request->title;
                                $data['content'] = MailTrait::commonmailformat($request->message, env('APP_NAME'));
                                MailTrait::mailSmtpSend($data);
                            }
                        }
                    }
                }
            } else {
                $alluser = User::get();
                foreach ($alluser as $user) {
                    $data['email'] = $user->email;
                    $data['subject'] = $request->title;
                    $data['content'] = MailTrait::createEmailTemplate($request->message, env('APP_NAME'));
                    MailTrait::mailSmtpSend($data);
                }
            }
            return redirect()->back()->with('success', 'Email Sent Successfully !');
        } else {
            return view('admin.notification.mailnotification');
        }
    }

    public function appnotification(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            if ($request->type == 'specific') {
                if (empty($input['uservalues'])) {
                    return redirect()->back()->with('error', 'Please select users');
                }
                $explodearray = explode(',', $input['uservalues']);
                $data['subject'] = $request->title;
                $data['content'] = $request->message;
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
            } else {
                $data['subject'] = $request->title;
                $data['content'] = $request->message;
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'All', '');
            }
            return redirect()->back()->with('success', 'App Notification Sent Successfully !');
        } else {
            $users = DB::table('users')->get();
            return view('admin.notification.appnotification', compact('users'));
        }
    }

    public function getusers(Request $request)
    {
        $gettypevalue = "";
        if (isset($_POST['gettypevalue'])) {
            $gettypevalue = $_POST['gettypevalue'];
            $getusers = explode(',', $_POST['userspresent']);
        }
        $qy = DB::table('users');
        $findusers = $qy->whereNOTIn('id', $getusers)->where(function ($query) use ($gettypevalue) {
            $query->where('username', 'LIKE', '%' . $gettypevalue . '%')->orwhere('team', 'LIKE', '%' . $gettypevalue . '%')->orwhere('email', 'LIKE', '%' . $gettypevalue . '%');
        })->get();
        $option = "";
        $i = 0;
        if (!empty($findusers)) {
            foreach ($findusers as $user) {
                $showname = '<div class="d-flex bg-white shadow rounded p-2 my-2 mx-0 align-items-center"><div class="col-auto fs-35 pr-0"><i class="bi bi-person-fill" style="font-size: 22px;padding: 10px;"></i></div><div class="col"><div class="row"><div class="col-12 text-warning pr-0 font-weight-bold"> ' . $user->username . '  ' . $user->team . ' </div> ' . ' <div class="col-12 bg-text fs-13"> ' . $user->email . ' </div></div></div><div class="col-auto fs-30 pr-0"><i class="bi bi-patch-plus-fill text-success" style="font-size: 22px"></i><i onclick="deletediv(this,' . $user->id . ')" class="fal bi bi-patch-minus-fill text-danger" style="font-size: 22px"></i></div></div>';
                $option .= '<li class="pointer" onclick="set_item(' . $user->id . ')" id="userid' . $user->id . '">' . $showname . '</li>';
                $i++;
            }
        }
        echo $option;
        die;
    }
}
