<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class StockController extends Controller
{

    public static function getallstockexchange()
    {
        $exchanges = Http::get('https://api.twelvedata.com/exchanges?type=stock&apikey=aa3bc02c99db452086055505891e79d6')->json();
        foreach ($exchanges['data'] as $exch) {
            $findexchange = DB::table('stock_exchanges')->where('code', $exch['code'])->first();
            if (empty($findexchange)) {
                $data['name'] = $exch['name'];
                $data['code'] = $exch['code'];
                $data['country'] = $exch['country'];
                $data['timezone'] = $exch['timezone'];
                DB::table('stock_exchanges')->insert($data);
            }
        }
        return redirect()->back()->with('success','Exchanges Successfully Imported');
    }

    public static function getallcommodity()
    {
        $appkey= '157eba22a9d4f274821d6d574fe4dfca';
		$ticker_url = 'https://fmpcloud.io/api/v3/quotes/commodity?apikey='.$appkey;
        $commodity = Http::get($ticker_url)->json();
        dd($commodity);
        foreach ($commodity['data'] as $commo) {
            $findcommodity = DB::table('stock_commodity')->where('symbol', $commo['symbol'])->first();
            if (empty($findcommodity)) {
                $data['symbol'] = $commo['symbol'];
                $data['name'] = $commo['name'];
                $data['name'] = $commo['name'];
                $data['currentvalue'] = $commo['currentvalue'];
                DB::table('stock_commodity')->insert($data);
            }
        }
        return redirect()->back()->with('success','Commodity Successfully Imported');
    }

    public static function getcompanylist($name)
    {
        $appkey= 'aa3bc02c99db452086055505891e79d6';
		$ticker_url = 'https://api.twelvedata.com/stocks?exchange='.$name;
        $companylist = Http::get($ticker_url)->json();
        foreach ($companylist['data'] as $company) {
            $findcompany = DB::table('stock_companies')->where('symbol', $company['symbol'])->first();
            if (empty($findcompany)) {
                $data['symbol'] = $company['symbol'];
                $data['name'] = $company['name'];
                $data['exchange'] = $company['exchange'];
                $data['type'] = $company['type'];
                $data['currency'] = $company['currency'];
                $data['country'] = $company['country'];
                $data['mic_code'] = $company['mic_code'];
                DB::table('stock_companies')->insert($data);
            }else{
                $data['name'] = $company['name'];
                $data['exchange'] = $company['exchange'];
                $data['type'] = $company['type'];
                $data['currency'] = $company['currency'];
                $data['country'] = $company['country'];
                $data['mic_code'] = $company['mic_code'];
                DB::table('stock_companies')->where('symbol', $company['symbol'])->update($data);
            }
        }
        return redirect()->back()->with('success','Company Successfully Imported');
    }
    public static function getcompanyprofile($symbol)
    {
        $appkey= 'aa3bc02c99db452086055505891e79d6';
		$ticker_url = 'https://api.twelvedata.com/quote?symbol='.$symbol.'&apikey=aa3bc02c99db452086055505891e79d6';
        $companyprice = Http::get($ticker_url)->json();
        dd($companyprice);
        foreach ($companylist['data'] as $company) {
            $findcompany = DB::table('stock_companies')->where('symbol', $company['symbol'])->first();
            if (empty($findcompany)) {
                $data['symbol'] = $company['symbol'];
                $data['name'] = $company['name'];
                $data['exchange'] = $company['exchange'];
                $data['type'] = $company['type'];
                $data['currency'] = $company['currency'];
                $data['country'] = $company['country'];
                DB::table('stock_companies')->insert($data);
            }
        }
        return redirect()->back()->with('success','Company Successfully Updated');
    }

    public static function getcompanyprice($symbol)
    {
        $appkey= 'aa3bc02c99db452086055505891e79d6';
		$ticker_url = 'https://api.twelvedata.com/price?symbol='.$symbol.'&apikey=aa3bc02c99db452086055505891e79d6';
        $companyprice = Http::get($ticker_url)->json();
        DB::table('stock_companies')->where('symbol', $symbol)->update(['currentvalue'=>$companyprice['price']]);
        return redirect()->back()->with('success','Price Successfully Updated');
    }
}
