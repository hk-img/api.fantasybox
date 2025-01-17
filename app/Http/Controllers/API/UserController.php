<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Http\JsonResponse;
use DB;
use App\Models\Userverify;
use App\Models\Userbalance;
use App\Traits\SettingsTrait;
use Illuminate\Support\Facades\Http;
use App\Traits\MailTrait;
use PDF;
use Razorpay\Api\Api;
use Session;

class UserController extends BaseController
{
    public function __construct()
    {
        $this->middleware('checkBlocked');
    }

    public function getApp(Request $request)
    {
        $india_states = [
            "Andhra Pradesh",
            "Assam",
            "Nagaland",
            "Orissa",
            "Odisha",
            "Sikkim",
            "Telangana",
        ];

        if (isset($request->country) && $request->country != "India") {
            return $this->sendError('You are in 🌍 fantasy gaming banned Country 🚫 ' . $request->country, '', 201);
        }

        if (isset($request->state) && in_array($request->state, $india_states)) {
            return $this->sendError('You are in 🌍 fantasy gaming banned state 🚫 ' . $request->state, '', 201);
        }

        $signup_bonus = DB::table('generaltabs')->where('type', 'signup_bonus')->first();
        $refer_bonus = DB::table('generaltabs')->where('type', 'refer_bonus')->first();
        $data['appstatus'] = SettingsTrait::settings('app_status');
        $data['androidversion'] = 1;
        $data['referurl'] = env('APP_URL') . "download/%REFERCODE% ";
        $data['apkname'] = env('APP_NAME') . '.apk';
        $data['androidappurl'] = env('APP_URL') . "download/" . $data['apkname'];
        $data['refermessage'] = '🎉 Refer and Earn Rewards!  🎉 Refer a friend and earn ₹ ' . $refer_bonus->amount . ' for the referrer, and the referred user receives ₹ ' . $signup_bonus->amount . ' upon downloading using this link: ' . $data['referurl'] . '.Don\'t forget to use the referral code: %REFERCODE% .';
        $data['contestsharemessage'] = "⚔️ %TeamName% challenged you for a fantasy contest in %Team1% vs %Team2% match on %AppName%. Visit for Android 📱: %url_share%" . " to accept the challenge. 🏆 Alternatively, you can also copy code %inviteCode% to join the contest. 🚀 ";
        $data['minwithdraw'] = 100;
        $data['maxwithdraw'] = 25000;
        $data['refer_bonus'] = $refer_bonus->amount;
        $data['signup_bonus'] = $signup_bonus->amount;
        $data['minadd'] = 1;
        $data['supportmobile'] = '+91 9999999999';
        $data['supportemail'] = 'Abcdef@gmail.com';
        $data['updationmessage'] = '1. UI Changes 
                                    2. Bug Fixes';
        $allbanner = DB::table('banner')->get();
        $activegmaes = DB::table('fantasy')->where('status', 1)->get();
        $j = 0;
        foreach ($activegmaes as $game) {
            $data['games'][$j]['gameid'] = $game->id;
            $data['games'][$j]['name'] = $game->name;
            $data['games'][$j]['image'] = asset('public/settings/' . $game->image);
            $data['games'][$j]['status'] = $game->status;
            $j++;
        }

        $i = 0;
        foreach ($allbanner as $banner) {
            $data['banner'][$i]['url'] = $banner->url;
            $data['banner'][$i]['image'] = asset('public/' . $banner->image);
            $i++;
        }
        return $this->sendResponse($data, 'App Data.');
    }

    public static function generateOTP()
    {
        // $otp = str_pad(random_int(0, 9999), 4, '0', STR_PAD_LEFT);
        return '1234';
        // return $otp;
    }

    function generateReferCode($userId, $length = 6)
    {
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $prefix = SettingsTrait::settings('short_name');
        $randomString = $prefix;
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }
        $referCode = $randomString . $userId;
        return $referCode;
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile' => 'required|string|min:10',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        $userExists = DB::table('users')->where('mobile', $request->input('mobile'))->exists();
        $code = $this->generateOTP();
        if ($userExists) {
            $Json['mobile'] = $request->mobile;
            SettingsTrait::sendTextSmsNew($code, $request->mobile);
            DB::table('users')->where('mobile', $request->input('mobile'))->update(['code' => $code]);
            return $this->sendResponse($Json, 'Otp Sent Successfully.');
        } else {
            $data['code'] = $code;
            $data['mobile'] = $Json['mobile'] = $request->mobile;
            SettingsTrait::sendTextSmsNew($code, $request->mobile);
            $tempid = DB::table('tempuser')->insertGetId($data);
            $Json['tempid'] = base64_encode(serialize($tempid));
            return $this->sendResponse($Json, 'Otp Sent Successfully.');
        }
    }

    public function resendOtp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile' => 'required|string|min:10',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }

        $userExists = DB::table('users')->where('mobile', $request->input('mobile'))->exists();
        $code = $this->generateOTP();
        if ($userExists) {
            $userData = DB::table('users')->where('mobile', $request->input('mobile'))->first();
            $Json['mobile'] = $request->mobile;
            // SMS Sent
            SettingsTrait::sendTextSmsNew($code, $request->mobile);
            return $this->sendResponse($Json, 'Otp Resend Successfully.');
        } else {
            $userData = DB::table('tempuser')->where('mobile', $request->input('mobile'))->first();
            $Json['mobile'] = $request->mobile;
            // SMS Sent
            SettingsTrait::sendTextSmsNew($code, $request->mobile);
            return $this->sendResponse($Json, 'Otp Resend Successfully.');
        }
    }

    public function verifyLoginotp(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile' => 'required|string|min:10',
            'otp' => 'required|string|min:4',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }

        // Check if the user exists in the main 'User' table
        $user = User::where('mobile', $request->input('mobile'))
            ->where('code', $request->input('otp'))
            ->first();

        if ($user) {
            // Clear the 'code' in the main 'User' table
            $user->update(['code' => null]);
            if (isset($request->device_token) && !empty($request->device_token)) {
                DB::table('devicetoken')->insert(['userid' => $user->id, 'device_token' => $request->device_token]);
            }
            $token = $user->createToken('ApiToken')->plainTextToken;

            return $this->sendResponse([
                'authorization' => [
                    'token' => $token,
                    'type' => 'bearer',
                ],
            ], 'User Login successfully.');
        } else {
            $userExists = DB::table('tempuser')
                ->where('id', unserialize(base64_decode($request->tempid)))
                ->where('mobile', $request->mobile)
                ->where('code', $request->otp)
                ->first();

            if (!empty($userExists)) {
                $input = $request->all();
                unset($input['otp']);
                unset($input['tempid']);
                $input['code'] = null;
                // Create a new user in the 'User' table
                $insertedUserId = DB::table('users')->insertGetId($input);
                $user = User::find($insertedUserId);
                $user->assignRole('user');
                DB::table('user_verify')->insert(['userid' => $insertedUserId, 'mobile_verify' => 1]);
                Userbalance::create(['user_id' => $insertedUserId]);
                // Delete the user from the 'tempuser' table
                DB::table('tempuser')
                    ->where('id', unserialize(base64_decode($request->tempid)))
                    ->delete();
                $refer_code = $this->generateReferCode($insertedUserId);
                DB::table('users')->where('id', $insertedUserId)->update(['refer_code' => $refer_code, 'team' => $refer_code]);
                if (isset($request->device_token) && !empty($request->device_token)) {
                    DB::table('devicetoken')->insert(['userid' => $insertedUserId, 'device_token' => $request->device_token]);
                }
                SettingsTrait::awardBonus($insertedUserId, 'signup_bonus');
                SettingsTrait::awardBonus($insertedUserId, 'mobile_bonus');
                // if ($input['refer_id'] != 0) {
                //     SettingsTrait::awardBonus($input['refer_id'], 'refer_bonus');
                // }
                $token = $user->createToken('ApiToken')->plainTextToken;
                return $this->sendResponse([
                    'authorization' => [
                        'token' => $token,
                        'type' => 'bearer',
                    ],
                ], 'User Login successfully.');
            } else {
                return $this->sendError('Invalid OTP.', ['error' => 'Invalid OTP'], 201);
            }
        }
    }

    public function socialLogin(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'emailtoken' => 'required|string',
        ]);
        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }

        $access_token = $request->emailtoken;

        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $access_token,
        ])->get('https://www.googleapis.com/oauth2/v1/userinfo')->json();
        if (isset($response['email'])) {
            $user = User::where('email', $response['email'])
                ->first();

            if (isset($user) && $user->status == 0) {
                return response()->json([
                    'success' => false,
                    'message' => '⚠️ This user is blocked! Please contact the administrator for assistance. ⚠️',
                    'data' => ['error' => 'User Blocked'],
                ], 403);
            }

            if ($user) {
                if (isset($request->device_token) && !empty($request->device_token)) {
                    DB::table('devicetoken')->insert(['userid' => $user->id, 'device_token' => $request->device_token]);
                }
                $data1['name'] = $response['name'];
                $data1['image'] = $response['picture'];
                DB::table('users')->where('id', $user->id)->update($data1);
                $token = $user->createToken('ApiToken')->plainTextToken;
                return $this->sendResponse([
                    'authorization' => [
                        'token' => $token,
                        'type' => 'bearer',
                    ],
                ], 'User Login successfully.');
            } else {
                $data['email'] = $response['email'];
                $data['name'] = $response['name'];
                $data['image'] = $response['picture'];
                // Create a new user in the 'User' table
                $insertedUserId = DB::table('users')->insertGetId($data);
                $user = User::find($insertedUserId);
                $user->assignRole('user');
                DB::table('user_verify')->insert(['userid' => $insertedUserId, 'email_verify' => 1]);
                Userbalance::create(['user_id' => $insertedUserId]);
                $refer_code = $this->generateReferCode($insertedUserId);
                DB::table('users')->where('id', $insertedUserId)->update(['refer_code' => $refer_code, 'team' => $refer_code]);
                if (isset($request->device_token) && !empty($request->device_token)) {
                    DB::table('devicetoken')->insert(['userid' => $insertedUserId, 'device_token' => $request->device_token]);
                }
                SettingsTrait::awardBonus($insertedUserId, 'signup_bonus');
                SettingsTrait::awardBonus($insertedUserId, 'email_bonus');
                $token = $user->createToken('ApiToken')->plainTextToken;
                return $this->sendResponse([
                    'authorization' => [
                        'token' => $token,
                        'type' => 'bearer',
                    ],
                ], 'User Login successfully.');
            }
        } else {
            return $this->sendError('Invalid Token.', ['error' => 'Invalid Token'], 201);
        }
    }

    public function logout(Request $request)
    {
        if ($request->type == 'all') {
            Auth::user()->tokens()->delete();
            DB::table('devicetoken')->where('userid', Auth::user()->id)->delete();
            return $this->sendResponse('', 'Successfully logged out from All Devices');
        } else {
            DB::table('devicetoken')->where('device_token', $request->device_token)->delete();
            return $this->sendResponse('', 'Successfully logged out');
        }
    }

    public function checkcodeaccess(Request $request)
    {
        $userExists = DB::table('access')->where('name', $request->code)->where('status', 'opened')->exists();
        if ($userExists) {
            return $this->sendResponse('', 'Access Authorized');
        } else {
            return $this->sendError('⚠️ Your Demo Time was Expired ! Please contact the administrator for assistance. ⚠️', ['error' => '⚠️ Your Demo Time was Expired ! Please contact the administrator for assistance. ⚠️'], 201);
        }
    }

    public function userInfo(Request $request)
    {
        $data = User::join('userbalance', 'userbalance.user_id', '=', 'users.id')->join('user_verify', 'user_verify.userid', '=', 'users.id')->select('users.*', 'userbalance.balance', 'userbalance.winning', 'userbalance.bonus', 'user_verify.mobile_verify', 'user_verify.email_verify', 'user_verify.pan_verify', 'user_verify.bank_verify', 'user_verify.aadhar_verify')->where('users.id', Auth::user()->id)->first();
        if (!empty($data)) {
            $data = $data->toArray();
            foreach ($data as $key => $val) {
                if ($val === 0) {
                    $Json[$key] = 0;
                } elseif ($val === null) {
                    $Json[$key] = '';
                } else {
                    $Json[$key] = $val;
                }
            }
        } else {
            $Json = [];
        }

        return $this->sendResponse($Json, 'User Fetched successfully.');
    }

    public function allNotifications(Request $request)
    {
        $allnotifications = DB::table('notifications')->where('userid', Auth::user()->id)->orderBy('id', 'DESC')->get();
        return $this->sendResponse($allnotifications, 'Notification Data.');
    }

    public function allTransactions(Request $request)
    {
        $allnotifications = DB::table('transactions')->where('userid', Auth::user()->id)->orderBy('id', 'DESC')->get();
        return $this->sendResponse($allnotifications, 'Transaction Data.');
    }

    public function verifyMobile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'mobile' => 'required|string|min:10|unique:users',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        if (isset($request->otp)) {
            $userExists = DB::table('users')->where('id', Auth::user()->id)->where('code', $request->otp)->exists();
            if ($userExists) {
                DB::table('users')->where('id', Auth::user()->id)->update(['code' => NULL, 'mobile' => $request->mobile]);
                DB::table('user_verify')->where('userid', Auth::user()->id)->update(['mobile_verify' => 1]);
                SettingsTrait::awardBonus(Auth::user()->id, 'mobile_bonus');
                return $this->sendResponse('', 'Mobile Verified Successfully.');
            } else {
                return $this->sendError('Invalid OTP.', ['error' => 'Invalid OTP'], 201);
            }
        } else {
            $userExists = DB::table('users')->where('id', Auth::user()->id)->exists();
            $code = $this->generateOTP();
            if ($userExists) {
                DB::table('users')->where('id', Auth::user()->id)->update(['code' => $code]);
                $Json['mobile'] = $request->mobile;
                SettingsTrait::sendTextSmsNew($code, $request->mobile);
                // SMS Sent
                return $this->sendResponse($Json, 'Otp Sent Successfully.');
            }
        }
    }
  
    public function verifyEmail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|unique:users,email,' . Auth::user()->id,
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        if (isset($request->otp)) {
            $userExists = DB::table('users')->where('id', Auth::user()->id)->where('code', $request->otp)->exists();
            if ($userExists) {
                DB::table('users')->where('id', Auth::user()->id)->update(['code' => NULL, 'email' => $request->email]);
                DB::table('user_verify')->where('userid', Auth::user()->id)->update(['email_verify' => 1]);
                SettingsTrait::awardBonus(Auth::user()->id, 'email_bonus');
                return $this->sendResponse('', 'Email Verified Successfully.');
            } else {
                return $this->sendError('Invalid OTP.', ['error' => 'Invalid OTP'], 201);
            }
        } 
        else {
            $userExists = DB::table('users')->where('id', Auth::user()->id)->exists();
            $code = $this->generateOTP();
            if ($userExists) {
                DB::table('users')->where('id', Auth::user()->id)->update(['code' => $code]);
                $Json['email'] = $request->email;
                // SMS Sent
                $data['email'] = $request->email;
                $data['subject'] = 'OTP For Email Verification -' . env('APP_NAME');
                $data['content'] = MailTrait::otpemail($code, env('APP_NAME'));
                // MailTrait::mailSmtpSend($data);
                return $this->sendResponse($Json, 'Otp Sent Successfully.');
            }
        }
    }

    public function updateUserImage(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
        ]);
        $Json = [];
        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
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
            $Json['image'] = asset('public/users/profile/' . $newfilename);
        }
        $request->user()->save();
        return $this->sendResponse($Json, 'Image Uploaded Successfully.');
    }

    public function updatePanDetail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
            'pan_number' => 'required|string|min:10|unique:pancard',
            'pan_name' => 'required|string',
            'pan_dob' => 'required|string',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        $input = $request->all();
        if (!empty($request->image)) {
            $image = $request->image;
            $destination = public_path('/users/pancard/');
            $filename = $request->pan_number . Auth::user()->id . time() . '.png';
            $info = pathinfo($filename);
            $imageNamee = $info['filename'];
            $newfilename = $imageNamee . "." . $info['extension'];
            $image->move($destination, $newfilename);
            $input['image'] = 'users/pancard/' . $newfilename;
        }
        $input['userid'] = Auth::user()->id;
        DB::table('pancard')->insert($input);
        DB::table('user_verify')->where('userid', Auth::user()->id)->update(['pan_verify' => 0]);
        return $this->sendResponse('', 'Pan Detail Submitted Successfully.');
    }

    public function updateAadharDetail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
            'imageback' => 'required|image|mimes:jpeg,png,jpg,gif',
            'aadhar_number' => 'required|string|min:12|unique:aadharcard',
            'aadhar_name' => 'required|string',
            'aadhar_dob' => 'required|string',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        $input = $request->all();
        if (!empty($request->image)) {
            $image = $request->image;
            $destination = public_path('/users/aadharcard/front/');
            $filename = 'FRONT' . $request->aadhar_number . Auth::user()->id . time() . '.png';
            $info = pathinfo($filename);
            $imageNamee = $info['filename'];
            $newfilename = $imageNamee . "." . $info['extension'];
            $image->move($destination, $newfilename);
            $input['image'] = 'users/aadharcard/front/' . $newfilename;
        }
        if (!empty($request->imageback)) {
            $imageback = $request->imageback;
            $destination = public_path('/users/aadharcard/back/');
            $filename = 'BACK' . $request->aadhar_number . Auth::user()->id . time() . '.png';
            $info = pathinfo($filename);
            $imageNamee = $info['filename'];
            $newfilename = $imageNamee . "." . $info['extension'];
            $imageback->move($destination, $newfilename);
            $input['imageback'] = 'users/aadharcard/back/' . $newfilename;
        }
        $input['userid'] = Auth::user()->id;
        DB::table('aadharcard')->insert($input);
        DB::table('user_verify')->where('userid', Auth::user()->id)->update(['aadhar_verify' => 0]);
        return $this->sendResponse('', 'Aadhar Detail Submitted Successfully.');
    }

    public function updateBankDetail(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'image' => 'required|image|mimes:jpeg,png,jpg,gif',
            'accno' => 'required|string|min:10|unique:bank',
            'accountholder' => 'required|string',
            'ifsc' => 'required|string|min:11',
            'bankname' => 'required|string',
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        $input = $request->all();
        if (!empty($request->image)) {
            $image = $request->image;
            $destination = public_path('/users/bank/');
            $filename = $request->accno . Auth::user()->id . time() . '.png';
            $info = pathinfo($filename);
            $imageNamee = $info['filename'];
            $newfilename = $imageNamee . "." . $info['extension'];
            $image->move($destination, $newfilename);
            $input['image'] = 'users/bank/' . $newfilename;
        }
        $input['userid'] = Auth::user()->id;
        DB::table('bank')->insert($input);
        DB::table('user_verify')->where('userid', Auth::user()->id)->update(['bank_verify' => 0]);
        return $this->sendResponse('', 'Bank Detail Submitted Successfully.');
    }

    public function panView(Request $request)
    {
        $pandetail = DB::table('pancard')->where('userid', Auth::user()->id)->first();
        if (!empty($pandetail)) {
            $data = $pandetail;
            $data->image = asset('public/' . $pandetail->image);
            if ($pandetail->comment == NULL) {
                $pandetail->comment = "";
            }
        } else {
            $data = [];
        }

        return $this->sendResponse($data, 'Pan Details.');
    }

    public function bankView(Request $request)
    {
        $bankdetail = DB::table('bank')->where('userid', Auth::user()->id)->first();
        if (!empty($bankdetail)) {
            $data = $bankdetail;
            $data->image = asset('public/' . $bankdetail->image);
            if ($bankdetail->comment == NULL) {
                $bankdetail->comment = "";
            }
        } else {
            $data = [];
        }

        return $this->sendResponse($data, 'Bank Details.');
    }

    public function aadharView(Request $request)
    {
        $aadhardetail = DB::table('aadharcard')->where('userid', Auth::user()->id)->first();
        if (!empty($aadhardetail)) {
            $data = $aadhardetail;
            $data->image = asset('public/' . $aadhardetail->image);
            $data->imageback = asset('public/' . $aadhardetail->imageback);
            if ($aadhardetail->comment == NULL) {
                $aadhardetail->comment = "";
            }
        } else {
            $data = [];
        }

        return $this->sendResponse($data, 'Aadhar Details.');
    }

    public function editPrfoile(Request $request)
    {
        
        $validator = Validator::make($request->all(), [
            'name' => 'required|string',
            'address' => 'required|string',
            'city' => 'required|string',
            'state' => 'required|string',
            'country' => 'required|string',
            'pincode' => 'required|string',
            'dob' => 'required|string',
            'gender' => 'required|string',
            'team' => 'unique:users,id,'.Auth::user()->id
        ]);

        if ($validator->fails()) {
            foreach ($validator->errors()->all() as $key => $messages) {
                return $this->sendError($messages, '', 201);
            }
        }
        $input = $request->all();
        unset($input['email']);
        unset($input['mobile']);
        unset($input['masterpassword']);
        unset($input['refer_code']);
        DB::table('users')->where('id', Auth::user()->id)->update($input);
        return $this->sendResponse('', 'User Detail Updated Successfully.');
    }

    public function requestAddcash(Request $request)
    {
        try {
            if ($request->isMethod('post')) {
                $input = $request->all();
                $id =  $userid =  Auth::user()->id;
                $getdata['amount'] = $amount = floor($request->get('amount'));
                $getdata['userid'] = $userid;
                $getdata['paymentby'] = $request->get('paymentby');
                /* check for the user details */
                $loginsession = DB::table('users')->where('id', $id)->first();
                if (!empty($loginsession->mobile)) {
                    if (!empty($loginsession)) {
                        if (!empty($request->get('offerid'))) {
                            $offerdata = DB::table('offers')->where('offercode', $request->get('offerid'))->select('*')->first();
                            if (!empty($offerdata)) {
                                $usedcount = DB::table('used_offer')->where('user_id', $id)->where('offer_id', $offerdata->id)->count();
                                if ($usedcount < $offerdata->user_time) {
                                    $max = $offerdata->maxamount;
                                    $min = $offerdata->minamount;
                                    if ($min <= $amount and $amount <= $max) {
                                        $paymentprocess['offerid'] = $request->get('offerid');
                                    } else {
                                        return $this->sendError('Min ' . $min . ' & Max ' . $max, '', 201);
                                    }
                                } else {
                                    return $this->sendError('Offer Used Only ' . $offerdata->user_time . ' Times', '', 201);
                                }
                            } else {
                                return $this->sendError('Inavlid Coupon Code', '', 201);
                            }
                        }
                        $paymentdata['amount'] = $amount;
                        $paymentdata['userid'] = $loginsession->id;
                        $paymentdata['username'] = $loginsession->username;
                        $paymentdata['mobile'] = $loginsession->mobile;
                        $paymentdata['email'] = $loginsession->email;
                        $paymentprocess['amount'] = $amount;
                        $paymentprocess['userid'] = $loginsession->id;
                        $paymentprocess['paymentmethod'] = $request->get('paymentmethod');
                        $txnid = (SettingsTrait::settings('short_name') ?? '') . '-ADD-' . time() . $loginsession->id;
                        $paymentprocess['orderid'] = $txnid;
                        $Json['orderId'] = '';
                        if ($request->get('paymentby') == 'razorpay') {
                            include app_path() . '/razorpay/razorpay-php/Razorpay.php';
                            include app_path() . '/razorpay/config.php';
                            $api = new Api($keyId, $keySecret);
                            $orderData = [
                                'receipt' => $txnid,
                                'amount' => $amount * 100,
                                'currency' => 'INR',
                                'payment_capture' => 1,
                            ];
                            $razorpayOrder = $api->order->create($orderData);
                            $razorpayOrderId = $razorpayOrder['id'];
                            $Json['orderId'] = $razorpayOrderId;
                            $paymentprocess['orderid'] = $razorpayOrderId;
                            // $paymentprocess['txnid'] = $txnid;
                        }
                        DB::table('paymentprocess')->insert($paymentprocess);
                        $Json['txnid'] = $txnid;
                        return $this->sendResponse($Json, 'Transaction Detail');
                    } else {
                        return $this->sendError('Transaction Not Found', '', 201);
                    }
                } else {
                    return $this->sendError('Mobile Number Not Found', '', 201);
                }
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), '', 201);
        }
    }

    public function manualAddReq(Request $request)
    {
        // try {
        if ($request->isMethod('post')) {
            $input = $request->all();
            $Json = [];
            $id =  $userid =  Auth::user()->id;
            $getdata['amount'] = $amount = floor($request->get('amount'));
            $getdata['userid'] = $userid;
            $getdata['orderid'] = $request->get('orderid');
            $getdata['returnid'] = $request->get('returnid');
            /* check for the user details */
            $loginsession = DB::table('users')->where('id', $id)->first();
            if (!empty($loginsession->mobile)) {
                if (!empty($loginsession)) {
                    $transcheck = DB::table('paymentprocess')->where('orderid', $getdata['orderid'])->where('amount', $amount)->where('status', '!=', 'success')->first();
                    if (!empty($transcheck)) {
                        DB::table('paymentprocess')->where('id', $transcheck->id)->update(['returnid' => $getdata['returnid']]);
                        return $this->sendResponse($Json, 'Submitted Successfully');
                    } else {
                        return $this->sendError('Transaction Not Found', '', 201);
                    }
                } else {
                    return $this->sendError('Transaction Not Found', '', 201);
                }
            } else {
                return $this->sendError('Mobile Number Not Found', '', 201);
            }
        }
        // } catch (\Exception $e) {
        //     return $this->sendError($e->getMessage(), '', 201);
        // }
    }

    public function paymentWebhook(Request $request)
    {
        $input = $request->all();
        if (!empty($input)) {
            $data['data'] = json_encode($input);
            $lastid = DB::table('payment_data')->insertGetId($data);
            $datas = DB::table('payment_data')->where('id', $lastid)->first();

            $input = json_decode($datas->data, true);
            $encryption_key = 'dxXM0lTo1EZY9dmK';
            $iv = 'b0SybtoW91b7mtBL';
            $cipher = "aes-128-cbc";
            $encrypted_data = $input['encResponse'];
            //Decrypt data 
            $decrypted_data = openssl_decrypt($encrypted_data, $cipher, $encryption_key, 0, $iv);
            $arr = explode('&', $decrypted_data);
            foreach ($arr as $element) {
                list($key, $value) = explode('=', $element);
                $result[urldecode($key)] = urldecode($value);
            }
            if ($result['status'] == 'SUCCESS') {
                $orderid = $result['clientTxnId']; # we need these
                if (!empty($orderid)) {
                    $checkdata = DB::table('paymentprocess')->where('orderid', $orderid)->first();
                    if (!empty($checkdata)) {
                        $uid =  $checkdata->userid;
                        $pstatus = $checkdata->status;
                        if ($pstatus == "pending") {
                            $userid = $uid;
                            $getdata['amount'] = $amount = floor($checkdata->amount);
                            $getdata['userid'] = $uid;
                            $getdata['returnid'] = $orderid;

                            $loginsession = DB::table('users')->where('id', $uid)->first();

                            if (!empty($loginsession)) {
                                $paymentdata['amount'] = $amount;
                                $paymentdata['userid'] = $loginsession->id;
                                $paymentdata['username'] = $loginsession->username;
                                $paymentdata['mobile'] = $loginsession->mobile;
                                $paymentdata['email'] = $loginsession->email;
                                $paymentdata['paymentby'] = $checkdata->paymentmethod;
                                Session::put('askforpayment', $paymentdata);
                            }
                            $paymentgatewayinfo['amount'] = $getdata['amount'];
                            $paymentgatewayinfo['txnid'] = $orderid;
                            $paymentgatewayinfo['paymentby'] = $checkdata->paymentmethod;
                            $paymentgatewayinfo['returnid'] = $orderid;

                            $returnamount = $this->requestprocess($paymentgatewayinfo);

                            if ($returnamount == 'success') {
                                $totalamt = DB::table('userbalance')->where('user_id', $userid)->first();
                                $total = 0;

                                if (!empty($totalamt)) {
                                    $total = $totalamt->bonus + $totalamt->winning + $totalamt->balance;
                                }
                                $Json['total_amount'] = $total;

                                $Notification['userid'] = $userid;
                                $Notification['title'] = 'You have got ₹' . $getdata['amount'] . ' for Cash Added.';
                                DB::table('notifications')->insert($Notification);
                                $explodearray[] = $userid;
                                $referralBonusAmount = $getdata['amount'];
                                $data['subject'] = "💰 Cash Added Added to Wallet";
                                $data['content'] = "🎉 Congratulations! You've received a Cash added of ₹ {$referralBonusAmount} in your wallet. Enjoy your rewards! 💸";
                                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

                                return $this->sendResponse($Json, 'Transaction Completed');
                            }
                        }
                    }
                }
            }
        }
    }

    public function requestprocess($paymentgatewayinfo)
    {
        $finduserinfo = DB::table('paymentprocess')->where('paymentprocess.status', 'pending')->where(function ($qq) use ($paymentgatewayinfo) {
            $qq->where('orderid', $paymentgatewayinfo['txnid']);
        })->join('users', 'users.id', '=', 'paymentprocess.userid')->select('users.email', 'users.mobile', 'paymentprocess.orderid', 'paymentprocess.offerid', 'users.team', 'paymentprocess.amount', 'paymentprocess.paymentmethod', 'users.id as userid', 'paymentprocess.id', 'paymentprocess.status', 'users.refer_id')->first();
        if (!empty($finduserinfo)) {
            $getdata['amount'] = $finduserinfo->amount;
            $getdata['userid'] = $finduserinfo->userid;
            $getdata['paymentby'] = $finduserinfo->paymentmethod;
            $ds['returnid'] = $paymentgatewayinfo['txnid'];
            $ds['status'] = !empty($paymentgatewayinfo['status']) ? $paymentgatewayinfo['status'] : 'success';
            DB::table('paymentprocess')->where('id', $finduserinfo->id)->update($ds);
            /* update balance in user bucket */
            $userdata = DB::table('userbalance')->where('user_id', $getdata['userid'])->first();
            if (!empty($userdata)) {
                $datainseert['user_id'] = $getdata['userid'];
                $datainseert['balance'] = $userdata->balance + $getdata['amount'];
                DB::table('userbalance')->where('user_id', $getdata['userid'])->update($datainseert);
            }
            /* entry in transactions*/
            $trdata = array();
            $trdata['type'] = 'Cash added';
            $txnid = $paymentgatewayinfo['txnid'];
            $trdata['transaction_id'] = $txnid;
            $trdata['userid'] = $getdata['userid'];
            $trdata['amount'] = $getdata['amount'];
            $trdata['addfund_amt'] = $getdata['amount'];
            $trdata['bal_fund_amt'] = $datainseert['balance'];
            $trdata['bal_win_amt'] = $userdata->winning;
            $trdata['bal_bonus_amt'] = $userdata->bonus;
            $trdata['total_available_amt'] = $datainseert['balance'] + $userdata->winning + $userdata->bonus;
            $trdata['transaction_by'] = $paymentgatewayinfo['paymentby'];
            $trdata['paymentstatus'] = 'confirmed';
            DB::table('transactions')->insert($trdata);

            /* check for offers */
            if (!empty($finduserinfo->offerid)) {
                $userid = $finduserinfo->userid;
                $offer = DB::table('offers')->where('offercode', $finduserinfo->offerid)->first();

                if ($offer->bonus_type == 'per') {
                    $amountt =  $finduserinfo->amount * ($offer->bonus / 100);
                } else {
                    $amountt = $offer->bonus;
                }
                $userdata1 = array();
                $userdata1 = DB::table('userbalance')->where('user_id', $userid)->first();
                if (!empty($userdata1)) {
                    $transactionsdata = array();
                    if ($offer->type == 'addfund') {
                        $datainseert1['balance'] = $userdata1->balance + $amountt;
                        $transactionsdata['addfund_amt'] = $amountt;
                        $transactionsdata['bal_fund_amt'] = $datainseert1['balance'];
                        $transactionsdata['bal_bonus_amt'] = $userdata1->bonus;
                    } else {
                        $datainseert1['bonus'] = $userdata1->bonus + $amountt;
                        $transactionsdata['bonus_amt'] = $amountt;
                        $transactionsdata['bal_bonus_amt'] = $datainseert1['bonus'];
                        $transactionsdata['bal_fund_amt'] = $userdata1->balance;
                    }
                    DB::table('userbalance')->where('user_id', $userid)->update($datainseert1);

                    $transactionsdata['transaction_id'] = (SettingsTrait::settings()->short_name ?? '') . '-EBONUS-' . rand(1000, 9999);
                    $transactionsdata['transaction_by'] = (SettingsTrait::settings()->short_name ?? '');
                    $transactionsdata['userid'] = $userid;
                    $transactionsdata['type'] = 'special bonus';
                    $transactionsdata['amount'] = $amountt;

                    $transactionsdata['paymentstatus'] = 'confirmed';

                    $transactionsdata['bal_win_amt'] = $userdata1->winning;

                    $transactionsdata['total_available_amt'] = $transactionsdata['bal_bonus_amt'] + $transactionsdata['bal_fund_amt'] + $userdata1->winning;
                    DB::table('transactions')->insert($transactionsdata);
                    $myoo['user_id'] = $userid;
                    $myoo['offer_id'] = $offer->id;
                    DB::table('used_offer')->insert($myoo);
                    $Notification['userid'] = $userid;
                    $Notification['title'] = 'You have got ₹' . $amountt . ' for special bonus.';
                    DB::table('notifications')->insert($Notification);
                    $explodearray[] = $userid;
                    $referralBonusAmount = $amountt;
                    $data['subject'] = "💰 Special Bonus Added to Wallet";
                    $data['content'] = "🎉 Congratulations! You've received a special bonus of ₹ {$referralBonusAmount} in your wallet. Enjoy your rewards! 💸";
                    SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
                }
            }
            Session::forget('askforpayment');
            return 'success';
        }
    }


    public function withdrawRequest(Request $request)
    {
        try {
            $Json = [];
            if ($request->isMethod('post')) {
                $user_id = $userid = Auth::user()->id;;
                $amount = $request->get('amount');
                $data['user_id'] = $user_id;
                $data['amount'] = $amount;
                $data['withdraw_request_id'] = 'WD-' . $user_id . '-' . time();
                $data['withdrawfrom'] = $request->get('withdrawfrom');
                // check for minimum amount //
                if ($amount < 100) {
                    return $this->sendError('Withdrawl amount should be greater than or equal to 100', '', 201);
                }
                // check for verification process //
                $findverification = DB::table('user_verify')->where('userid', $user_id)->first();
                if (!empty($findverification)) {
                    if ($findverification->aadhar_verify != 1) {
                        return $this->sendError('Please first complete your Aadhar verification process. to withdarw this amount.', '', 201);
                    }
                    if ($findverification->pan_verify != 1) {
                        return $this->sendError('Please first complete your PAN verification process. to withdarw this amount.', '', 201);
                    }
                    if ($findverification->bank_verify != 1) {
                        return $this->sendError('Please first complete your Bank verification process to withdraw this amount.', '', 201);
                    }
                } else {
                    return $this->sendError('Sorry,no data available!', '', 201);
                }

                $bal_bonus_amt = 0;
                $bal_win_amt = 0;
                $bal_fund_amt = 0;
                $total_available_amt = 0;
                $findlastow = DB::table('userbalance')->where('user_id', $user_id)->first();
                if (!empty($findlastow)) {
                    $balance = 0;
                    /* check from where user wants to withdraw his money */
                    $balance = number_format($findlastow->winning, 2, ".", "");

                    if ($balance >= $amount) {
                        $bal_fund_amt = $findlastow->balance;
                        $bal_win_amt = $findlastow->winning;
                        $bal_bonus_amt = $findlastow->bonus;
                        $dataq['winning'] = number_format($balance - $amount, 2, ".", "");

                        DB::table('userbalance')->where('id', $findlastow->id)->update($dataq);
                        DB::table('withdraw')->insert($data);
                        $total_available_amt = $findlastow->balance + $dataq['winning'] + $findlastow->bonus;
                        $transactionsdata['userid'] = $userid;
                        $transactionsdata['type'] = 'Amount Withdraw';
                        $transactionsdata['transaction_id'] = $data['withdraw_request_id'];
                        $transactionsdata['transaction_by'] = 'wallet';
                        $transactionsdata['amount'] = $amount;
                        $transactionsdata['paymentstatus'] = 'pending';
                        $transactionsdata['withdraw_amt'] = $amount;
                        $transactionsdata['bal_fund_amt'] = $bal_fund_amt;
                        $transactionsdata['bal_win_amt'] = $dataq['winning'];
                        $transactionsdata['cons_win'] = $amount;
                        $transactionsdata['bal_bonus_amt'] = $bal_bonus_amt;
                        $transactionsdata['total_available_amt'] = $total_available_amt;
                        DB::table('transactions')->insert($transactionsdata);
                        return $this->sendResponse($Json, "Your request for  withdrawl amount of Rs " . $amount . " is sent successfully. You will  get info about it in between 24 to 48 Hours.");
                    } else {
                        return $this->sendError("You can withdraw only " . $balance . " rupees.", '', 201);
                    }
                } else {
                    return $this->sendError('Invalid user id.', '', 201);
                }
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), $Json, 201);
        }
    }

    public function allOfferlist(Request $request)
    {
        $alloffers = DB::table('offers')->where('expire_date', '>=', date('Y-m-d H:i:s'))->get();
        return $this->sendResponse($alloffers, 'Offers Data.');
    }

    public function transactioReceipt()
    {
        // 
        $data = [
            'title' => 'Sample PDF',
            'content' => '<h1>Hello, world!</h1><p>This is a sample PDF generated from HTML in Laravel.</p>'
        ];

        $pdf = PDF::loadView('pdf.transaction', $data);
        return $pdf->stream('transaction_receipt.pdf');
        // return $pdf->download('pdf.transaction');
    }
    public function sendLinkUrl(Request $request)
    {
        if (!empty($request->code)) {
            // Replace with your Firebase API key
            $apiKey = "AIzaSyCnFmm0R2BniAddldowPRnYK3fNcsy-2PA";
    
            // Firebase Dynamic Links API URL
            $apiUrl = "https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=" . $apiKey;
    
            // The destination URL for your dynamic link
            $destinationUrl = "https://api.fantasybox.in/joincontest/" . $request->code;
    
            // Dynamic link parameters
            $dynamicLink = [
                "dynamicLinkInfo" => [
                    "domainUriPrefix" => "https://fantasyboxnew.page.link", // Your Firebase Dynamic Links domain
                    "link" => $destinationUrl, // The deep link
                    "androidInfo" => [
                        "androidPackageName" => "com.img.fantasybox_new", // Your app's package name
                    ],
                ],
                "suffix" => [
                    "option" => "UNGUESSABLE"
                ]
            ];
    
            // Encode the parameters to JSON
            $payload = json_encode($dynamicLink);
    
            // Initialize cURL session
            $ch = curl_init($apiUrl);
    
            // Set cURL options
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, [
                'Content-Type: application/json',
                'Content-Length: ' . strlen($payload)
            ]);
    
            // Execute the cURL request
            $response = curl_exec($ch);
            // Check for cURL errors
            if (curl_errno($ch)) {
                curl_close($ch);
                return $this->sendError('Error while sending the request: ' . curl_error($ch), '', 500);
            }
    
            // Close the cURL session
            curl_close($ch);
    
            // Parse the response JSON
            $responseData = json_decode($response, true);
    
            // Check if the response contains a short link
            if (isset($responseData['shortLink'])) {
                $shortLink = $responseData['shortLink'];
                $jsonResponse = [
                    'url' => $shortLink
                ];
                return $this->sendResponse($jsonResponse, "Join Link");
            } else {
                return $this->sendError('Failed to create short link', '', 500);
            }
        } else {
            return $this->sendError('Code is required', '', 400);
        }
    }
    


    public function helpdeskMail(Request $request)
    {
        $user_id = Auth::user()->id;
        $input = $request->all();
        $data['user_id'] = $user_id;
        $data['issue'] = $input['issue'];
        $data['message'] = $input['message'];
        $data['email'] = 'ajays1.img@gmail.com';
        $data['mobile'] = $input['mobile'];

        $Json = [];
        $userinfo = DB::table('users')->where('id', $user_id)->first();
        if (!empty($userinfo)) {
            $data['subject'] = 'Technical Support -' . env('APP_NAME');
            $content = '<table style="border-collapse: collapse; width: 100%; margin: 0 auto; font-family: Arial, sans-serif;">
                            <tr>
                                <th style="border: 1px solid #ddd; background-color: #f2f2f2; padding: 8px;">Email</th>
                                <td style="border: 1px solid #ddd; padding: 8px;">' . $input['email'] . '</td>
                            </tr>
                            <tr>
                                <th style="border: 1px solid #ddd; padding: 8px;">Mobile</th>
                                <td style="border: 1px solid #ddd; padding: 8px;">' . $data['mobile'] . '</td>
                            </tr>
                            <tr>
                                <th style="border: 1px solid #ddd; padding: 8px;">Issue</th>
                                <td style="border: 1px solid #ddd; padding: 8px; font-size: 20px; color:red">' . $data['issue'] . '</td>
                            </tr>
                            <tr>
                                <th style="border: 1px solid #ddd; padding: 8px;">Message</th>
                                <td style="border: 1px solid #ddd; padding: 8px; font-size: 20px;">' . $data['message'] . '</td>
                            </tr>
                        </table>';

            $data['content'] = MailTrait::commonmailformat($content, env('APP_NAME'));
            MailTrait::mailSmtpSend($data);
            return $this->sendResponse($Json, 'Ticket Raised Successfully');
        }
    }
}
