<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Auth;

class StockMatchController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view(Request $request)
    {
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $collection = DB::table('stock_listmatches')->where('status', 'notstarted')->where('launch_status', 'launched')->where('date', '>=', $currentdate)->orderBy('id','DESC')->get();
        return view('admin.stock.match.view',compact('collection'));
    }

    public function company(Request $request)
    {
        if(isset($request->exchange)){
            $miccode = $request->exchange;
        }else{
            $miccode = 'XNSE';
        }
        $collection = DB::table('stock_companies')->where('mic_code',$miccode)->where('status', 1)->get();
        $exchanges = DB::table('stock_exchanges')->get();
        return view('admin.stock.match.company',compact('collection','exchanges'));
    }

    public function commodity(Request $request)
    {
        $collection = DB::table('stock_commodity')->where('status', 1)->get();
        return view('admin.stock.match.commodity',compact('collection'));
    }

    public function exchange(Request $request)
    {
        $collection = DB::table('stock_exchanges')->where('status', 1)->get();
        return view('admin.stock.match.exchange',compact('collection'));
    }

    
    
    
}
