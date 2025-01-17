<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;
use App\Http\Controllers\API\MatchController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::controller(UserController::class)->group(function () {
    Route::get('getapp', 'getApp');
    Route::post('verifyloginotp', 'verifyLoginotp');
    Route::post('login', 'login');
    Route::post('sociallogin', 'socialLogin');
    Route::post('resendotp', 'resendOtp');
    Route::any('transactioreceipt', 'transactioReceipt');
    Route::any('paymentwebhook', 'paymentWebhook');
    Route::any('checkcode', 'checkcodeaccess');
});


Route::middleware('auth:sanctum')->group(function () {
    // User Api
    Route::any('sendlinkurl', [UserController::class, 'sendlinkurl']);
    Route::any('userinfo', [UserController::class, 'userInfo']);
    Route::any('helpdeskmail', [UserController::class, 'helpdeskMail']);
    Route::any('editprfoile', [UserController::class, 'editPrfoile']);
    Route::any('verifymobile', [UserController::class, 'verifyMobile']);
    Route::any('verifyemail', [UserController::class, 'verifyEmail']);
    Route::any('updateuserimage', [UserController::class, 'updateUserImage']);
    Route::any('updatepandetail', [UserController::class, 'updatePanDetail']);
    Route::any('updateaadhardetail', [UserController::class, 'updateAadharDetail']);
    Route::any('updatebankdetail', [UserController::class, 'updateBankDetail']);
    Route::any('panview', [UserController::class, 'panView']);
    Route::any('bankview', [UserController::class, 'bankView']);
    Route::any('aadharview', [UserController::class, 'aadharView']);
    Route::any('allnotifications', [UserController::class, 'allNotifications']);
    Route::any('alltransactions', [UserController::class, 'allTransactions']);
    Route::any('allofferlist', [UserController::class, 'allOfferlist']);
    Route::any('requestaddcash', [UserController::class, 'requestAddcash']);
    Route::any('manualaddreq', [UserController::class, 'manualAddReq']);
    Route::any('withdrawrequest', [UserController::class, 'withdrawRequest']);
    Route::any('logout', [UserController::class, 'logout']);

    // Match Api

    Route::any('getmatchlist', [MatchController::class, 'getMatchList']);
    Route::any('getallcontest', [MatchController::class, 'getAllContest']);
    Route::any('getallplayers', [MatchController::class, 'getAllPlayers']);
    Route::any('getusablebalance', [MatchController::class, 'getUsableBalance']);
    Route::any('createteam', [MatchController::class, 'createTeam']);
    Route::any('getmyteams', [MatchController::class, 'getMyTeams']);
    Route::any('joinleauge', [MatchController::class, 'joinLeauge']);
    Route::any('joinedcontest', [MatchController::class, 'joinedContest']);
    Route::any('createprivatecontest', [MatchController::class, 'createPrivateContest']);
    Route::any('joinbycode', [MatchController::class, 'joinByCode']);
    Route::any('joinbycodedetail', [MatchController::class, 'joinByCodeDetail']);
    Route::any('viewteam', [MatchController::class, 'viewTeam']);
    Route::any('switchteams', [MatchController::class, 'switchTeams']);
    Route::any('challengejoineduser', [MatchController::class, 'challengeJoinedUser']);
    Route::any('playerinfo', [MatchController::class, 'playerInfo']);
    Route::any('joinedmatches', [MatchController::class, 'joinedMatches']);
    Route::any('joinedlivecontest', [MatchController::class, 'joinedLiveContest']);
    Route::any('matchscorecard', [MatchController::class, 'matchScorecard']);
    Route::any('playerstats', [MatchController::class, 'playerStats']);
    Route::any('challengeleaderboard', [MatchController::class, 'challengeLeaderboard']);
    Route::any('seriesleaderboard', [MatchController::class, 'seriesLeaderboard']);
    Route::any('getallseries', [MatchController::class, 'getAllSeries']);


});
