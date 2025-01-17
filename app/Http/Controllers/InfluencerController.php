<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Hash;
use SebastianBergmann\CodeCoverage\Util\Percentage;
use Illuminate\Support\Facades\Validator;

class InfluencerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            $validator = Validator::make($input, [
                'refer_code' => 'required|unique:users,refer_code',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            unset($input['_token']);
            $is_already_exists = DB::table('users')->where('email', $input['email'])->orWhere('mobile', $input['mobile'])->select('id')->first();
            $input['type'] = 'influencer';
            $input['password'] =  Hash::make($input['password']);
            if ($is_already_exists) {
                DB::table('users')->where('id', $is_already_exists->id)->update($input);
            } else {
                $input['status'] = 1;

                $userid = DB::table('users')->insertGetId($input);

                # user balance
                $userbalance['user_id'] = $userid;
                DB::table('userbalance')->insert($userbalance);

                # user verify
                $userverify['userid'] = $userid;
                $userverify['email_verify'] = 1;
                $userverify['mobile_verify'] = 1;
                DB::table('user_verify')->insert($userverify);
            }

            return redirect()->route('influencer.view')->with('success', 'Successfully Added !');
        } else {
            return view('admin.influencer.add');
        }
    }

    public function view()
    {
        $collection = DB::table('users')->where('type','influencer')->get();
        return view('admin.influencer.view', compact('collection'));
    }

    public function edit(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            $validator = Validator::make($input, [
                'refer_code' => 'required|unique:users,refer_code,' . $id,
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            unset($input['_token']);
            $input['password'] =  Hash::make($input['password']);
            DB::table('users')->where('id', $id)->update($input);
            return redirect()->route('influencer.view')->with('success', 'Successfully Updated !');
        } else {
            $collection = DB::table('users')->where('id', $id)->first();
            return view('admin.influencer.edit', compact('collection'));
        }
    }

    public function deleteinfluencer(Request $request, $id)
    {
        $id = base64_decode($id);
        DB::table('users')->where('id', $id)->update(['type'=>NULL,'percentage'=>NULL]);
        return redirect()->back()->with('success', 'Successfully Deleted !');
    }
}
