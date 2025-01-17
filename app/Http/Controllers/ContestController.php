<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class ContestController extends Controller
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
            $checkchallenge = DB::table('challenges')->where('fantasy_type', $input['fantasy_type'])->where('entryfee', $input['entryfee'])->where('win_amount', $input['win_amount'])->first();
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
                if (isset($input['team_size'])) {
                    if ($input['team_size'] < 2) {
                        return redirect()->back()->with('error', 'Value of  Team Size is greater then 2 ...');
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
                DB::table('challenges')->insert($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->first();
                return redirect()->route('globalcontest.view', base64_encode($fantast_type->name))->with('success', 'Successfully Added !');
            }
        } else {
            return view('admin.globalcontest.add');
        }
    }

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('challenges')->join('fantasy', 'fantasy.id', '=', 'challenges.fantasy_type')->join('contest_category', 'contest_category.id', '=', 'challenges.contest_cat')->select('challenges.*', 'fantasy.name as fantasyname', 'contest_category.name as categoryname')->where('fantasy.name', $fantasy_type)->get();
        return view('admin.globalcontest.view', compact('collection', 'fantasy_type'));
    }

    public function edit(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('challenges')->where('id', $id)->first();
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
            if (isset($input['team_size'])) {
                if ($input['team_size'] < 2) {
                    return redirect()->back()->with('error', 'Value of  Team Size is greater then 2 ...');
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
            DB::table('challenges')->where('id', $id)->update($input);
            $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->first();
            return redirect()->route('globalcontest.view', base64_encode($fantast_type->name))->with('success', 'Successfully Added !');
        } else {
            $collection = DB::table('challenges')->where('id', $id)->first();
            return view('admin.globalcontest.edit', compact('collection'));
        }
    }

    public function deleteglobalcontest(Request $request)
    {
        DB::table('challenges')->where('id', $request->id)->delete();
        $data = DB::table('pricecards')->where('challenge_id', $request->id)->select('id')->get();
        $d = $data->toArray();
        if (!empty($d)) {
            DB::table('pricecards')->where('challenge_id', $request->id)->delete();
        }
        return true;
    }

    public function globalpricecard(Request $request, $id)
    {
        $id = base64_decode($id);
        $findminposition = DB::table('pricecards')->where('challenge_id', $id)->orderBY('id', 'DESC')->select('max_position')->first();
        if (empty($findminposition)) {
            $min_position = 0;
            $totalam = 0;
        } else {
            $totalam = DB::table('pricecards')->where('challenge_id', $id)->sum('total');
            $min_position = $findminposition->max_position;
        }
        if ($request->isMethod('post')) {
            $findchallenge = DB::table('challenges')->where('id', $id)->first();
            $totalPriceAmount = DB::table('pricecards')
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
                $per = DB::table('pricecards')->where('challenge_id', $id)->select(DB::raw('sum(pricecards.total) as totalpriceamount'))->get();
                $aa = $per[0]->totalpriceamount + $input['total'];
                if ($aa > 100) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            }
            DB::table('pricecards')->insert($input);
            return redirect()->back()->with('success', 'price card added successfully!');
        } else {
            $collection =  DB::table('challenges')->join('fantasy', 'fantasy.id', '=', 'challenges.fantasy_type')->where('challenges.id', $id)->join('contest_category', 'contest_category.id', '=', 'challenges.contest_cat')->select('challenges.*', 'fantasy.name as fantasyname', 'contest_category.name as categoryname')->first();
            $pricecards = DB::table('pricecards')->where('challenge_id', $id)->get();
            return view('admin.globalcontest.pricecard', compact('collection', 'pricecards', 'min_position', 'totalam'));
        }
    }

    public function globalpricecarddelete(Request $request)
    {
        DB::table('pricecards')->where('id', $request->id)->delete();
        return true;
    }


    public function addcustom(Request $request, $fantasy_type)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('matchchallenges')->where('fantasy_type', $input['fantasy_type'])->where('entryfee', $input['entryfee'])->where('win_amount', $input['win_amount'])->first();
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
                if (isset($input['team_size'])) {
                    if ($input['team_size'] < 2) {
                        return redirect()->back()->with('error', 'Value of  Team Size is greater then 2 ...');
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

                DB::table('matchchallenges')->insert($input);
                $fantast_type = DB::table('fantasy')->where('id', $input['fantasy_type'])->first();
                return redirect()->route('match.customcontest', ['fantasy_type' => base64_encode($fantast_type->name), 'matchkey' => $input['matchkey']])->with('success', 'Successfully Added !');
            }
        } else {
            $fantasy_type = base64_decode($fantasy_type);
            date_default_timezone_set('Asia/Kolkata');
            $currentdate = date('Y-m-d H:i:s');
            $launchedmatch = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->where('fantasy.name', $fantasy_type)->where('listmatches.start_date', '>=', $currentdate)->where('listmatches.status', 'notstarted')->where('listmatches.launch_status', 'launched')->where('listmatches.final_status', 'pending')->select('listmatches.*')->get();
            return view('admin.customcontest.add', compact('launchedmatch', 'fantasy_type'));
        }
    }

    public function editcustom(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            $checkchallenge = DB::table('matchchallenges')->where('id', $id)->first();
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
            if (isset($input['team_size'])) {
                if ($input['team_size'] < 2) {
                    return redirect()->back()->with('error', 'Value of  Team Size is greater then 2 ...');
                }
            }   
            if (!isset($input['confirmed_challenge'])) {
                $input['confirmed_challenge'] = "0";
            }
            if (!isset($input['is_running'])) {
                $input['is_running'] = "0";
            }
            if (!isset($input['is_bonus'])) {
                $input['is_bonus'] = "0";
            }

            if ($input['win_amount'] != $checkchallenge->win_amount) {
                DB::table('matchpricecards')->where('challenge_id', $checkchallenge->id)->delete();
            }
            if ($input['contest_type'] == 'Percentage') {
                $input['maximum_user'] = '0';
                $input['pricecard_type'] = '0';
                $pricecarddata = DB::table('matchpricecards')->where('challenge_id', $id)->get();
                if (!empty($pricecarddata)) {
                    DB::table('matchpricecards')->where('challenge_id', $id)->delete();
                }
            }
            if ($input['contest_type'] == 'Amount') {
                if (empty($input['pricecard_type'])) {
                    $input['pricecard_type'] = 'Amount';
                }
                $input['winning_percentage'] = '0';
            }
            DB::table('matchchallenges')->where('id', $id)->update($input);
            $fantast_type = DB::table('fantasy')->where('id', $checkchallenge->fantasy_type)->first();
            return redirect()->route('match.customcontest', ['fantasy_type' => base64_encode($fantast_type->name), 'matchkey' => $checkchallenge->matchkey])->with('success', 'Successfully Added !');
        } else {
            date_default_timezone_set('Asia/Kolkata');
            $currentdate = date('Y-m-d H:i:s');
            $collection = DB::table('matchchallenges')->join('fantasy', 'fantasy.id', '=', 'matchchallenges.fantasy_type')->where('matchchallenges.id', $id)->select('matchchallenges.*','fantasy.name as fantasyname')->first();
            $launchedmatch = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->where('fantasy.id', $collection->fantasy_type)->where('listmatches.start_date', '>=', $currentdate)->where('listmatches.status', 'notstarted')->where('listmatches.launch_status', 'launched')->where('listmatches.final_status', 'pending')->select('listmatches.*')->get();
            return view('admin.customcontest.edit', compact('collection', 'launchedmatch'));
        }
    }

    public function deletecustomcontest(Request $request)
    {
        $joineduser = DB::table('joinedleauges')->where('challengeid', $request->id)->count();
        if ($joineduser == 0) {
            DB::table('matchchallenges')->where('id', $request->id)->delete();
            $data = DB::table('matchpricecards')->where('challenge_id', $request->id)->select('id')->get();
            $d = $data->toArray();
            if (!empty($d)) {
                DB::table('matchpricecards')->where('challenge_id', $request->id)->delete();
            }
            return true;
        } else {
            return 2;
        }
    }

    public function cancelcontest(Request $request)
    {
        $joineduser = DB::table('joinedleauges')->where('challengeid', $request->id)->get();
        DB::table('matchchallenges')->where('id', $request->id)->update(['status' => 'cancelled']);
        //Amount Refund Code
        return true;
    }

    public function custompricecard(Request $request, $id)
    {
        $id = base64_decode($id);
        $findminposition = DB::table('matchpricecards')->where('challenge_id', $id)->orderBY('id', 'DESC')->select('max_position')->first();
        if (empty($findminposition)) {
            $min_position = 0;
            $totalam = 0;
        } else {
            $totalam = DB::table('matchpricecards')->where('challenge_id', $id)->sum('total');
            $min_position = $findminposition->max_position;
        }
        if ($request->isMethod('post')) {
            $findchallenge = DB::table('matchchallenges')->where('id', $id)->first();
            $totalPriceAmount = DB::table('matchpricecards')
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
                $per = DB::table('matchpricecards')->where('challenge_id', $id)->select(DB::raw('sum(matchpricecards.total) as totalpriceamount'))->get();
                $aa = $per[0]->totalpriceamount + $input['total'];
                if ($aa > 100) {
                    return redirect()->back()->with('error', 'You cannot add more winners.');
                }
            }
            DB::table('matchpricecards')->insert($input);
            return redirect()->back()->with('success', 'price card added successfully!');
        } else {
            $collection =  DB::table('matchchallenges')->join('fantasy', 'fantasy.id', '=', 'matchchallenges.fantasy_type')->where('matchchallenges.id', $id)->join('contest_category', 'contest_category.id', '=', 'matchchallenges.contest_cat')->select('matchchallenges.*', 'fantasy.name as fantasyname', 'contest_category.name as categoryname')->first();
            $pricecards = DB::table('matchpricecards')->where('challenge_id', $id)->get();
            return view('admin.customcontest.pricecard', compact('collection', 'pricecards', 'min_position', 'totalam'));
        }
    }

    public function custompricecarddelete(Request $request)
    {
        DB::table('matchpricecards')->where('id', $request->id)->delete();
        return true;
    }
}
