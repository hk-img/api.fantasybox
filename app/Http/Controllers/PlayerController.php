<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class PlayerController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('players')->join('fantasy','fantasy.id','=','players.fantasy_type')->select('players.*','fantasy.name as fantasyname')->where('fantasy.name',$fantasy_type)->get();
        return view('admin.player.view',compact('collection','fantasy_type'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            if ($request->file('image')) {
                $image = $request->file('image');
                $image =  Storage::disk('public_folder')->putFile('players', $image, 'public');
                $input['image'] = $image;
            }
            DB::table('players')->where('id',$id)->update($input);
            return redirect()->back()->with('success','Successfully Updated !');
        }else{
            $collection = DB::table('players')->where('id',$id)->first();
            return view('admin.player.edit',compact('collection'));
        }
    }
}
