<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class SettingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->isMethod('POST')) {
            $input = request()->except('_token');
            if (empty($input)) {
                return back()->with('error', 'Please Enter All data');

            }
            
            if (!empty($input)) {
                foreach ($input as $name => $value) {
                    # if logo
                    if (is_file($value)) {
                        $image = $value;
                        $destination = public_path('/settings');
                        $filename = $name . '.png';
                        if (file_exists($destination . '/' . $filename)) {
                            $info = pathinfo($filename);
                            $imageNamee = $info['filename'];
                            $newfilename = $imageNamee . "." . $info['extension'];
                        }
                        $image->move($destination, $newfilename);
                        $data['value'] = $newfilename;

                        if ($data['value'] == '') {
                            return redirect()->back()->with('error', 'Invalid extension of file you uploaded. You can only upload image.');
                        }

                        $data['name'] = $name;
                        $data['value'] = $value = $data['value'];
                    } else {
                        $data['name'] = $name;
                        $data['value'] = $value;
                    }
                    $is_exists = DB::table('settings')
                        ->where('name', $name)
                        ->first();

                    if (!empty($is_exists) and !empty($value)) {
                        DB::table('settings')
                            ->where('name', $name)
                            ->update($data);
                    } else if (!empty($value)) {
                        DB::table('settings')
                            ->insert($data);
                    }
                }
            }
            return redirect()->back()->with('success', 'UI Settings Updated Successfully');
        } else {
            $settings = DB::table('settings')
                ->pluck('value', 'name')
                ->toArray();

            $settings = (object) $settings;
            return view('admin.settings', compact('settings'));
        }
    }

    public function gamemerge(Request $request)
    {
        if ($request->isMethod('POST')) {
            $input = request()->except('_token');
            if (empty($input)) {
                return back()->with('error', 'Please Enter All data');

            }
            
            if (!empty($input)) {
                foreach ($input as $name => $value) {
                    # if logo
                    if (is_file($value)) {
                        $image = $value;
                        $destination = public_path('/settings');
                        $filename = $name . '.png';
                        if (file_exists($destination . '/' . $filename)) {
                            $info = pathinfo($filename);
                            $imageNamee = $info['filename'];
                            $newfilename = $imageNamee . "." . $info['extension'];
                        }
                        $image->move($destination, $newfilename);
                        $data['value'] = $newfilename;

                        if ($data['value'] == '') {
                            return redirect()->back()->with('error', 'Invalid extension of file you uploaded. You can only upload image.');
                        }

                        $data['name'] = $name;
                        $data['value'] = $value = $data['value'];
                    } else {
                        $data['name'] = $name;
                        $data['value'] = $value;
                    }
                    $is_exists = DB::table('settings')
                        ->where('name', $name)
                        ->first();

                    if (!empty($is_exists) and !empty($value)) {
                        DB::table('settings')
                            ->where('name', $name)
                            ->update($data);
                    } else if (!empty($value)) {
                        DB::table('settings')
                            ->insert($data);
                    }
                }
            }
            return redirect()->back()->with('success', 'UI Settings Updated Successfully');
        } else {
            $settings = DB::table('settings')
                ->pluck('value', 'name')
                ->toArray();

            $settings = (object) $settings;
            return view('admin.settings', compact('settings'));
        }
    }
}
