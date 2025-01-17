<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Auth;

class StockCronController extends Controller
{

    public function importstockmatch(Request $request)
    {
        date_default_timezone_set('Asia/Kolkata');
        $current = date('Y-m-d H:i:s');
        $nextdate = date('Y-m-d 09:15:00', strtotime($current . ' +1 day'));
        $finds=DB::table('stock_listmatches')->where('date',$nextdate)->first();
        if(!empty($finds)){
            echo '<pre>';print_r('Already Created');die;
        }
        
        $day= date('l', strtotime($current . ' +1 day'));
        if($current<$nextdate && $day!='Saturday' && $day != 'Sunday'){
            $data1['launch_status']='launched';
            $data1['date']=$nextdate;  
            $mid = DB::table('stock_listmatches')->insertGetId($data1);
            DB::table('stock_listmatches')->where('id',$mid)->update(['matchkey'=>$mid]);
            $leauges = DB::table('stock_challenges')->get();
            if (!empty($leauges)) {
                foreach ($leauges as $leauge) {
                    $findchallengeexist = DB::table('stock_matchchallenges')->where('matchkey', $mid)->where('challenge_id', $leauge->id)->first();
                    if (empty($findchallengeexist)) {
                        $data['challenge_id'] = $leauge->id;
                        $data['contest_cat'] = $leauge->contest_cat;
                        $data['contest_type'] = $leauge->contest_type;
                        $data['c_type'] = $leauge->c_type;
                        $data['winning_percentage'] = $leauge->winning_percentage;
                        $data['is_bonus'] = $leauge->is_bonus;
                        $data['bonus_percentage'] = $leauge->bonus_percentage;
                        $data['pricecard_type'] = $leauge->pricecard_type;
                        $data['entryfee'] = $leauge->entryfee;
                        $data['win_amount'] = $leauge->win_amount;
                        $data['maximum_user'] = $leauge->maximum_user;
                        $data['status'] = 'opened';
                        $data['confirmed_challenge'] = $leauge->confirmed_challenge;
                        $data['is_running'] = $leauge->is_running;
                        $data['multi_entry'] = $leauge->multi_entry;
                        $data['team_limit'] = $leauge->team_limit;
                        $data['matchkey'] = $mid;
                        $data['created_at'] = date('Y-m-d h:i:s');
                        $data['updated_at'] = date('Y-m-d h:i:s');

                        $getcid = DB::table('stock_matchchallenges')->insertGetId($data);

                        $findpricecrads = DB::table('stock_pricecards')->where('challenge_id', $leauge->id)->get();
                        if (!empty($findpricecrads)) {
                            foreach ($findpricecrads as $pricec) {
                                $pdata['challenge_id'] = $getcid;
                                $pdata['matchkey'] = $mid;
                                $pdata['winners'] = $pricec->winners;
                                $pdata['type'] = $pricec->type;
                                if (!empty($pricec->price)) {
                                    $pdata['price'] = $pricec->price;
                                } else {
                                    $pdata['price'] = 0;
                                }
                                $pdata['min_position'] = $pricec->min_position;
                                $pdata['max_position'] = $pricec->max_position;
                                $pdata['total'] = $pricec->total;
                                $pdata['created_at'] = date('Y-m-d h:i:s');
                                $pdata['updated_at'] = date('Y-m-d h:i:s');
                                DB::table('stock_matchpricecards')->insert($pdata);
                            }
                        }
                    }
                }
            }
        }
        echo '<pre>';print_r('Done');die;  
    }

    
    
    
}
