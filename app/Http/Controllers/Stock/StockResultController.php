<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;

class StockResultController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }


    public function view(Request $request)
    {
        $collection = DB::table('stock_listmatches')->where('launch_status', 'launched')->orderBy('id','DESC')->get();
        return view('admin.stock.match.viewresult',compact('collection'));
    }


}
