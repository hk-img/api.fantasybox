<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class AccessController extends Controller
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
            unset($input['fantasy_type']);
            $checkseries = DB::table('access')->where('name',$input['name'])->first();
            if(!empty($checkseries)){
                return redirect()->back()->with('error','Access Already Exist !');
            }else{
                DB::table('access')->insert($input);
                $fantast_type = DB::table('fantasy')->where('id', 1)->value('name');
                return redirect()->route('access.view',base64_encode($fantast_type))->with('success','Successfully Added !');
            }
        }else{
            return view('admin.access.add');
        }
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('access')->select('access.*')->get();
        return view('admin.access.view',compact('collection'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            unset($input['fantasy_type']);
            $checkseries = DB::table('access')->where('id','<>',$id)->where('name',$input['name'])->first();
            if(!empty($checkseries)){
                return redirect()->back()->with('error','Access Already Exist !');
            }else{
                DB::table('access')->where('id',$id)->update($input);
                return redirect()->route('access.view',base64_encode('cricket'))->with('success','Successfully Updated !');
            }
        }else{
            $collection = DB::table('access')->where('id',$id)->first();
            return view('admin.access.edit',compact('collection'));
        }
    }

    public function actdect(Request $request,$id)
    {
        $id = base64_decode($id);
        $find = DB::table('access')->where('id', $id)->first();

        if (!empty($find)) {
            if ($find->status == "closed") {
                DB::table('access')->where('id', $id)->update(['status' => "opened"]);
                return redirect()->back()->with('success', 'Successfully Enabled');
            } else {
                DB::table('access')->where('id', $id)->update(['status' => "closed"]);
                return redirect()->back()->with('error', 'Successfully Disabled');
            }
        }
    }
}
