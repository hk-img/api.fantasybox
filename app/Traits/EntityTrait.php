<?php

namespace App\Traits;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use URL;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;
use Transliterator;
use Illuminate\Support\Facades\Http;

trait EntityTrait
{
    public static function getcricketseries()
    {
        $match_arrs = Http::get(config('entity.competitions'), [
            'token' => config('entity.entityToken'),
            'per_page' => 50,
            'paged' => 1,
        ])->json();
        return $match_arrs;
    }

    public static function getcricketmatches()
    {
        $match_result = Http::get(config('entity.upcoming'), [
            'status' => 1,
            'token' => config('entity.entityToken'),
            'per_page' => 100,
            'paged' => 1,
        ])->json();
        return $match_result;
    }

    public static function getcricketmatchplayers($matchid)
    {
        $match_result = Http::get('https://rest.entitysport.com/v2/matches/' . $matchid . '/squads?token=' . config('entity.entityToken'))->json();
        return $match_result;
    }

    public static function getcricketmatchinfo($matchid)
    {
        $match_result = Http::get('https://rest.entitysport.com/v2/matches/' . $matchid . '/info?token=' . config('entity.entityToken'))->json();
        return $match_result;
    }

    public static function getcricketmatchscore($matchid)
    {
        $match_result = Http::get('https://rest.entitysport.com/v2/matches/' . $matchid . '/scorecard?token=' . config('entity.entityToken'))->json();
        return $match_result;
    }


}
