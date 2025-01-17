<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class BannerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            if ($request->file('image')) {
                $image = $request->file('image');
                $image =  Storage::disk('public_folder')->putFile('banner', $image, 'public');
                $input['image'] = $image;
            }
            DB::table('banner')->insert($input);
            return redirect()->route('banner.view')->with('success','Successfully Added !');
        }else{
            return view('admin.banner.add');
        }
    }

    public function view()
    {
        $collection = DB::table('banner')->get();
        return view('admin.banner.view',compact('collection'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            if ($request->file('image')) {
                $image = $request->file('image');
                $image =  Storage::disk('public_folder')->putFile('banner', $image, 'public');
                $input['image'] = $image;
            }
            DB::table('banner')->where('id',$id)->update($input);
            return redirect()->route('banner.view')->with('success','Successfully Updated !');
        }else{
            $collection = DB::table('banner')->where('id',$id)->first();
            return view('admin.banner.edit',compact('collection'));
        }
    }

    public function deletebanner(Request $request,$id)
    {
        $id = base64_decode($id);
        DB::table('banner')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Successfully Deleted !');
    }
}
