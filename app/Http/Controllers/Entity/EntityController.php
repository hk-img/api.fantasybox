<?php

namespace App\Http\Controllers\Entity;

use DB;
use Session;
use bcrypt;
use Config;
use Redirect;
use Hash;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;
use DateTime;
use App\Traits\EntityTrait;

class EntityController extends Controller
{
	public static function importseries($fantasy_type)
	{

		if (base64_decode($fantasy_type) == "Cricket") {
			$getserieslist = EntityTrait::getcricketseries();
			if (!empty($getserieslist)) {
				$series = $getserieslist['response']['items'];
				if (!empty($series)) {
					foreach ($series as $serieslist) {
						$checkseries = DB::table('series')->where('series_key', $serieslist['abbr'])->first();
						if (empty($checkseries) && $serieslist['status'] != 'result') {
							$seriesdata['fantasy_type'] = 1;
							$seriesdata['series_key'] = $serieslist['abbr'];
							$seriesdata['name'] = $serieslist['title'];
							$seriesdata['start_date'] = $serieslist['datestart'];
							$seriesdata['end_date'] = $serieslist['dateend'];
							$seriesdata['teamcount'] = $serieslist['total_teams'];
							$seriesdata['matchcount'] = $serieslist['total_matches'];
							$seriesdata['rounds_data'] = isset($serieslist['rounds']) ? json_encode($serieslist['rounds']) : "null";
							$seriesenddat = date('Y-m-d H:i:s', strtotime($serieslist['dateend']));
							$currentdate = date('Y-m-d H:i:s');
							if ($seriesenddat > $currentdate) {
								$seriesdata['status'] = "opened";
							} else {
								$seriesdata['status'] = "closed";
							}
							DB::table('series')->insert($seriesdata);
						} else {
							$updtseriesdata['fantasy_type'] = 1;
							$updtseriesdata['start_date'] = $serieslist['datestart'];
							$updtseriesdata['teamcount'] = $serieslist['total_teams'];
							$updtseriesdata['matchcount'] = $serieslist['total_matches'];
							$updtseriesdata['end_date'] = $serieslist['dateend'];
							$seriesenddat = date('Y-m-d H:i:s', strtotime($serieslist['dateend']));
							$currentdate = date('Y-m-d H:i:s');
							if ($serieslist['status'] == 'result') {
								$updtseriesdata['status'] = "closed";
							} else {
								$updtseriesdata['status'] = "opened";
							}
							if (isset($checkseries->id)) {
								DB::table('series')->where('id', $checkseries->id)->update($updtseriesdata);
							}
						}
					}
					return redirect()->back()->with('success', 'Series Imported Successfully');
				}
			}
		} else {
			dd('Plan not Activated');
		}
	}

	public static function importmatch($fantasy_type)
	{

		if (base64_decode($fantasy_type) == "Cricket") {
			$getdayslist = EntityTrait::getcricketmatches();
			date_default_timezone_set('Asia/Kolkata');
			$m_status = [1 => 'notstarted', 2 => 'completed', 3 => 'started', 4 => 'completed'];
			$format_status = array(
				1 => 'one-day',
				2 => 'test',
				3 => 't20',
				4 => 'one-day',
				5 => 'test',
				6 => 't20',
				7 => 'one-day',
				8 => 't20',
				9 => 'one-day',
				10 => 't20',
				17 => 't10',
				18 => 'the-hundred',
				19 => 'the-hundred'
			);
			if (!empty($getdayslist)) {
				$matches = $getdayslist['response']['items'];
				if (!empty($matches)) {
					$i = 0;
					foreach ($matches as $key => $getli) {
						$findmatchexist = DB::connection('mysql')->table('listmatches')->where('real_matchkey', $getli['match_id'])->first();
						if (empty($findmatchexist)) {
							$team1key = $getli['teama']['team_id'];
							$team2key = $getli['teamb']['team_id'];
							if (($team1key != 111066 && $team2key != 111066) && !empty($team1key) && !empty($team2key)) {
								$findteam1 = DB::connection('mysql')->table('teams')->where('team_key', $team1key)->select('id')->first();
								if (empty($findteam1)) {
									$existteam1 = DB::connection('mysql')->table('teams')->select('id')->where('team', '=', $getli['teama']['name'])->first();
									if (empty($existteam1)) {
										$data['team_key'] = $team1key;
										$data['team'] = $getli['teama']['name'];
										$data['short_name'] = $getli['teama']['short_name'] ?? $team1key;
										$data['logo'] = $getli['teama']['logo_url'];
										$team1id = DB::table('teams')->insertGetId($data);
									} else {
										$team_data1['team_key'] = $team1key;
										DB::table('teams')->where('id', '=', $existteam1->id)->update($team_data1);
										$team1id = $existteam1->id;
									}
								} else {
									$team1id = $findteam1->id;
								}

								$findteam2 = DB::connection('mysql')->table('teams')->where('team_key', $team2key)->select('id')->first();
								if (empty($findteam2)) {
									$existteam2 = DB::connection('mysql')->table('teams')->select('id')->where('team', '=', $getli['teamb']['name'])->first();
									if (empty($existteam2)) {
										$data1['team_key'] = $team2key;
										$data1['team'] = $getli['teamb']['name'];
										$data1['short_name'] = $getli['teamb']['short_name'] ?? $team2key;
										$data1['logo'] = $getli['teamb']['logo_url'];
										$team2id = DB::table('teams')->insertGetId($data1);
									} else {
										$team_data2['team_key'] = $team2key;
										DB::table('teams')->where('id', '=', $existteam2->id)->update($team_data2);
										$team2id = $existteam2->id;
									}
								} else {
									$team2id = $findteam2->id;
								}
								$seriesdata2['fantasy_type'] = 1;
								$seriesdata2['series_key'] = $getli['competition']['abbr'];
								$seriesdata2['name'] = $getli['competition']['title'];
								$seriesdata2['start_date'] = $getli['competition']['datestart'];
								$seriesdata2['end_date'] = $getli['competition']['dateend'];
								$seriesdata2['teamcount'] = $getli['competition']['total_teams'];
								$seriesdata2['matchcount'] = $getli['competition']['total_matches'];
								$seriesdata2['rounds_data'] = isset($getli['competition']['rounds']) ? json_encode($getli['competition']['rounds']) : "null";
								$seriesenddat = date('Y-m-d H:i:s', strtotime($getli['competition']['dateend']));
								$currentdate = date('Y-m-d H:i:s');
								if ($seriesenddat > $currentdate) {
									$seriesdata2['status'] = "opened";
								} else {
									$seriesdata2['status'] = "closed";
								}
								$seriesdataa = DB::table('series')->where('series_key', $seriesdata2['series_key'])->first();
								if (!empty($seriesdataa)) {
									$matchadata['series'] = $seriesdataa->id;
								} else {
									$seriesid = DB::table('series')->insertGetId($seriesdata2);
									$matchadata['series'] = $seriesid;
								}
								$matchadata['status'] = $m_status[$getli['status']];
								$matchadata['name'] = $getli['title'];
								$matchadata['team1'] = $team1id;
								$matchadata['team2'] = $team2id;
								$matchadata['real_matchkey'] = $getli['match_id'];
								if ($getli['pre_squad'] == true) {
									$matchadata['squadstatus'] = 'yes';
								} else {
									$matchadata['squadstatus'] = 'no';
								}
								$matchadata['format'] = $format_status[$getli['format']];
								$matchadata['launch_status'] = 'pending';
								$matchadata['final_status'] = 'pending';
								$matchadata['start_date'] = date('Y-m-d H:i:s', $getli['timestamp_start']);
								$matchadata['fantasy_type'] = 1;
								$matchid = DB::table('listmatches')->insertGetId($matchadata);
								DB::table('listmatches')->where('id', $matchid)->update(['matchkey' => $matchid]);
							}
						} else {
							$team1key = $getli['teama']['team_id'];
							$team2key = $getli['teamb']['team_id'];
							if (($team1key != 111066 && $team2key != 111066) && !empty($team1key) && !empty($team2key)) {
								$findteam1 = DB::connection('mysql')->table('teams')->where('team_key', $team1key)->select('id')->first();
								if (empty($findteam1)) {
									$existteam1 = DB::connection('mysql')->table('teams')->select('id')->where('team', '=', $getli['teama']['name'])->first();
									if (empty($existteam1)) {
										$data['team_key'] = $team1key;
										$data['team'] = $getli['teama']['name'];
										$data['short_name'] = $getli['teama']['short_name'] ?? $team1key;
										$data['logo'] = $getli['teama']['logo_url'];
										$team1id = DB::table('teams')->insertGetId($data);
									} else {
										$team_data1['team_key'] = $team1key;
										DB::table('teams')->where('id', '=', $existteam1->id)->update($team_data1);
										$team1id = $existteam1->id;
									}
								} else {
									$team1id = $findteam1->id;
								}

								$findteam2 = DB::connection('mysql')->table('teams')->where('team_key', $team2key)->select('id')->first();
								if (empty($findteam2)) {
									$existteam2 = DB::connection('mysql')->table('teams')->select('id')->where('team', '=', $getli['teamb']['name'])->first();
									if (empty($existteam2)) {
										$data1['team_key'] = $team2key;
										$data1['team'] = $getli['teamb']['name'];
										$data1['short_name'] = $getli['teamb']['short_name'] ?? $team2key;
										$data1['logo'] = $getli['teamb']['logo_url'];
										$team2id = DB::table('teams')->insertGetId($data1);
									} else {
										$team_data2['team_key'] = $team2key;
										DB::table('teams')->where('id', '=', $existteam2->id)->update($team_data2);
										$team2id = $existteam2->id;
									}
								} else {
									$team2id = $findteam2->id;
								}
								$seriesdata1['fantasy_type'] = 1;
								$seriesdata1['series_key'] = $getli['competition']['abbr'];
								$seriesdata1['name'] = $getli['competition']['title'];
								$seriesdata1['start_date'] = $getli['competition']['datestart'];
								$seriesdata1['end_date'] = $getli['competition']['dateend'];
								$seriesdata1['teamcount'] = $getli['competition']['total_teams'];
								$seriesdata1['matchcount'] = $getli['competition']['total_matches'];
								$seriesdata1['rounds_data'] = isset($getli['competition']['rounds']) ? json_encode($getli['competition']['rounds']) : "null";
								$seriesenddat = date('Y-m-d H:i:s', strtotime($getli['competition']['dateend']));
								$currentdate = date('Y-m-d H:i:s');
								if ($seriesenddat > $currentdate) {
									$seriesdata1['status'] = "opened";
								} else {
									$seriesdata1['status'] = "closed";
								}
								$seriesdata = DB::table('series')->where('series_key', $seriesdata1['series_key'])->first();
								if (!empty($seriesdata)) {
									$matchadata1['series'] = $seriesdata->id;
								} else {
									$seriesid = DB::table('series')->insertGetId($seriesdata1);
									$matchadata1['series'] = $seriesid;
								}

								$matchadata1['status'] = $m_status[$getli['status']];
								$matchadata1['name'] = $getli['title'];
								$matchadata1['format'] = $format_status[$getli['format']];
								$matchadata1['team1'] = $team1id;
								$matchadata1['team2'] = $team2id;
								if ($getli['pre_squad'] == true) {
									$matchadata1['squadstatus'] = 'yes';
								} else {
									$matchadata1['squadstatus'] = 'no';
								}
								$matchadata1['start_date'] = date('Y-m-d H:i:s', $getli['timestamp_start']);
								$matchadata1['fantasy_type'] = 1;
								DB::table('listmatches')->where('real_matchkey', $getli['match_id'])->update($matchadata1);
							}
						}
					}
				}
			}
			return redirect()->back()->with('success', 'Successfully Imported !');
		} else {
			dd('Plan not Activated');
		}
	}

	public static function importmatchplayers($matchid)
	{

		$matchkey = base64_decode($matchid);
		$findmatch = DB::table('listmatches')->where('matchkey', $matchkey)->first();
		$roled = ['bowl'=>'bowler','bat'=>'batsman','all'=>'allrounder','wk'=>'keeper','wkbat'=>'keeper'];
		$getdetails = EntityTrait::getcricketmatchplayers($findmatch->real_matchkey);

		$getdetails = $getdetails['response'];
		if (!empty($getdetails)) {
			$team1players = array();
			$team2players = array();
			if (isset($getdetails['teama']['squads'])) {
				$team1players = $getdetails['teama']['squads'];
			}
			if (isset($getdetails['teamb']['squads'])) {
				$team2players = $getdetails['teamb']['squads'];
			}
			if (!empty($team1players) && !empty($team2players)) {
				$team1key = $getdetails['teama']['team_id'];
				$team2key = $getdetails['teamb']['team_id'];
				// insert team 1//
				$findteam1 = DB::connection('mysql')->table('teams')->where('team_key', $team1key)->select('id')->first();
				if (empty($findteam1)) {
					$mpdata['team_key'] = $team1key;
					$mpdata['team'] = $getdetails['teams'][0]['title'];
					$mpdata['short_name'] = $getdetails['teams'][0]['abbr'] ?? $team1key;
					$mpdata['logo'] = $getdetails['teams'][0]['thumb_url'];
					$team1id = DB::table('teams')->insertGetId($mpdata);
				} else {
					$team1id = $findteam1->id;
				}

				// insert team 2//
				$findteam2 = DB::connection('mysql')->table('teams')->where('team_key', $team2key)->select('id')->first();
				if (empty($findteam2)) {
					$mpdata1['team_key'] = $team2key;
					$mpdata1['team'] = $getdetails['teams'][1]['title'];
					$mpdata1['short_name'] = $getdetails['teams'][1]['abbr'] ?? $team2key;
					$mpdata1['logo'] = $getdetails['teams'][1]['thumb_url'];
					$team2id = DB::table('teams')->insertGetId($mpdata1);
				} else {
					$team2id = $findteam2->id;
				}
				$matchadata['team1'] = $team1id;
				$matchadata['team2'] = $team2id;
				$matchadata['name'] = $getdetails['teams'][0]['title'] . ' Vs ' . $getdetails['teams'][1]['title'];
				$matchadata['squadstatus'] = 'yes';
				DB::table('listmatches')->where('matchkey', $findmatch->matchkey)->update($matchadata);
			}
			if (!empty($team1players)) {
				foreach ($team1players as $players1) {
					$playerkey = $players1['player_id'];
					$key = array_search($players1['player_id'], array_column($getdetails['players'], 'pid'));
					$teamkey = $getdetails['teama']['team_id'];
					$findmatchexist = DB::table('teams')->where('team_key', $teamkey)->select('id')->first();
					if (!empty($findmatchexist)) {
						$findplayerexist = DB::table('players')->where('players_key', $playerkey)->where('team', $findmatchexist->id)->first();
						$data['player_name'] = $getdetails['players'][$key]['title'];
						$data['players_key'] = $playerkey;
						$data['credit'] = $getdetails['players'][$key]['fantasy_player_rating'] ?? 9;
						$data['battingstyle'] = $getdetails['players'][$key]['batting_style'];
						$data['bowlingstyle'] = $getdetails['players'][$key]['bowling_style'];
						$data['country'] = $getdetails['players'][$key]['nationality'];
						$data['dob'] = $getdetails['players'][$key]['birthdate'];
						if (empty($findplayerexist)) {

							$data['team'] = $findmatchexist->id;
							if ($getdetails['players'][$key]['playing_role'] == "") {
								$data['role'] = 'allrounder';
							} else {
								$data['role'] =  $roled[$getdetails['players'][$key]['playing_role']];
							}
							$playerid = DB::table('players')->insertGetId($data);
							$credit = $getdetails['players'][$key]['fantasy_player_rating'] ?? 9;
						} else {
							$playerid = $findplayerexist->id;
							$credit = $getdetails['players'][$key]['fantasy_player_rating'] ?? $findplayerexist->credit;
							if ($getdetails['players'][$key]['playing_role'] == "") {
								$data['role'] = $findplayerexist->role;
								$getdetails['players'][$key]['playing_role'] = $findplayerexist->role;
							} else {
								$data['role'] =  $roled[$getdetails['players'][$key]['playing_role']];
							}

						}
						// insert players for a match//
						$findplayer1entry = DB::table('matchplayers')->where('matchkey', $findmatch->matchkey)->where('playerid', $playerid)->first();
						if (empty($findplayer1entry)) {
							$matchplayerdata['matchkey'] = $findmatch->matchkey;
							$matchplayerdata['playerid'] = $playerid;
							$matchplayerdata['role'] = $data['role'];
							$matchplayerdata['name'] = $data['player_name'];
							$matchplayerdata['credit'] = $credit;
							$matchplayerdata['battingstyle'] = $data['battingstyle'];
							$matchplayerdata['bowlingstyle'] = $data['bowlingstyle'];
							DB::table('matchplayers')->insert($matchplayerdata);
						} else {
							$matchplayerdata1['credit'] = $getdetails['players'][$key]['fantasy_player_rating'] ?? $findplayer1entry->credit;
							$matchplayerdata1['role'] = $data['role'];
							DB::table('matchplayers')->where('id', $findplayer1entry->id)->update($matchplayerdata1);
						}
					}
				}
			}
			if (!empty($team2players)) {
				foreach ($team2players as $players2) {
					$playerkey2 = $players2['player_id'];
					$key = array_search($players2['player_id'], array_column($getdetails['players'], 'pid'));
					$playerid = "";
					$findplayer2exist = array();
					$data = array();
					$team2key = $getdetails['teamb']['team_id'];
					$findmatchexist = DB::table('teams')->where('team_key', $team2key)->select('id')->first();
					if (!empty($findmatchexist)) {
						$findplayer2exist = DB::table('players')->where('players_key', $playerkey2)->where('team', $findmatchexist->id)->first();
						$data['player_name'] = $getdetails['players'][$key]['title'];
						$data['players_key'] = $playerkey2;
						$data['credit'] = $getdetails['players'][$key]['fantasy_player_rating'] ?? 9;
						$data['battingstyle'] = $getdetails['players'][$key]['batting_style'];
						$data['bowlingstyle'] = $getdetails['players'][$key]['bowling_style'];
						$data['country'] = $getdetails['players'][$key]['nationality'];
						$data['dob'] = $getdetails['players'][$key]['birthdate'];
						if (empty($findplayer2exist)) {

							$data['team'] = $findmatchexist->id;
							if ($getdetails['players'][$key]['playing_role'] == "") {
								$data['role'] =  'allrounder';
							} else {
								$data['role'] = $roled[$getdetails['players'][$key]['playing_role']];
							}
							$playerid =  DB::table('players')->insertGetId($data);
							$credit = $getdetails['players'][$key]['fantasy_player_rating'] ?? 9;
						} else {
							$playerid = $findplayer2exist->id;
							$credit = $getdetails['players'][$key]['fantasy_player_rating'] ?? $findplayer2exist->credit;
							if ($getdetails['players'][$key]['playing_role'] == "") {
								$data['role'] = $findplayerexist->role;
								$getdetails['players'][$key]['playing_role'] = $findplayerexist->role;
							} else {
								$data['role'] =  $roled[$getdetails['players'][$key]['playing_role']];
							}
						}
						$findplayer2entry = DB::table('matchplayers')->where('matchkey', $findmatch->matchkey)->where('playerid', $playerid)->first();
						if (empty($findplayer2entry)) {
							$matchplayerdatas['matchkey'] = $findmatch->matchkey;
							$matchplayerdatas['playerid'] = $playerid;
							if ($data['role'] != "") {
								$matchplayerdatas['role'] = $data['role'];
							}
							$matchplayerdatas['name'] = $data['player_name'];
							$matchplayerdatas['credit'] = $credit;
							$matchplayerdatas['battingstyle'] = $data['battingstyle'];
							$matchplayerdatas['bowlingstyle'] = $data['bowlingstyle'];
							DB::table('matchplayers')->insert($matchplayerdatas);
						} else {
							$matchplayerdatas2['credit'] = $getdetails['players'][$key]['fantasy_player_rating'] ?? $findplayer2entry->credit;
							$matchplayerdatas2['role'] = $data['role'];
							DB::table('matchplayers')->where('id', $findplayer2entry->id)->update($matchplayerdatas2);
						}
					}
				}
			}
		}
		return redirect()->back()->with('success', 'Player Imported Successfully!');
	}
}
