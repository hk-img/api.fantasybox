<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Http\JsonResponse;
use DB;
use App\Models\Userverify;
use App\Models\Userbalance;
use App\Traits\SettingsTrait;
use Illuminate\Support\Facades\Http;

class MatchController extends BaseController
{
    public function __construct()
    {
        $this->middleware('checkBlocked');
    }

    public function getMatchList(Request $request)
    {
        $currenttimme = date('Y-m-d H:i:s');
        $lastdays = date('Y-m-d H:i:s', strtotime('+15days', strtotime($currenttimme)));
        $fantasy_type = $request->fantasy_type;
        $findmatches = DB::table('listmatches')->join('series', 'listmatches.series', '=', 'series.id')
            ->join('teams as team1', 'team1.id', '=', 'listmatches.team1')
            ->join('teams as team2', 'team2.id', '=', 'listmatches.team2')
            ->whereBetween('listmatches.start_date', [$currenttimme, $lastdays])
            ->where('listmatches.fantasy_type', $fantasy_type)
            ->where('listmatches.final_status', '!=', 'IsCanceled')
            ->where('listmatches.final_status', '!=', 'IsAbandoned')
            ->where('listmatches.status', 'notstarted')
            ->where('listmatches.launch_status', 'launched')
            ->select('listmatches.id as listmatchid', 'team1.short_name as teamname1', 'team2.short_name as teamname2', 'team1.team as team1fullname', 'team2.team as team2fullname', 'team1.color as team1color', 'team2.color as team2color', 'team1.logo as team1logo', 'team2.logo as team2logo', 'listmatches.series as seriesid', 'series.name as seriesname', 'listmatches.name', 'listmatches.start_date', 'listmatches.format', 'listmatches.matchkey', 'listmatches.final_status', 'listmatches.launch_status', 'listmatches.playing11_status', 'listmatches.fantasy_type', 'listmatches.second_inning_status', 'listmatches.real_matchkey', 'listmatches.tosswinner_team', 'listmatches.toss_decision', 'listmatches.match_notification')
            ->orderBY('listmatches.start_date', 'ASC')
            ->get();
        if (!empty($findmatches->toArray())) {
            $i = 0;
            $matchshow = 0;
            foreach ($findmatches as $match) {
                $Json[$i]['id'] = $match->listmatchid;
                $Json[$i]['name'] = $match->name;
                $Json[$i]['format'] = $match->format;
                $Json[$i]['series'] = $match->seriesid;
                $Json[$i]['seriesname'] = $match->seriesname;
                $Json[$i]['team1name'] = strtoupper($match->teamname1);
                $Json[$i]['team2name'] = strtoupper($match->teamname2);
                $Json[$i]['team1fullname'] = strtoupper($match->team1fullname);
                $Json[$i]['team2fullname'] = strtoupper($match->team2fullname);
                $Json[$i]['matchkey'] = $match->matchkey;
                if (!empty($match->tosswinner_team)) {
                    $tossteamname = DB::table('teams')->where('team_key', $match->tosswinner_team)->first();
                }
                $Json[$i]['tosswinner_team'] = isset($tossteamname) ? strtoupper($tossteamname->short_name) : strtoupper(NULL);
                if ($match->toss_decision == 1) {
                    $Json[$i]['toss_decision'] = 'BAT';
                } elseif ($match->toss_decision == 2) {
                    $Json[$i]['toss_decision'] = 'BOWL';
                } else {
                    $Json[$i]['toss_decision'] = 'TOSS PENDING';
                }

                $Json[$i]['fantasy_type'] = $match->fantasy_type;
                $Json[$i]['winnerstatus'] = $match->final_status;
                $Json[$i]['playing11_status'] = $match->playing11_status;
                if (!empty($match->team1color)) {
                    $Json[$i]['team1color'] = $match->team1color;
                } else {
                    $Json[$i]['team1color'] = '#ffffff';
                }
                if (!empty($match->team2color)) {
                    $Json[$i]['team2color'] = $match->team2color;
                } else {
                    $Json[$i]['team2color'] = '#ffffff';
                }

                if ($match->team1logo != "") {
                    if (strpos($match->team1logo, 'https') === 0) {
                        $Json[$i]['team1logo'] = $match->team1logo;
                    } else {
                        $Json[$i]['team1logo'] = asset('public/' . $match->team1logo);
                    }
                } else {
                    $Json[$i]['team1logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                }
                if ($match->team2logo != "") {
                    if (strpos($match->team2logo, 'https') === 0) {
                        $Json[$i]['team2logo'] = $match->team2logo;
                    } else {
                        $Json[$i]['team2logo'] = asset('public/' . $match->team2logo);
                    }
                } else {
                    $Json[$i]['team2logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                }

                $Json[$i]['time_start'] = date('Y-m-d H:i:s', strtotime($match->start_date));
                $Json[$i]['launch_status'] = $match->launch_status;

                $findjointeam = DB::table('jointeam')->where('userid', Auth::user()->id)->where('matchkey', $match->matchkey)->orderBY('id', 'DESC')->get();
                if (!empty($findjointeam->toArray())) {
                    $Json[$i]['createteamnumber'] = $findjointeam[0]->teamnumber + 1;
                } else {
                    $Json[$i]['createteamnumber'] = 1;
                }

                $Json[$i]['totalTeams'] = DB::table('jointeam')
                    ->where('matchkey', $match->matchkey)
                    ->where('userid', Auth::user()->id)->count();

                $totalcontest = DB::table('joinedleauges')
                    ->where('matchkey', $match->matchkey)
                    ->where('userid', Auth::user()->id)
                    ->groupBy('challengeid')
                    ->count();
                $Json[$i]['totalcontest'] = $totalcontest;

                $maximum_winning_amount = DB::table('matchchallenges')
                    ->where('matchkey', $match->matchkey)
                    ->orderBy('win_amount', 'DESC')
                    ->value('win_amount');
                $Json[$i]['maximum_winning_amount'] = $maximum_winning_amount;
                $ch = DB::table('matchchallenges')->where('matchkey', $match->matchkey)->first([DB::raw('SUM(maximum_user)as max_users'), DB::raw('SUM(joinedusers)as joinedusers')]);
                $Json[$i]['max_users'] = $ch->max_users;
                $Json[$i]['total_joined'] = $ch->joinedusers;
                $matchchallengeav = DB::table('matchchallenges')->where('matchkey', $match->matchkey)->count();
                if ($matchchallengeav != 0) {
                    $Json[$i]['matchopenstatus'] = true;
                } else {
                    $Json[$i]['matchopenstatus'] = false;
                }

                $i++;
            }
        } else {
            $Json = [];
        }

        return $this->sendResponse($Json, 'Upcoming Matches.');
    }
    
    public function getAllContest(Request $request)
    {
        $matchkey = $request->matchkey;
        $findallcats = DB::table('contest_category')->orderBy('created_at', 'ASC')->get();
        $i = 0;
        $count = 0;
        $Json = [];
        if (!empty($findallcats)) {
            foreach ($findallcats as $cats) {
                $k = 0;
                $query = DB::table('matchchallenges');
                $query = $query->where('contest_cat', $cats->id);
                if ($matchkey != "") {
                    $query = $query->where('matchkey', $matchkey);
                }
                $totalallchallenges = $query->where('status', 'opened')
                    ->orderBY('entryfee', 'ASC')->get();
                $allchallenges = $query->where('status', 'opened')
                    ->orderBY('entryfee', 'ASC')->get();
                $a = $allchallenges->toArray();
                if (!empty($a)) {
                    $Json[$i]['catname'] = $cats->name;
                    $Json[$i]['catid'] = $cats->id;
                    $Json[$i]['sub_title'] = $cats->sub_title;
                    $Json[$i]['totalcontest'] = count($totalallchallenges);
                    $Json[$i]['type'] = 'category';
                    $Json[$i]['image'] = (!empty($cats->image) || $cats->image != '') ? asset('public/' . $cats->image) : asset('public/settings/' . SettingsTrait::settings('logo'));
                    $k = $i + 1;
                    foreach ($allchallenges as $challenege) {
                        $count++;
                        $Json[$k]['id'] = $challenege->id;
                        $Json[$k]['name'] = 'Win Rs.' . $challenege->win_amount;
                        $Json[$k]['entryfee'] = $challenege->entryfee;
                        $Json[$k]['type'] = 'contest';
                        $Json[$k]['contest_type'] = $challenege->contest_type;
                        $Json[$k]['winning_percentage'] = $challenege->winning_percentage;
                        $Json[$k]['win_amount'] = $challenege->win_amount;
                        $Json[$k]['matchkey'] = $challenege->matchkey;
                        $Json[$k]['status'] = 1;
                        $Json[$k]['joinedusers'] = $challenege->joinedusers;
                        if ($challenege->contest_type == 'Amount') {
                            if ($challenege->maximum_user > 0) {
                                $getjoinedpercentage = round(($challenege->joinedusers / $challenege->maximum_user) * 100, 2);
                            }
                            $Json[$k]['maximum_user'] = $challenege->maximum_user;
                        } else {
                            $getjoinedpercentage = 100;
                            $Json[$k]['maximum_user'] = 0;
                        }
                        $Json[$k]['bonus_type'] = ($challenege->bonus_percentage == '0') ? "Amount" : "Percentage";
                        $Json[$k]['getjoinedpercentage'] = $getjoinedpercentage . '%';
                        $Json[$k]['multi_entry'] = $challenege->multi_entry;
                        $Json[$k]['team_limit'] = $challenege->team_limit;
                        $Json[$k]['confirmed_challenge'] = $challenege->confirmed_challenge;
                        $Json[$k]['is_running'] = $challenege->is_running;
                        $Json[$k]['is_bonus'] = $challenege->is_bonus;
                        $Json[$k]['bonus_percentage'] = $challenege->bonus_percentage;
                        $Json[$k]['pricecard_type'] = $challenege->pricecard_type;
                        $Json[$k]['team_size'] = $challenege->team_size;
                        $findexistornot = DB::table('joinedleauges')->where('userid', Auth::user()->id)->where('challengeid', $challenege->id)->where('matchkey', $matchkey)->select('teamid', 'refercode')->get();
                        $ab = $findexistornot->toArray();
                        $userteamscount = count($findexistornot);
                        if ($userteamscount >= $challenege->team_limit) {
                            $Json[$k]['isselected'] = true;
                        } else {
                            $Json[$k]['isselected'] = false;
                        }
                        $Json[$k]['isselectedid'] = "";
                        if (!empty($ab)) {
                            $Json[$k]['refercode'] = $findexistornot[0]->refercode;
                        } else {
                            $Json[$k]['refercode'] = "";
                        }
                        $query1 = DB::table('matchpricecards');
                        $query1 = $query1->where('matchkey', $challenege->matchkey)->where('challenge_id', $challenege->id);
                        $allpricecard = $query1->orderBY('min_position', 'ASC')->get();
                        $aaa = $allpricecard->toArray();
                        $j = 0;
                        $winners = 0;
                        if (!empty($aaa)) {
                            foreach ($allpricecard as $prc) {
                                if ($prc->price == 0) {
                                    $ttlprice = $prc->total / $prc->winners;
                                    $Json[$k]['price_card'][$j]['price'] = $ttlprice;
                                    $Json[$k]['price_card'][$j]['price_percent'] = $prc->price_percent . '%';
                                } else {
                                    $Json[$k]['price_card'][$j]['price'] = $prc->price;
                                }
                                $Json[$k]['price_card'][$j]['winners'] = $prc->winners;
                                $winners += $prc->winners;
                                if ($prc->min_position + 1 != $prc->max_position) {
                                    $Json[$k]['price_card'][$j]['start_position'] = $prc->min_position + 1 . '-' . $prc->max_position;
                                } else {
                                    $Json[$k]['price_card'][$j]['start_position'] = '' . $prc->max_position;
                                }
                                $Json[$k]['totalwinners'] = $winners;
                                $j++;
                            }
                        } else {
                            $Json[$k]['totalwinners'] = 1;
                            $Json[$k]['price_card'][$j]['start_position'] = 1;
                            $Json[$k]['price_card'][$j]['price'] = $challenege->win_amount;
                        }
                        $k++;
                        $i = $k + 1;
                    }
                }
            }
        }
        $Json = array_values($Json);
        return $this->sendResponse($Json, 'All Contests.');
    }

    public function getUsableBalance(Request $request)
    {
        $challengeid = $request->get('challengeid');
        $total_team_count = $request->get('total_team_count', 1);

        /* to find the challenge details */
        $findchallengedetails = DB::table('matchchallenges')->where('id', $challengeid)->first();
        if (!empty($findchallengedetails)) {
            $entryfee = $findchallengedetails->entryfee * $total_team_count;
            $maximumuser = $findchallengedetails->maximum_user;
            /* to get the balance details */
            $findwalletamount = DB::table('userbalance')->where('user_id', Auth::user()->id)->first();
            if (!empty($findwalletamount)) {
                if ($findchallengedetails->bonus_percentage != 0) {
                    $findbonus = ($findchallengedetails->bonus_percentage / 100) * $findwalletamount->bonus;
                } else {
                    $findbonus = 0;
                }
                $findbal = $findwalletamount->balance;
                $findbonus = $findwalletamount->bonus;
                $findwining = $findwalletamount->winning;
                $findtotalbalance = $findwalletamount->bonus + $findwalletamount->balance + $findwalletamount->winning;
                $findusablebalance = $findwalletamount->balance + $findwalletamount->winning;
            } else {
                $findbonus = 0;
                $findbal = 0;
                $findwining = 0;
                $findtotalbalance = 0;
                $findusablebalance = 0;
            }
            $findbonusamount = 0;
            if ($findchallengedetails->is_bonus == 1) {
                $getbonuspercentage = $findchallengedetails->bonus_percentage;
                if ($getbonuspercentage) {
                    $findbonusamount = ($getbonuspercentage / 100) * $entryfee;
                }
            }
            $usedbonus = 0;
            if ($findbonus >= $findbonusamount) {
                $usedbonus = $findbonusamount;
                $findusablebalance += $findbonusamount;
            } else {
                $usedbonus = $findbonus;
                $findusablebalance += $findbonus;
            }

            $Json['usablebalance'] = number_format($findusablebalance, 2, '.', '');
            $Json['usertotalbalance'] = number_format($findtotalbalance, 2, '.', '');
            $Json['entryfee'] = number_format($entryfee, 2, '.', '');
            $Json['bonus'] = number_format($usedbonus, 2, '.', '');
            return $this->sendResponse($Json, 'Usable Balance.');
        } else {
            return $this->sendError('Invalid Details', '', 201);
        }
    }

    public function getAllPlayers(Request $request)
    {
        $matchkey = $request->matchkey;
        $Json = array();
        if ($request->get('matchkey')) {
            $findmatch = DB::table('listmatches')
                ->join('teams as t1', 't1.id', '=', 'listmatches.team1')
                ->join('teams as t2', 't2.id', '=', 'listmatches.team2')
                ->where('listmatches.matchkey', $matchkey)
                ->orderBy('listmatches.start_date', 'desc')
                ->select('listmatches.*', 't1.short_name as teamdata1_short_name', 't2.short_name as teamdata2_short_name')
                ->first();
            if (!empty($findmatch)) {
                $team1 = $findmatch->team1;
                $team2 = $findmatch->team2;
                $getseries = $findmatch->series;
                $allmatchkey = array();
                $findallmatches = DB::table('listmatches')->where('series', $getseries)->select('matchkey')->get();
                if (!empty($findallmatches)) {
                    foreach ($findallmatches as $matches) {
                        $allmatchkey[] = $matches->matchkey;
                    }
                }
                $findpplayers = DB::table('matchplayers')
                    ->join('players', 'players.id', 'matchplayers.playerid')
                    ->where('matchplayers.matchkey', $matchkey)
                    ->orderBy('players.points', 'DESC')
                    ->select(
                        'matchplayers.*',
                        'players.id as matchplayers_playerid_id',
                        'players.team as matchplayers_playerid_team',
                        'players.player_name as matchplayers_playerid_player_name',
                        'players.players_key as matchplayers_playerid_players_key',
                        'players.image as matchplayers_playerid_image',
                        'matchplayers.selection_per',
                        'matchplayers.captainselected',
                        'matchplayers.vcaptainselected'
                    )
                    ->get();
                if (!empty($findpplayers)) {
                    $i = 0;
                    foreach ($findpplayers as $pp) {
                        $findallplayers = DB::table('matchplayers')->whereIn('matchkey', $allmatchkey)->where('playerid', $pp->matchplayers_playerid_id)->select(DB::raw("SUM(points) as totalpoints"))->get();
                        if (($pp->matchplayers_playerid_team == $team2) || ($pp->matchplayers_playerid_team == $team1)) {
                            $Json['players'][$i]['id'] = $pp->matchplayers_playerid_id;
                            $Json['players'][$i]['name'] = $pp->matchplayers_playerid_player_name;
                            $Json['players'][$i]['role'] = $pp->role;
                            $Json['players'][$i]['credit'] = $pp->credit;
                            $Json['players'][$i]['playingstatus'] = $pp->playingstatus;
                            $Json['players'][$i]['playerkey'] = $pp->matchplayers_playerid_players_key;

                            if (empty($pp->matchplayers_playerid_image)) {
                                $Json['players'][$i]['image'] = asset('public/settings/' . SettingsTrait::settings('player_image'));
                            } else {
                                if (strpos($pp->matchplayers_playerid_image, 'https') === 0) {
                                    $Json['players'][$i]['image'] = $pp->matchplayers_playerid_image;
                                } else {
                                    $Json['players'][$i]['image'] = asset('public/' . $pp->matchplayers_playerid_image);
                                }
                            }

                            if (!empty($findallplayers[0]->totalpoints)) {
                                $Json['players'][$i]['points'] = $findallplayers[0]->totalpoints;
                            } else {
                                $Json['players'][$i]['points'] = 0;
                            }


                            $Json['players'][$i]['isSelected'] = false;
                            if ($pp->matchplayers_playerid_team == $team1) {
                                $Json['players'][$i]['team'] = 'team1';
                                $Json['players'][$i]['teamname'] = strtoupper($findmatch->teamdata1_short_name);
                            }
                            if ($pp->matchplayers_playerid_team == $team2) {
                                $Json['players'][$i]['team'] = 'team2';
                                $Json['players'][$i]['teamname'] = strtoupper($findmatch->teamdata2_short_name);
                            }

                            $Json['players'][$i]['player_selection_percentage'] = $pp->selection_per;
                            $Json['players'][$i]['captain_selection_percentage'] = $pp->captainselected;;
                            $Json['players'][$i]['vice_captain_selection_percentage'] = $pp->vcaptainselected;;
                            $i++;
                        }
                    }
                }
                $Json['sport_category']['max_players'] = 11;
                $Json['sport_category']['max_credits'] = 100;
                $Json['sport_category']['min_players_per_team'] = 4;
                $Json['sport_category']['player_positions'][0]['name'] = 'WK';
                $Json['sport_category']['player_positions'][0]['code'] = 'keeper';
                $Json['sport_category']['player_positions'][0]['fullname'] = 'Keeper';
                $Json['sport_category']['player_positions'][0]['min_players_per_team'] = 1;
                $Json['sport_category']['player_positions'][0]['max_players_per_team'] = 4;

                $Json['sport_category']['player_positions'][1]['name'] = 'BAT';
                $Json['sport_category']['player_positions'][1]['code'] = 'batsman';
                $Json['sport_category']['player_positions'][1]['fullname'] = 'Batsman';
                $Json['sport_category']['player_positions'][1]['min_players_per_team'] = 3;
                $Json['sport_category']['player_positions'][1]['max_players_per_team'] = 6;

                $Json['sport_category']['player_positions'][2]['name'] = 'ALL';
                $Json['sport_category']['player_positions'][2]['code'] = 'allrounder';
                $Json['sport_category']['player_positions'][2]['fullname'] = 'All Rounder';
                $Json['sport_category']['player_positions'][2]['min_players_per_team'] = 1;
                $Json['sport_category']['player_positions'][2]['max_players_per_team'] = 4;

                $Json['sport_category']['player_positions'][3]['name'] = 'BWL';
                $Json['sport_category']['player_positions'][3]['code'] = 'bowler';
                $Json['sport_category']['player_positions'][3]['fullname'] = 'Bowler';
                $Json['sport_category']['player_positions'][3]['min_players_per_team'] = 3;
                $Json['sport_category']['player_positions'][3]['max_players_per_team'] = 6;
            }
        }
        return $this->sendResponse($Json, 'All Match Players');
    }

    public function createTeam(Request $request)
    {
        
        $matchkey = $request->matchkey;
        $teamnumber = $request->input('teamnumber');
        $players = $request->input('players');
        $captain = $request->input('captain');
        $vicecaptain = $request->input('vicecaptain');
        $challenge_id = $request->input('challenge_id');
        $Json = [];
        $playersarray = array_filter(explode(',', $players));
        $playersarrays = implode(',', $playersarray);
        
        // if (count($playersarray) !== 11) {
        //     return $this->sendError('Please choose exactly 11 players', $Json, 201);
        // }

        $findallplayerdetails = DB::table('matchplayers')
            ->whereIn('playerid', $playersarray)
            ->where('matchkey', $matchkey)
            ->select('credit')
            ->get();

        $totalCredit = $findallplayerdetails->sum('credit');

        if ($totalCredit > 100) {
            return $this->sendError('Credit exceeded', $Json, 201);
        }

        $findmatchdetails = DB::table('listmatches')
            ->where('matchkey', $matchkey)
            ->select('start_date')
            ->first();

        if (!empty($findmatchdetails)) {
            $currentDate = now();
            $matchLockDate = $findmatchdetails->start_date;

            if ($currentDate > $matchLockDate) {
                return $this->sendError('Match Closed', $Json, 201);
            }
        }

        $data['userid'] = Auth::user()->id;
        $data['matchkey'] = $matchkey;
        $data['teamnumber'] = $teamnumber;
        $data['players'] = $players;
        $data['captain'] = $captain;
        $data['vicecaptain'] = $vicecaptain;
        $data['challenge_id'] = $challenge_id;

        $findlastteam = DB::table('jointeam')
            ->where('userid', $data['userid'])
            ->where('matchkey', $matchkey)
            ->where('challenge_id', $challenge_id)
            ->orderBy('teamnumber', 'DESC')
            ->get();

        if (!$findlastteam->isEmpty()) {
            foreach ($findlastteam as $lteam) {
                if ($lteam->captain == $data['captain'] && $lteam->vicecaptain == $data['vicecaptain']) {
                    $allplayersget = explode(',', $lteam->players);
                    $nowplayers = explode(',', $data['players']);
                    $result = array_intersect($nowplayers, $allplayersget);
                    if (count($allplayersget) === count($result)) {
                        $Json['teamid'] = 0;
                        return $this->sendError('You cannot create the same team.', $Json, 201);
                    }
                }
            }
        }

        $findcreateteam = DB::table('jointeam')
            ->where('userid', Auth::user()->id)
            ->where('matchkey', $matchkey)
            ->where('teamnumber', $teamnumber)
            ->first();

        if (!empty($findcreateteam)) {
            $data['created_at'] = $findcreateteam->created_at;
            DB::table('jointeam')
                ->where('id', $findcreateteam->id)
                ->update($data);
            $getteamid = $findcreateteam->id;
        } else {
            $findlastteam = DB::table('jointeam')
                ->where('userid', Auth::user()->id)
                ->where('matchkey', $matchkey)
                ->orderBy('teamnumber', 'DESC')
                ->select('teamnumber')
                ->first();

            if (!empty($findlastteam)) {
                $finnewteamnumber = $findlastteam->teamnumber + 1;
                if ($finnewteamnumber <= 99) {
                    $data['teamnumber'] = $finnewteamnumber;
                } else {
                    return $this->sendError('Limit exceed', $Json, 201);
                }
            } else {
                $data['teamnumber'] = 1;
            }

            if ($data['teamnumber'] <= 99) {
                $getteamid = DB::table('jointeam')->insertGetId($data);
            } else {
                return $this->sendError('Limit exceed', $Json, 201);
            }
        }

        $Json['teamid'] = $getteamid;
        return $this->sendResponse($Json, 'Team Created Successfully');
    }

    public function getMyTeams(Request $request)
    {
        // dd(Auth::user()->id);
        $matchkey = $request->matchkey;

        $challengeid = $request->input('challengeid');
        $Json = array();
        $findjointeam = DB::table('jointeam')->where('challenge_id', $challengeid)->where('matchkey', $matchkey)
        ->where('userid', Auth::user()->id)->orderBy('teamnumber', 'ASC')->select('id', 'teamnumber', 'captain', 'vicecaptain', 'players', 'points')->get();
        $i = 0;
        $Json['players'] = [];
        if (count($findjointeam) > 0) {
            foreach ($findjointeam as $jointeams) {
                $Json['players'][$i]['teamnumber'] = $jointeams->teamnumber;
                $Json['players'][$i]['teamid'] = $jointeams->id;
                $Json['players'][$i]['points'] = $jointeams->points;
                $joinleaug = DB::table('joinedleauges')->where('challengeid', $challengeid)->where('teamid', $jointeams->id)->first();
                if (!empty($joinleaug)) {
                    $Json['players'][$i]['isSelected'] = true;
                } else {
                    $Json['players'][$i]['isSelected'] = false;
                }
                $boplayerdetails = DB::table('matchplayers')
                    ->join('players', 'players.id', 'matchplayers.playerid')
                    ->join('teams', 'teams.id', 'players.team')
                    ->where('matchplayers.matchkey', $matchkey)
                    ->where('matchplayers.playerid', $jointeams->captain)
                    ->select('matchplayers.*', 'players.player_name as matchplayers_playerid_player_name', 'players.image as matchplayers_playerid_image')
                    ->first();
                if (!empty($boplayerdetails)) {
                    $Json['players'][$i]['captain'] = $boplayerdetails->matchplayers_playerid_player_name;
                    if (empty($boplayerdetails->matchplayers_playerid_image)) {
                        $Json['players'][$i]['captainimage'] = asset('public/settings/' . SettingsTrait::settings('player_image'));
                    } else {
                        if (strpos($boplayerdetails->matchplayers_playerid_image, 'https') === 0) {
                            $Json['players'][$i]['captainimage'] = $boplayerdetails->matchplayers_playerid_image;
                        } else {
                            $Json['players'][$i]['captainimage'] = asset('public/' . $boplayerdetails->matchplayers_playerid_image);
                        }
                    }
                }
                $boplayerdetails1 = DB::table('matchplayers')
                    ->join('players', 'players.id', 'matchplayers.playerid')
                    ->join('teams', 'teams.id', 'players.team')
                    ->where('matchplayers.matchkey', $matchkey)
                    ->where('matchplayers.playerid', $jointeams->vicecaptain)
                    ->select('matchplayers.*', 'players.player_name as matchplayers_playerid_player_name', 'players.image as matchplayers_playerid_image')
                    ->first();
                if (!empty($boplayerdetails1)) {
                    $Json['players'][$i]['vicecaptain'] = $boplayerdetails1->matchplayers_playerid_player_name;

                    if (empty($boplayerdetails1->matchplayers_playerid_image)) {
                        $Json['players'][$i]['vicecaptainimage'] = asset('public/settings/' . SettingsTrait::settings('player_image'));
                    } else {
                        if (strpos($boplayerdetails1->matchplayers_playerid_image, 'https') === 0) {
                            $Json['players'][$i]['vicecaptainimage'] = $boplayerdetails1->matchplayers_playerid_image;
                        } else {
                            $Json['players'][$i]['vicecaptainimage'] = asset('public/' . $boplayerdetails1->matchplayers_playerid_image);
                        }
                    }
                }
                $nowplayers = explode(',', $jointeams->players);
                $findmatch = DB::table('listmatches')->where('matchkey', $matchkey)->first();
                $playerss = DB::table('matchplayers')
                    ->join('players', 'players.id', 'matchplayers.playerid')
                    ->join('teams', 'teams.id', 'players.team')
                    ->where('matchplayers.matchkey', $matchkey)
                    ->whereIn('matchplayers.playerid', $nowplayers)
                    ->select('matchplayers.*', 'players.player_name as matchplayers_playerid_player_name', 'players.image as matchplayers_playerid_image', 'players.team as matchplayers_playerid_team')
                    ->get();
                $btco = 0;
                $btco1 = 0;
                $btco2 = 0;
                $btco3 = 0;
                $btco4 = 0;
                foreach ($playerss as $bowler1) {

                    if ($bowler1->role == 'batsman') {

                        $btco++;
                    }
                    if ($bowler1->role == 'bowler') {

                        $btco1++;
                    }
                    if ($bowler1->role == 'allrounder') {

                        $btco2++;
                    }
                    if ($bowler1->matchplayers_playerid_team == $findmatch->team1) {
                        $btco3++;
                    }
                    if ($bowler1->matchplayers_playerid_team == $findmatch->team2) {
                        $btco4++;
                    }
                }
                $j = 0;
                $Json['players'][$i]['batsmancount'] = $btco;
                $Json['players'][$i]['bowlercount'] = $btco1;
                $Json['players'][$i]['allroundercount'] = $btco2;
                $Json['players'][$i]['team1count'] = $btco3;
                $Json['players'][$i]['team2count'] = $btco4;
                foreach ($playerss as $bowler) {
                    $Json['players'][$i]['player'][$j]['id'] = $bowler->playerid;
                    $Json['players'][$i]['player'][$j]['name'] = $bowler->matchplayers_playerid_player_name;
                    $Json['players'][$i]['player'][$j]['role'] = $bowler->role;
                    $Json['players'][$i]['player'][$j]['credit'] = $bowler->credit;
                    $Json['players'][$i]['player'][$j]['playingstatus'] = $bowler->playingstatus;
                    if ($bowler->matchplayers_playerid_team == $findmatch->team1) {
                        $Json['players'][$i]['player'][$j]['team'] = 'team1';
                    }
                    if ($bowler->matchplayers_playerid_team == $findmatch->team2) {
                        $Json['players'][$i]['player'][$j]['team'] = 'team2';
                    }

                    if (empty($bowler->matchplayers_playerid_image)) {
                        $Json['players'][$i]['player'][$j]['image'] = asset('public/settings/' . SettingsTrait::settings('player_image'));
                    } else {
                        if (strpos($bowler->matchplayers_playerid_image, 'https') === 0) {
                            $Json['players'][$i]['player'][$j]['image'] = $bowler->matchplayers_playerid_image;
                        } else {
                            $Json['players'][$i]['player'][$j]['image'] = asset('public/' . $bowler->matchplayers_playerid_image);
                        }
                    }
                    $vicecaptain = 0;
                    $captain = 0;
                    if ($jointeams->vicecaptain == $bowler->playerid) {
                        $vicecaptain = 1;
                    }
                    if ($jointeams->captain == $bowler->playerid) {
                        $captain = 1;
                    }
                    $Json['players'][$i]['player'][$j]['vicecaptain'] = $vicecaptain;
                    $Json['players'][$i]['player'][$j]['captain'] = $captain;
                    $currentpoints = $bowler->points;
                    $Json['players'][$i]['player'][$j]['points'] = $currentpoints;

                    $j++;
                }
                if ($request->get('challengeid')) {
                    $findifwithteam = DB::table('joinedleauges')->where('challengeid', $request->get('challengeid'))->where('teamid', $jointeams->id)->where('userid', Auth::user()->id)->first();
                    if (!empty($findifwithteam)) {
                        $Json['players'][$i]['isSelected'] = true;
                    }
                }
                $Json['players'][$i]['status'] = 1;
                $i++;
            }
        }
        $Json['sport_category']['max_players'] = 11;
        $Json['sport_category']['max_credits'] = 100;
        $Json['sport_category']['min_players_per_team'] = 4;
        $Json['sport_category']['player_positions'][0]['name'] = 'WK';
        $Json['sport_category']['player_positions'][0]['code'] = 'keeper';
        $Json['sport_category']['player_positions'][0]['fullname'] = 'Keeper';
        $Json['sport_category']['player_positions'][0]['min_players_per_team'] = 1;
        $Json['sport_category']['player_positions'][0]['max_players_per_team'] = 4;

        $Json['sport_category']['player_positions'][1]['name'] = 'BAT';
        $Json['sport_category']['player_positions'][1]['code'] = 'batsman';
        $Json['sport_category']['player_positions'][1]['fullname'] = 'Batsman';
        $Json['sport_category']['player_positions'][1]['min_players_per_team'] = 3;
        $Json['sport_category']['player_positions'][1]['max_players_per_team'] = 6;

        $Json['sport_category']['player_positions'][2]['name'] = 'ALL';
        $Json['sport_category']['player_positions'][2]['code'] = 'allrounder';
        $Json['sport_category']['player_positions'][2]['fullname'] = 'All Rounder';
        $Json['sport_category']['player_positions'][2]['min_players_per_team'] = 1;
        $Json['sport_category']['player_positions'][2]['max_players_per_team'] = 4;

        $Json['sport_category']['player_positions'][3]['name'] = 'BWL';
        $Json['sport_category']['player_positions'][3]['code'] = 'bowler';
        $Json['sport_category']['player_positions'][3]['fullname'] = 'Bowler';
        $Json['sport_category']['player_positions'][3]['min_players_per_team'] = 3;
        $Json['sport_category']['player_positions'][3]['max_players_per_team'] = 6;
        return $this->sendResponse($Json, 'Team List');
    }

    public function joinLeauge(Request $request)
    {
        $Json = [];
        DB::beginTransaction();
        $matchkey = $request->matchkey;
        $listmatchestartdate =  DB::table('listmatches')->where('matchkey', $matchkey)->first();
        if (!empty($listmatchestartdate)) {
            $getcurrentdate = date('Y-m-d H:i:s');
            if ($getcurrentdate > date('Y-m-d H:i:s', strtotime($listmatchestartdate->start_date))) {
                return $this->sendError('Match Closed', $Json, 201);
            }
        } else {
            return $this->sendError('no match by this key', $Json, 201);
        }

        $aadharverify = DB::table('user_verify')->where('userid', Auth::user()->id)->first();

        if (!empty($aadharverify) && $aadharverify->aadhar_verify != 1) {
            return $this->sendError('Please Update Your Aadhar', $Json, 201);
        }

        $challengeid = $data['challengeid'] = $datass['challengeid'] = $request->get('challengeid');
        $teamid = $data['teamid'] = $request->get('teamid');
        $teamids = explode(',', $teamid);

        foreach ($teamids as $teamid) {
            if (!empty($teamid)) {
                $findteam =  DB::table('jointeam')->where('id', $teamid)->where('matchkey', $matchkey)->first();
                if (empty($findteam)) {
                    return $this->sendError('Invalid Team', $Json, 201);
                }
                $data['teamid'] = $datass['teamid'] = $teamid;
                $findjoinedleauges =  DB::table('joinedleauges')->where('teamid', $teamid)->where('challengeid', $challengeid)->where('matchkey', $matchkey)->where('userid', Auth::user()->id)->first();
                //Generate random code//
                $refercode = $characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                $refercode = '';
                $max = strlen($characters) - 1;
                for ($i = 0; $i < 4; $i++) {
                    $refercode .= $characters[mt_rand(0, $max)];
                }

                $data['refercode'] = $datass['refercode'] = $refercode = SettingsTrait::settings('short_name') . $refercode;
                //Check if match is closed or not//
                $findchallenge =  DB::table('matchchallenges')->where('id', $challengeid)->first();
                if (!empty($findchallenge)) {
                    $findexistornot =  DB::table('joinedleauges')->where('userid', Auth::user()->id)->where('challengeid', $challengeid)->where('matchkey', $matchkey)->select('teamid')->get();
                    $ab = $findexistornot->toArray();
                    if (!empty($ab)) {
                        if ($findchallenge->multi_entry == 0) {
                            return $this->sendError('Already Joined', $Json, 201);
                        } else {
                            foreach ($findexistornot as $ff) {
                                if ($ff->teamid == $teamid) {
                                    return $this->sendError('Team Already Joined', $Json, 201);
                                }
                            }
                            /* check if there is any multi entry limit */
                            if ($findchallenge->multi_entry == 1) {
                                $userteamscount = count($findexistornot);
                                if ($userteamscount >= $findchallenge->team_limit) {
                                    return $this->sendError('You cannot join with more teams now.', $Json, 201);
                                }
                            }
                        }
                    }
                    try {
                        //check for leauge closed or not //
                        $dataused = array();
                        $dataleft = array();
                        if (Auth::user()->id == Auth::user()->id) {
                            $nextteamcount = $findchallenge->joinedusers + 1;
                            $updatedata['joinedusers'] = $nextteamcount;
                        }
                        if ($findchallenge->contest_type == 'Amount') {
                            if ($updatedata['joinedusers'] > $findchallenge->maximum_user) {
                                return $this->sendError('Leauge Closed', $Json, 201);
                            }
                        }

                        //start deduct money code for join leauge//
                        $finduserbalance =  DB::table('userbalance')->where('user_id', Auth::user()->id)->first();
                        if (!empty($finduserbalance)) {
                            $totalbonus = 0;
                            $findentryfee = $findchallenge->entryfee;
                            /* find the current balance of users*/
                            $dataleft['bonus'] = $findbonusforuser = number_format($finduserbalance->bonus, 2, ".", "");
                            $dataleft['winning'] = number_format($finduserbalance->winning, 2, ".", "");
                            $dataleft['balance'] = number_format($finduserbalance->balance, 2, ".", "");
                            $totalbonus = 0;
                            $finduserbonus = 0;
                            if ($findchallenge->is_bonus == 1) {
                                $totalbonus = $finduserbonus = number_format($finduserbalance->bonus, 2, ".", "");
                            }
                            $usedbonus = 0;
                            $canusedbonus = 0;
                            $totalwining = $canusedwining = number_format($finduserbalance->winning, 2, ".", "");
                            $totalbalance = $canusedbalance = number_format($finduserbalance->balance, 2, ".", "");
                            $totbalan = number_format($finduserbalance->bonus + $finduserbalance->winning + $finduserbalance->balance, 2, ".", "");
                            $findusablebalance = number_format($finduserbalance->balance + $finduserbalance->winning, 2, ".", "");
                            $reminingfee = $findentryfee;
                            //start deduct money section//
                            if ($findchallenge->is_private != 1 && $findchallenge->is_bonus == 1) {
                                $canu = 0;
                                $totalchalbonus = 0;
                                $totalchalbonus = ($findchallenge->bonus_percentage / 100) * $findentryfee;
                                if ($finduserbonus >= $totalchalbonus) {
                                    $findusablebalance += $totalchalbonus;
                                    $canu = $totalchalbonus;
                                } else {
                                    $canusedd = $finduserbonus;
                                    $findusablebalance += $canusedd;
                                    $canu = $canusedd;
                                }
                                if ($findusablebalance < $findentryfee) {
                                    return $this->sendError('Insufficient Balance', $Json, 201);
                                }
                                if ($canu >= $findentryfee) {
                                    $remainingbonus1 = $canu - $findentryfee;
                                    $remainingbonus = $finduserbonus - $findentryfee;
                                    $dataleft['bonus'] = number_format($remainingbonus, 2, ".", "");
                                    $transactiondata['cons_bonus'] = $dataused['bonus'] = $findentryfee;
                                    $reminingfee = 0;
                                } else {
                                    $reminingfee = $findentryfee - $canu;
                                    $remainingbonus = $finduserbonus - $canu;
                                    $dataleft['bonus'] = number_format($remainingbonus, 2, ".", "");
                                    $transactiondata['cons_bonus'] = $dataused['bonus'] = $canu;
                                }
                            }

                            if ($findusablebalance < $findentryfee) {
                                return $this->sendError('Insufficient Balance', $Json, 201);
                            }
                            if ($reminingfee > 0) {
                                if ($canusedbalance >= $reminingfee) {
                                    $reminingbalance = $canusedbalance - $reminingfee;
                                    $dataleft['balance'] = number_format($reminingbalance, 2, ".", "");
                                    $transactiondata['cons_amount'] = $dataused['balance'] = $reminingfee;
                                    $reminingfee = 0;
                                } else {
                                    $dataleft['balance'] = 0;
                                    $reminingfee = $reminingfee - $canusedbalance;
                                    $transactiondata['cons_amount'] = $dataused['balance'] = $canusedbalance;
                                }
                            }
                            if ($reminingfee > 0) {
                                if ($canusedwining >= $reminingfee) {
                                    $reminingwining = $canusedwining - $reminingfee;
                                    $dataleft['winning'] = number_format($reminingwining, 2, ".", "");
                                    $transactiondata['cons_win'] = $dataused['winning'] = $reminingfee;
                                    $reminingfee = 0;
                                } else {
                                    $dataleft['winning'] = 0;
                                    $reminingfee = $reminingfee - $canusedwining;
                                    $transactiondata['cons_win'] = $dataused['winning'] = $canusedwining;
                                }
                            }

                            // find transaction id//
                            $tranid = (SettingsTrait::settings('short_name')) . '-JL-' . $findchallenge->id . '-' . time() . rand(10, 99);
                            // to enter in joined leauges table//
                            $data['transaction_id'] = $datass['transaction_id'] = $tranid . '-' . Auth::user()->id;
                            //insert leauge entry//

                            if ($findchallenge->contest_type == 'Percentage') {
                                $result = DB::insert("INSERT INTO `joinedleauges` ( `userid`, `challengeid`, `teamid`, `matchkey`, `transaction_id`) SELECT " . Auth::user()->id . " , " . $challengeid . ", " . $teamid . ", '" . $matchkey . "', '" . $data['transaction_id'] . "' FROM DUAL");
                                $challenge_insert_id = DB::select('SELECT LAST_INSERT_ID()');
                            } else {
                                $result = DB::insert("INSERT INTO `joinedleauges` ( `userid`, `challengeid`, `teamid`, `matchkey`, `transaction_id`) SELECT " . Auth::user()->id . " , " . $challengeid . ", '" . $teamid . "', '" . $matchkey . "', '" . $data['transaction_id'] . "' FROM DUAL WHERE (SELECT COUNT(*) FROM joinedleauges WHERE challengeid=$challengeid) < " . $findchallenge->maximum_user);
                                $challenge_insert_id = DB::select('SELECT LAST_INSERT_ID()');
                            }
                            if (!empty($result)) {

                                $getinsertid = $challenge_insert_id[0]->{"LAST_INSERT_ID()"};
                                DB::table('joinedleauges')->where('id', $getinsertid)->update($data);
                                if ($getinsertid != '0') {

                                    $data['refercode'] = $datass['refercode'] = $refercode . '' . $getinsertid;
                                    DB::table('joinedleauges')->where('id', $getinsertid)->update($data);
                                    $joinedusers =  DB::table('joinedleauges')->where('challengeid', $challengeid)->count();
                                    $updatedata['joinedusers'] = $joinedusers;
                                    DB::table('matchchallenges')->where('id', $challengeid)->update($updatedata);
                                    $datass['joinid'] = $getinsertid;

                                    //entry in leauges transactions//
                                    $dataused['matchkey'] = $matchkey;
                                    $dataused['user_id'] = Auth::user()->id;
                                    $dataused['challengeid'] = $challengeid;
                                    $dataused['joinid'] = $getinsertid;
                                    DB::table('leaugestransactions')->insert($dataused);
                                    //updatewallet table//
                                    DB::table('userbalance')->where('user_id', Auth::user()->id)->update($dataleft);
                                    $findnowamount =  DB::table('userbalance')->where('user_id', Auth::user()->id)->first();
                                    //end deduct money section//
                                    //start entry in transaction table//
                                    $transactiondata['type'] = 'Contest Joining Fee';
                                    $transactiondata['amount'] = $findentryfee;
                                    $transactiondata['total_available_amt'] = $totbalan - $findentryfee;
                                    $transactiondata['transaction_by'] = 'wallet';
                                    $transactiondata['challengeid'] = $challengeid;
                                    $transactiondata['userid'] = Auth::user()->id;
                                    $transactiondata['paymentstatus'] = 'confirmed';
                                    $transactiondata['bal_bonus_amt'] = $findnowamount->bonus;
                                    $transactiondata['bal_win_amt'] = $findnowamount->winning;
                                    $transactiondata['bal_fund_amt'] = $findnowamount->balance;
                                    $transactiondata['transaction_id'] = $tranid . '-' . Auth::user()->id;
                                    DB::table('transactions')->insert($transactiondata);
                                    $updatedata['status'] = 'opened';
                                    if ($findchallenge->contest_type == 'Amount') {
                                        if ($updatedata['joinedusers'] == $findchallenge->maximum_user) {
                                            //close challenge//
                                            $updatedata['status'] = 'closed';
                                            if ($findchallenge->is_running == 1) {
                                                //new duplicate challenge//
                                                $newentry = json_decode(json_encode($findchallenge), true);
                                                unset($newentry['id']);
                                                unset($newentry['joinedusers']);
                                                $entryfee = $findchallenge->entryfee;
                                                $maximum_user = $findchallenge->maximum_user;
                                                $win_amount = $findchallenge->win_amount;
                                                $matchkey = $findchallenge->matchkey;
                                                $contest_type = $findchallenge->contest_type;
                                                $created_by = $findchallenge->created_by;
                                                $id = $findchallenge->id;

                                                $existdata =  DB::table('matchchallenges')->where('entryfee', $entryfee)->where('maximum_user', $maximum_user)->where('win_amount', $win_amount)->where('matchkey', $matchkey)->where('contest_type', $contest_type)->where('created_by', $created_by)->where('status', 'opened')->where('id', '!=', $id)->first();
                                                if (empty($existdata)) {
                                                    $getcid = DB::table('matchchallenges')->insertGetId($newentry);
                                                    $findpricecards =  DB::table('matchpricecards')->where('challenge_id', $findchallenge->id)->get();
                                                    if (!empty($findpricecards)) {
                                                        foreach ($findpricecards as $pricec) {
                                                            $pdata = array();
                                                            $pdata = json_decode(json_encode($pricec), true);
                                                            unset($pdata['id']);
                                                            $pdata['challenge_id'] = $getcid;
                                                            DB::table('matchpricecards')->insert($pdata);
                                                        }
                                                    }
                                                }
                                            }
                                            DB::table('matchchallenges')->where('id', $challengeid)->update($updatedata);
                                        }
                                    } else {
                                        $updatedata['status'] = 'opened';
                                        $updatedata['matchkey'] = $findchallenge->matchkey;
                                        DB::table('matchchallenges')->where('id', $challengeid)->update($updatedata);
                                    }
                                } else {
                                    $updatedata['status'] = 'opened';
                                }
                                $findchallenge->status = $updatedata['status'];

                                $findchallenge->joinedusers = $updatedata['joinedusers'];

                                DB::table('matchchallenges')
                                    ->where('id', $challengeid)
                                    ->update($updatedata);

                                if ($findchallenge->joinedusers == $updatedata['joinedusers'] and $findchallenge->status == $updatedata['status']) {
                                    DB::table('matchchallenges')->where('id', $challengeid)->update($updatedata);
                                    DB::commit();
                                    $ttlblance = $totbalan - $findentryfee;
                                    $data21['userid'] = Auth::user()->id;
                                    $data21['seen'] = 0;
                                    $data21['title'] = 'You have successfully joined league of Rs ' . $findentryfee;
                                    DB::table('notifications')->insert($data21);
                                    $explodearray[] = Auth::user()->id;
                                    $leagueEntryFee = $findentryfee;
                                    $data['subject'] = '🏆 League Joined Successfully';
                                    $data['content'] = "Congratulations! You've successfully joined a league with an entry fee of ₹ {$leagueEntryFee}. Best of luck and may the best team win! 🎉🏏";
                                    SettingsTrait::sendnotification($data['subject'], $data['content'], '', 'individual', $explodearray);

                                    $Json['totalbalance'] = $ttlblance;
                                    $Json['joinedusers'] = $updatedata['joinedusers'];
                                    if ($findchallenge->contest_type == 'Amount') {
                                        if ($findchallenge->maximum_user > 0) {
                                            $joinper = ($updatedata['joinedusers'] / $findchallenge->maximum_user) * 100;
                                        } else {
                                            $joinper = 0;
                                        }
                                    } else {
                                        $joinper = 100;
                                    }
                                    $Json['getjoinedpercentage'] = $joinper . '%';
                                    if ($findchallenge->is_private != "" || $findchallenge->is_private != 0) {
                                        $Json['is_private'] = 1;
                                    } else {
                                        $Json['is_private'] = 0;
                                    }
                                    if ($findchallenge->multi_entry != "" || $findchallenge->multi_entry != 0) {
                                        $Json['multi_entry'] = 1;
                                    } else {
                                        $Json['multi_entry'] = 0;
                                    }
                                    $Json['refercode'] = $data['refercode'];
                                    return $this->sendResponse($Json, 'Leauge Joined');
                                } else {
                                    DB::rollBack();
                                }
                            }
                        }
                    } catch (\Exception $e) {
                        DB::rollBack();
                        return $this->sendError($e->getMessage(), $Json, 201);
                    }
                } else {
                    return $this->sendError('no challenge by this challengeid', $Json, 201);
                }
            }
        }
    }

    public function joinedContest(Request $request)
    {
        $matchkey = $request->matchkey;
        $i = 0;
        $count = 0;
        $Json = [];
        $query = DB::table('joinedleauges');
        if ($matchkey != "") {
            $query = $query->join('matchchallenges', 'matchchallenges.id', '=', 'joinedleauges.challengeid')->where('joinedleauges.matchkey', $matchkey)->where('joinedleauges.userid', Auth::user()->id);
        }
        $allchallenges = $query->select('matchchallenges.*', 'joinedleauges.id as jid')->get();
        $a = $allchallenges->toArray();
        if (!empty($a)) {
            foreach ($allchallenges as $challenege) {
                $count++;
                $Json[$i]['id'] = $challenege->id;
                $Json[$i]['joinid'] = $challenege->jid;
                $Json[$i]['name'] = 'Win Rs.' . $challenege->win_amount;
                $Json[$i]['entryfee'] = $challenege->entryfee;
                $Json[$i]['type'] = 'contest';
                $Json[$i]['contest_type'] = $challenege->contest_type;
                $Json[$i]['winning_percentage'] = $challenege->winning_percentage;
                $Json[$i]['win_amount'] = $challenege->win_amount;
                $Json[$i]['matchkey'] = $challenege->matchkey;
                $Json[$i]['status'] = 1;
                $Json[$i]['joinedusers'] = $challenege->joinedusers;
                if ($challenege->contest_type == 'Amount') {
                    if ($challenege->maximum_user > 0) {
                        $getjoinedpercentage = round(($challenege->joinedusers / $challenege->maximum_user) * 100, 2);
                    }
                    $Json[$i]['maximum_user'] = $challenege->maximum_user;
                } else {
                    $getjoinedpercentage = 100;
                    $Json[$i]['maximum_user'] = 0;
                }
                $Json[$i]['bonus_type'] = ($challenege->bonus_percentage == '0') ? "Amount" : "Percentage";
                $Json[$i]['getjoinedpercentage'] = $getjoinedpercentage . '%';
                $Json[$i]['multi_entry'] = $challenege->multi_entry;
                $Json[$i]['team_limit'] = $challenege->team_limit;
                $Json[$i]['confirmed_challenge'] = $challenege->confirmed_challenge;
                $Json[$i]['is_running'] = $challenege->is_running;
                $Json[$i]['is_bonus'] = $challenege->is_bonus;
                $Json[$i]['bonus_percentage'] = $challenege->bonus_percentage;
                $Json[$i]['pricecard_type'] = $challenege->pricecard_type;
                $findexistornot = DB::table('joinedleauges')->where('userid', Auth::user()->id)->where('challengeid', $challenege->id)->where('matchkey', $matchkey)->select('teamid', 'refercode')->get();
                $userteamscount = count($findexistornot);
                if ($userteamscount >= $challenege->team_limit) {
                    $Json[$i]['isselected'] = true;
                } else {
                    $Json[$i]['isselected'] = false;
                }
                $Json[$i]['isselectedid'] = "";
                if (!empty($userteamscount)) {
                    $Json[$i]['refercode'] = $findexistornot[0]->refercode;
                } else {
                    $Json[$i]['refercode'] = "";
                }
                $query1 = DB::table('matchpricecards');
                $query1 = $query1->where('matchkey', $challenege->matchkey)->where('challenge_id', $challenege->id);
                $allpricecard = $query1->orderBY('min_position', 'ASC')->get();
                $aaa = $allpricecard->toArray();
                $j = 0;
                $winners = 0;
                if (!empty($aaa)) {
                    foreach ($allpricecard as $prc) {
                        if ($prc->price == 0) {
                            $ttlprice = $prc->total / $prc->winners;
                            $Json[$i]['price_card'][$j]['price'] = $ttlprice;
                            $Json[$i]['price_card'][$j]['price_percent'] = $prc->price_percent . '%';
                        } else {
                            $Json[$i]['price_card'][$j]['price'] = $prc->price;
                        }
                        $Json[$i]['price_card'][$j]['winners'] = $prc->winners;
                        $winners += $prc->winners;
                        if ($prc->min_position + 1 != $prc->max_position) {
                            $Json[$i]['price_card'][$j]['start_position'] = $prc->min_position + 1 . '-' . $prc->max_position;
                        } else {
                            $Json[$i]['price_card'][$j]['start_position'] = '' . $prc->max_position;
                        }
                        $Json[$i]['totalwinners'] = $winners;
                        $j++;
                    }
                } else {
                    $Json[$i]['totalwinners'] = 1;
                    $Json[$i]['price_card'][$j]['start_position'] = 1;
                    $Json[$i]['price_card'][$j]['price'] = $challenege->win_amount;
                }

                $i++;
            }
        }

        return $this->sendResponse($Json, 'Joined Contests.');
    }

    public function createPrivateContest(Request $request)
    {
        $matchkey = $request->matchkey;
        $Json = [];
        if ($request->get('win_amount') > 10000) {
            return $this->sendError('Winning amount should be less than 10000.', $Json, 201);
        }
        if ($request->get('maximum_user') > 100) {
            return $this->sendError('League size should be less than 100.', $Json, 201);
        }
        $maximum_user = $data['maximum_user'] = $request->get('maximum_user');
        $total_re = (($request->get('win_amount') * 15) / 100) + $request->get('win_amount');
        $data['created_by'] = Auth::user()->id;
        $data['matchkey'] = $matchkey;
        $data['multi_entry'] = $request->get('multi_entry');
        $data['contest_type'] = 'Amount';
        $data['contest_name'] = $request->get('name');
        $data['contest_cat'] = '0';
        $data['entryfee'] = $request->get('entryfee');
        $data['win_amount'] = $request->get('win_amount');
        if ($maximum_user < 2) {
            return $this->sendError('Invalid league details. You cannot create a league with less then two members.', $Json, 201);
        }
        $rec = $request->get('entryfee') * $maximum_user;
        $epsilon = 0.00001;
        $rec = floatval($request->get('entryfee')) * floatval($maximum_user);
        $total_re = (($request->get('win_amount') * 15) / 100) + $request->get('win_amount');

        if (abs(floatval($rec) - floatval($total_re)) < $epsilon) {
            if ($request->get('entryfee') <= 0) {
                $data['win_amount'] = 0;
            }
            $challengeid = DB::table('matchchallenges')->insertGetId($data);
            $dataa =  DB::table('matchchallenges')->where('id', $challengeid)->select('entryfee')->first();
            $Json['challengeid'] = $challengeid;
            $Json['entryfee'] = $dataa->entryfee;
        } else {
            return $this->sendError('Invalid league details. You cannot create a Free League.', $Json, 201);
        }
        return $this->sendResponse($Json, 'Private Contest Created.');
    }

    public function joinByCode(Request $request)
    {
        $invitecode = $request->getcode;
        $Json = [];
        $findchallenge =  DB::table('joinedleauges')
            ->join('matchchallenges', 'matchchallenges.id', '=', 'joinedleauges.challengeid')
            ->where('joinedleauges.refercode', $invitecode)
            ->select('matchchallenges.status', 'matchchallenges.entryfee', 'matchchallenges.maximum_user', 'matchchallenges.multi_entry', 'joinedleauges.*')
            ->first();
        if (!empty($findchallenge)) {
            $matchkeyy = $findchallenge->matchkey;
            $matchdetail =  DB::table('listmatches')->Where('matchkey', $matchkeyy)->select('fantasy_type')->first();
            $joinedchll =  DB::table('joinedleauges')->where('challengeid', $findchallenge->challengeid)->where('userid', Auth::user()->id)->count();
            if ($findchallenge->multi_entry == 1) {
                if ($joinedchll == 11) {
                    return $this->sendError('Already Used', $Json, 201);
                } elseif ($findchallenge->status == 'closed') {
                    return $this->sendError('Challenge closed', $Json, 201);
                } else {
                    $Json['multi_entry'] = 1;
                    $Json['challengeid'] = $findchallenge->challengeid;
                    $Json['entryfee'] = $findchallenge->entryfee;
                    $Json['type'] = $matchdetail->fantasy_type;
                    $Json['max_teams'] = $findchallenge->maximum_user;
                }
            } else {
                if ($joinedchll == 0) {
                    return $this->sendError('Already Used', $Json, 201);
                }
                if ($findchallenge->status == 'closed') {
                    return $this->sendError('Challenge closed', $Json, 201);
                } else {
                    $Json['multi_entry'] = 0;
                    $Json['challengeid'] = $findchallenge->challengeid;
                    $Json['entryfee'] = $findchallenge->entryfee;
                    $Json['max_teams'] = $findchallenge->maximum_user;
                }
            }
            $match =  DB::table('listmatches')
                ->where('listmatches.matchkey', $findchallenge->matchkey)
                ->join('series', 'listmatches.series', '=', 'series.id')
                ->join('teams as team1', 'team1.id', '=', 'listmatches.team1')
                ->join('teams as team2', 'team2.id', '=', 'listmatches.team2')
                ->where('listmatches.final_status', '!=', 'IsCanceled')
                ->where('listmatches.final_status', '!=', 'IsAbandoned')
                ->where('series.status', 'opened')
                ->select('listmatches.id as listmatchid', 'team1.short_name as teamname1', 'team2.short_name as teamname2', 'team1.color as team1color', 'team2.color as team2color', 'team1.logo as team1logo', 'team2.logo as team2logo', 'listmatches.series as seriesid', 'series.name as seriesname', 'listmatches.name', 'listmatches.start_date', 'listmatches.format', 'listmatches.matchkey', 'listmatches.final_status', 'listmatches.launch_status', 'listmatches.playing11_status', 'listmatches.fantasy_type')->orderBY('listmatches.start_date', 'ASC')
                ->first();

            if (!empty($match)) {
                $Json['type'] = $match->fantasy_type;
                $Json['match_key'] = $findchallenge->matchkey;
                $Json['team1name'] = strtoupper($match->teamname1);
                $Json['team2name'] = strtoupper($match->teamname2);
                $Json['time_start'] = date('Y-m-d H:i:s', strtotime($match->start_date));
                if (!empty($match->team1color)) {
                    $Json['team1color'] = $match->team1color;
                } else {
                    $Json['team1color'] = '#ffffff';
                }
                if (!empty($match->team2color)) {
                    $Json['team2color'] = $match->team2color;
                } else {
                    $Json['team2color'] = '#ffffff';
                }

                if ($match->team1logo != "") {
                    if (strpos($match->team1logo, 'https') === 0) {
                        $Json['team1logo'] = $match->team1logo;
                    } else {
                        $Json['team1logo'] = asset('public/' . $match->team1logo);
                    }
                } else {
                    $Json['team1logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                }
                if ($match->team2logo != "") {
                    if (strpos($match->team2logo, 'https') === 0) {
                        $Json['team2logo'] = $match->team2logo;
                    } else {
                        $Json['team2logo'] = asset('public/' . $match->team2logo);
                    }
                } else {
                    $Json['team2logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                }


                $Json['series'] = $match->seriesid;
            }
        } else {
            return $this->sendError('Invalid Code', $Json, 201);
        }
        return $this->sendResponse($Json, 'Challenge Opened.');
    }

    public function joinByCodeDetail(Request $request)
    {
        $invitecode = $request->getcode;
        $Json = [];
        $findchallenge =  DB::table('joinedleauges')
            ->join('matchchallenges', 'matchchallenges.id', '=', 'joinedleauges.challengeid')
            ->where('joinedleauges.refercode', $invitecode)
            ->select('matchchallenges.status', 'matchchallenges.entryfee', 'matchchallenges.maximum_user', 'matchchallenges.multi_entry', 'joinedleauges.*')
            ->first();
        if (!empty($findchallenge)) {
            $matchkeyy = $findchallenge->matchkey;
            $matchdetail =  DB::table('listmatches')->Where('matchkey', $matchkeyy)->select('fantasy_type')->first();
            $joinedchll =  DB::table('joinedleauges')->where('challengeid', $findchallenge->challengeid)->where('userid', Auth::user()->id)->count();
            if ($findchallenge->multi_entry == 1) {
                if ($joinedchll == 11) {
                    return $this->sendError('Already Used', $Json, 201);
                } else {
                    $Json['multi_entry'] = 1;
                    $Json['challengeid'] = $findchallenge->challengeid;
                    $Json['entryfee'] = $findchallenge->entryfee;
                    $Json['type'] = $matchdetail->fantasy_type;
                    $Json['max_teams'] = $findchallenge->maximum_user;
                }
            } else {
                if ($joinedchll == 0) {
                    return $this->sendError('Already Used', $Json, 201);
                } else {
                    $Json['multi_entry'] = 0;
                    $Json['challengeid'] = $findchallenge->challengeid;
                    $Json['entryfee'] = $findchallenge->entryfee;
                    $Json['max_teams'] = $findchallenge->maximum_user;
                }
            }
            $match =  DB::table('listmatches')
                ->where('listmatches.matchkey', $findchallenge->matchkey)
                ->join('series', 'listmatches.series', '=', 'series.id')
                ->join('teams as team1', 'team1.id', '=', 'listmatches.team1')
                ->join('teams as team2', 'team2.id', '=', 'listmatches.team2')
                ->where('listmatches.final_status', '!=', 'IsCanceled')
                ->where('listmatches.final_status', '!=', 'IsAbandoned')
                ->where('series.status', 'opened')
                ->select('listmatches.id as listmatchid', 'team1.short_name as teamname1', 'team2.short_name as teamname2', 'team1.color as team1color', 'team2.color as team2color', 'team1.logo as team1logo', 'team2.logo as team2logo', 'listmatches.series as seriesid', 'series.name as seriesname', 'listmatches.name', 'listmatches.start_date', 'listmatches.format', 'listmatches.matchkey', 'listmatches.final_status', 'listmatches.launch_status', 'listmatches.playing11_status', 'listmatches.fantasy_type')->orderBY('listmatches.start_date', 'ASC')
                ->first();

            if (!empty($match)) {
                $Json['type'] = $match->fantasy_type;
                $Json['match_key'] = $findchallenge->matchkey;
                $Json['team1name'] = strtoupper($match->teamname1);
                $Json['team2name'] = strtoupper($match->teamname2);
                $Json['time_start'] = date('Y-m-d H:i:s', strtotime($match->start_date));
                if (!empty($match->team1color)) {
                    $Json['team1color'] = $match->team1color;
                } else {
                    $Json['team1color'] = '#ffffff';
                }
                if (!empty($match->team2color)) {
                    $Json['team2color'] = $match->team2color;
                } else {
                    $Json['team2color'] = '#ffffff';
                }
                if (strpos($match->team1logo, 'https') === 0) {
                    $Json['team1logo'] = $match->team1logo;
                } else {
                    $Json['team1logo'] = asset('public/' . $match->team1logo);
                }
                if (strpos($match->team2logo, 'https') === 0) {
                    $Json['team2logo'] = $match->team2logo;
                } else {
                    $Json['team2logo'] = asset('public/' . $match->team2logo);
                }
                $Json['series'] = $match->seriesid;
            }
        } else {
            return $this->sendError('Invalid Code', $Json, 201);
        }
        return $this->sendResponse($Json, 'Challenge Opened.');
    }

    public function viewTeam(Request $request)
    {
        $teamid = $request->teamid;
        $Json = [];
        $query = DB::table('jointeam');
        if ($request->get('teamid')) {
            $query = $query->where('id', $teamid);
        }
        if ($request->get('teamnumber') && $request->get('matchkey')) {
            $query = $query->where('matchkey', $request->get('matchkey'))->where('teamnumber', $request->get('teamnumber'));
        }
        $jointeam = $query->select('*')->get();
        if (count($jointeam) > 0) {
            foreach ($jointeam as $team) {
                $playersarr = explode(',', $team->players);
                $boplayerdetails = DB::table('matchplayers')
                    ->join('players', 'players.id', 'matchplayers.playerid')
                    ->join('teams', 'teams.id', 'players.team')
                    ->where('matchplayers.matchkey', $team->matchkey)
                    ->whereIn('matchplayers.playerid', $playersarr)
                    ->select('matchplayers.*', 'players.player_name as matchplayers_playerid_player_name', 'players.image as matchplayers_playerid_image', 'players.team as matchplayers_playerid_team')
                    ->get();
                if (count($boplayerdetails) > 0) {
                    $j = 0;
                    foreach ($boplayerdetails as $bowler) {
                        $findmatch = DB::table('listmatches')
                            ->join('teams as t1', 't1.id', '=', 'listmatches.team1')
                            ->join('teams as t2', 't2.id', '=', 'listmatches.team2')
                            ->where('listmatches.matchkey', $jointeam[0]->matchkey)
                            ->select('listmatches.*', 't1.short_name as teamdata1_short_name', 't2.short_name as teamdata2_short_name')
                            ->first();

                        $Json['players'][$j]['id'] = $bowler->playerid;
                        $Json['players'][$j]['name'] = $bowler->matchplayers_playerid_player_name;
                        $Json['players'][$j]['role'] = $bowler->role;
                        $Json['players'][$j]['credit'] = $bowler->credit;
                        $Json['players'][$j]['points'] = $bowler->points;
                        $Json['players'][$j]['ppoints'] = $bowler->points;
                        $Json['players'][$j]['playingstatus'] = $bowler->playingstatus;
                        if (!empty($findmatch)) {
                            if ($bowler->matchplayers_playerid_team == $findmatch->team1) {
                                $Json['players'][$j]['team'] = 'team1';
                                $Json['players'][$j]['teamname'] = $findmatch->teamdata1_short_name;
                            } else {
                                $Json['players'][$j]['team'] = 'team2';
                                $Json['players'][$j]['teamname'] = $findmatch->teamdata2_short_name;
                            }
                        } else {
                            $Json['players'][$j]['team'] = '';
                            $Json['players'][$j]['teamname'] = '';
                        }
                        $captain = 0;
                        if ($team->captain == $bowler->playerid) {
                            $captain = 1;
                        }
                        $Json['players'][$j]['captain'] = $captain;
                        $vcaptain = 0;
                        if ($team->vicecaptain == $bowler->playerid) {
                            $vcaptain = 1;
                        }
                        $Json['players'][$j]['vicecaptain'] = $vcaptain;
                        if ($bowler->matchplayers_playerid_image != "") {
                            if (strpos($bowler->matchplayers_playerid_image, 'https') === 0) {
                                $Json['players'][$j]['image'] = $bowler->matchplayers_playerid_image;
                            } else {
                                $Json['players'][$j]['image'] = asset('public/' . $bowler->matchplayers_playerid_image);
                            }
                        } else {
                            $Json['players'][$j]['image'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                        }
                        $j++;
                    }
                } else {
                    return $this->sendError('Invalid Team', $Json, 201);
                }
            }
        } else {
            return $this->sendError('Invalid Team', $Json, 201);
        }
        $Json['sport_category']['max_players'] = 11;
        $Json['sport_category']['max_credits'] = 100;
        $Json['sport_category']['min_players_per_team'] = 4;
        $Json['sport_category']['player_positions'][0]['name'] = 'WK';
        $Json['sport_category']['player_positions'][0]['code'] = 'keeper';
        $Json['sport_category']['player_positions'][0]['fullname'] = 'Keeper';
        $Json['sport_category']['player_positions'][0]['min_players_per_team'] = 1;
        $Json['sport_category']['player_positions'][0]['max_players_per_team'] = 4;

        $Json['sport_category']['player_positions'][1]['name'] = 'BAT';
        $Json['sport_category']['player_positions'][1]['code'] = 'batsman';
        $Json['sport_category']['player_positions'][1]['fullname'] = 'Batsman';
        $Json['sport_category']['player_positions'][1]['min_players_per_team'] = 3;
        $Json['sport_category']['player_positions'][1]['max_players_per_team'] = 6;

        $Json['sport_category']['player_positions'][2]['name'] = 'ALL';
        $Json['sport_category']['player_positions'][2]['code'] = 'allrounder';
        $Json['sport_category']['player_positions'][2]['fullname'] = 'All Rounder';
        $Json['sport_category']['player_positions'][2]['min_players_per_team'] = 1;
        $Json['sport_category']['player_positions'][2]['max_players_per_team'] = 4;

        $Json['sport_category']['player_positions'][3]['name'] = 'BWL';
        $Json['sport_category']['player_positions'][3]['code'] = 'bowler';
        $Json['sport_category']['player_positions'][3]['fullname'] = 'Bowler';
        $Json['sport_category']['player_positions'][3]['min_players_per_team'] = 3;
        $Json['sport_category']['player_positions'][3]['max_players_per_team'] = 6;

        return $this->sendResponse($Json, 'Challenge Opened.');
    }

    public function switchTeams(Request $request)
    {
        if ($request->isMethod('post')) {
            $Json = [];
            $teamid = array();
            $joinid = array();
            $matchkey = $data['matchkey'] = $request->matchkey;
            $teamid = explode(',', $request->teamid);
            $joinid = explode(',', $request->joinid);
            $challenge_id = $data['challengeid'] = $request->challengeid;
            $findmatchdetails =  DB::table('listmatches')->where('matchkey', $matchkey)->select('start_date')->first();
            if (!empty($findmatchdetails)) {
                $getcurrentdate = date('Y-m-d H:i:s');
                if ($getcurrentdate >= $findmatchdetails->start_date) {
                    return $this->sendError('Match Closed', $Json, 201);
                }
            }
            $findchallenge =  DB::table('matchchallenges')->where('id', $challenge_id)->first();
            if (!empty($findchallenge)) {
                $i = 0;
                foreach ($teamid as $teamvalue) {
                    $leaugeexist = DB::table('joinedleauges')->where('challengeid', $challenge_id)->where('id', '=', $joinid[$i])->first();
                    if (empty($leaugeexist)) {
                        return $this->sendError('Leauge Not Exist', $Json, 201);
                    }
                    $data['teamid'] = $teamvalue;
                    DB::table('joinedleauges')->where('challengeid', $challenge_id)->where('id', '=', $joinid[$i])->update($data);
                    $i++;
                }
            } else {
                return $this->sendError('Challenge Not Exist', $Json, 201);
            }
            return $this->sendResponse($Json, 'Team Updated.');
        }
    }

    public function challengeJoinedUser(Request $request)
    {
        $Json = [];
        $challengeid = $request->challengeid;
        $limit = $request->input('limit', 10);
        $offset = $request->input('offset', 0);
        $getdata =  DB::table('joinedleauges')
            ->join('jointeam', 'jointeam.id', '=', 'joinedleauges.teamid')
            ->where('joinedleauges.challengeid', $challengeid)
            ->select('jointeam.userid', 'jointeam.id as teamid', 'jointeam.teamnumber', 'joinedleauges.id as joinid')
            ->skip($offset)
            ->take($limit)
            ->get();
        $Json['teams'] = [];
        if (!empty($getdata)) {
            if (!empty($getdata)) {
                $i = 0;
                foreach ($getdata as $val) {
                    $userdata = DB::table('users')->where('id', $val->userid)->first();
                    if (!empty($userdata)) {
                        if ($userdata->id == Auth::user()->id) {
                            $Json['teams'][$i]['userid'] = Auth::user()->id;
                            $Json['teams'][$i]['team'] = $userdata->team;
                            $Json['teams'][$i]['image'] = (!empty($userdata->image)) ? $userdata->image : asset('public/settings/' . SettingsTrait::settings('user_image'));
                            $Json['teams'][$i]['userno'] = -1;
                        } else {
                            $Json['teams'][$i]['userid'] = $userdata->id;
                            $Json['teams'][$i]['team'] = $userdata->team;
                            $Json['teams'][$i]['image'] = (!empty($userdata->image)) ? $userdata->image : asset('public/settings/' . SettingsTrait::settings('user_image'));
                            $Json['teams'][$i]['userno'] = 0;
                        }
                        $Json['teams'][$i]['teamnumber'] = $val->teamnumber;
                        $Json['teams'][$i]['teamid'] = $val->teamid;
                        $Json['teams'][$i]['joinid'] = $val->joinid;
                        $i++;
                    }
                }
                $Json['totalteams'] = DB::table('joinedleauges')
                    ->where('joinedleauges.challengeid', $challengeid)
                    ->count();
            }
            array_multisort(array_column($Json['teams'], 'userno'), SORT_ASC, $Json['teams']);
        } else {
            return $this->sendError('Challenge Not Exist', $Json, 201);
        }
        return $this->sendResponse($Json, 'Challenge Joined Users.');
    }

    public function playerInfo(Request $request)
    {
        $Json = [];
        $playerid = $request->get('playerid');
        $matchkey = $request->get('matchkey');
        $findseries = DB::table('listmatches')->where('matchkey', $matchkey)->select('series')->first();
        $findplayerdetails = DB::table('matchplayers')
            ->join('players', 'players.id', 'matchplayers.playerid')
            ->join('teams', 'teams.id', 'players.team')
            ->where('matchplayers.matchkey', $matchkey)
            ->where('matchplayers.playerid', $playerid)
            ->select(
                'matchplayers.*',
                'players.id as matchplayers_playerid_id',
                'players.team as matchplayers_playerid_team',
                'players.player_name as matchplayers_playerid_player_name',
                'players.players_key as matchplayers_playerid_players_key',
                'players.image as matchplayers_playerid_image',
                'players.battingstyle as matchplayers_playerid_battingstyle',
                'players.bowlingstyle as matchplayers_playerid_bowlingstyle',
                'players.battingstyle as matchplayers_playerid_battingstyle',
                'players.country as matchplayers_playerid_country',
                'players.dob as matchplayers_playerid_dob',
                'teams.short_name as matchplayers_playerid_players_team_short_name'
            )
            ->first();
        if (!empty($findplayerdetails)) {
            $findallplayers = DB::table('matchplayers')
                ->join('listmatches', 'listmatches.matchkey', '=', 'matchplayers.matchkey')->where('playerid', $findplayerdetails->playerid)
                ->where('listmatches.series', $findseries->series)
                ->select(DB::raw("SUM(points) as totalpoints"))
                ->get();
            if (!empty($findallplayers[0]->totalpoints)) {
                $Json['playerpoints'] = $findallplayers[0]->totalpoints;
            } else {
                $Json['playerpoints'] = 0;
            }
            if (!empty($findplayerdetails)) {
                $Json['playername'] = $findplayerdetails->matchplayers_playerid_player_name;
                $Json['playerkey'] = $findplayerdetails->matchplayers_playerid_players_key;
                $Json['playercredit'] = $findplayerdetails->credit;
                if (!empty($findplayerdetails->matchplayers_playerid_battingstyle)) {
                    $Json['battingstat'] = $findplayerdetails->matchplayers_playerid_battingstyle;
                } else {
                    $Json['battingstat'] = '';
                }
                if (!empty($findplayerdetails->matchplayers_playerid_bowlingstyle)) {
                    $Json['bowlerstat'] = $findplayerdetails->matchplayers_playerid_bowlingstyle;
                } else {
                    $Json['bowlerstat'] = '';
                }
                if (!empty($findplayerdetails->matchplayers_playerid_country)) {
                    $Json['playercountry'] = $findplayerdetails->matchplayers_playerid_country;
                } else {
                    $Json['playercountry'] = '';
                }
                if (!empty($findplayerdetails->matchplayers_playerid_dob)) {
                    $Json['playerdob'] = $findplayerdetails->matchplayers_playerid_dob;
                } else {
                    $Json['playerdob'] = '';
                }
                $Json['team'] = $findplayerdetails->matchplayers_playerid_players_team_short_name;
                if ($findplayerdetails->matchplayers_playerid_image != "") {
                    if (strpos($findplayerdetails->matchplayers_playerid_image, 'https') === 0) {
                        $Json['playerimage'] = $findplayerdetails->matchplayers_playerid_image;
                    } else {
                        $Json['playerimage'] = asset('public/' . $findplayerdetails->matchplayers_playerid_image);
                    }
                } else {
                    $Json['playerimage'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                }
                if ($findplayerdetails->role == 'allrounder') {
                    $Json['playerrole'] = 'All Rounder';
                } else if ($findplayerdetails->role == 'keeper') {
                    $Json['playerrole'] = 'Wicket Keeper';
                } else {
                    $Json['playerrole'] = ucwords($findplayerdetails->role);
                }
                $findallmatches = DB::table('listmatches')->join('matchplayers', 'matchplayers.matchkey', '=', 'listmatches.matchkey')->where('matchplayers.playerid', $playerid)->join('players', 'players.id', '=', 'matchplayers.playerid')->where('listmatches.series', $findseries->series)->select('listmatches.name as name', 'listmatches.matchkey', 'listmatches.start_date', 'matchplayers.playerid as player_id', 'listmatches.team1 as team1', 'listmatches.team2 as team2')->get();
                $aa = $findallmatches->toArray();

                $i = 0;
                $totalpoints = 0;
                if (!empty($aa)) {
                    foreach ($findallmatches as $player) {
                        $ttlpoint = DB::table('result_points')->where('playerid', $player->player_id)->where('matchkey', $player->matchkey)->first();
                        if (!empty($ttlpoint)) {
                            $totalpoints = $ttlpoint->total;
                        } else {
                            $totalpoints = 0;
                        }
                        $team1data = DB::table('teams')->where('id', $player->team1)->select('short_name')->first();
                        $team2data = DB::table('teams')->where('id', $player->team2)->select('short_name')->first();
                        if ((!empty($team1data)) && (!empty($team2data))) {
                            $Json['matches'][$i]['shortname'] = $team1data->short_name . ' vs ' . $team2data->short_name;
                        }
                        $Json['matches'][$i]['matchname'] = $player->name;
                        $Json['matches'][$i]['matchdate'] = date('d M, Y', strtotime($player->start_date));
                        $Json['matches'][$i]['total_points'] = $totalpoints;
                        $finduselectthisplayer = DB::table('jointeam')->where('matchkey', $player->matchkey)->select('players')->get();

                        $countlenght = count($finduselectthisplayer);
                        $allplayers = array();
                        $countplayer = 0;
                        $a = $finduselectthisplayer->toArray();
                        if (!empty($a)) {
                            foreach ($finduselectthisplayer as $pp) {
                                $fplayers = array();
                                $fplayers = explode(',', $pp->players);
                                foreach ($fplayers as $fpl) {
                                    $allplayers[] = $fpl;
                                }
                            }
                        }

                        if (!empty($allplayers)) {
                            foreach ($allplayers as $pl) {
                                if ($pl == $player->player_id) {
                                    $countplayer++;
                                }
                            }
                        }
                        if ($countplayer > 0) {
                            $countper = round(($countplayer / $countlenght) * 100, 2);
                        } else {
                            $countper = 0;
                        }
                        $Json['matches'][$i]['selectper'] = $countper . '%';
                        $i++;
                    }
                } else {
                    $Json['matches'] = [];
                }
            }
        } else {
            return $this->sendError('Player Not Exist', $Json, 201);
        }
        return $this->sendResponse($Json, 'Player Info.');
    }

    public function joinedMatches(Request $request)
    {
        $currenttimme = date('Y-m-d H:i:s');
        $lastdays = date('Y-m-d H:i:s', strtotime('+15days', strtotime($currenttimme)));
        $fantasy_type = $request->fantasy_type;
        $Json = [];
        $findmatches = DB::table('joinedleauges')->join('listmatches', 'listmatches.id', '=', 'joinedleauges.matchkey')->join('series', 'listmatches.series', '=', 'series.id')
            ->join('teams as team1', 'team1.id', '=', 'listmatches.team1')
            ->join('teams as team2', 'team2.id', '=', 'listmatches.team2')
            ->where('joinedleauges.fantasy_type', $fantasy_type)
            ->where('listmatches.final_status', '!=', 'IsCanceled')
            ->where('listmatches.final_status', '!=', 'IsAbandoned')
            ->where('listmatches.launch_status', 'launched')
            ->select('listmatches.id as listmatchid', 'team1.short_name as teamname1', 'team2.short_name as teamname2', 'team1.team as team1fullname', 'team2.team as team2fullname', 'team1.color as team1color', 'team2.color as team2color', 'team1.logo as team1logo', 'team2.logo as team2logo', 'listmatches.series as seriesid', 'series.name as seriesname', 'listmatches.name', 'listmatches.start_date', 'listmatches.format', 'listmatches.matchkey', 'listmatches.final_status', 'listmatches.launch_status', 'listmatches.playing11_status', 'listmatches.fantasy_type', 'listmatches.second_inning_status', 'listmatches.real_matchkey', 'listmatches.tosswinner_team', 'listmatches.toss_decision', 'listmatches.match_notification')
            ->orderBY('listmatches.start_date', 'DESC')
            ->groupBy(
                'listmatches.id',
                'team1.short_name',
                'team2.short_name',
                'team1.team',
                'team2.team',
                'team1.color',
                'team2.color',
                'team1.logo',
                'team2.logo',
                'listmatches.series',
                'series.name',
                'listmatches.name',
                'listmatches.start_date',
                'listmatches.format',
                'listmatches.matchkey',
                'listmatches.final_status',
                'listmatches.launch_status',
                'listmatches.playing11_status',
                'listmatches.fantasy_type',
                'listmatches.second_inning_status',
                'listmatches.real_matchkey',
                'listmatches.tosswinner_team',
                'listmatches.toss_decision',
                'listmatches.match_notification'
            )
            ->get();
        if (!empty($findmatches->toArray())) {
            $i = 0;
            foreach ($findmatches as $match) {
                $totalcontest = DB::table('joinedleauges')
                    ->where('matchkey', $match->matchkey)
                    ->where('userid', Auth::user()->id)
                    ->groupBy('challengeid')
                    ->count();
                if ($totalcontest != 0) {
                    if ($currenttimme < date('Y-m-d H:i:s', strtotime($match->start_date))) {
                        $dtime = "upcoming";
                    } else if ($match->final_status != 'winnerdeclared') {
                        $dtime = "live";
                    } else {
                        $dtime = "completed";
                    }
                    $Json[$i]['joinedmatchstatus'] = $dtime;
                    $Json[$i]['id'] = $match->listmatchid;
                    $Json[$i]['name'] = $match->name;
                    $Json[$i]['format'] = $match->format;
                    $Json[$i]['series'] = $match->seriesid;
                    $Json[$i]['seriesname'] = $match->seriesname;
                    $Json[$i]['team1name'] = strtoupper($match->teamname1);
                    $Json[$i]['team2name'] = strtoupper($match->teamname2);
                    $Json[$i]['team1fullname'] = strtoupper($match->team1fullname);
                    $Json[$i]['team2fullname'] = strtoupper($match->team2fullname);
                    $Json[$i]['matchkey'] = $match->matchkey;
                    if (!empty($match->tosswinner_team)) {
                        $tossteamname = DB::table('teams')->where('team_key', $match->tosswinner_team)->first();
                    }
                    $Json[$i]['tosswinner_team'] = isset($tossteamname) ? strtoupper($tossteamname->short_name) : strtoupper(NULL);
                    if ($match->toss_decision == 1) {
                        $Json[$i]['toss_decision'] = 'BAT';
                    } elseif ($match->toss_decision == 2) {
                        $Json[$i]['toss_decision'] = 'BOWL';
                    } else {
                        $Json[$i]['toss_decision'] = 'TOSS PENDING';
                    }

                    $Json[$i]['fantasy_type'] = $match->fantasy_type;
                    $Json[$i]['winnerstatus'] = $match->final_status;
                    $Json[$i]['playing11_status'] = $match->playing11_status;
                    if (!empty($match->team1color)) {
                        $Json[$i]['team1color'] = $match->team1color;
                    } else {
                        $Json[$i]['team1color'] = '#ffffff';
                    }
                    if (!empty($match->team2color)) {
                        $Json[$i]['team2color'] = $match->team2color;
                    } else {
                        $Json[$i]['team2color'] = '#ffffff';
                    }

                    if ($match->team1logo != "") {
                        if (strpos($match->team1logo, 'https') === 0) {
                            $Json[$i]['team1logo'] = $match->team1logo;
                        } else {
                            $Json[$i]['team1logo'] = asset('public/' . $match->team1logo);
                        }
                    } else {
                        $Json[$i]['team1logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                    }
                    if ($match->team2logo != "") {
                        if (strpos($match->team2logo, 'https') === 0) {
                            $Json[$i]['team2logo'] = $match->team2logo;
                        } else {
                            $Json[$i]['team2logo'] = asset('public/' . $match->team2logo);
                        }
                    } else {
                        $Json[$i]['team2logo'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                    }

                    $Json[$i]['time_start'] = date('Y-m-d H:i:s', strtotime($match->start_date));
                    $Json[$i]['launch_status'] = $match->launch_status;

                    $findjointeam = DB::table('jointeam')->where('userid', Auth::user()->id)->where('matchkey', $match->matchkey)->orderBY('id', 'DESC')->get();
                    if (!empty($findjointeam->toArray())) {
                        $Json[$i]['createteamnumber'] = $findjointeam[0]->teamnumber + 1;
                    } else {
                        $Json[$i]['createteamnumber'] = 1;
                    }

                    $Json[$i]['totalTeams'] = DB::table('jointeam')
                        ->where('matchkey', $match->matchkey)
                        ->where('userid', Auth::user()->id)->count();

                    $Json[$i]['totalcontest'] = $totalcontest;

                    $maximum_winning_amount = DB::table('matchchallenges')
                        ->where('matchkey', $match->matchkey)
                        ->orderBy('win_amount', 'DESC')
                        ->value('win_amount');
                    $Json[$i]['maximum_winning_amount'] = $maximum_winning_amount;
                    $ch = DB::table('matchchallenges')->where('matchkey', $match->matchkey)->first([DB::raw('SUM(maximum_user)as max_users'), DB::raw('SUM(joinedusers)as joinedusers')]);
                    $Json[$i]['max_users'] = $ch->max_users;
                    $Json[$i]['total_joined'] = $ch->joinedusers;
                    $matchchallengeav = DB::table('matchchallenges')->where('matchkey', $match->matchkey)->count();
                    if ($matchchallengeav != 0) {
                        $Json[$i]['matchopenstatus'] = true;
                    } else {
                        $Json[$i]['matchopenstatus'] = false;
                    }

                    $i++;
                }
            }
        }

        return $this->sendResponse($Json, 'Upcoming Matches.');
    }

    public function joinedLiveContest(Request $request)
    {
        $matchkey = $request->matchkey;
        $i = 0;
        $Json = [];
        $query = DB::table('matchchallenges');
        if ($matchkey != "") {
            $query = $query->join('joinedleauges', 'joinedleauges.challengeid', '=', 'matchchallenges.id')->where('matchchallenges.matchkey', $matchkey)->where('joinedleauges.userid', Auth::user()->id)->where('matchchallenges.status', '!=', 'canceled')->select('matchchallenges.*');
        }
        $allchallenges = $query->get();
        $a = $allchallenges->toArray();
        if (!empty($a)) {
            foreach ($allchallenges as $challenege) {
                $rankm = DB::table('joinedleauges')->where('joinedleauges.challengeid', $challenege->id)->join('jointeam', 'jointeam.id', '=', 'joinedleauges.teamid')->select('joinedleauges.id as jid', 'joinedleauges.teamid', 'joinedleauges.refercode as jrefercode', 'jointeam.points', 'jointeam.teamnumber', 'joinedleauges.userid')->orderBy('jointeam.points', 'DESC')->get();
                $currentRank = 1;
                $j = 0;
                $data = [];
                foreach ($rankm as $ran) {
                    if ($ran->userid == Auth::user()->id) {
                        if ($j > 0 && $ran->points == $rankm[$j - 1]->points) {
                            $data[$j]['rank'] = $data[$j - 1]['rank'];
                            $Json[$i]['rank'] = $data[$j]['rank'];
                            $Json[$i]['points'] = $ran->points;
                            $Json[$i]['joinid'] = $ran->jid;
                            $Json[$i]['teamid'] = $ran->teamid;
                            $Json[$i]['teamnumber'] = $ran->teamnumber;
                            $Json[$i]['refercode'] = $ran->jrefercode;;
                        } else {
                            $data[$j]['rank'] = $currentRank;
                            $Json[$i]['rank'] = $currentRank;
                            $Json[$i]['points'] = $ran->points;
                            $Json[$i]['joinid'] = $ran->jid;
                            $Json[$i]['teamid'] = $ran->teamid;
                            $Json[$i]['teamnumber'] = $ran->teamnumber;
                            $Json[$i]['refercode'] = $ran->jrefercode;;
                        }
                    }
                    $currentRank++;
                    $j++;
                }
                $Json[$i]['id'] = $challenege->id;
                $Json[$i]['name'] = 'Win Rs.' . $challenege->win_amount;
                $Json[$i]['entryfee'] = $challenege->entryfee;
                $Json[$i]['type'] = 'contest';
                $Json[$i]['contest_type'] = $challenege->contest_type;
                $Json[$i]['winning_percentage'] = $challenege->winning_percentage;
                $Json[$i]['win_amount'] = $challenege->win_amount;
                $Json[$i]['matchkey'] = $challenege->matchkey;
                $Json[$i]['status'] = 1;
                $Json[$i]['joinedusers'] = $challenege->joinedusers;
                if ($challenege->contest_type == 'Amount') {
                    if ($challenege->maximum_user > 0) {
                        $getjoinedpercentage = round(($challenege->joinedusers / $challenege->maximum_user) * 100, 2);
                    }
                    $Json[$i]['maximum_user'] = $challenege->maximum_user;
                } else {
                    $getjoinedpercentage = 100;
                    $Json[$i]['maximum_user'] = 0;
                }
                $Json[$i]['bonus_type'] = ($challenege->bonus_percentage == '0') ? "Amount" : "Percentage";
                $Json[$i]['getjoinedpercentage'] = $getjoinedpercentage . '%';
                $Json[$i]['multi_entry'] = $challenege->multi_entry;
                $Json[$i]['team_limit'] = $challenege->team_limit;
                $Json[$i]['confirmed_challenge'] = $challenege->confirmed_challenge;
                $Json[$i]['is_running'] = $challenege->is_running;
                $Json[$i]['is_bonus'] = $challenege->is_bonus;
                $Json[$i]['bonus_percentage'] = $challenege->bonus_percentage;
                $Json[$i]['pricecard_type'] = $challenege->pricecard_type;

                $winnerdata = DB::table('finalresults')->where('userid', Auth::user()->id)->where('challengeid', $challenege->id)->sum('amount');

                if (!empty($winnerdata)) {
                    $Json[$i]['winningamount'] = $winnerdata;
                } else {
                    $Json[$i]['winningamount'] = 0;
                }
                $findexistornot = DB::table('joinedleauges')->where('userid', Auth::user()->id)->where('challengeid', $challenege->id)->where('matchkey', $matchkey)->select('teamid')->get();
                $userteamscount = count($findexistornot);
                if ($userteamscount >= $challenege->team_limit) {
                    $Json[$i]['isselected'] = true;
                } else {
                    $Json[$i]['isselected'] = false;
                }
                $Json[$i]['isselectedid'] = "";

                $query1 = DB::table('matchpricecards');
                $query1 = $query1->where('matchkey', $challenege->matchkey)->where('challenge_id', $challenege->id);
                $allpricecard = $query1->orderBY('min_position', 'ASC')->get();
                $aaa = $allpricecard->toArray();
                $j = 0;
                $winners = 0;
                if (!empty($aaa)) {
                    foreach ($allpricecard as $prc) {
                        if ($prc->price == 0) {
                            $ttlprice = $prc->total / $prc->winners;
                            $Json[$i]['price_card'][$j]['price'] = $ttlprice;
                            $Json[$i]['price_card'][$j]['price_percent'] = $prc->price_percent . '%';
                        } else {
                            $Json[$i]['price_card'][$j]['price'] = $prc->price;
                        }
                        $Json[$i]['price_card'][$j]['winners'] = $prc->winners;
                        $winners += $prc->winners;
                        if ($prc->min_position + 1 != $prc->max_position) {
                            $Json[$i]['price_card'][$j]['start_position'] = $prc->min_position + 1 . '-' . $prc->max_position;
                        } else {
                            $Json[$i]['price_card'][$j]['start_position'] = '' . $prc->max_position;
                        }
                        $Json[$i]['totalwinners'] = $winners;
                        $j++;
                    }
                } else {
                    $Json[$i]['totalwinners'] = 1;
                    $Json[$i]['price_card'][$j]['start_position'] = 1;
                    $Json[$i]['price_card'][$j]['price'] = $challenege->win_amount;
                }
                $i++;
            }
        }
        $Json = array_values($Json);
        return $this->sendResponse($Json, 'Joined Contests.');
    }

    public function playerStats(Request $request)
    {
        $Json = [];
        $getmatchkey = $request->get('matchkey');
        $matchplayers = DB::table('matchplayers')->where('matchkey', $getmatchkey)->join('players', 'players.id', '=', 'matchplayers.playerid')->leftjoin('teams', 'teams.id', '=', 'players.team')->select('players.player_name as playername', 'matchplayers.playerid', 'matchplayers.credit', 'players.image as playerimage', 'players.id as plid', 'players.role as prole', 'teams.team as teamname', 'teams.short_name', 'matchplayers.selection_per', 'matchplayers.captainselected', 'matchplayers.vcaptainselected')->get();
        $findmatchname = DB::table('listmatches')->where('matchkey', $getmatchkey)->select('name')->first();
        if (!empty($findmatchname)) {
            if (!empty($matchplayers)) {
                $i = 0;
                foreach ($matchplayers as $player) {
                    $findresult_points = DB::table('result_points')
                        ->leftjoin('result_matches', 'result_matches.id', '=', 'result_points.resultmatch_id')
                        ->leftjoin('listmatches', 'listmatches.matchkey', '=', 'result_points.matchkey')
                        ->where('result_points.playerid', $player->playerid)
                        ->where('result_points.matchkey', $getmatchkey)
                        ->where('result_matches.starting11', 1)
                        ->select(
                            'result_points.matchkey',
                            'result_matches.starting11',
                            'result_points.startingpoints',
                            'listmatches.name',
                            'result_matches.innings',
                            'result_matches.batting',
                            'result_matches.bowling',
                            'result_matches.duck',
                            DB::raw('sum(result_points.fours) as totalfours'),
                            DB::raw('sum(result_points.sixs) as totalsixs'),
                            DB::raw('sum(result_points.runs) as totalruns'),
                            DB::raw('sum(result_points.strike_rate) as totalstrike_rate'),
                            DB::raw('sum(result_points.century) as totalcentury'),
                            DB::raw('sum(result_points.halfcentury) as totalhalfcentury'),
                            DB::raw('sum(result_points.thirtypoints) as totalthirtypoints'),
                            DB::raw('sum(result_points.wicketbonuspoint) as totalwicketbonuspoint'),
                            DB::raw('sum(result_points.wickets) as totalwickets'),
                            DB::raw('sum(result_points.maidens) as totalmaidens'),
                            DB::raw('sum(result_points.economy_rate) as totaleconomy_rate'),
                            DB::raw('sum(result_points.runouts) as totalrunouts'),
                            DB::raw('sum(result_points.catch) as totalcatch'),
                            DB::raw('sum(result_points.stumping) as totalstumping'),
                            DB::raw('sum(result_points.thrower) as totalthrower'),
                            DB::raw('sum(result_points.hitter) as totalhitter'),
                            DB::raw('sum(result_points.bonus) as totalbonus'),
                            DB::raw('sum(result_points.negative) as totalnegative'),
                            DB::raw('sum(result_points.total) as totaltotal')
                        )
                        ->groupBy(
                            'result_points.matchkey',
                            'result_matches.starting11',
                            'result_points.startingpoints',
                            'listmatches.name',
                            'result_matches.innings',
                            'result_matches.batting',
                            'result_matches.bowling',
                            'result_matches.duck'
                        )
                        ->orderBy('result_matches.innings', 'ASC')
                        ->orderBy('totaltotal', 'DESC')
                        ->first();
                    if (!empty($findresult_points->starting11) && $findresult_points->starting11 == 1) {
                        $Json[$i]['credit'] = $player->credit;
                        $Json[$i]['playerid'] = $player->playerid;
                        $Json[$i]['role'] = $player->prole;
                        $Json[$i]['selectper'] =  $player->selection_per . '%';
                        $Json[$i]['player_name'] = $player->playername;
                        if ($player->playerimage != "") {
                            if (strpos($player->playerimage, 'https') === 0) {
                                $Json[$i]['playerimage'] = $player->playerimage;
                            } else {
                                $Json[$i]['playerimage'] = asset('public/' . $player->playerimage);
                            }
                        } else {
                            $Json[$i]['playerimage'] = asset('public/settings/' . SettingsTrait::settings('player_image'));;
                        }
                        $Json[$i]['duck'] = $findresult_points->duck;
                        $Json[$i]['startingpoints'] = $findresult_points->startingpoints;
                        $Json[$i]['runs'] = $findresult_points->totalruns;
                        $Json[$i]['fours'] = $findresult_points->totalfours;
                        $Json[$i]['sixs'] = $findresult_points->totalsixs;
                        $Json[$i]['strike_rate'] = $findresult_points->totalstrike_rate;
                        $Json[$i]['thirtypoints'] = $findresult_points->totalthirtypoints;
                        $Json[$i]['halfcentury'] = $findresult_points->totalhalfcentury;
                        $Json[$i]['century'] = $findresult_points->totalcentury;
                        $Json[$i]['wickets'] = $findresult_points->totalwickets;
                        $Json[$i]['lbw_bowled'] = $findresult_points->totalwicketbonuspoint;
                        $Json[$i]['maidens'] = $findresult_points->totalmaidens;
                        $Json[$i]['economy_rate'] = $findresult_points->totaleconomy_rate;
                        $Json[$i]['catch_points'] = $findresult_points->totalcatch;
                        $Json[$i]['stumping'] = $findresult_points->totalstumping;
                        $Json[$i]['thrower'] = $findresult_points->totalthrower;
                        $Json[$i]['runout'] = $findresult_points->totalthrower + $findresult_points->totalhitter;
                        $Json[$i]['hitter'] = $findresult_points->totalhitter;
                        $Json[$i]['bonus'] = $findresult_points->totalbonus;
                        $Json[$i]['negative'] = $findresult_points->totalnegative;
                        $Json[$i]['total'] = $findresult_points->totaltotal;
                        $Json[$i]['captain_selection_percentage'] = $player->captainselected;
                        $Json[$i]['total_selected_vice_captain'] = $player->vcaptainselected;
                        $i++;
                    }
                }
            } else {
                return $this->sendError('Data Not Exist', $Json, 201);
            }
        } else {
            return $this->sendError('Player Not Exist', $Json, 201);
        }
        return $this->sendResponse($Json, 'Player Info.');
    }

    public function challengeLeaderboard(Request $request)
    {
        $Json = [];
        $challengeid = $request->challengeid;
        $limit = $request->input('limit', 10);
        $offset = $request->input('offset', 0);
        $getdata =  DB::table('joinedleauges')
            ->join('jointeam', 'jointeam.id', '=', 'joinedleauges.teamid')
            ->where('joinedleauges.challengeid', $challengeid)
            ->select('jointeam.userid', 'jointeam.id as teamid', 'jointeam.teamnumber', 'joinedleauges.id as joinid', 'jointeam.points')
            ->orderBy('jointeam.points', 'DESC')
            ->skip($offset)
            ->take($limit)
            ->get();
        $Json['teams'] = [];
        $currentRank = 1 + $offset; // Adjust the starting rank based on offset

        if (!empty($getdata)) {
            $previousPoints = null;
            $i = 0;

            foreach ($getdata as $val) {
                $userdata = DB::table('users')->where('id', $val->userid)->first();

                if (!empty($userdata)) {
                    $Json['teams'][$i]['userid'] = $userdata->id;
                    $Json['teams'][$i]['team'] = $userdata->team;
                    $Json['teams'][$i]['image'] = (!empty($userdata->image)) ? $userdata->image : asset('public/settings/' . SettingsTrait::settings('user_image'));
                    $Json['teams'][$i]['teamnumber'] = $val->teamnumber;
                    $Json['teams'][$i]['teamid'] = $val->teamid;
                    $Json['teams'][$i]['joinid'] = $val->joinid;
                    $Json['teams'][$i]['points'] = $val->points;
                    $winnerdata = DB::table('finalresults')->where('userid', $val->userid)->where('joinedid', $val->joinid)->where('challengeid', $challengeid)->first();

                    if (!empty($winnerdata)) {
                        $Json['teams'][$i]['winningamount'] = $winnerdata->amount;
                    } else {
                        $Json['teams'][$i]['winningamount'] = 0;
                    }
                    // Check if points are the same as the previous team
                    if ($previousPoints !== null && $val->points == $previousPoints) {
                        $Json['teams'][$i]['rank'] = $Json['teams'][$i - 1]['rank'];
                    } else {
                        $Json['teams'][$i]['rank'] = $currentRank;
                    }
                    // Update the previousPoints
                    $previousPoints = $val->points;

                    // Increment the currentRank
                    $currentRank++;
                    $i++;
                }
            }

            $Json['totalteams'] = DB::table('joinedleauges')
                ->where('joinedleauges.challengeid', $challengeid)
                ->count();
        } else {
            return $this->sendError('Challenge Not Exist', $Json, 201);
        }
        usort($Json['teams'], function ($a, $b) {
            return $a['rank'] - $b['rank'];
        });

        return $this->sendResponse($Json, 'Challenge Leaderboard Users.');
    }

    public function seriesLeaderboard(Request $request)
    {
        $Json = [];
        $limit = $request->input('limit', 10);
        $offset = $request->input('offset', 0);
        $getdata = DB::table('listmatches')
            ->join('series', 'series.id', '=', 'listmatches.series')
            ->where('listmatches.series', $request->series)
            // ->where('series.end_date', '>=', date('Y-m-d H:i:s'))
            ->where('listmatches.launch_status', '=', 'launched')
            // ->where('listmatches.final_status', '=', 'winnerdeclared')
            ->join('jointeam', 'jointeam.matchkey', '=', 'listmatches.matchkey')
            ->join('users', 'users.id', '=', 'jointeam.userid')
            ->select(
                'listmatches.final_status',
                'jointeam.userid',
                'listmatches.series',
                DB::raw('sum(points) as totalpoints'),
                'users.id as rid',
                'users.team as rteam',
                'users.image as rimage'
            )
            ->groupBy('jointeam.userid', 'listmatches.final_status', 'listmatches.series')
            ->orderByDesc('totalpoints')
            ->skip($offset)
            ->take($limit)
            ->get();
        $Json['teams'] = [];
        $currentRank = 1 + $offset; // Adjust the starting rank based on offset

        if (!empty($getdata)) {
            $previousPoints = null;
            $i = 0;

            foreach ($getdata as $val) {

                $Json['teams'][$i]['userid'] = $val->userid;
                $Json['teams'][$i]['team'] = $val->rteam;
                $Json['teams'][$i]['image'] = (!empty($val->rimage)) ? $val->rimage : asset('public/settings/' . SettingsTrait::settings('user_image'));
                $Json['teams'][$i]['points'] = $val->totalpoints;

                // Check if points are the same as the previous team
                if ($previousPoints !== null && $val->totalpoints == $previousPoints) {
                    $Json['teams'][$i]['rank'] = $Json['teams'][$i - 1]['rank'];
                } else {
                    $Json['teams'][$i]['rank'] = $currentRank;
                }

                // Update the previousPoints
                $previousPoints = $val->totalpoints;

                // Increment the currentRank
                $currentRank++;
                $i++;
            }
        } else {
            return $this->sendError('Series Not Exist', $Json, 201);
        }
        usort($Json['teams'], function ($a, $b) {
            return $a['rank'] - $b['rank'];
        });

        return $this->sendResponse($Json, 'Series Leaderboard Users.');
    }

    public function getAllSeries(Request $request)
    {
        $currenttimme = date('Y-m-d H:i:s');
        $end_date = date('Y-m-d H:i:s', strtotime('-2days', strtotime($currenttimme)));
        $fantasy_type = $request->fantasy_type;
        $findseries = DB::table('series')->where('fantasy_type', $fantasy_type)->where('end_date', '>=', $end_date)->get();
        if (!empty($findseries->toArray())) {
            $i = 0;
            foreach ($findseries as $series) {
                $Json[$i]['id'] = $series->id;
                $Json[$i]['name'] = $series->name;
                $Json[$i]['start_date'] = $series->start_date;
                $Json[$i]['end_date'] = $series->end_date;
                $Json[$i]['status'] = $series->status;
                $i++;
            }
        } else {
            $Json = [];
        }

        return $this->sendResponse($Json, 'Series List.');
    }

    public function matchScorecard(Request $request)
    {
        $matchkey = $request->matchkey;
        $Json = [];
        if (!empty($matchkey)) {
            $checkpre = DB::table('matchruns')->where('matchkey', $matchkey)->first();
            if (!empty($checkpre->matchdata)) {
                $giveresresult = json_decode($checkpre->matchdata, true);
                if (
                    !empty($giveresresult['innings'])
                ) {
                    foreach ($giveresresult['innings']
                        as
                        $inning
                        =>
                        $inning_data) {

                        $Json[$inning]['name'] = $inning_data['name'];
                        $Json[$inning]['scores'] = $inning_data['scores_full'];
                        if (!empty($inning_data['batsmen'])) {
                            foreach ($inning_data['batsmen'] as $batsman => $batsman_data) {

                                $Json[$inning]['batsmen'][$batsman]['name'] = $batsman_data['name'];
                                $Json[$inning]['batsmen'][$batsman]['role'] = $batsman_data['role'];
                                $Json[$inning]['batsmen'][$batsman]['how_out'] = $batsman_data['how_out'];
                                $Json[$inning]['batsmen'][$batsman]['runs'] = $batsman_data['runs'];
                                $Json[$inning]['batsmen'][$batsman]['balls'] = $batsman_data['balls_faced'];
                                $Json[$inning]['batsmen'][$batsman]['fours'] = $batsman_data['fours'];
                                $Json[$inning]['batsmen'][$batsman]['sixes'] = $batsman_data['sixes'];
                                $Json[$inning]['batsmen'][$batsman]['strike_rate'] = $batsman_data['strike_rate'];
                            }
                        } else {
                            $Json[$inning]['batsmen'] = [];
                        }

                        $Json[$inning]['extras'] = array($inning_data['extra_runs']);
                        $Json[$inning]['total'] = array($inning_data['equations']);
                        $Json[$inning]['did_not_bat'] = '';

                        foreach ($inning_data['did_not_bat'] as $did_not_bat => $did_not_bat_data) {
                            $Json[$inning]['did_not_bat'] .= $did_not_bat_data['name'];

                            // , not at last
                            if (
                                (count($inning_data['did_not_bat']) - 1) == $did_not_bat
                            ) {
                            } else {
                                $Json[$inning]['did_not_bat'] .= ', ';
                            }
                        }
                        if (!empty($inning_data['bowlers'])) {
                            foreach ($inning_data['bowlers'] as $bowler => $bowler_data) {

                                $Json[$inning]['bowlers'][$bowler]['name'] = $bowler_data['name'];
                                $Json[$inning]['bowlers'][$bowler]['overs'] = $bowler_data['overs'];
                                $Json[$inning]['bowlers'][$bowler]['maidens'] = $bowler_data['maidens'];
                                $Json[$inning]['bowlers'][$bowler]['runs'] = $bowler_data['runs_conceded'];
                                $Json[$inning]['bowlers'][$bowler]['wickets'] = $bowler_data['wickets'];
                                $Json[$inning]['bowlers'][$bowler]['economy_rate'] = $bowler_data['econ'];
                            }
                        } else {
                            $Json[$inning]['bowlers'] = [];
                        }

                        if (!empty($inning_data['fows'])) {
                            foreach ($inning_data['fows'] as $fall_of_wicket => $fall_of_wicket_data) {

                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['name'] = $fall_of_wicket_data['name'];
                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['runs'] = $fall_of_wicket_data['runs'];
                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['balls'] = $fall_of_wicket_data['balls'];
                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['score_at_dismissal'] = $fall_of_wicket_data['score_at_dismissal'];
                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['overs_at_dismissal'] = $fall_of_wicket_data['overs_at_dismissal'];
                                $Json[$inning]['fall_of_wickets'][$fall_of_wicket]['number'] = $fall_of_wicket_data['number'];
                            }
                        } else {
                            $Json[$inning]['fall_of_wickets'] = [];
                        }
                    }
                }
            }
        }
        return $this->sendResponse($Json, 'Match Scorecard.');
    }
}
