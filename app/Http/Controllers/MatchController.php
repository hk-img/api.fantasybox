<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;

class MatchController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view($fantasy_type)
    {   
        $fantasy_type = base64_decode($fantasy_type);
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $collection = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->leftjoin('teams as team1', 'team1.id', '=', 'listmatches.team1')->leftjoin('teams as team2', 'team2.id', '=', 'listmatches.team2')->leftjoin('series', 'series.id', '=', 'listmatches.series')->where('fantasy.name', $fantasy_type)->where('listmatches.start_date', '>=', $currentdate)->select('listmatches.*', 'team1.logo as team1logo', 'team2.logo as team2logo', 'team1.team as team1team', 'team2.team as team2team', 'series.name as seriesname', 'fantasy.name as fantasyname')->where('listmatches.status', '!=', 'completed')->orderBY('listmatches.start_date', 'ASC')->get();
        return view('admin.match.view', compact('collection', 'fantasy_type'));
    }

    public function edit(Request $request, $id)
    {
        $id = base64_decode($id);
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            DB::table('listmatches')->where('id', $id)->update($input);
            return redirect()->back()->with('success', 'Successfully Updated !');
        } else {
            $collection =  DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->leftjoin('teams as team1', 'team1.id', '=', 'listmatches.team1')->leftjoin('teams as team2', 'team2.id', '=', 'listmatches.team2')->leftjoin('series', 'series.id', '=', 'listmatches.series')->where('listmatches.id', $id)->select('listmatches.*', 'team1.logo as team1logo', 'team2.logo as team2logo', 'team1.team as team1team', 'team2.team as team2team', 'series.name as seriesname', 'fantasy.name as fantasyname')->where('listmatches.status', '!=', 'completed')->orderBY('listmatches.start_date', 'ASC')->first();
            $getallseries = DB::table('series')->get();
            return view('admin.match.edit', compact('collection', 'getallseries'));
        }
    }

    public function allmatchview($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $collection = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->where('fantasy.name', $fantasy_type)->select('listmatches.*', 'fantasy.name as fantasyname')->orderBY('listmatches.start_date', 'ASC')->get();
        return view('admin.match.allmatch', compact('collection', 'fantasy_type'));
    }

    public function launchmatch($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        date_default_timezone_set('Asia/Kolkata');
        $findmatchdetails = DB::table('listmatches')->leftjoin('teams as team1', 'listmatches.team1', '=', 'team1.id')->leftjoin('teams as team2', 'listmatches.team2', '=', 'team2.id')->select('listmatches.*', 'team1.id as team1id', 'team2.id as team2id', 'team1.team as team1team', 'team2.team as team2team', 'team1.logo as team1logo', 'team2.logo as team2logo')->where('matchkey', $matchkey)->first();

        $batsman1 = 0;
        $batsman2 = 0;
        $bowlers1 = 0;
        $bowlers2 = 0;
        $allrounder1 = 0;
        $allrounder2 = 0;
        $wk1 = 0;
        $wk2 = 0;
        $criteria = 1;
        if (!empty($findmatchdetails)) {
            $team1 = $findmatchdetails->team1id;
            $team2 = $findmatchdetails->team2id;
            $findallmatchplayers = DB::table('matchplayers')->leftjoin('players', 'matchplayers.playerid', '=', 'players.id')->select('matchplayers.*', 'players.team as playersteam')->where('matchkey', $matchkey)->get();
            $findplayer1details = DB::table('matchplayers')->where('matchplayers.matchkey', $findmatchdetails->matchkey)->where('players.team', $findmatchdetails->team1)->join('players', 'players.id', '=', 'matchplayers.playerid')->select('matchplayers.*', 'players.image')->get();

            $findplayer2details = DB::table('matchplayers')->where('matchplayers.matchkey', $findmatchdetails->matchkey)->where('players.team', $findmatchdetails->team2)->join('players', 'players.id', '=', 'matchplayers.playerid')->select('matchplayers.*', 'players.image')->get();
            if (!empty($findallmatchplayers)) {
                foreach ($findallmatchplayers as $matchplay) {
                    if ($matchplay->playersteam == $team1) {
                        if ($matchplay->role == 'bowler') {
                            $bowlers1++;
                        }
                        if ($matchplay->role == 'batsman') {
                            $batsman1++;
                        }
                        if ($matchplay->role == 'allrounder') {
                            $allrounder1++;
                        }
                        if ($matchplay->role == 'keeper') {
                            $wk1++;
                        }
                        if ($matchplay->role == "") {
                            $criteria = 0;
                            return Redirect()->back()->with('error', 'You cannot launch this match because the role of ' . ucwords($matchplay->name) . ' is not defined.');
                        }
                    }
                    if ($matchplay->playersteam == $team2) {
                        if ($matchplay->role == 'bowler') {
                            $bowlers2++;
                        }
                        if ($matchplay->role == 'batsman') {
                            $batsman2++;
                        }
                        if ($matchplay->role == 'allrounder') {
                            $allrounder2++;
                        }
                        if ($matchplay->role == 'keeper') {
                            $wk2++;
                        }
                        if ($matchplay->role == "") {
                            $criteria = 0;
                            return Redirect()->back()->with('error', 'You cannot launch this match because the role of ' . ucwords($matchplay->name) . ' is not defined.');
                        }
                    }
                }
            }
        }
        return view('admin.match.launchmatch', compact('findmatchdetails', 'batsman1', 'batsman2', 'bowlers1', 'bowlers2', 'allrounder1', 'allrounder2', 'wk1', 'wk2', 'findplayer1details', 'findplayer2details'));
    }

    public function deletematchplayer(Request $request)
    {
        DB::table('matchplayers')->where('id', $request->id)->delete();
        return true;
    }

    public function launch($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $datastatus['launch_status'] = 'launched';
        $findmatch = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->leftjoin('teams as team1', 'listmatches.team1', '=', 'team1.id')->leftjoin('teams as team2', 'listmatches.team2', '=', 'team2.id')->select('listmatches.*', 'team1.id as team1id', 'team2.id as team2id', 'fantasy.name as fantasy_type')->where('matchkey', $matchkey)->first();
        if (!empty($findmatch)) {
            if ($findmatch->series == 0 || $findmatch->series == "") {
                return Redirect()->back()->with('error', 'You cannot launch this match. Series is required in this match.');
            }
            $team1 = $findmatch->team1id;
            $team2 = $findmatch->team2id;
            $batsman1 = 0;
            $batsman2 = 0;
            $bowlers1 = 0;
            $bowlers2 = 0;
            $allrounder1 = 0;
            $allrounder2 = 0;
            $wk1 = 0;
            $wk2 = 0;
            $criteria = 1;
            $findallmatchplayers = DB::table('matchplayers')->leftjoin('players', 'matchplayers.playerid', '=', 'players.id')->select('matchplayers.*', 'players.team as playerteam')->where('matchkey', $matchkey)->get();

            if (!empty($findallmatchplayers)) {
                foreach ($findallmatchplayers as $matchplay) {
                    if ($matchplay->playerteam == $team1) {
                        if ($matchplay->role == 'bowler') {
                            $bowlers1++;
                        }
                        if ($matchplay->role == 'batsman') {
                            $batsman1++;
                        }
                        if ($matchplay->role == 'allrounder') {
                            $allrounder1++;
                        }
                        if ($matchplay->role == 'keeper') {
                            $wk1++;
                        }
                        if ($matchplay->role == "") {
                            $criteria = 0;
                            return Redirect()->back()->with('error', 'You cannot launch this match because the role of ' . ucwords($matchplay->name) . ' is not defined.');
                        }
                    }
                    if ($matchplay->playerteam == $team2) {
                        if ($matchplay->role == 'bowler') {
                            $bowlers2++;
                        }
                        if ($matchplay->role == 'batsman') {
                            $batsman2++;
                        }
                        if ($matchplay->role == 'allrounder') {
                            $allrounder2++;
                        }
                        if ($matchplay->role == 'keeper') {
                            $wk2++;
                        }
                        if ($matchplay->role == "") {
                            $criteria = 0;
                            return Redirect()->back()->with('error', 'You cannot launch this match because the role of ' . ucwords($matchplay->name) . ' is not defined.');
                        }
                    }
                }
                if ($bowlers1 < 3) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 3 bowlers are required in team1 to launch this match');
                } else if ($bowlers2 < 3) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 3 bowlers are required in team2 to launch this match');
                } else if ($batsman1 < 3) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 3 batman are required in team1 to launch this match');
                } else if ($batsman2 < 3) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 3 batman are required in team2 to launch this match');
                } else if ($wk1 < 1) {
                    $criteria = 0;
                    return Redirect()->back()->withErrors('error', 'Minimum 1 wicketkeeper is required in team1 to launch this match');
                } else if ($wk2 < 1) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 1 wicketkeeper is required in team2 to launch this match');
                } else if ($allrounder1 < 1) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 1 all rounder are required in team1 to launch this match');
                } else if ($allrounder2 < 1) {
                    $criteria = 0;
                    return Redirect()->back()->with('error', 'Minimum 1 all rounder are required in team2 to launch this match');
                }
            }

            if ($criteria == 1) {
                DB::table('listmatches')->where('matchkey', $matchkey)->update($datastatus);
                return redirect()->route('match.customcontest', [
                    'fantasy_type' => base64_encode($findmatch->fantasy_type),
                    'matchkey' => $matchkey
                ])->with('success', 'Successfully launched this match!');
            }
        } else {
            return redirect()->back()->with('error', 'Invalid match Provided');
        }
    }

    public function unlaunch($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $satus['launch_status'] = 'pending';
        DB::table('listmatches')->where('matchkey', $matchkey)->update($satus);
        return Redirect()->back()->with('success', 'Successfully unlaunch the match!');
    }

    public function customcontest(Request $request, $fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $launchedmatch = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->where('fantasy.name', $fantasy_type)->where('listmatches.start_date', '>=', $currentdate)->where('listmatches.status', 'notstarted')->where('listmatches.launch_status', 'launched')->where('listmatches.final_status', 'pending')->select('listmatches.*')->get();
        if (isset($request->matchkey) && !empty($request->matchkey)) {
            $matchchallenges = DB::table('matchchallenges')->join('fantasy', 'fantasy.id', '=', 'matchchallenges.fantasy_type')->select('matchchallenges.*', 'fantasy.name as fantasyname')->where('matchchallenges.matchkey', $request->matchkey)->where('fantasy.name', $fantasy_type)->get();
        } else {
            $matchchallenges = [];
        }
        return view('admin.match.customcontest', compact('launchedmatch', 'matchchallenges', 'fantasy_type'));
    }

    public function importcontest($matchkey)
    {

        $matchkey = base64_decode($matchkey);
        $matchdetail = DB::table('listmatches')->where('id', $matchkey)->first();

        $collection = DB::table('challenges')->join('fantasy', 'fantasy.id', '=', 'challenges.fantasy_type')->join('contest_category', 'contest_category.id', '=', 'challenges.contest_cat')->select('challenges.*', 'fantasy.name as fantasyname', 'contest_category.name as categoryname')->where('fantasy.id', $matchdetail->fantasy_type)->get();
    
        return view('admin.match.importcontest', compact('collection', 'matchkey'));
    }

    public function importmatchcontest(Request $request)
    {
        // dd('importmatchcontest');
        $id = $request->get('matchkey');
        date_default_timezone_set('Asia/Kolkata');
        $findmatch = DB::table('listmatches')->where('matchkey', $id)->first();
        if (!empty($findmatch)) {
            $values = $request->get('contests');
            if (!empty($values)) {
                foreach ($values as $globids) {
                    $leauge = DB::table('challenges')->where('id', $globids)->first();
                    $findchallengeexist = DB::table('matchchallenges')->where('matchkey', $id)->where('challenge_id', $leauge->id)->first();
                    if (empty($findchallengeexist)) {
                        $data['challenge_id'] = $leauge->id;
                        $data['contest_cat'] = $leauge->contest_cat;
                        $data['contest_type'] = $leauge->contest_type;
                        $data['fantasy_type'] = $leauge->fantasy_type;
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
                        $data['team_size'] = $leauge->team_size;
                        $data['created_at'] = date('Y-m-d h:i:s');
                        $data['updated_at'] = date('Y-m-d h:i:s');
                        $getcid = DB::table('matchchallenges')->insertGetId($data);

                        $findpricecrads = DB::table('pricecards')->where('challenge_id', $leauge->id)->get();
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
                                $pdata['price_percent'] = $pricec->price_percent;
                                $pdata['min_position'] = $pricec->min_position;
                                $pdata['max_position'] = $pricec->max_position;
                                $pdata['total'] = $pricec->total;
                                $pdata['created_at'] = date('Y-m-d h:i:s');
                                $pdata['updated_at'] = date('Y-m-d h:i:s');
                                DB::table('matchpricecards')->insert($pdata);
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

    public function updateplayingxi(Request $request, $fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        date_default_timezone_set('Asia/Kolkata');
        $currentdate = date('Y-m-d H:i:s');
        $launchedmatch = DB::table('listmatches')->join('fantasy', 'fantasy.id', '=', 'listmatches.fantasy_type')->where('fantasy.name', $fantasy_type)->where('listmatches.start_date', '>=', $currentdate)->where('listmatches.status', 'notstarted')->where('listmatches.launch_status', 'launched')->where('listmatches.final_status', 'pending')->select('listmatches.*')->get();
        if (isset($request->matchkey) && !empty($request->matchkey)) {
            $matchkey = $request->matchkey;
            $findmatchdetails = DB::table('listmatches')->leftjoin('teams as team1', 'listmatches.team1', '=', 'team1.id')->leftjoin('teams as team2', 'listmatches.team2', '=', 'team2.id')->select('listmatches.*', 'team1.id as team1id', 'team2.id as team2id', 'team1.team as team1team', 'team2.team as team2team', 'team1.logo as team1logo', 'team2.logo as team2logo')->where('matchkey', $matchkey)->first();
            // dd($findmatchdetails->team1team);
            $findplayer1details = DB::table('matchplayers')->where('matchplayers.matchkey', $findmatchdetails->matchkey)->where('players.team', $findmatchdetails->team1)->join('players', 'players.id', '=', 'matchplayers.playerid')->select('matchplayers.*', 'players.image')->get();
            $findplayer2details = DB::table('matchplayers')->where('matchplayers.matchkey', $findmatchdetails->matchkey)->where('players.team', $findmatchdetails->team2)->join('players', 'players.id', '=', 'matchplayers.playerid')->select('matchplayers.*', 'players.image')->get();
        } else {
            $findmatchdetails = [];
            $findplayer1details = [];
            $findplayer2details = [];
        }
        return view('admin.match.updateplayingxi', compact('launchedmatch', 'fantasy_type', 'findmatchdetails', 'findplayer1details', 'findplayer2details'));
    }

    public function updateplayingxiplayer(Request $request)
    {
        $data = DB::table('matchplayers')->where('id', $request->matchplayerid)->first();
        if ($data->vplaying == 0) {
            DB::table('matchplayers')->where('id', $request->matchplayerid)->update(['vplaying' => 1]);
        } else {
            DB::table('matchplayers')->where('id', $request->matchplayerid)->update(['vplaying' => 0]);
        }
        return true;
    }

    public function launchplayingxi(Request $request, $matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $playerCountsByTeam = DB::table('matchplayers')
            ->join('players', 'players.id', '=', 'matchplayers.playerid')
            ->join('teams', 'teams.id', '=', 'players.team')
            ->where('matchplayers.matchkey', $matchkey)
            ->where('matchplayers.vplaying', 1)
            ->select('players.team', 'teams.team as teamname', DB::raw('count(*) as player_count'))
            ->groupBy('players.team', 'teams.team')
            ->get();
        // dd($playerCountsByTeam[0]->player_count);
        if (!isset($playerCountsByTeam[0]) or !isset($playerCountsByTeam[1])) {
            return redirect()->back()->with('error', 'Minimum 11-11 Player Select From Both Teams !');
        }

        if (isset($playerCountsByTeam[0]->player_count) && $playerCountsByTeam[0]->player_count < 11) {
            return redirect()->back()->with('error', 'Minimum 11 Player Select From ' . $playerCountsByTeam[0]->teamname . ' Team !');
        }

        if (isset($playerCountsByTeam[1]->player_count) && $playerCountsByTeam[1]->player_count < 11) {
            return redirect()->back()->with('error', 'Minimum 11 Player Select From ' . $playerCountsByTeam[1]->teamname . ' Team !');
        }

        $vplayers = DB::table('matchplayers')
            ->where('matchplayers.vplaying', 1)
            ->get();
        if (!empty($vplayers)) {
            foreach ($vplayers as $playerd) {
                DB::table('matchplayers')->where('id', $playerd->id)->update(['playingstatus' => 1]);
            }
            DB::table('listmatches')->where('id', $matchkey)->update(['playing11_status' => 1]);
        }
        return redirect()->back()->with('success', 'Playing XI Launched Successfully !');
    }

    public function unlaunchplayingxi(Request $request, $matchkey)
    {
        $matchkey = base64_decode($matchkey);
        DB::table('matchplayers')->where('matchkey', $matchkey)->update(['playingstatus' => -1, 'vplaying' => 0]);
        DB::table('listmatches')->where('id', $matchkey)->update(['playing11_status' => 0]);
        return redirect()->back()->with('success', 'Playing XI UnLaunched Successfully !');
    }
}
