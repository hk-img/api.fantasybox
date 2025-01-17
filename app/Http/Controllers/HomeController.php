<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;
use File;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;


class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function dashboard()
    {
        $data['livematch'] = DB::table('listmatches')->where('status', 'started')->count();
        $data['launchedmatch'] = DB::table('listmatches')->where('launch_status', 'launched')->where('status', 'notstarted')->count();
        $data['completedmatch'] = DB::table('listmatches')->where('launch_status', 'launched')->where('status', 'completed')->count();
        $data['pendingpan'] = DB::table('user_verify')->where('pan_verify', 0)->count();
        $data['notuploadedpan'] = DB::table('user_verify')->where('pan_verify', -1)->count();
        $data['approvedpan'] = DB::table('user_verify')->where('pan_verify', 1)->count();
        $data['pendingbank'] = DB::table('user_verify')->where('bank_verify', 0)->count();
        $data['notuploadedbank'] = DB::table('user_verify')->where('bank_verify', -1)->count();
        $data['approvedbank'] = DB::table('user_verify')->where('bank_verify', 1)->count();
        $data['pendingwithdrawal'] = DB::table('withdraw')->where('status', 0)->count();
        $data['approvedwithdrawal'] = DB::table('withdraw')->where('status', 1)->count();
        $data['totalwithdrawalamount'] = DB::table('withdraw')->where('status', 1)->sum('amount');
        $data['totaluser'] = DB::table('users')->count();
        $data['activeuser'] = DB::table('users')->where('status', 1)->count();
        $data['pendingwinnerdeclear'] = DB::table('listmatches')->where('status', '!=', 'notstarted')->where('launch_status', 'launched')->where('final_status', 'pending')->count();
        $data['totalteam'] = DB::table('teams')->count();
        $data['totalplayer'] = DB::table('players')->count();
        $data['globalcontest'] = DB::table('challenges')->count();

        return view('admin.dashboard', compact('data'));
    }

    public function index()
    {
        return view('home');
    }

    public function get_contest_category(Request $request)
    {
        $fantasy_type = $request->fantasy_type;
        $collection = DB::table('contest_category')->join('fantasy', 'fantasy.id', '=', 'contest_category.fantasy_type')->select('contest_category.*', 'fantasy.name as fantasyname')->where('fantasy.id', $fantasy_type)->get();
        // dd($collection);
        return $collection;
    }

    public function get_stockcontest_category(Request $request)
    {
        $fantasy_type = $request->fantasy_type;
        $collection = DB::table('stock_contest_category')->get();
        // dd($collection);
        return $collection;
    }
}
