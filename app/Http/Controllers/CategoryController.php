<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class CategoryController extends Controller
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
            $checkcategory = DB::table('contest_category')->where('fantasy_type',$input['fantasy_type'])->where('name',$input['name'])->first();
            if(!empty($checkcategory)){
                return redirect()->back()->with('error','Category Already Exist !');
            }else{
                if ($request->file('image')) {
                    $image = $request->file('image');
                    $image =  Storage::disk('public_folder')->putFile('category', $image, 'public');
                    $input['image'] = $image;
                }
                DB::table('contest_category')->insert($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->value('name');
                return redirect()->route('category.view',base64_encode($fantast_type))->with('success','Successfully Added !');
            }
        }else{
            return view('admin.category.add');
        }
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('contest_category')->join('fantasy','fantasy.id','=','contest_category.fantasy_type')->select('contest_category.*','fantasy.name as fantasyname')->where('fantasy.name',$fantasy_type)->get();
        return view('admin.category.view',compact('collection','fantasy_type'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            $checkcategory = DB::table('contest_category')->where('id','<>',$id)->where('fantasy_type',$input['fantasy_type'])->where('name',$input['name'])->first();
            if(!empty($checkcategory)){
                return redirect()->back()->with('error','Category Already Exist !');
            }else{
                if ($request->file('image')) {
                    $image = $request->file('image');
                    $image =  Storage::disk('public_folder')->putFile('category', $image, 'public');
                    $input['image'] = $image;
                }
                DB::table('contest_category')->where('id',$id)->update($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->value('name');
                return redirect()->route('category.view',base64_encode($fantast_type))->with('success','Successfully Updated !');
            }
        }else{
            $collection = DB::table('contest_category')->where('id',$id)->first();
            return view('admin.category.edit',compact('collection'));
        }
    }

    public function deletecategory(Request $request,$id)
    {
        $id = base64_decode($id);
        DB::table('contest_category')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Successfully Deleted !');
    }
}
