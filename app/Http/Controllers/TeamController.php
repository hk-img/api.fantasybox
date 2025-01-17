<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class TeamController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('teams')->join('fantasy','fantasy.id','=','teams.fantasy_type')->select('teams.*','fantasy.name as fantasyname')->where('fantasy.name',$fantasy_type)->get();
        return view('admin.team.view',compact('collection','fantasy_type'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            if ($request->file('logo')) {
                $image = $request->file('logo');
                $image =  Storage::disk('public_folder')->putFile('team', $image, 'public');
                $input['logo'] = $image;
            }
            DB::table('teams')->where('id',$id)->update($input);
            return redirect()->back()->with('success','Successfully Updated !');
        }else{
            $collection = DB::table('teams')->where('id',$id)->first();
            return view('admin.team.edit',compact('collection'));
        }
    }
}
