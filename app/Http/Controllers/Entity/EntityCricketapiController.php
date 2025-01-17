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

class EntityCricketapiController extends Controller
{

	public static function importseries($fantasy_type){
		// $match_fields = EntityCricketapiController::getaccesstoken();
		// $access_token = $match_fields['access_token'];
		$match_url = 'https://api.fantasybox.in/entityinfo/getSeriesData';
	    $ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $match_url);
		curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt($ch,CURLOPT_ENCODING , "gzip");
		// Execute Match request
		$match_result = curl_exec($ch);
		$ab['seriesdata'] = $match_result;
		// DB::table('seriesdata')->insert($ab);
		$match_arrs = json_decode($match_result, true);
		return $match_arrs ;
		curl_close($ch);
	}

	public static function allUpcomingMatches($page){
		$match_url = 'https://api.fantasybox.in/entityinfo/getavailablematches';
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $match_url);
		curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt($ch,CURLOPT_ENCODING , "gzip");
		// Execute Match request
		$match_result = curl_exec($ch);
		$match_arrs = json_decode($match_result, true);
		return $match_arrs;
		// dd($match_arrs);
	}

	public static function getmatchplayers($matchid){
		$match_url = "https://api.fantasybox.in/entityinfo/getmatchplayersdata/$matchid";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $match_url);
		curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt($ch,CURLOPT_ENCODING , "gzip");
		// Execute Match request
		$match_result = curl_exec($ch);
		$match_arrs = json_decode($match_result, true);
		return $match_arrs;
	}
	public static function getmatchescoredata($matchid){
		$match_url = "https://api.fantasybox.in/entityinfo/getmatchescoredata/$matchid";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $match_url);
		curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt($ch,CURLOPT_ENCODING , "gzip");
		// Execute Match request
		$match_result = curl_exec($ch);
		$match_arrs = json_decode($match_result, true);
		return $match_arrs;
		// dd($match_arrs);
	}

	public static function match_info($matchid){
		$match_url = "https://api.fantasybox.in/entityinfo/match_info/$matchid";
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $match_url);
		curl_setopt($ch, CURLOPT_POST, false);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true );
		curl_setopt($ch,CURLOPT_ENCODING , "gzip");
		// Execute Match request
		$match_result = curl_exec($ch);
		$match_arrs = json_decode($match_result, true);
		return $match_arrs;
		// dd($match_arrs);
	}
}
