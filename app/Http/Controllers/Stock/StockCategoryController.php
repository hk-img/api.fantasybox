<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;

class StockCategoryController extends Controller
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
            $checkcategory = DB::table('stock_contest_category')->where('exchange_id',$input['exchange_id'])->first();
            if(!empty($checkcategory)){
                return redirect()->back()->with('error','This Exchange Category Already Exist !');
            }else{
                if ($request->file('image')) {
                    $image = $request->file('image');
                    $image =  Storage::disk('public_folder')->putFile('stock/category', $image, 'public');
                    $input['image'] = $image;
                }
                DB::table('stock_contest_category')->insert($input);
                return redirect()->route('stockcategory.view')->with('success','Successfully Added !');
            }
        }else{
            $exchanges = DB::table('stock_exchanges')->get();
            return view('admin.stock.category.add',compact('exchanges'));
        }
    }

    public function view()
    {
        $collection = DB::table('stock_contest_category')->get();
        return view('admin.stock.category.view',compact('collection'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            $checkcategory = DB::table('stock_contest_category')->where('id','<>',$id)->where('exchange_id',$input['exchange_id'])->first();
            if(!empty($checkcategory)){
                return redirect()->back()->with('error','This Exchange Category Already Exist !');
            }else{
                if ($request->file('image')) {
                    $image = $request->file('image');
                    $image =  Storage::disk('public_folder')->putFile('stock/category', $image, 'public');
                    $input['image'] = $image;
                }
                DB::table('stock_contest_category')->where('id',$id)->update($input);
                return redirect()->route('stockcategory.view')->with('success','Successfully Updated !');
            }
        }else{
            $collection = DB::table('stock_contest_category')->where('id',$id)->first();
            $exchanges = DB::table('stock_exchanges')->get();
            return view('admin.stock.category.edit',compact('collection','exchanges'));
        }
    }

    public function deletecategory(Request $request,$id)
    {
        $id = base64_decode($id);
        DB::table('stock_contest_category')->where('id', $id)->delete();
        return redirect()->back()->with('success', 'Successfully Deleted !');
    }
}
