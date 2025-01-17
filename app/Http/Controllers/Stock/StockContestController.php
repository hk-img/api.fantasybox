<?php

namespace App\Http\Controllers\Stock;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\Controller;

class StockContestController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('stock_challenges')->where('entryfee', $input['entryfee'])->where('win_amount', $input['win_amount'])->first();
            if (!empty($checkchallenge)) {
                return redirect()->back()->with('error', 'Contest Already Exist !');
            } else {
                if (isset($input['team_limit'])) {
                    if ($input['team_limit'] == 0) {
                        return redirect()->back()->with('error', 'Value of multientry limit not equal to 0...');
                    }
                }
                if (isset($input['maximum_user'])) {
                    if ($input['maximum_user'] < 2) {
                        return redirect()->back()->with('error', 'Value of maximum user not less than 2...');
                    }
                }
                if (isset($input['winning_percentage'])) {
                    if ($input['winning_percentage'] == 0) {
                        return redirect()->back()->with('error', 'Value of winning percentage not equal to 0...');
                    }
                }
                if (!isset($input['winning_percentage'])) {
                    $input['winning_percentage'] = 0;
                }
                if (isset($input['bonus_percentage'])) {
                    if ($input['bonus_percentage'] == 0) {
                        return redirect()->back()->with('error', 'Value of bonus percentage not equal to 0...');
                    }
                }
                if ($input['contest_type'] == 'Percentage') {
                    $input['maximum_user'] = '0';
                    $input['pricecard_type'] = '0';
                }
                if ($input['contest_type'] == 'Amount') {
                    if (empty($input['pricecard_type'])) {
                        $input['pricecard_type'] = 'Amount';
                    }
                    $input['winning_percentage'] = '0';
                }

                DB::table('stock_challenges')->insert($input);
                return redirect()->route('stockglobalcontest.view')->with('success', 'Successfully Added !');
            }
        } else {
            return view('admin.stock.globalcontest.add');
        }
    }

    public function view()
    {
        $collection = DB::table('stock_challenges')->join('stock_contest_category', 'stock_contest_category.id', '=', 'stock_challenges.contest_cat')->select('stock_challenges.*', 'stock_contest_category.name as categoryname')->get();
        return view('admin.stock.globalcontest.view', compact('collection'));
    }

    public function edit(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('stock_challenges')->where('id', $id)->first();
            if (isset($input['team_limit'])) {
                if ($input['team_limit'] == 0) {
                    return redirect()->back()->with('error', 'Value of multientry limit not equal to 0...');
                }
            }
            if (isset($input['maximum_user'])) {
                if ($input['maximum_user'] < 2) {
                    return redirect()->back()->with('error', 'Value of maximum user not less than 2...');
                }
            }
            if (isset($input['winning_percentage'])) {
                if ($input['winning_percentage'] == 0) {
                    return redirect()->back()->with('error', 'Value of winning percentage not equal to 0...');
                }
            }

            if (!isset($input['winning_percentage'])) {
                $input['winning_percentage'] = 0;
            }

            if (isset($input['bonus_percentage'])) {
                if ($input['bonus_percentage'] == 0) {
                    return redirect()->back()->with('error', 'Value of bonus percentage not equal to 0...');
                }
            }
            if ($input['win_amount'] != $checkchallenge->win_amount) {
                DB::table('pricecards')->where('challenge_id', $checkchallenge->id)->delete();
            }
            if ($input['contest_type'] == 'Percentage') {
                $input['maximum_user'] = '0';
                $input['pricecard_type'] = '0';
                $pricecarddata = DB::table('pricecards')->where('challenge_id', $id)->get();
                if (!empty($pricecarddata)) {
                    DB::table('pricecards')->where('challenge_id', $id)->delete();
                }
            }
            if ($input['contest_type'] == 'Amount') {
                if (empty($input['pricecard_type'])) {
                    $input['pricecard_type'] = 'Amount';
                }
                $input['winning_percentage'] = '0';
            }
            DB::table('stock_challenges')->where('id', $id)->update($input);
            return redirect()->route('stockglobalcontest.view')->with('success', 'Successfully Added !');
        } else {
            $collection = DB::table('stock_challenges')->where('id', $id)->first();
            return view('admin.stock.globalcontest.edit', compact('collection'));
        }
    }

    public function deleteglobalcontest(Request $request)
    {
        DB::table('stock_challenges')->where('id', $request->id)->delete();
        $data = DB::table('stock_pricecards')->where('challenge_id', $request->id)->select('id')->get();
        $d = $data->toArray();
        if (!empty($d)) {
            DB::table('stock_pricecards')->where('challenge_id', $request->id)->delete();
        }
        return true;
    }

    public function globalpricecard(Request $request, $id)
    {
        $id = base64_decode($id);
        $findminposition = DB::table('stock_pricecards')->where('challenge_id', $id)->orderBY('id', 'DESC')->select('max_position')->first();
        if (empty($findminposition)) {
            $min_position = 0;
            $totalam = 0;
        } else {
            $totalam = DB::table('stock_pricecards')->where('challenge_id', $id)->sum('total');
            $min_position = $findminposition->max_position;
        }
        if ($request->isMethod('post')) {
            $findchallenge = DB::table('stock_challenges')->where('id', $id)->first();
            $totalPriceAmount = DB::table('stock_pricecards')
                ->where('challenge_id', $id)
                ->sum('total');
            $input = $request->all();
            unset($input['_token']);
            if (isset($input['price']) and $input['price'] == '0') {
                return redirect()->back()->with('error', 'Amount should be greater than 0');
            }

            if ($input['winners'] == 0) {
                return redirect()->back()->with('error', 'Number of winner not equal to zero.');
            } 
            if (isset($input['price']) && !empty($input['price'])) {
                $input['price'] = $input['price'];
            } else {
                $input['price'] = 0;
                $input['price_percent'] = $input['price_percent'];
            }

            $input['max_position'] = $input['min_position'] + $input['winners'];
            if (isset($input['price'])) {
                $input['total'] = $input['price'] * $input['winners'];
                $input['type'] = 'Amount';
            }
            if (!empty($input['price_percent'])) {
                $percent_amt = ($input['price_percent'] / 100) * $findchallenge->win_amount;
                $input['total'] = $percent_amt * $input['winners'];
                $input['type'] = 'Percentage';
            }
            $input['challenge_id'] = $id;
            unset($input['_token']);
            $countamount = $totalPriceAmount + $input['total'];
            if ($countamount > $findchallenge->win_amount) {

                return redirect()->back()->with('error', 'Your price cards amount is greater than the total winning amount');
            }
            if (!empty($findchallenge->maximum_user)) {
                if ($input['max_position'] > $findchallenge->maximum_user) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            } else {
                $per = DB::table('stock_pricecards')->where('challenge_id', $id)->select(DB::raw('sum(stock_pricecards.total) as totalpriceamount'))->get();
                $aa = $per[0]->totalpriceamount + $input['total'];
                if ($aa > 100) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            }
            DB::table('stock_pricecards')->insert($input);
            return redirect()->back()->with('success', 'price card added successfully!');
        } else {
            $collection =  DB::table('stock_challenges')->where('stock_challenges.id', $id)->join('stock_contest_category', 'stock_contest_category.id', '=', 'stock_challenges.contest_cat')->select('stock_challenges.*', 'stock_contest_category.name as categoryname')->first();
            $pricecards = DB::table('stock_pricecards')->where('challenge_id', $id)->get();
            return view('admin.stock.globalcontest.pricecard', compact('collection', 'pricecards', 'min_position', 'totalam'));
        }
    }

    public function globalpricecarddelete(Request $request)
    {
        DB::table('stock_pricecards')->where('id', $request->id)->delete();
        return true;
    }


    public function addcustom(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('stock_matchchallenges')->where('entryfee', $input['entryfee'])->where('win_amount', $input['win_amount'])->first();
            if (!empty($checkchallenge)) {
                return redirect()->back()->with('error', 'Contest Already Exist !');
            } else {
                if (isset($input['team_limit'])) {
                    if ($input['team_limit'] == 0) {
                        return redirect()->back()->with('error', 'Value of multientry limit not equal to 0...');
                    }
                }
                if (isset($input['maximum_user'])) {
                    if ($input['maximum_user'] < 2) {
                        return redirect()->back()->with('error', 'Value of maximum user not less than 2...');
                    }
                }
                if (isset($input['winning_percentage'])) {
                    if ($input['winning_percentage'] == 0) {
                        return redirect()->back()->with('error', 'Value of winning percentage not equal to 0...');
                    }
                }
                if (!isset($input['winning_percentage'])) {
                    $input['winning_percentage'] = 0;
                }
                if (isset($input['bonus_percentage'])) {
                    if ($input['bonus_percentage'] == 0) {
                        return redirect()->back()->with('error', 'Value of bonus percentage not equal to 0...');
                    }
                }
                if ($input['contest_type'] == 'Percentage') {
                    $input['maximum_user'] = '0';
                    $input['pricecard_type'] = '0';
                }
                if ($input['contest_type'] == 'Amount') {
                    if (empty($input['pricecard_type'])) {
                        $input['pricecard_type'] = 'Amount';
                    }
                    $input['winning_percentage'] = '0';
                }

                DB::table('stock_matchchallenges')->insert($input);
                return redirect()->route('match.stockcustomcontest', ['matchkey' => $input['matchkey']])->with('success', 'Successfully Added !');
            }
        } else {
            date_default_timezone_set('Asia/Kolkata');
            $currentdate = date('Y-m-d H:i:s');
            $launchedmatch = DB::table('stock_listmatches')->where('date', '>=', $currentdate)->where('status', 'notstarted')->where('launch_status', 'launched')->where('final_status', 'pending')->get();
            return view('admin.stock.customcontest.add', compact('launchedmatch'));
        }
    }

    public function editcustom(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('stock_matchchallenges')->where('id', $id)->first();
            if (isset($input['team_limit'])) {
                if ($input['team_limit'] == 0) {
                    return redirect()->back()->with('error', 'Value of multientry limit not equal to 0...');
                }
            }
            if (isset($input['maximum_user'])) {
                if ($input['maximum_user'] < 2) {
                    return redirect()->back()->with('error', 'Value of maximum user not less than 2...');
                }
            }
            if (isset($input['winning_percentage'])) {
                if ($input['winning_percentage'] == 0) {
                    return redirect()->back()->with('error', 'Value of winning percentage not equal to 0...');
                }
            }

            if (!isset($input['winning_percentage'])) {
                $input['winning_percentage'] = 0;
            }

            if (isset($input['bonus_percentage'])) {
                if ($input['bonus_percentage'] == 0) {
                    return redirect()->back()->with('error', 'Value of bonus percentage not equal to 0...');
                }
            }
            if ($input['win_amount'] != $checkchallenge->win_amount) {
                DB::table('stock_matchpricecards')->where('challenge_id', $checkchallenge->id)->delete();
            }
            if ($input['contest_type'] == 'Percentage') {
                $input['maximum_user'] = '0';
                $input['pricecard_type'] = '0';
                $pricecarddata = DB::table('stock_matchpricecards')->where('challenge_id', $id)->get();
                if (!empty($pricecarddata)) {
                    DB::table('stock_matchpricecards')->where('challenge_id', $id)->delete();
                }
            }
            if ($input['contest_type'] == 'Amount') {
                if (empty($input['pricecard_type'])) {
                    $input['pricecard_type'] = 'Amount';
                }
                $input['winning_percentage'] = '0';
            }
            DB::table('stock_matchchallenges')->where('id', $id)->update($input);
            return redirect()->route('match.stockcustomcontest', ['matchkey' => $checkchallenge->matchkey])->with('success', 'Successfully Added !');
        } else {
            date_default_timezone_set('Asia/Kolkata');
            $currentdate = date('Y-m-d H:i:s');
            $collection = DB::table('stock_matchchallenges')->where('id', $id)->first();
            $launchedmatch = DB::table('stock_listmatches')->where('stock_listmatches.date', '>=', $currentdate)->where('stock_listmatches.status', 'notstarted')->where('stock_listmatches.launch_status', 'launched')->where('stock_listmatches.final_status', 'pending')->select('stock_listmatches.*')->get();
            return view('admin.stock.customcontest.edit', compact('collection', 'launchedmatch'));
        }
    }

    public function deletecustomcontest(Request $request)
    {
        $joineduser = DB::table('joinedleauges')->where('challengeid', $request->id)->count();
        if ($joineduser == 0) {
            DB::table('stock_matchchallenges')->where('id', $request->id)->delete();
            $data = DB::table('stock_matchpricecards')->where('challenge_id', $request->id)->select('id')->get();
            $d = $data->toArray();
            if (!empty($d)) {
                DB::table('stock_matchpricecards')->where('challenge_id', $request->id)->delete();
            }
            return true;
        } else {
            return 2;
        }
    }

    public function cancelcontest(Request $request)
    {
        $joineduser = DB::table('joinedleauges')->where('challengeid', $request->id)->get();
        DB::table('stock_matchchallenges')->where('id', $request->id)->update(['status' => 'cancelled']);
        //Amount Refund Code
        return true;
    }

    public function custompricecard(Request $request, $id)
    {
        $id = base64_decode($id);
        $findminposition = DB::table('stock_matchpricecards')->where('challenge_id', $id)->orderBY('id', 'DESC')->select('max_position')->first();
        if (empty($findminposition)) {
            $min_position = 0;
            $totalam = 0;
        } else {
            $totalam = DB::table('stock_matchpricecards')->where('challenge_id', $id)->sum('total');
            $min_position = $findminposition->max_position;
        }
        if ($request->isMethod('post')) {
            $findchallenge = DB::table('stock_matchchallenges')->where('id', $id)->first();
            $totalPriceAmount = DB::table('stock_matchpricecards')
                ->where('challenge_id', $id)
                ->sum('total');
            $input = $request->all();
            unset($input['_token']);
            if (isset($input['price']) and $input['price'] == '0') {
                return redirect()->back()->with('error', 'Amount should be greater than 0');
            }

            if ($input['winners'] == 0) {
                return redirect()->back()->with('error', 'Number of winner not equal to zero.');
            } 
            if (isset($input['price']) && !empty($input['price'])) {
                $input['price'] = $input['price'];
            } else {
                $input['price'] = 0;
                $input['price_percent'] = $input['price_percent'];
            }

            $input['max_position'] = $input['min_position'] + $input['winners'];
            if (isset($input['price'])) {
                $input['total'] = $input['price'] * $input['winners'];
                $input['type'] = 'Amount';
            }
            if (!empty($input['price_percent'])) {
                $percent_amt = ($input['price_percent'] / 100) * $findchallenge->win_amount;
                $input['total'] = $percent_amt * $input['winners'];
                $input['type'] = 'Percentage';
            }
            $input['challenge_id'] = $id;
            unset($input['_token']);
            $countamount = $totalPriceAmount + $input['total'];
            if ($countamount > $findchallenge->win_amount) {

                return redirect()->back()->with('error', 'Your price cards amount is greater than the total winning amount');
            }
            if (!empty($findchallenge->maximum_user)) {
                if ($input['max_position'] > $findchallenge->maximum_user) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            } else {
                $per = DB::table('stock_matchpricecards')->where('challenge_id', $id)->select(DB::raw('sum(stock_matchpricecards.total) as totalpriceamount'))->get();
                $aa = $per[0]->totalpriceamount + $input['total'];
                if ($aa > 100) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            }
            DB::table('stock_matchpricecards')->insert($input);
            return redirect()->back()->with('success', 'price card added successfully!');
        } else {
            $collection =  DB::table('stock_matchchallenges')->where('stock_matchchallenges.id', $id)->join('stock_contest_category', 'stock_contest_category.id', '=', 'stock_matchchallenges.contest_cat')->select('stock_matchchallenges.*', 'stock_contest_category.name as categoryname')->first();
            $pricecards = DB::table('stock_matchpricecards')->where('challenge_id', $id)->get();
            return view('admin.stock.customcontest.pricecard', compact('collection', 'pricecards', 'min_position', 'totalam'));
        }
    }

    public function custompricecarddelete(Request $request)
    {
        DB::table('stock_matchpricecards')->where('id', $request->id)->delete();
        return true;
    }

    public function stockcustomcontest(Request $request)
    {
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $launchedmatch = DB::table('stock_listmatches')->where('date', '>=', $currentdate)->where('status', 'notstarted')->where('launch_status', 'launched')->where('final_status', 'pending')->get();
        if (isset($request->matchkey) && !empty($request->matchkey)) {
            $matchchallenges = DB::table('stock_matchchallenges')->where('stock_matchchallenges.matchkey', $request->matchkey)->get();
        } else {
            $matchchallenges = [];
        }
        return view('admin.stock.match.customcontest', compact('launchedmatch', 'matchchallenges'));
    }

    public function importstockcontest($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $matchdetail = DB::table('stock_listmatches')->where('id', $matchkey)->first();
        $collection = DB::table('stock_challenges')->join('stock_contest_category', 'stock_contest_category.id', '=', 'stock_challenges.contest_cat')->select('stock_challenges.*','stock_contest_category.name as categoryname')->get();
        return view('admin.stock.match.importcontest', compact('collection', 'matchkey'));
    }

    public function importstockmatchcontest(Request $request)
    {
        $id = $request->get('matchkey');
        date_default_timezone_set('Asia/Kolkata');
        $findmatch = DB::table('stock_listmatches')->where('matchkey', $id)->first();
        if (!empty($findmatch)) {
            $values = $request->get('contests');
            if (!empty($values)) {
                foreach ($values as $globids) {
                    $leauge = DB::table('stock_challenges')->where('id', $globids)->first();
                    $findchallengeexist = DB::table('stock_matchchallenges')->where('matchkey', $id)->where('challenge_id', $leauge->id)->first();
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
                        $data['matchkey'] = $id;
                        $data['created_at'] = date('Y-m-d h:i:s');
                        $data['updated_at'] = date('Y-m-d h:i:s');

                        $getcid = DB::table('stock_matchchallenges')->insertGetId($data);

                        $findpricecrads = DB::table('stock_pricecards')->where('challenge_id', $leauge->id)->get();
                        if (!empty($findpricecrads)) {
                            foreach ($findpricecrads as $pricec) {
                                $pdata['challenge_id'] = $getcid;
                                $pdata['matchkey'] = $id;
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
            return true;
            die;
        } else {
            return false;
            die;
        }
    }
}
