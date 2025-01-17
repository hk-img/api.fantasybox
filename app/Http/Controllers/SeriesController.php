<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class SeriesController extends Controller
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
            $checkseries = DB::table('series')->where('fantasy_type',$input['fantasy_type'])->where('name',$input['name'])->first();
            if(!empty($checkseries)){
                return redirect()->back()->with('error','Series Already Exist !');
            }else{
                DB::table('series')->insert($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->value('name');
                return redirect()->route('series.view',base64_encode($fantast_type))->with('success','Successfully Added !');
            }
        }else{
            return view('admin.series.add');
        }
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('series')->join('fantasy','fantasy.id','=','series.fantasy_type')->select('series.*','fantasy.name as fantasyname')->where('fantasy.name',$fantasy_type)->get();
        return view('admin.series.view',compact('collection','fantasy_type'));
    }

    public function edit(Request $request,$id)
    {
        $id = base64_decode($id);
        if($request->isMethod('post')){
            $input = $request->all();
            unset($input['_token']);
            $checkseries = DB::table('series')->where('id','<>',$id)->where('fantasy_type',$input['fantasy_type'])->where('name',$input['name'])->first();
            if(!empty($checkseries)){
                return redirect()->back()->with('error','Series Already Exist !');
            }else{
                DB::table('series')->where('id',$id)->update($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->value('name');
                return redirect()->route('series.view',base64_encode($fantast_type))->with('success','Successfully Updated !');
            }
        }else{
            $collection = DB::table('series')->where('id',$id)->first();
            return view('admin.series.edit',compact('collection'));
        }
    }

    public function actdect(Request $request,$id)
    {
        $id = base64_decode($id);
        $find = DB::table('series')->where('id', $id)->first();

        if (!empty($find)) {
            if ($find->status == "closed") {
                DB::table('series')->where('id', $id)->update(['status' => "opened"]);
                return redirect()->back()->with('success', 'Successfully Enabled');
            } else {
                DB::table('series')->where('id', $id)->update(['status' => "closed"]);
                return redirect()->back()->with('error', 'Successfully Disabled');
            }
        }
    }

    public function viewfullseries(Request $request,$fantasy_type)
    {   
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('series')->join('fantasy','fantasy.id','=','series.fantasy_type')->select('series.*','fantasy.name as fantasyname')->where('fantasy.name',$fantasy_type)->get();
        if(isset($request->series) && !empty($request->series)){
            $matchdata = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->leftjoin('teams as team1', 'listmatches.team1', '=', 'team1.id')->leftjoin('teams as team2', 'listmatches.team2', '=', 'team2.id')->select('listmatches.*', 'team1.team as team1name', 'team2.team as team2name', 'fantasy.name as fantasy_type')->where('series', base64_decode($request->series))->get();
        }else{
            $matchdata = [];
        }
        return view('admin.series.fullseries',compact('collection','fantasy_type','matchdata'));
    }
}
