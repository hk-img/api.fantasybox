<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class OfferController extends Controller
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
            DB::table('offers')->insert($input);
            return redirect()->route('offer.view')->with('success','Successfully Added !');
        }else{
            return view('admin.offer.add');
        }
    }

    public function view()
    {
        $collection = DB::table('offers')->get();
        return view('admin.offer.view',compact('collection'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            DB::table('offers')->where('id',$id)->update($input);
            return redirect()->route('offer.view')->with('success','Successfully Updated !');
        }else{
            $collection = DB::table('offers')->where('id',$id)->first();
            return view('admin.offer.edit',compact('collection'));
        }
    }

    public function deleteoffer(Request $request,$id)
    {
        $id = base64_decode($id);
        DB::table('offers')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Successfully Deleted !');
    }
}
