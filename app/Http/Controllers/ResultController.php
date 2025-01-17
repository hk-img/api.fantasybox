<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use App\Traits\EntityTrait;
use App\Traits\SettingsTrait;

class ResultController extends Controller
{

    public function view($fantasy_type)
    {
        $fantasy_type = base64_decode($fantasy_type);
        $collection = DB::table('series')
            ->join('fantasy', 'fantasy.id', '=', 'series.fantasy_type')
            ->join('listmatches', 'listmatches.series', '=', 'series.id')
            ->select('series.id', 'series.name', 'series.start_date', 'series.end_date', 'fantasy.name as fantasyname')
            ->where('listmatches.launch_status', 'launched')
            ->where('fantasy.name', $fantasy_type)
            ->groupBy('series.id', 'series.name', 'series.start_date', 'series.end_date', 'fantasy.name')
            ->get();
        return view('admin.result.view', compact('collection', 'fantasy_type'));
    }

    public function seriesdetail($seriesid)
    {
        $seriesid = base64_decode($seriesid);
        $collection = DB::table('listmatches')->where('series', $seriesid)->where('launch_status', 'launched')->get();
        return view('admin.result.seriesdetail', compact('collection'));
    }

    public function matchcontests($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $collection = DB::table('matchchallenges')->where('matchkey', $matchkey)->get();
        $matchdetails = DB::table('listmatches')->where('matchkey', $matchkey)->first();
        return view('admin.result.matchcontests', compact('collection', 'matchdetails'));
    }

    public function matchcancel(Request $request)
    {
        $matchkey = $request->matchkey;
        $checkmatch =  DB::table('listmatches')->where('matchkey', $matchkey)->where('final_status', 'IsCanceled')->first();
        if (empty($checkmatch)) {
            $reason = 'Match canceled';
            $mst['final_status'] = 'IsCanceled';
            DB::table('listmatches')->where('matchkey', $matchkey)->update($mst);
            ResultController::refund_allamount($matchkey, $reason);
            return true;
        }
    }

    public function matchwinnerdeclear(Request $request)
    {
        $matchkey = $request->matchkey;
        $checkpassword = DB::table('users')->where('id', Auth::user()->id)->where('masterpassword', $request->masterpassword)->first();
        if (!empty($checkpassword)) {
            // match winner working

            $abcdd = DB::table('listmatches')->where('matchkey', $matchkey)
                ->where('final_status', '!=', 'winnerdeclared')
                ->where('final_status', '!=', 'IsCanceled')
                ->first();

            if (!empty($abcdd)) {
                $allchallenges = DB::table('matchchallenges')->where('matchkey', $matchkey)
                    ->where('status', '!=', 'canceled')
                    ->select('id', 'win_amount', 'contest_type', 'winning_percentage', 'pricecard_type', 'entryfee', 'id', 'joinedusers', 'is_bonus', 'bonus_percentage', 'maximum_user', 'confirmed_challenge')
                    ->get();

                if (!empty($allchallenges)) {
                    foreach ($allchallenges as $challenge) {
                        $totaljoineduser = DB::table('joinedleauges')->where('matchkey', $matchkey)->where('challengeid', $challenge->id)->count();
                        if ($challenge->maximum_user > $totaljoineduser) {
                            if ($challenge->confirmed_challenge == 0) {
                                $getresponse = $this->refundprocess($challenge->id, $challenge->entryfee, $matchkey, 'challenge cancel');
                                if ($getresponse == true) {
                                    $data['status'] = 'canceled';
                                    DB::table('matchchallenges')->where('id', $challenge->id)->update($data);
                                }
                            } elseif ($challenge->confirmed_challenge == 1 && $totaljoineduser == 1) {
                                $getresponse = $this->refundprocess($challenge->id, $challenge->entryfee, $matchkey, 'challenge cancel');
                                if ($getresponse == true) {
                                    $data['status'] = 'canceled';
                                    DB::table('matchchallenges')->where('id', $challenge->id)->update($data);
                                }
                            }
                        }
                    }
                }

                $allchallenges = DB::table('matchchallenges')->where('matchkey', $matchkey)
                    ->where('status', '!=', 'canceled')
                    ->select('win_amount', 'contest_type', 'winning_percentage', 'pricecard_type', 'entryfee', 'id', 'joinedusers', 'is_bonus', 'bonus_percentage', 'win_amount_2', 'contest_cat', 'fantasy_type')
                    ->get();

                if (!empty($allchallenges)) {
                    foreach ($allchallenges as $challenge) {
                        $joinedusers = DB::table('joinedleauges')
                            ->join('matchchallenges', 'matchchallenges.id', '=', 'joinedleauges.challengeid')
                            ->where('joinedleauges.matchkey', $matchkey)
                            ->where('joinedleauges.challengeid', $challenge->id)
                            ->join('jointeam', 'jointeam.id', '=', 'joinedleauges.teamid')
                            ->select('joinedleauges.userid', 'points', 'joinedleauges.id as jid')
                            ->get();

                        $joinedusers = $joinedusers->toArray();
                        if (!empty($joinedusers)) {

                            // calculate the price cards //
                            if ($challenge->contest_type == 'Amount') {
                                $prc_arr = array();
                                if ($challenge->pricecard_type == 'Amount') {
                                    $matchpricecards = DB::table('matchpricecards')->where('challenge_id', $challenge->id)->select('min_position', 'max_position', 'price')->get();
                                    $matchpricecards = $matchpricecards->toArray();
                                    if (!empty($matchpricecards)) {
                                        foreach ($matchpricecards as $prccrd) {
                                            $min_position = $prccrd->min_position;
                                            $max_position = $prccrd->max_position;
                                            for ($i = $min_position; $i < $max_position; $i++) {
                                                $prc_arr[$i + 1] = $prccrd->price;
                                            }
                                        }
                                    } else {
                                        $prc_arr[1] = $challenge->win_amount;
                                    }
                                } else {
                                    $matchpricecards = DB::table('matchpricecards')->where('challenge_id', $challenge->id)->select('min_position', 'max_position', 'price_percent')->get();
                                    $matchpricecards = $matchpricecards->toArray();
                                    if (!empty($matchpricecards)) {
                                        foreach ($matchpricecards as $prccrd) {
                                            $min_position = $prccrd->min_position;
                                            $max_position = $prccrd->max_position;
                                            for ($i = $min_position; $i < $max_position; $i++) {
                                                $prc_arr[$i + 1] = ($prccrd->price_percent / 100) * ($challenge->win_amount);
                                            }
                                        }
                                    } else {
                                        $prc_arr[1] = $challenge->win_amount;
                                    }
                                }
                            } else if ($challenge->contest_type == 'Percentage') {
                                $getwinningpercentage = $challenge->winning_percentage;
                                $gtjnusers = $totaljoineduser;
                                $toWin = floor($gtjnusers * $getwinningpercentage / 100);
                                $prc_arr = array();
                                for ($i = 0; $i < $toWin; $i++) {
                                    $prc_arr[$i + 1] = $challenge->win_amount;
                                }
                            }

                            // get the number of users //
                            $user_points = array();
                            if (!empty($joinedusers)) {
                                $lp = 0;
                                foreach ($joinedusers as $jntm) {
                                    $user_points[$lp]['id'] = $jntm->userid;
                                    $user_points[$lp]['points'] = $jntm->points;
                                    $user_points[$lp]['joinedid'] = $jntm->jid;
                                    $lp++;
                                }
                            }
                            SettingsTrait::sortBySubArrayValue($user_points, 'points', 'desc');
                            $poin_user = array();
                            foreach ($user_points as $usr) {
                                $ids_str = "";
                                $userids_str = "";
                                $ids_arr = array();
                                $userids_arr = array();
                                if (array_key_exists("'" . $usr['points'] . "'", $poin_user)) {
                                    if (isset($poin_user["'" . $usr['points'] . "'"]['joinedid'])) {
                                        $ids_str = implode(',', $poin_user["'" . $usr['points'] . "'"]['joinedid']);
                                    }
                                    $ids_str = $ids_str . ',' . $usr['joinedid'];
                                    $ids_arr = explode(',', $ids_str);
                                    $poin_user["'" . $usr['points'] . "'"]['joinedid'] = $ids_arr;
                                    // for user id //
                                    if (isset($poin_user["'" . $usr['points'] . "'"]['id'])) {
                                        $userids_str = implode(',', $poin_user["'" . $usr['points'] . "'"]['id']);
                                    }
                                    $userids_str = $userids_str . ',' . $usr['id'];
                                    $userids_arr = explode(',', $userids_str);
                                    $poin_user["'" . $usr['points'] . "'"]['id'] = $userids_arr;
                                    $poin_user["'" . $usr['points'] . "'"]['points'] = $usr['points'];
                                } else {
                                    $poin_user["'" . $usr['points'] . "'"]['id'][0] = $usr['id'];
                                    $poin_user["'" . $usr['points'] . "'"]['points'] = $usr['points'];
                                    $poin_user["'" . $usr['points'] . "'"]['joinedid'][0] = $usr['joinedid'];
                                }
                            }
                            SettingsTrait::sortBySubArrayValue($poin_user, 'points', 'desc');
                            $win_usr = array();
                            $win_cnt = 0;
                            $count = count($prc_arr);
                            foreach ($poin_user as $kk => $pu) {
                                if ($win_cnt < $count) {
                                    $win_usr[$kk]['min'] = $win_cnt + 1;
                                    $win_cnt = $win_cnt + count($pu['joinedid']);
                                    $win_usr[$kk]['max'] = $win_cnt;
                                    $win_usr[$kk]['count'] = count($pu['joinedid']);
                                    $win_usr[$kk]['joinedid'] = $pu['joinedid'];
                                    $win_usr[$kk]['id'] = $pu['id'];
                                } else {
                                    break;
                                }
                            }
                            $final_poin_user = array();
                            foreach ($win_usr as $ks => $ps) {
                                if ($ps['count'] == 1) {
                                    $final_poin_user[$ps['joinedid'][0]]['points'] = $ks;
                                    $final_poin_user[$ps['joinedid'][0]]['amount'] = $prc_arr[$ps['min']];
                                    $final_poin_user[$ps['joinedid'][0]]['rank'] = $ps['min'];
                                    $final_poin_user[$ps['joinedid'][0]]['userid'] = $ps['id'][0];
                                } else {
                                    $ttl = 0;
                                    $avg_ttl = 0;
                                    for ($jj = $ps['min']; $jj <= $ps['max']; $jj++) {
                                        $sm = 0;

                                        if (isset($prc_arr[$jj])) {
                                            $sm = $prc_arr[$jj];
                                        }
                                        $ttl = $ttl + $sm;
                                    }
                                    $avg_ttl = $ttl / $ps['count'];
                                    foreach ($ps['joinedid'] as $keyuser => $fnl) {
                                        $final_poin_user[$fnl]['points'] = $ks;
                                        $final_poin_user[$fnl]['amount'] = $avg_ttl;
                                        $final_poin_user[$fnl]['rank'] = $ps['min'];
                                        $final_poin_user[$fnl]['userid'] = $ps['id'][$keyuser];
                                    }
                                }
                            }
                            if (!empty($final_poin_user)) {
                                foreach ($final_poin_user as $fpuskjoinid => $fpusv) {
                                    $fpusk = $fpusv['userid'];
                                    $winningdata = DB::table('finalresults')->where('joinedid', $fpuskjoinid)->first();
                                    if (empty($winningdata)) {
                                        $fres = array();
                                        $listmatches = DB::table('listmatches')->where('matchkey', $matchkey)->select('series', 'name')->first();
                                        $challengeid = $challenge->id;
                                        $seriesid = $listmatches->series;
                                        $transactionidsave = 'WIN-' . rand(1000, 99999) . $challengeid . $fpuskjoinid;
                                        $fres['userid'] = $fpusk;
                                        $fres['points'] = str_replace("'", "", $fpusv['points']);
                                        $fres['amount'] = number_format(floor($fpusv['amount'] * 100) / 100, '2', '.', '');
                                        $fres['rank'] = $fpusv['rank'];
                                        $fres['matchkey'] = $matchkey;
                                        $fres['challengeid'] = $challengeid;
                                        $fres['seriesid'] = $seriesid;
                                        $fres['transaction_id'] = $transactionidsave;
                                        $fres['joinedid'] = $fpuskjoinid;
                                        $findalreexist = DB::table('finalresults')->where('joinedid', $fpuskjoinid)->where('userid', $fpusk)->select('id')->first();
                                        if (empty($findalreexist)) {
                                            DB::table('finalresults')->insert($fres);
                                            $finduserbalance = DB::table('userbalance')->where('user_id', $fpusk)->first();
                                            if (!empty($finduserbalance)) {
                                                if ($fpusv['amount'] > 10000) {
                                                    $datatr = array();
                                                    $dataqs = array();
                                                    $tdsdata['tds_amount'] = (31.2 / 100) * ($fres['amount'] / 100);
                                                    $tdsdata['amount'] = $fpusv['amount'];
                                                    $remainingamount = $fres['amount'] - $tdsdata['tds_amount'];
                                                    $tdsdata['userid'] = $fpusk;
                                                    $tdsdata['challengeid'] = $challenge->id;
                                                    DB::table('tdsdetails')->insert($tdsdata);
                                                    $fpusv['amount'] = $remainingamount;
                                                    //user balance//
                                                    $registeruserdetails = DB::table('users')->where('id', $fpusk)->first();
                                                    $findlastow = DB::table('userbalance')->where('user_id', $fpusk)->first();
                                                    $dataqs['winning'] = number_format($findlastow->winning + $fres['amount'], 2, ".", "");

                                                    DB::table('userbalance')->where('id', $findlastow->id)->update($dataqs);
                                                    //transactions entry//
                                                    $datatr['transaction_id'] = $transactionidsave;;
                                                    $datatr['type'] = 'Challenge Winning Amount';
                                                    $datatr['transaction_by'] = SettingsTrait::settings('short_name');
                                                    $datatr['amount'] = $fres['amount'];
                                                    $datatr['paymentstatus'] = 'confirmed';
                                                    $datatr['challengeid'] = $challenge->id;
                                                    $datatr['win_amt'] = $fres['amount'];
                                                    $datatr['bal_bonus_amt'] = $finduserbalance->bonus;
                                                    $datatr['bal_win_amt'] = $dataqs['winning'];
                                                    $datatr['bal_fund_amt'] = $finduserbalance->balance;
                                                    $datatr['userid'] = $fpusk;
                                                    $datatr['total_available_amt'] = $finduserbalance->balance + $dataqs['winning'] + $finduserbalance->bonus;
                                                    DB::table('transactions')->insert($datatr);

                                                    $datanot['title'] = 'You won amount Rs.' . $fres['amount'] . ' and 31.2% amount of ' . $tdsdata['amount'] . ' deducted due to TDS.';
                                                    $datanot['userid'] = $fpusk;
                                                    DB::table('notifications')->insert($datanot);
                                                    //push notifications//
                                                    $explodearray[] = $fpusk;
                                                    $data['subject'] = '🏆Congratulations on Your Match Victory!🏆';
                                                    $data['content'] = "🎉 You're a Winner! 🏆\n\nCongratulations on your victory! You've won the match and earned a prize.\n\nPrize Amount: Rs. {$fres['amount']} has been credited to your account.";
                                                    SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
                                                } else {
                                                    $datatr = array();
                                                    $dataqs = array();
                                                    //user balance//
                                                    $registeruserdetails = DB::table('users')->where('id', $fpusk)->first();

                                                    $findlastow = DB::table('userbalance')->where('user_id', $fpusk)->first();
                                                    $dataqs['winning'] =  number_format($findlastow->winning + $fres['amount'], 2, ".", "");
                                                    DB::table('userbalance')->where('id', $findlastow->id)->update($dataqs);
                                                    if ($fpusv['amount'] > 0) {
                                                        //transactions entry//
                                                        $datatr['transaction_id'] = $transactionidsave;;
                                                        $datatr['type'] = 'Challenge Winning Amount';
                                                        $datatr['transaction_by'] = SettingsTrait::settings('short_name');
                                                        $datatr['amount'] = $fres['amount'];
                                                        $datatr['paymentstatus'] = 'confirmed';
                                                        $datatr['challengeid'] = $challenge->id;
                                                        $datatr['win_amt'] = $fres['amount'];
                                                        $datatr['bal_bonus_amt'] = $finduserbalance->bonus;
                                                        $datatr['bal_win_amt'] = $dataqs['winning'];
                                                        $datatr['bal_fund_amt'] = $finduserbalance->balance;
                                                        $datatr['userid'] = $fpusk;
                                                        $datatr['total_available_amt'] = $finduserbalance->balance + $dataqs['winning'] + $finduserbalance->bonus;
                                                        DB::table('transactions')->insert($datatr);

                                                        //notifications entry//
                                                        $datanot['title'] = 'You won amount Rs.' . $fres['amount'];
                                                        $datanot['userid'] = $fpusk;
                                                        DB::table('notifications')->insert($datanot);
                                                        //push notifications//
                                                        $explodearray[] = $fpusk;
                                                        $data['subject'] = '🏆Congratulations on Your Match Victory!🏆';
                                                        $data['content'] = "🎉 You're a Winner! 🏆\n\nCongratulations on your victory! You've won the match and earned a prize.\n\nPrize Amount: Rs. {$fres['amount']} has been credited to your account.";
                                                        SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                $mst['final_status'] = 'winnerdeclared';
                DB::table('listmatches')->where('matchkey', $matchkey)->update($mst);
                return redirect()->back()->with('success', 'Winner Declear Successfully');
            } else {
                return redirect()->back()->with('error', 'you cannot declare the winner of this match');
            }
        } else {
            return redirect()->back()->with('error', 'Please Enter Correct Password');
        }
    }

    public function viewwinners($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $collection = DB::table('joinedleauges')->where('joinedleauges.matchkey', $matchkey)->join('jointeam', 'jointeam.id', '=', 'joinedleauges.teamid')->join('matchchallenges', 'matchchallenges.id', '=', 'joinedleauges.challengeid')->join('users', 'users.id', '=', 'joinedleauges.userid')->orderBy('joinedleauges.challengeid', 'ASC')->select('matchchallenges.win_amount', 'matchchallenges.entryfee', 'matchchallenges.joinedusers', 'matchchallenges.is_private', 'matchchallenges.bonus_percentage', 'matchchallenges.confirmed_challenge', 'matchchallenges.maximum_user', 'joinedleauges.*', 'users.username as username', 'users.email', 'users.team', 'jointeam.points')->get();
        return view('admin.result.viewwinners', compact('collection'));
    }

    public function viewjoinedusers($challengeid)
    {
        $challengeid = base64_decode($challengeid);
        $collection = DB::table('joinedleauges')->join('users', 'users.id', '=', 'joinedleauges.userid')->where('joinedleauges.challengeid', $challengeid)->select('joinedleauges.*', 'users.name', 'users.email', 'users.mobile', 'users.team')->get();
        return view('admin.result.viewjoinedusers', compact('collection'));
    }

    public function viewchallengewinners($challengeid)
    {
        $challengeid = base64_decode($challengeid);
        $collection = DB::table('finalresults')->join('users', 'users.id', '=', 'finalresults.userid')->join('joinedleauges', 'joinedleauges.id', '=', 'finalresults.joinedid')->where('finalresults.challengeid', $challengeid)->select('finalresults.*', 'users.name', 'users.email', 'users.mobile', 'users.team', 'joinedleauges.teamid')->orderBy('rank', 'DESC')->get();
        return view('admin.result.viewchallengewinners', compact('collection'));
    }

    public function viewteam($matchkey, $teamid)
    {
        $teamid = base64_decode($teamid);
        $matchkey = base64_decode($matchkey);
        $collection = DB::table('jointeam')->where('id', $teamid)->where('matchkey', $matchkey)->first();
        return view('admin.result.viewteam', compact('collection'));
    }

    public function matchscore($matchkey)
    {
        $matchkey = base64_decode($matchkey);
        $collection =  DB::table('result_matches')->join('players', 'players.players_key', '=', 'result_matches.player_key')->join('matchplayers', 'matchplayers.playerid', '=', 'players.id')->join('teams', 'teams.id', '=', 'players.team')->where('result_matches.match_key', $matchkey)->where('matchplayers.matchkey', $matchkey)->orderBy('result_matches.innings')->orderBy('players.team')->select('result_matches.*', 'matchplayers.matchkey as matchplayers_matchkey', 'matchplayers.points as matchplayers_points', 'matchplayers.role as matchplayers_role', 'matchplayers.name as matchplayers_name', 'players.players_key as players_player_key', 'players.team as players_team', 'teams.team as teams_team', 'teams.short_name as team_short_name', 'teams.team_key as teams_team_key', 'matchplayers.playerid as matchplayers_playerid')->get();
        return view('admin.result.matchscore', compact('collection'));
    }

    public function update_results_of_matches()
    {
        $findmatchexist = DB::table('listmatches')
            ->whereDate('start_date', '<=', date('Y-m-d'))
            ->where('launch_status', 'launched')
            ->where('final_status', '!=', 'IsCanceled')
            ->where('final_status', '!=', 'winnerdeclared')
            ->where('status', '!=', 'completed')
            ->get();
        if (!empty($findmatchexist)) {
            foreach ($findmatchexist as $val) {
                $getcurrentdate = date('Y-m-d H:i:s');
                $matchtimings = date('Y-m-d H:i:s', strtotime($val->start_date));
                $matchtimings1 = date('Y-m-d H:i:s', strtotime('-55 minutes', strtotime($val->start_date)));

                if ($getcurrentdate > $matchtimings1 && $val->playing11_status == 0) {
                    // Update playing XI if the match is about to start and playing11_status is 0
                    $match_key = $val->matchkey;
                    $real_match_key = $val->real_matchkey;
                    $this->showplaying($real_match_key, $match_key);
                }

                if ($getcurrentdate >= $matchtimings) {
                    // Update match scores or other relevant data if the match has started
                    $match_key = $val->matchkey;
                    $real_match_key = $val->real_matchkey;

                    if ($val->second_inning_status == 0 || $val->second_inning_status == 1) {
                        $this->getScoresUpdates($real_match_key, $match_key);
                    }
                }
            }
            return 'completed';
        }
    }


    public function showplaying($real_match_key, $match_key)
    {
        // Check if the match exists in the database
        $checkMatch = DB::table('listmatches')
            ->where('matchkey', $match_key)
            ->select('matchkey', 'playing11_status', 'status')
            ->first();

        if (!empty($checkMatch)) {
            // Fetch cricket match player and match info
            $giveresult = EntityTrait::getcricketmatchplayers($real_match_key);
            $giveresult1 = EntityTrait::getcricketmatchinfo($real_match_key);
            $giveresult = $giveresult['response'];
            $giveresult1 = $giveresult1['response'];
            $teamAPlayingXI = [];
            $teamBPlayingXI = [];

            if (isset($giveresult['teama']['squads']) && !empty($giveresult['teama']['squads'])) {
                $teamA = $giveresult['teama'];
                $teamAPlayingXI = $this->updatePlayingXI($teamA, $match_key);
            }

            if (isset($giveresult['teamb']['squads']) && !empty($giveresult['teamb']['squads'])) {
                $teamB = $giveresult['teamb'];
                $teamBPlayingXI = $this->updatePlayingXI($teamB, $match_key);
            }

            // Merge playing XI of both teams
            $newPlayingXI = array_merge($teamAPlayingXI, $teamBPlayingXI);

            // Update playing status of match players
            $getPlayers = DB::table('players')
                ->join('matchplayers', 'matchplayers.playerid', '=', 'players.id')
                ->where('matchplayers.matchkey', $match_key)
                ->select('players.players_key', 'matchplayers.id')
                ->get();

            if (!empty($getPlayers)) {
                foreach ($getPlayers as $player) {
                    $data = [
                        'playingstatus' => in_array($player->players_key, $newPlayingXI) ? 1 : 0
                    ];

                    DB::table('matchplayers')->where('id', $player->id)->update($data);
                }
            }

            if (!empty($newPlayingXI)) {
                // Update match status
                if (count($newPlayingXI) >= 22) {
                    $playingStat['playing11_status'] = '1';
                }

                $playingStat['tosswinner_team'] = $giveresult1['toss']['winner'];
                $playingStat['toss_decision'] = $giveresult1['toss']['decision'];
                if (isset($giveresult1['toss']['text'])) {
                    $playingStat['match_notification'] = $giveresult1['toss']['text'];
                }

                DB::table('listmatches')->where('matchkey', $match_key)->update($playingStat);
                $teamssdta = DB::table('listmatches')->where('matchkey', $match_key)->join('teams as t1', 't1.id', '=', 'listmatches.team1')->join('teams as t2', 't2.id', '=', 'listmatches.team2')->select('t1.short_name as t1name', 't2.short_name as t2name', 'listmatches.playing11_status as playing11_status')->first();
                $data['subject'] = strtoupper($teamssdta->t1name) . ' VS ' . strtoupper($teamssdta->t2name) . ' Playing XI Out!';
                $data['content'] = '🏏 Get in the Game! Create/Edit Your Team & Join the Contests Before the Deadline. Hurry! ⏰';
                SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'All', '');
            }
        }
    }

    private function updatePlayingXI($team, $match_key)
    {
        $playingXI = [];

        foreach ($team['squads'] as $player) {

            $matchPlayer = DB::table('players')
                ->join('matchplayers', 'matchplayers.playerid', '=', 'players.id')
                ->where('matchplayers.matchkey', $match_key)
                ->where('players.players_key', $player['player_id'])
                ->select('matchplayers.id', 'playingstatus')
                ->first();
            if ($player['playing11'] === 'true') {
                $playerKey = $player['player_id'];
                // Check if player exists in match players table
                if (!empty($matchPlayer)) {
                    // Update playing status
                    $playerStatus['playingstatus'] = 1;
                    DB::table('matchplayers')->where('id', $matchPlayer->id)->update($playerStatus);
                    // Update player's starting points and starting 11 status
                    $this->insertResultMatch($playerKey, $match_key, $matchPlayer->id, $status = 1);
                } else {
                    // Player doesn't exist in match players table, add them
                    $this->addPlayerToMatch($playerKey, $match_key);
                }

                $playingXI[] = $playerKey;
            } else {
                if (!empty($matchPlayer)) {
                    $this->insertResultMatch($player['player_id'], $match_key, $matchPlayer->id, $status = 0);
                } else {
                    // Player doesn't exist in match players table, add them
                    $this->addPlayerToMatch($player['player_id'], $match_key);
                }
            }
        }

        return $playingXI;
    }

    private function insertResultMatch($playerKey, $match_key, $matchPlayerID, $status)
    {
        $playerHit = DB::table('result_matches')
            ->where('result_matches.player_key', $playerKey)
            ->where('result_matches.match_key', $match_key)
            ->where('result_matches.innings', '1')
            ->select('result_matches.id')
            ->first();

        if (!empty($playerHit)) {
            if ($status == 1) {
                $dataHits['startingpoints'] = '4';
                $dataHitss['starting11'] = '1';
            } else {
                $dataHits['startingpoints'] = '0';
                $dataHitss['starting11'] = '0';
            }
            DB::table('result_points')
                ->where('resultmatch_id', $playerHit->id)
                ->where('matchkey', $match_key)
                ->update($dataHits);
            DB::table('result_matches')
                ->where('id', $playerHit->id)
                ->where('match_key', $match_key)
                ->update($dataHitss);
        } else {
            if ($status == 1) {
                $dataHitss['starting11'] = '1';
                $dataHits['startingpoints'] = '4';
            } else {
                $dataHitss['starting11'] = '0';
                $dataHits['startingpoints'] = '0';
            }

            $dataHitss['player_id'] = $matchPlayerID;
            $dataHitss['player_key'] = $playerKey;
            $dataHitss['match_key'] = $match_key;
            $dataHitss['out_str'] = 'not out';
            $resultmatch_id = DB::table('result_matches')->insertGetId($dataHitss);
            $dataHits['matchkey'] = $match_key;
            $dataHits['playerid'] = $matchPlayerID;
            $dataHits['resultmatch_id'] = $resultmatch_id;
            DB::table('result_points')->insert($dataHits);
        }
    }

    private function addPlayerToMatch($playerKey, $match_key)
    {
        $team = DB::table('teams')
            ->where('team_key', $playerKey)
            ->select('id')
            ->first();

        if (!empty($team)) {
            $player = DB::table('players')
                ->where('players_key', $playerKey)
                ->where('team', $team->id)
                ->first();

            if (!empty($player)) {
                $result = DB::table('matchplayers')
                    ->where('matchkey', $match_key)
                    ->where('playerid', $player->id)
                    ->first();

                if (empty($result)) {
                    $data['matchkey'] = $match_key;
                    $data['playerid'] = $player->id;
                    $data['role'] = $player->role;
                    $data['credit'] = $player->credit;
                    $data['name'] = $player->player_name;
                    $data['playingstatus'] = 1;
                    DB::table('matchplayers')->insert($data);
                }
            }
        }
    }


    //Score Update

    public function getScoresUpdates($real_matchkey, $match_key)
    {

        $m_status = [1 => 'notstarted', 2 => 'completed', 3 => 'started', 4 => 'canceled'];

        $findmatchtype = DB::table('listmatches')->where('matchkey', $match_key)->select('final_status', 'format')->first();

        $giveresresult = EntityTrait::getCricketMatchScore($real_matchkey);
        // dd($giveresresult);
        $giveresresult = $giveresresult['response'];
        $teamainnKey = [];
        $teambinnKey = [];

        if (!empty($giveresresult) && $giveresresult != 'Invalid request') {
            $checkpre = DB::table('matchruns')->where('matchkey', $match_key)->first();

            if (empty($checkpre)) {
                // Insert new match data
                $matchdata['matchkey'] = $match_key;
                $matchdata['teams1'] = $giveresresult['teama']['short_name'];
                $matchdata['teams2'] = $giveresresult['teamb']['short_name'];
                $matchdata['winning_status'] = !empty($giveresresult['status_note']) ? $giveresresult['status_note'] : 0;

                if (isset($giveresresult['innings']) && !empty($giveresresult['innings'])) {
                    $inningsCount = count($giveresresult['innings']);

                    if ($inningsCount > 2) {
                        foreach ($giveresresult['innings'] as $k => $value) {
                            if ($value['batting_team_id'] == $giveresresult['teama']['team_id']) {
                                $teamainnKey[] = $giveresresult['innings'][$k];
                            } elseif ($value['batting_team_id'] == $giveresresult['teamb']['team_id']) {
                                $teambinnKey[] = $giveresresult['innings'][$k];
                            }
                        }
                    } else {
                        $key1 = array_search($giveresresult['teama']['team_id'], array_column($giveresresult['innings'], 'batting_team_id'));
                        $key2 = array_search($giveresresult['teamb']['team_id'], array_column($giveresresult['innings'], 'batting_team_id'));

                        $teamainnKey[] = ($key1 !== false) ? $giveresresult['innings'][$key1] : [];
                        $teambinnKey[] = ($key2 !== false) ? $giveresresult['innings'][$key2] : [];
                    }

                    $gettestscore1 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['runs'] : 0;
                    $gettestscore2 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['runs'] : 0;
                    $gettestwicket1 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['wickets'] : 0;
                    $gettestwicket2 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['wickets'] : 0;
                    $gettestover1 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['overs'] : 0;
                    $gettestover2 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['overs'] : 0;

                    $matchdata['wickets1'] = empty($gettestwicket1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['wickets'] : 0) : $teamainnKey[0]['equations']['wickets'] . ',' . $gettestwicket1;
                    $matchdata['wickets2'] = empty($gettestwicket2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['wickets'] : 0) : $teambinnKey[0]['equations']['wickets'] . ',' . $gettestwicket2;
                    $matchdata['overs1'] = empty($gettestover1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['overs'] : 0) : $teamainnKey[0]['equations']['overs'] . ',' . $gettestover1;
                    $matchdata['overs2'] = empty($gettestover2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['overs'] : 0) : $teambinnKey[0]['equations']['overs'] . ',' . $gettestover2;
                    $matchdata['runs1'] = empty($gettestscore1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['runs'] : 0) : $teamainnKey[0]['equations']['runs'] . ',' . $gettestscore1;
                    $matchdata['runs2'] = empty($gettestscore2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['runs'] : 0) : $teambinnKey[0]['equations']['runs'] . ',' . $gettestscore2;
                } else {
                    $matchdata['wickets1'] = 0;
                    $matchdata['wickets2'] = 0;
                    $matchdata['overs1'] = 0;
                    $matchdata['overs2'] = 0;
                    $matchdata['runs1'] = 0;
                    $matchdata['runs2'] = 0;
                }
                $matchdata['matchdata']=json_encode($giveresresult);
                DB::table('matchruns')->insert($matchdata);
            } else {
                // Update existing match data
                $matchdata['matchkey'] = $match_key;
                $matchdata['teams1'] = $giveresresult['teama']['short_name'];
                $matchdata['teams2'] = $giveresresult['teamb']['short_name'];
                $matchdata['winning_status'] = !empty($giveresresult['status_note']) ? $giveresresult['status_note'] : 0;

                if (isset($giveresresult['innings']) && !empty($giveresresult['innings'])) {
                    $teamainnKey = [];
                    $teambinnKey = [];

                    $inningsCount = count($giveresresult['innings']);

                    if ($inningsCount > 2) {
                        foreach ($giveresresult['innings'] as $k => $value) {
                            if ($value['batting_team_id'] == $giveresresult['teama']['team_id']) {
                                $teamainnKey[] = $giveresresult['innings'][$k];
                            } elseif ($value['batting_team_id'] == $giveresresult['teamb']['team_id']) {
                                $teambinnKey[] = $giveresresult['innings'][$k];
                            }
                        }
                    } else {
                        $key1 = array_search($giveresresult['teama']['team_id'], array_column($giveresresult['innings'], 'batting_team_id'));
                        $key2 = array_search($giveresresult['teamb']['team_id'], array_column($giveresresult['innings'], 'batting_team_id'));

                        $teamainnKey[] = ($key1 !== false) ? $giveresresult['innings'][$key1] : [];
                        $teambinnKey[] = ($key2 !== false) ? $giveresresult['innings'][$key2] : [];
                    }

                    $gettestscore1 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['runs'] : 0;
                    $gettestscore2 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['runs'] : 0;
                    $gettestwicket1 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['wickets'] : 0;
                    $gettestwicket2 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['wickets'] : 0;
                    $gettestover1 = isset($teamainnKey[1]) ? $teamainnKey[1]['equations']['overs'] : 0;
                    $gettestover2 = isset($teambinnKey[1]) ? $teambinnKey[1]['equations']['overs'] : 0;

                    $matchdata['wickets1'] = empty($gettestwicket1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['wickets'] : 0) : $teamainnKey[0]['equations']['wickets'] . ',' . $gettestwicket1;
                    $matchdata['wickets2'] = empty($gettestwicket2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['wickets'] : 0) : $teambinnKey[0]['equations']['wickets'] . ',' . $gettestwicket2;
                    $matchdata['overs1'] = empty($gettestover1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['overs'] : 0) : $teamainnKey[0]['equations']['overs'] . ',' . $gettestover1;
                    $matchdata['overs2'] = empty($gettestover2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['overs'] : 0) : $teambinnKey[0]['equations']['overs'] . ',' . $gettestover2;
                    $matchdata['runs1'] = empty($gettestscore1) ? (!empty($teamainnKey[0]) ? $teamainnKey[0]['equations']['runs'] : 0) : $teamainnKey[0]['equations']['runs'] . ',' . $gettestscore1;
                    $matchdata['runs2'] = empty($gettestscore2) ? (!empty($teambinnKey[0]) ? $teambinnKey[0]['equations']['runs'] : 0) : $teambinnKey[0]['equations']['runs'] . ',' . $gettestscore2;
                } else {
                    $matchdata['wickets1'] = 0;
                    $matchdata['wickets2'] = 0;
                    $matchdata['overs1'] = 0;
                    $matchdata['overs2'] = 0;
                    $matchdata['runs1'] = 0;
                    $matchdata['runs2'] = 0;
                }
                $matchdata['matchdata']=json_encode($giveresresult);
                DB::table('matchruns')->where('matchkey', $match_key)->update($matchdata);
            }
            $game_state = [
                0 => "Default",
                1 => "Starts Shortly",
                2 => "Toss",
                3 => "Play Ongoing",
                4 => "Delayed",
                5 => "Drinks Break",
                6 => "Innings Break",
                7 => "Stumps",
                8 => "Lunch Break",
                9 => "Tea Break",
                10 => "Match Start Delay",
                11 => "Rain Delay",
                12 => "Dinner",
                13 => "Strategic Timeout",
                14 => "Technical Issue",
                15 => "Bad Light",
                16 => "Match Interrupted"
            ];
            $mainarrayget = $giveresresult;
            $getmtdatastatus['status'] = $m_status[$mainarrayget['status']];
            $getmtdatastatus['status_overview'] = $game_state[$mainarrayget['game_state']];

            if ($mainarrayget['status'] == 4) {
                $reason = 'Match canceled';
                $mst['final_status'] = 'IsCanceled';
                DB::table('listmatches')->where('matchkey', $match_key)->update($mst);
                ResultController::refund_allamount($match_key, $reason);
            }

            if ($getmtdatastatus['status'] == 'completed' && $findmatchtype->final_status == 'pending') {
                $getmtdatastatus['final_status'] = 'IsReviewed';
            }

            DB::table('listmatches')->where('matchkey', $match_key)->update($getmtdatastatus);

            $playin = DB::table('matchplayers')->join('players', 'players.id', '=', 'matchplayers.playerid')->where('playingstatus', 1)->where('matchkey', $match_key)->pluck('players.players_key')->toArray();
            if (isset($mainarrayget['players'])) {
                $players = array_column($mainarrayget['players'], 'pid');
                $matchplayers = DB::table('matchplayers')->join('players', 'players.id', '=', 'matchplayers.playerid')->where('matchkey', $match_key)->select('matchplayers.*', 'players.players_key', 'players.role as playerrole')->get();
                // dd($players);
                $a = $matchplayers->toArray();

                if (!empty($a)) {
                    $innplayers = [];
                    $t = '';
                    $f = 1;
                    $j = 1;
                    foreach ($matchplayers as $kp => $player) {
                        $pid = $player->playerid;
                        $value = $player->players_key;
                        $i = 1;
                        foreach ($teamainnKey as $ak => $teama) {
                            $datasv = array();
                            $runs = 0;
                            $fours = 0;
                            $six = 0;
                            $maiden_over = 0;
                            $wicket = 0;
                            $catch = 0;
                            $stumbed = 0;
                            $batdots = 0;
                            $balldots = 0;
                            $bball = 0;
                            $grun = 0;
                            $balls = 0;
                            $extra = 0;
                            $overs = 0;

                            $bat = (isset($teama['batsmen'])) ? '' . (array_search($value, array_column($teama['batsmen'], 'batsman_id'))) : '';
                            if ($bat != '') {
                                $innplayers[$value][$i]['batting'] = $teama['batsmen'][$bat];
                            } else {
                                if (!isset($innplayers[$value][$i]['batting'])) {
                                    $innplayers[$value][$i]['batting'] = [];
                                }
                                $bowl = (isset($teama['bowlers'])) ? '' . (array_search($value, array_column($teama['bowlers'], 'bowler_id'))) : '';
                                $field = (isset($teama['fielder'])) ? '' . (array_search($value, array_column($teama['fielder'], 'fielder_id'))) : '';
                                $innplayers[$value][$i]['bowling'] = ($bowl != '') ? $teama['bowlers'][$bowl] : [];
                                $innplayers[$value][$i]['fielding'] = ($field != '') ? $teama['fielder'][$field] : [];
                            }
                            $batb = (isset($teambinnKey[$ak]['batsmen'])) ? '' . (array_search($value, array_column($teambinnKey[$ak]['batsmen'], 'batsman_id'))) : '';
                            if ($batb != '') {
                                $innplayers[$value][$i]['batting'] = $teambinnKey[$ak]['batsmen'][$batb];
                            } else {
                                if (!isset($innplayers[$value][$i]['batting'])) {
                                    $innplayers[$value][$i]['batting'] = [];
                                }
                                if (empty($innplayers[$value][$i]['bowling'])) {
                                    $bowlb = (isset($teambinnKey[$ak]['bowlers'])) ? '' . (array_search($value, array_column($teambinnKey[$ak]['bowlers'], 'bowler_id'))) : '';
                                    $innplayers[$value][$i]['bowling'] = ($bowlb != '') ? $teambinnKey[$ak]['bowlers'][$bowlb] : [];
                                }
                                if (empty($innplayers[$value][$i]['fielding'])) {
                                    $fieldb = (isset($teambinnKey[$ak]['fielder'])) ? '' . (array_search($value, array_column($teambinnKey[$ak]['fielder'], 'fielder_id'))) : '';
                                    $innplayers[$value][$i]['fielding'] = ($fieldb != '') ? $teambinnKey[$ak]['fielder'][$fieldb] : [];
                                }
                            }

                            $play = $innplayers[$value][$i];
                            // dd($play);
                            if (!empty($play['batting']) || !empty($play['bowling']) || !empty($play['fielding'])) {
                                if (in_array($value, $playin)) {
                                    $datasv['starting11'] = 1;
                                }
                                if (!empty($play['batting'])) {
                                    if (isset($play['batting']['strike_rate'])) {
                                        $datasv['batting'] = 1;
                                        $datasv['strike_rate'] = $play['batting']['strike_rate'];
                                    } else {
                                        $datasv['batting'] = 0;
                                    }
                                    /* runs points */
                                    if (isset($play['batting']['runs'])) {
                                        $datasv['runs'] = $runs = $runs +  $play['batting']['runs'];
                                    } else {
                                        $datasv['runs'] = 0;
                                    }

                                    /* fours points */

                                    if (isset($play['batting']['fours'])) {
                                        $datasv['fours'] = $fours = $fours + $play['batting']['fours'];
                                    }
                                    if (isset($play['batting']['balls_faced'])) {
                                        $datasv['bball'] = $bball = $bball + $play['batting']['balls_faced'];
                                    }
                                    /* sixes Points */

                                    if (isset($play['batting']['sixes'])) {
                                        $datasv['six'] = $six = $six + $play['batting']['sixes'];
                                    }
                                    if (!empty($play['batting']['dismissal'])) {

                                        if ($player->playerrole != 'bowler') {
                                            if (($runs == 0) && ($play['batting']['dismissal'] != '')) {
                                                $datasv['duck'] = $duck = 1;
                                            } else {
                                                $datasv['duck'] = $duck = 0;
                                            }
                                        } else {
                                            $datasv['duck'] = $duck = 0;
                                        }
                                        if ($play['batting']['dismissal'] != '') {
                                            $datasv['out_str'] = $play['batting']['how_out'];
                                        } else {
                                            $datasv['out_str'] = 'not out';
                                        }
                                    }
                                    if (isset($batting['dots'])) {
                                        $datasv['battingdots'] = $batdots = $batdots + $play['batting']['run0'];
                                    }

                                    if ($play['batting']['dismissal'] == 'lbw' || $play['batting']['dismissal'] == 'bowled') {

                                        $wbowlerkey = $play['batting']['bowler_id'];

                                        $bowlerplayersid = DB::table('matchplayers')->join('players', 'players.id', '=', 'matchplayers.playerid')->where('players.players_key', $wbowlerkey)->where('matchkey', $match_key)->value('matchplayers.playerid');

                                        if (!empty($bowlerplayersid)) {
                                            $datasv['wplayerid'] = $bowlerplayersid;
                                        }
                                    }
                                    $datasv['wicket_type'] = $play['batting']['dismissal'];
                                }
                                // bowling points //
                                if (!empty($play['bowling'])) {
                                    $bowling = $play['bowling'];
                                    $datasv['bowling'] = 1;
                                    $datasv['economy_rate'] = $bowling['econ'];
                                    $datasv['maiden_over'] = $maiden_over = $maiden_over + $bowling['maidens'];
                                    $datasv['wicket'] = $wicket = $wicket + $bowling['wickets'];
                                    $datasv['overs'] = $overs = $overs + $bowling['overs'];
                                    $datasv['grun'] = $grun = $grun + $bowling['runs_conceded'];
                                    $datasv['balldots'] = $balldots = $balldots + (!empty($bowling['run0'])) ? $bowling['run0'] : 0;
                                    $datasv['balls'] = $balls = $balls + ($overs * 6);
                                    if (!empty($bowling['noballs']) && !empty($bowling['wides'])) {
                                        $datasv['extra'] = $extra = $extra + ($bowling['noballs'] + $bowling['wides']);
                                    }
                                }

                                // // fielding points //
                                if (!empty($play['fielding'])) {
                                    $fielding = $play['fielding'];
                                    $datasv['catch'] = $catch = $catch + $fielding['catches'];
                                    if ($fielding['runout_direct_hit'] == 0) {
                                        $datasv['hitter'] = $fielding['runout_catcher'];
                                        $datasv['thrower'] = $fielding['runout_thrower'];
                                    } else {
                                        $datasv['thrower'] = 1;
                                        $datasv['hitter'] = 1;
                                    }
                                    $datasv['stumbed'] = $stumbed = $stumbed + $fielding['stumping'];
                                }
                                $datasv['match_key'] = $match_key;
                                $datasv['player_key'] = $value;
                                $datasv['player_id'] = $pid;
                                $datasv['innings'] = $i;
                                $findplayerex = DB::table('result_matches')->where('player_key', $value)->where('match_key', $match_key)->where('innings', $i)->select('id')->first();
                                if (!empty($findplayerex)) {
                                    DB::table('result_matches')->where('id', $findplayerex->id)->update($datasv);
                                } else {
                                    DB::table('result_matches')->insert($datasv);
                                }
                            } else {
                                if (in_array($value, $playin)) {
                                    $datasvs['starting11'] = 1;
                                } else {
                                    $datasvs['starting11'] = 0;
                                }
                                $datasvs['out_str'] = 'not out';
                                $datasvs['match_key'] = $match_key;
                                $datasvs['player_key'] = $value;
                                $datasvs['player_id'] = $pid;
                                $datasvs['innings'] = $i;
                                $findplayerex = DB::table('result_matches')->where('player_key', $value)->where('match_key', $match_key)->where('innings', $i)->select('id')->first();
                                if (!empty($findplayerex)) {
                                    DB::table('result_matches')->where('id', $findplayerex->id)->update($datasvs);
                                } else {
                                    DB::table('result_matches')->insert($datasvs);
                                }
                            }

                            // }


                            $i++;
                        }
                    }
                    $showpoints = ResultController::player_point($match_key, $findmatchtype->format, $real_matchkey);
                }
            }
        }

        return true;
    }

    public function player_point($match_key, $match)
    {
        $matchplayers = DB::table('result_matches')->where('match_key', $match_key)->get();
        $aaa = $matchplayers->toArray();
        if (!empty($aaa)) {
            foreach ($matchplayers as $row) {
                $result = array();
                $player_key = $row->player_key;
                $findplayerrole = DB::table('matchplayers')->where('playerid', $row->player_id)->where('matchkey', $match_key)->select('role')->first();
                $runs = $row->runs;
                $wicket = $row->wicket;
                $catch = $row->catch;
                $stumbed = $row->stumbed;
                $six = $row->six;
                $fours = $row->fours;
                $maiden_over = $row->maiden_over;
                $thrower = $row->thrower;
                $hitter = $row->hitter;
                $overs = $row->overs;
                $bballs = $row->bball;    //batting balls
                $erate = $row->economy_rate;
                $strikerate = $row->strike_rate;
                $throwpoint = 0;
                $hittspoints = 0;
                $duckpoint = 0;
                $wkpoints = 0;   //points for wickets
                $catchpoint = 0;
                $stpoint = 0;   // points for stumb
                $boundrypoints = 0;
                $sixpoints = 0;
                $runpoints = 0;
                $centuryPoints = 0;
                $thirtypoints = 0;
                $halcenturypoints = 0;
                $maidenpoints = 0;
                $total_points = 0;

                $economypoints = 0;
                $strikePoint = 0;
                $wicketbonuspoint = 0;
                $wicketbonuspointdata = DB::table('result_matches')->where('match_key', $match_key)->where('wplayerid', $row->player_id)->count();

                if (!empty($wicketbonuspointdata)) {
                    $wicketbonuspoint = $wicketbonuspointdata * 8;
                }
                if ($match == 't20') {
                    if ($row->starting11 == 1 && $row->innings == 1) {
                        $startingpoint = 4;
                    } else {
                        $startingpoint = 0;
                    }
                    // batting points given //
                    if ($findplayerrole != 'bowler') {
                        if ($row->duck != 0) {
                            $duckpoint = -2;
                        }
                    }
                    $boundrypoints = $fours * 1;
                    $sixpoints = $six * 2;
                    $runpoints = $runs * 1;
                    if (($runs >= 30) && ($runs < 50)) {
                        $thirtypoints = 4;
                    } else if (($runs >= 50) && ($runs < 100)) {
                        $halcenturypoints = 8;
                    } else if ($runs >= 100) {
                        $centuryPoints = 16;
                    }

                    // give points for bowling //
                    if ($wicket == 3) {
                        $wkpoints = $wkpoints + 4;
                    }
                    if ($wicket == 4) {
                        $wkpoints = $wkpoints + 8;
                    }
                    if ($wicket >= 5) {
                        $wkpoints = $wkpoints + 16;
                    }
                    $wkpoints = $wkpoints + $wicket * 25;
                    $maidenpoints = $maiden_over * 12;

                    // fielding points //

                    $catchpoint = $catch * 8;
                    if ($catch >= 3) {
                        $catchpoint = $catchpoint + 4;
                    }
                    $stpoint = $stumbed * 12;
                    $throwpoint = $thrower * 6;
                    $hittspoints = $hitter * 6;
                    if ($overs >= 2) {
                        if ($erate < 5) {
                            $economypoints = 6;
                        } else if ($erate >= 5 && $erate <= 5.99) {
                            $economypoints = 4;
                        } else if ($erate >= 6 && $erate <= 7) {
                            $economypoints = 2;
                        } else if ($erate >= 10 && $erate <= 11) {
                            $economypoints = -2;
                        } else if ($erate >= 11.1 && $erate <= 12) {
                            $economypoints = -4;
                        } else if ($erate >= 12) {
                            $economypoints = -6;
                        }
                    }
                    if ($findplayerrole != 'bowler') {
                        if ($bballs >= 10) {
                            if ($strikerate >= 60 && $strikerate <= 70) {
                                $strikePoint = -2;
                            } else if ($strikerate >= 50 && $strikerate <= 59.9) {
                                $strikePoint = -4;
                            } else if ($strikerate < 50) {
                                $strikePoint = -6;
                            } else if ($strikerate >= 130 && $strikerate <= 150) {
                                $strikePoint = 2;
                            } else if ($strikerate >= 150.01 && $strikerate <= 170) {
                                $strikePoint = 4;
                            } else if ($strikerate > 170) {
                                $strikePoint = 6;
                            }
                        }
                    }
                } else if ($match == 't10') {

                    if ($row->starting11 == 1 && $row->innings == 1) {
                        $startingpoint = 4;
                    } else {
                        $startingpoint = 0;
                    }
                    // batting points given //
                    if ($findplayerrole != 'bowler') {
                        if ($row->duck != 0) {
                            $duckpoint = -2;
                        }
                    }
                    $boundrypoints = $fours * 1;
                    $sixpoints = $six * 2;
                    $runpoints = $runs * 1;

                    if (($runs >= 30) && ($runs < 50)) {
                        $halcenturypoints = 8;
                    } else if ($runs >= 50) {
                        $centuryPoints = 16;
                    }

                    // give points for bowling //
                    if ($wicket == 2) {
                        $wkpoints = $wkpoints + 8;
                    }
                    if ($wicket >= 3) {
                        $wkpoints = $wkpoints + 16;
                    }
                    $wkpoints = $wkpoints + $wicket * 25;
                    $maidenpoints = $maiden_over * 16;

                    // fielding points //

                    $catchpoint = $catch * 8;
                    if ($catch >= 3) {
                        $catchpoint = $catchpoint + 4;
                    }
                    $stpoint = $stumbed * 12;
                    $throwpoint = $thrower * 6;
                    $hittspoints = $hitter * 6;

                    if ($overs >= 1) {
                        if ($erate < 7) {
                            $economypoints = 6;
                        } else if ($erate >= 7 && $erate <= 7.99) {
                            $economypoints = 4;
                        } else if ($erate >= 8 && $erate <= 9) {
                            $economypoints = 2;
                        } else if ($erate >= 14 && $erate <= 15) {
                            $economypoints = -2;
                        } else if ($erate >= 15.1 && $erate <= 16) {
                            $economypoints = -4;
                        } else if ($erate >= 16) {
                            $economypoints = -6;
                        }
                    }

                    if ($findplayerrole != 'bowler') {
                        if ($bballs >= 5) {
                            if ($strikerate >= 70 && $strikerate <= 80) {
                                $strikePoint = -2;
                            } else if ($strikerate >= 60 && $strikerate <= 69.99) {
                                $strikePoint = -4;
                            } else if ($strikerate < 60) {
                                $strikePoint = -6;
                            } else if ($strikerate >= 150 && $strikerate <= 170) {
                                $strikePoint = 2;
                            } else if ($strikerate >= 170.01 && $strikerate <= 190) {
                                $strikePoint = 4;
                            } else if ($strikerate > 190) {
                                $strikePoint = 6;
                            }
                        }
                    }
                } else if ($match == 'one-day') {
                    if ($row->starting11 == 1 && $row->innings == 1) {
                        $startingpoint = 4;
                    } else {
                        $startingpoint = 0;
                    }
                    // batting points given //
                    if ($findplayerrole != 'bowler') {
                        if ($row->duck != 0) {
                            $duckpoint = -3;
                        }
                    }

                    $boundrypoints = $fours * 1;
                    $sixpoints = $six * 2;
                    $runpoints = $runs * 1;

                    if (($runs >= 50) && ($runs < 100)) {
                        $halcenturypoints = 4;
                    } else if ($runs >= 100 && $runs < 150) {
                        $centuryPoints = 8;
                    }

                    // give points for bowling //
                    if ($wicket == 4) {
                        $wkpoints = $wkpoints + 4;
                    }
                    if ($wicket >= 5) {
                        $wkpoints = $wkpoints + 8;
                    }
                    $wkpoints = $wkpoints + $wicket * 25;
                    $maidenpoints = $maiden_over * 4;

                    // fielding points //

                    $catchpoint = $catch * 8;
                    if ($catch >= 3) {
                        $catchpoint = $catchpoint + 4;
                    }
                    $stpoint = $stumbed * 12;
                    $throwpoint = $thrower * 6;
                    $hittspoints = $hitter * 6;

                    if ($overs >= 5) {
                        if ($erate < 2.5) {
                            $economypoints = 6;
                        } else if ($erate >= 2.5 && $erate <= 3.49) {
                            $economypoints = 4;
                        } else if ($erate >= 3.5 && $erate <= 4.5) {
                            $economypoints = 2;
                        } else if ($erate >= 7 && $erate <= 8) {
                            $economypoints = -2;
                        } else if ($erate >= 8.01 && $erate <= 9) {
                            $economypoints = -4;
                        } else if ($erate >= 9) {
                            $economypoints = -6;
                        }
                    }
                    if ($findplayerrole != 'bowler') {
                        if ($bballs >= 20) {
                            if ($strikerate >= 40 && $strikerate <= 50) {
                                $strikePoint = -2;
                            } else if ($strikerate >= 30 && $strikerate <= 39.9) {
                                $strikePoint = -4;
                            } else if ($strikerate < 30) {
                                $strikePoint = -6;
                            } else if ($strikerate >= 100 && $strikerate <= 120) {
                                $strikePoint = 2;
                            } else if ($strikerate >= 120.01 && $strikerate <= 140) {
                                $strikePoint = 4;
                            } else if ($strikerate > 140) {
                                $strikePoint = 6;
                            }
                        }
                    }
                } else {    //test

                    if ($row->starting11 == 1 && $row->innings == 1) {
                        $startingpoint = 4;
                        $wicketbonuspoint = $wicketbonuspoint;
                    } else {
                        $startingpoint = 0;
                        $wicketbonuspoint = 0;
                    }
                    // batting points given //
                    if ($findplayerrole != 'bowler') {
                        if ($row->duck != 0) {
                            $duckpoint = -4;
                        }
                    }

                    $boundrypoints = $fours * 1;
                    $sixpoints = $six * 2;
                    $runpoints = $runs * 1;

                    if (($runs >= 50) && ($runs < 100)) {
                        $halcenturypoints = 4;
                    } else if ($runs >= 100 && $runs < 150) {
                        $centuryPoints = 8;
                    }

                    // give points for bowling //
                    if ($wicket == 4) {
                        $wkpoints = $wkpoints + 4;
                    }
                    if ($wicket >= 5) {
                        $wkpoints = $wkpoints + 8;
                    }
                    $wkpoints = $wkpoints + $wicket * 16;


                    // fielding points //

                    $catchpoint = $catch * 8;
                    $stpoint = $stumbed * 12;
                    $throwpoint = $thrower * 6;
                    $hittspoints = $hitter * 6;
                }

                if ($row->starting11 == 1) {
                    $economypoints = (int) $economypoints;

                    $result['batting_points'] = $runpoints + $sixpoints + $boundrypoints + $strikePoint + $halcenturypoints + $centuryPoints + $thirtypoints;
                    $result['fielding_points'] = $catchpoint + $stpoint + $throwpoint + $hittspoints;
                    $result['bowling_points'] = $wkpoints + $maidenpoints + $economypoints + $wicketbonuspoint;


                    $total_points = $result['total_points'] = $startingpoint + $runpoints + $sixpoints + $thirtypoints + $halcenturypoints + $centuryPoints + $boundrypoints + $strikePoint + $catchpoint + $stpoint + $wkpoints + $maidenpoints + $economypoints + $duckpoint + $hittspoints + $throwpoint + $wicketbonuspoint;
                } else {
                    $result['batting_points'] = 0;
                    $result['fielding_points'] = 0;
                    $result['bowling_points'] = 0;
                    $total_points = $result['total_points'] = 0;
                }
                DB::table('result_matches')->where('player_key', $player_key)->where('match_key', $match_key)->where('innings', $row->innings)->update($result);
                //insert in result points// 
                $resultpoints['matchkey'] = $match_key;
                $resultpoints['playerid'] = $row->player_id;
                if ($row->starting11 == 1) {
                    $resultpoints['startingpoints'] = $startingpoint;
                    $resultpoints['runs'] = $runpoints;
                    $resultpoints['fours'] = $boundrypoints;
                    $resultpoints['sixs'] = $sixpoints;
                    $resultpoints['strike_rate'] = $strikePoint;
                    $resultpoints['thirtypoints'] = $thirtypoints;
                    $resultpoints['halfcentury'] = $halcenturypoints;
                    $resultpoints['century'] = $centuryPoints;
                    $resultpoints['wickets'] = $wkpoints;
                    $resultpoints['maidens'] = $maidenpoints;
                    $resultpoints['economy_rate'] = $economypoints;
                    $resultpoints['catch'] = $catchpoint;
                    $resultpoints['wicketbonuspoint'] = $wicketbonuspoint;
                    $resultpoints['stumping'] = $stpoint;
                    $resultpoints['thrower'] = $throwpoint;
                    $resultpoints['hitter'] = $hittspoints;
                    $resultpoints['negative'] = $duckpoint;
                    $resultpoints['total'] = $total_points;
                } else {
                    $resultpoints['startingpoints'] = 0;
                    $resultpoints['runs'] = 0;
                    $resultpoints['fours'] = 0;
                    $resultpoints['sixs'] = 0;
                    $resultpoints['strike_rate'] = 0;
                    $resultpoints['thirtypoints'] = 0;
                    $resultpoints['halfcentury'] = 0;
                    $resultpoints['century'] = 0;
                    $resultpoints['wickets'] = 0;
                    $resultpoints['maidens'] = 0;
                    $resultpoints['economy_rate'] = 0;
                    $resultpoints['wicketbonuspoint'] = 0;
                    $resultpoints['catch'] = 0;
                    $resultpoints['stumping'] = 0;
                    $resultpoints['thrower'] = 0;
                    $resultpoints['hitter'] = 0;
                    $resultpoints['bonus'] = 0;
                    $resultpoints['negative'] = 0;
                    $resultpoints['total'] = 0;
                }

                $resultpoints['updated_at'] = date('Y-m-d H:i:s');
                $finde = DB::table('result_points')->where('matchkey', $match_key)->where('resultmatch_id', $row->id)->select('id')->first();
                if (empty($finde)) {
                    $resultpoints['resultmatch_id'] = $row->id;
                    DB::table('result_points')->insert($resultpoints);
                } else {
                    DB::table('result_points')->where('id', $finde->id)->update($resultpoints);
                }
            }
            $this->updateplayerMatchpoints($match_key);
        }
    }

    public static function updateplayerMatchpoints($match_key)
    {
        $findallplayers = DB::table('matchplayers')->where('matchkey', $match_key)->get();
        if (!empty($findallplayers)) {
            foreach ($findallplayers as $player) {
                $findtotalpoints = DB::table('result_points')->where('matchkey', $match_key)->where('playerid', $player->playerid)->sum('result_points.total');
                $data['points'] = $findtotalpoints;
                DB::table('matchplayers')->where('id', $player->id)->update($data);
            }
            ResultController::userPoints($match_key);
        }
    }

    public static function userPoints($match_key)
    {

        $joinlist = DB::table('jointeam')->where('matchkey', $match_key)->get();
        if (!empty($joinlist)) {
            foreach ($joinlist as $row2) {
                $user_points = 0;
                $players = explode(',', $row2->players);
                $matchplayers = DB::table('matchplayers')->where('matchkey', $match_key)->get();
                if (!empty($matchplayers)) {
                    foreach ($matchplayers as $row) {
                        $pid = $row->playerid;
                        if (in_array($pid, $players)) {
                            if ($row2->captain == $pid) {
                                $user_points = $user_points + ($row->points * 2);
                            } else if ($row2->vicecaptain == $pid) {
                                $user_points = $user_points + ($row->points * 1.5);
                            } else {
                                $user_points = $user_points + $row->points;
                            }
                        } else {
                            $user_points = $user_points;
                        }
                    }
                }
                if ($row2->points != $user_points) {
                    $result['lastpoints'] = $row2->points;
                }
                $result['points'] = $user_points;
                DB::table('jointeam')->where('id', $row2->id)->update($result);
            }
        }
    }

    public function refund_amount()
    {   
        $current = date('Y-m-d H:i:s');
        $match_time = date('Y-m-d H:i:s', strtotime('-15 minutes', strtotime($current)));
        // $match_time = date('Y-m-d H:i:s', strtotime($current));
        $findmatches = DB::table('listmatches')->where('start_date', '<=', $match_time)->where('status', 'started')->select('matchkey')->get();
        if (!empty($findmatches)) {
            foreach ($findmatches as $value) {
                $match_challenges = DB::table('matchchallenges')->where('matchkey', $value->matchkey)->where('status', '!=', 'canceled')->select('confirmed_challenge', 'id', 'joinedusers', 'maximum_user', 'matchkey', 'entryfee', 'fantasy_type', 'status')->get();
                $match_challenges = $match_challenges->toArray();
                if (!empty($match_challenges)) {
                    foreach ($match_challenges as  $value1) {
                        $totaljoineduser = DB::table('joinedleauges')->where('matchkey', $value->matchkey)->where('challengeid', $value1->id)->count();
                        if ($value1->maximum_user >= $totaljoineduser) {
                            if ($value1->confirmed_challenge == 0 && $value1->status != 'closed') {
                                $getresponse = $this->refundprocess($value1->id, $value1->entryfee, $value->matchkey, 'challenge cancel');
                                if ($getresponse == true) {
                                    $data['status'] = 'canceled';
                                    DB::table('matchchallenges')->where('id', $value1->id)->update($data);
                                }
                            }
                            // Here contest will cancel if contest is confirmed or joined users are equal to 1 only 

                            elseif ($value1->confirmed_challenge == 1 && $totaljoineduser == 1) {
                                $getresponse = $this->refundprocess($value1->id, $value1->entryfee, $value->matchkey, 'challenge cancel');
                                if ($getresponse == true) {
                                    $data['status'] = 'canceled';
                                    DB::table('matchchallenges')->where('id', $value1->id)->update($data);
                                }
                            }

                            if ($value1->maximum_user <= 3 or $totaljoineduser <= 3) {
                                $getTeam = DB::table('joinedleauges')->join('jointeam', 'joinedleauges.teamid', '=', 'jointeam.id')->where('joinedleauges.matchkey', $value->matchkey)->where('joinedleauges.challengeid', $value1->id)->select('joinedleauges.*', 'jointeam.players', 'jointeam.captain', 'jointeam.vicecaptain')->get();

                                if (isset($getTeam[1]) &&  $getTeam[0]->captain == $getTeam[1]->captain && $getTeam[0]->vicecaptain == $getTeam[1]->vicecaptain) {
                                    $allplayersget = explode(',', $getTeam[0]->players);
                                    $nowplayers  = explode(',', $getTeam[1]->players);
                                    $result = array_intersect($nowplayers, $allplayersget);
                                    if (count($allplayersget) == count($result)) {
                                        $getresponse = $this->refundprocess($value1->id, $value1->entryfee, $value->matchkey, 'challenge cancel');
                                        if ($getresponse == true) {
                                            $data['status'] = 'canceled';
                                            DB::table('matchchallenges')->where('id', $value1->id)->update($data);
                                        }
                                    }
                                } else if (isset($getTeam[2]) && $getTeam[1]->captain == $getTeam[2]->captain && $getTeam[1]->vicecaptain == $getTeam[2]->vicecaptain) {
                                    $allplayersget = explode(',', $getTeam[1]->players);
                                    $nowplayers  = explode(',', $getTeam[2]->players);
                                    $result = array_intersect($nowplayers, $allplayersget);
                                    if (count($allplayersget) == count($result)) {
                                        $getresponse = $this->refundprocess($value1->id, $value1->entryfee, $value->matchkey, 'challenge cancel');
                                        if ($getresponse == true) {
                                            $data['status'] = 'canceled';
                                            DB::table('matchchallenges')->where('id', $value1->id)->update($data);
                                        }
                                    }
                                } else if (isset($getTeam[2]) && $getTeam[0]->captain == $getTeam[2]->captain && $getTeam[0]->vicecaptain == $getTeam[2]->vicecaptain) {
                                    $allplayersget = explode(',', $getTeam[2]->players);
                                    $nowplayers  = explode(',', $getTeam[0]->players);
                                    $result = array_intersect($nowplayers, $allplayersget);
                                    if (count($allplayersget) == count($result)) {
                                        $getresponse = $this->refundprocess($value1->id, $value1->entryfee, $value->matchkey, 'challenge cancel');
                                        if ($getresponse == true) {
                                            $data['status'] = 'canceled';
                                            DB::table('matchchallenges')->where('id', $value1->id)->update($data);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // refund process starts //

    public static function refundprocess($challengeid, $entryfees, $matchkey, $reason)
    {
        $leaugestransactions = DB::table('leaugestransactions')->where('matchkey', $matchkey)->where('challengeid', $challengeid)->get();
        if (!empty($leaugestransactions)) {
            foreach ($leaugestransactions as  $value2) {
                $refund_data = DB::table('refunds')->where('joinid', $value2->joinid)->select('id')->first();
                if (empty($refund_data)) {
                    $entry_fee = $entryfees;
                    $last_row = DB::table('userbalance')->where('user_id', $value2->user_id)->first();
                    if (!empty($last_row)) {
                        $data_bal['balance'] = number_format($last_row->balance + $value2->balance, 2, ".", "");
                        $data_bal['winning'] = number_format($last_row->winning + $value2->winning, 2, ".", "");
                        $data_bal['bonus'] =  number_format($last_row->bonus + $value2->bonus, 2, ".", "");

                        DB::table('userbalance')->where('id', $last_row->id)->update($data_bal);
                        $refund_data['userid'] = $value2->user_id;
                        $refund_data['amount'] = $entry_fee;
                        $refund_data['joinid'] = $value2->joinid;
                        $refund_data['challengeid'] = $value2->challengeid;
                        $refund_data['reason'] = $reason;
                        $refund_data['matchkey'] = $matchkey;
                        $transaction_id = (SettingsTrait::settings('short_name') . '-') . rand(100, 999) . time() . '-' . $value2->user_id;
                        $refund_data['transaction_id'] = $transaction_id;
                        DB::table('refunds')->insert($refund_data);
                        $data_trans['transaction_id'] = $transaction_id;
                        $data_trans['type'] = 'Refund';
                        $data_trans['transaction_by'] = SettingsTrait::settings('short_name');
                        $data_trans['amount'] = $entry_fee;
                        $data_trans['paymentstatus'] = 'confirmed';
                        $data_trans['challengeid'] = $value2->challengeid;
                        $data_trans['bonus_amt'] = $value2->bonus;
                        $data_trans['win_amt'] = $value2->winning;
                        $data_trans['addfund_amt'] = $value2->balance;
                        $data_trans['bal_bonus_amt'] = $data_bal['bonus'];
                        $data_trans['bal_win_amt'] = $data_bal['winning'];
                        $data_trans['bal_fund_amt'] = $data_bal['balance'];
                        $data_trans['userid'] = $value2->user_id;
                        $data_trans['total_available_amt'] = $data_bal['balance'] + $data_bal['winning'] + $data_bal['bonus'];
                        DB::table('transactions')->insert($data_trans);
                        //notifications//
                        $totalentryfee = $value2->bonus + $value2->balance + $value2->winning;
                        $datan['title'] = 'Refund Amount of Rs.' . $totalentryfee . ' for challenge cancellation';
                        $datan['userid'] = $value2->user_id;
                        DB::table('notifications')->insert($datan);
                        $explodearray[] = $value2->user_id;
                        $refundAmount = $totalentryfee;
                        $data['subject'] = 'Contest Cancelled - Refund Processed';
                        $data['content'] = "❌ Contest Cancelled\n\nRefund Amount: Rs. {$refundAmount} has been credited to your account.";
                        SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);
                    }
                }
            }
        }
        return true;
    }

    public function refund_allamount($match_key, $reason)
    {
        $matchchallenges = DB::table('matchchallenges')->where('matchkey', $match_key)->get();
        foreach ($matchchallenges as $challenge) {
            $getresponse = $this->refundprocess($challenge->id, $challenge->entryfee, $match_key, $reason);
            if ($getresponse == true) {
                $data = array();
                $data['status'] = 'canceled';
                DB::table('matchchallenges')->where('id', $challenge->id)->update($data);
            }
        }
    }
}
