<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\SeriesController;
use App\Http\Controllers\AccessController;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\PlayerController;
use App\Http\Controllers\MatchController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ContestController;
use App\Http\Controllers\Entity\EntityController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\VerificationController;
use App\Http\Controllers\BannerController;
use App\Http\Controllers\GeneralController;
use App\Http\Controllers\OfferController;
use App\Http\Controllers\InfluencerController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\ResultController;
use App\Http\Controllers\Stock\StockMatchController;
use App\Http\Controllers\Stock\StockCategoryController;
use App\Http\Controllers\Stock\StockContestController;
use App\Http\Controllers\Stock\StockResultController;
use App\Http\Controllers\Stock\StockCronController;
use App\Http\Controllers\Stock\StockController;
use App\Http\Controllers\InfluencerBonusController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return redirect()->route('login');
});

Route::fallback(function () {
    return view('errors.404');
});



/*--------------  ADMIN ROUTES STARTS -----------------*/
Route::group(['prefix' => 'fantasyadmin'], function () {

    Route::group(['auth', 'middleware' => ['role:superadmin|admin']], function () {
        Route::middleware('auth')->group(function () {
            Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
            Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
            Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
            Route::get('/password', [ProfileController::class, 'editpass'])->name('password.edit');
            Route::post('/password', [ProfileController::class, 'updatepass'])->name('updatepass.update');
        });
    });

    Route::group(['auth', 'middleware' => ['role:superadmin']], function () {
        Route::any('/settings', [SettingController::class, 'index'])->name('settings');
        Route::any('/gamemerge', [SettingController::class, 'gamemerge'])->name('gamemerge');
    });

    Route::group(['auth', 'middleware' => ['role:superadmin|admin|cricket|football|basketball|stock|kabaddi']], function () {
        Route::any('/dashboard', [HomeController::class, 'dashboard'])->name('dashboard');
        Route::post('get_contest_category', [HomeController::class, 'get_contest_category'])->name('get_contest_category');


        //Access Manager
        Route::any('add-access', [AccessController::class, 'index'])->name('access.create');
        Route::any('edit-access/{id}', [AccessController::class, 'edit'])->name('access.edit');
        Route::any('actdect-access/{id}', [AccessController::class, 'actdect'])->name('access.actdect');
        Route::any('view-access/{fantasy_type}', [AccessController::class, 'view'])->name('access.view');
        Route::any('view-fullaccess/{fantasy_type}', [AccessController::class, 'viewfullaccess'])->name('access.viewfullaccess');

        //Series Manager
        Route::any('add-series', [SeriesController::class, 'index'])->name('series.create');
        Route::any('edit-series/{id}', [SeriesController::class, 'edit'])->name('series.edit');
        Route::any('actdect-series/{id}', [SeriesController::class, 'actdect'])->name('series.actdect');
        Route::any('view-series/{fantasy_type}', [SeriesController::class, 'view'])->name('series.view');
        Route::any('view-fullseries/{fantasy_type}', [SeriesController::class, 'viewfullseries'])->name('series.viewfullseries');

        //Team Manager
        Route::any('edit-team/{id}', [TeamController::class, 'edit'])->name('team.edit');
        Route::any('view-team/{fantasy_type}', [TeamController::class, 'view'])->name('team.view');

        //Player Manager
        Route::any('edit-player/{id}', [PlayerController::class, 'edit'])->name('player.edit');
        Route::any('view-player/{fantasy_type}', [PlayerController::class, 'view'])->name('player.view');

        //Match Manager
        Route::any('edit-match/{id}', [MatchController::class, 'edit'])->name('match.edit');
        Route::any('launch-match/{id}', [MatchController::class, 'launchmatch'])->name('match.launchmatch');
        Route::any('launch/{id}', [MatchController::class, 'launch'])->name('match.launch');
        Route::any('unlaunch/{id}', [MatchController::class, 'unlaunch'])->name('match.unlaunch');
        Route::any('view-upcoming-matches/{fantasy_type}', [MatchController::class, 'view'])->name('match.view');
        Route::any('view-allmatches/{fantasy_type}', [MatchController::class, 'allmatchview'])->name('allmatches.view');
        Route::any('deletematchplayer', [MatchController::class, 'deletematchplayer'])->name('match.deletematchplayer');
        Route::any('customcontest/{fantasy_type}', [MatchController::class, 'customcontest'])->name('match.customcontest');
        Route::any('importcontest/{matchkey}', [MatchController::class, 'importcontest'])->name('match.importcontest');
        Route::any('importmatchcontest', [MatchController::class, 'importmatchcontest'])->name('match.importmatchcontest');
        Route::any('updateplayingxi/{fantasy_type}', [MatchController::class, 'updateplayingxi'])->name('match.updateplayingxi');
        Route::any('launchplayingxi/{matchkey}', [MatchController::class, 'launchplayingxi'])->name('match.launchplayingxi');
        Route::any('unlaunchplayingxi/{matchkey}', [MatchController::class, 'unlaunchplayingxi'])->name('match.unlaunchplayingxi');
        Route::any('updateplayingxiplayer', [MatchController::class, 'updateplayingxiplayer'])->name('match.updateplayingxiplayer');


        //Category Manager
        Route::any('add-category', [CategoryController::class, 'index'])->name('category.create');
        Route::any('edit-category/{id}', [CategoryController::class, 'edit'])->name('category.edit');
        Route::any('delete-category/{id}', [CategoryController::class, 'deletecategory'])->name('category.deletecategory');
        Route::any('view-category/{fantasy_type}', [CategoryController::class, 'view'])->name('category.view');

        //Contest Manager
        Route::any('add-globalcontest', [ContestController::class, 'index'])->name('globalcontest.create');
        Route::any('edit-globalcontest/{id}', [ContestController::class, 'edit'])->name('globalcontest.edit');
        Route::any('delete-globalcontest', [ContestController::class, 'deleteglobalcontest'])->name('globalcontest.deleteglobalcontest');
        Route::any('view-globalcontest/{fantasy_type}', [ContestController::class, 'view'])->name('globalcontest.view');
        Route::any('pricecard-globalcontest/{id}', [ContestController::class, 'globalpricecard'])->name('globalcontest.pricecard');
        Route::any('pricecard-globaldelete', [ContestController::class, 'globalpricecarddelete'])->name('globalcontest.globalpricecarddelete');


        //Custom Contest Manager
        Route::any('add-customcontest/{fantasy_type}', [ContestController::class, 'addcustom'])->name('customcontest.create');
        Route::any('edit-customcontest/{id}', [ContestController::class, 'editcustom'])->name('customcontest.edit');
        Route::any('delete-customcontest', [ContestController::class, 'deletecustomcontest'])->name('customcontest.deletecustomcontest');
        Route::any('cancelcontest', [ContestController::class, 'cancelcontest'])->name('customcontest.cancelcontest');
        Route::any('pricecard-customcontest/{id}', [ContestController::class, 'custompricecard'])->name('customcontest.pricecard');
        Route::any('pricecard-customdelete', [ContestController::class, 'custompricecarddelete'])->name('customcontest.custompricecarddelete');


        //User Manager
        Route::any('edit-user/{id}', [UserController::class, 'edit'])->name('user.edit');
        Route::any('actdect-user/{id}', [UserController::class, 'actdect'])->name('user.actdect');
        Route::any('view-user', [UserController::class, 'view'])->name('user.view');
        Route::any('viewallreferal/{id}', [UserController::class, 'viewallreferal'])->name('user.viewallreferal');
        Route::any('viewtransaction/{id}', [UserController::class, 'viewtransaction'])->name('user.viewtransaction');
        Route::any('getuserdetail/{id}', [UserController::class, 'getuserdetail'])->name('user.getuserdetail');
        Route::any('userswallet', [UserController::class, 'userswallet'])->name('user.userswallet');
        Route::any('view-adminwallet', [UserController::class, 'adminwallet'])->name('user.adminwallet');
        Route::any('add-adminwallet', [UserController::class, 'addadminwallet'])->name('user.addadminwallet');
        Route::any('creditamount', [UserController::class, 'creditamount'])->name('user.creditamount');
        Route::any('debitamount', [UserController::class, 'debitamount'])->name('user.debitamount');

        //Verification Manager
        Route::any('edit-pancard/{id}', [VerificationController::class, 'editpan'])->name('verification.editpan');
        Route::any('approvepan/{id}', [VerificationController::class, 'approvepan'])->name('verification.approvepan');
        Route::any('view-pan', [VerificationController::class, 'viewpan'])->name('verification.viewpan');

        Route::any('edit-bank/{id}', [VerificationController::class, 'editbank'])->name('verification.editbank');
        Route::any('approvebank/{id}', [VerificationController::class, 'approvebank'])->name('verification.approvebank');
        Route::any('view-bank', [VerificationController::class, 'viewbank'])->name('verification.viewbank');

        Route::any('edit-aadhar/{id}', [VerificationController::class, 'editaadhar'])->name('verification.editaadhar');
        Route::any('approveaadhar/{id}', [VerificationController::class, 'approveaadhar'])->name('verification.approveaadhar');
        Route::any('view-aadhar', [VerificationController::class, 'viewaadhar'])->name('verification.viewaadhar');

        Route::any('view-receivedfund', [VerificationController::class, 'receivedfund'])->name('verification.receivedfund');
        Route::any('approvemanualadd/{id}', [VerificationController::class, 'approveManualAdd'])->name('verification.approvemanualadd');
        Route::any('rejectmanualadd/{id}', [VerificationController::class, 'rejectManualAdd'])->name('verification.rejectmanualadd');

        Route::any('approvewithdrawal/{id}', [VerificationController::class, 'approvewithdrawal'])->name('verification.approvewithdrawal');
        Route::any('rejectwithdrawal', [VerificationController::class, 'rejectwithdrawal'])->name('verification.rejectwithdrawal');
        Route::any('view-withdrawal', [VerificationController::class, 'viewwithdrawal'])->name('verification.viewwithdrawal');

        //Banner Manager
        Route::any('add-banner', [BannerController::class, 'index'])->name('banner.create');
        Route::any('edit-banner/{id}', [BannerController::class, 'edit'])->name('banner.edit');
        Route::any('delete-banner/{id}', [BannerController::class, 'deletebanner'])->name('banner.deletebanner');
        Route::any('view-banner', [BannerController::class, 'view'])->name('banner.view');

        //General Manager
        Route::any('view-general', [GeneralController::class, 'view'])->name('general.view');

        //Offer Manager
        Route::any('add-offer', [OfferController::class, 'index'])->name('offer.create');
        Route::any('edit-offer/{id}', [OfferController::class, 'edit'])->name('offer.edit');
        Route::any('delete-offer/{id}', [OfferController::class, 'deleteoffer'])->name('offer.deleteoffer');
        Route::any('view-offer', [OfferController::class, 'view'])->name('offer.view');

        //Influencer Manager
        Route::any('add-influencer', [InfluencerController::class, 'index'])->name('influencer.create');
        Route::any('edit-influencer/{id}', [InfluencerController::class, 'edit'])->name('influencer.edit');
        Route::any('delete-influencer/{id}', [InfluencerController::class, 'deleteinfluencer'])->name('influencer.deleteinfluencer');
        Route::any('view-influencer', [InfluencerController::class, 'view'])->name('influencer.view');

        //Notification Manager
        Route::any('mail-notification', [NotificationController::class, 'index'])->name('notification.mail');
        Route::any('app-notification', [NotificationController::class, 'appnotification'])->name('notification.app');
        Route::any('getusers', [NotificationController::class, 'getusers'])->name('notification.getusers');

        //Result Manager
        Route::any('view-results/{fantasy_type}', [ResultController::class, 'view'])->name('result.view');
        Route::any('view-seriesdetail/{seriesid}', [ResultController::class, 'seriesdetail'])->name('result.seriesdetail');
        Route::any('matchcontests/{matchkey}', [ResultController::class, 'matchcontests'])->name('result.matchcontests');
        Route::any('matchcancel', [ResultController::class, 'matchcancel'])->name('result.matchcancel');
        Route::any('matchwinnerdeclear', [ResultController::class, 'matchwinnerdeclear'])->name('result.matchwinnerdeclear');
        Route::any('/give_influencer_bonus', [InfluencerBonusController::class, 'give_influencer_bonus'])->name('give_influencer_bonus');
        Route::any('viewwinners/{matchkey}', [ResultController::class, 'viewwinners'])->name('result.viewwinners');
        Route::any('viewjoinedusers/{challengeid}', [ResultController::class, 'viewjoinedusers'])->name('result.viewjoinedusers');
        Route::any('viewchallengewinners/{challengeid}', [ResultController::class, 'viewchallengewinners'])->name('result.viewchallengewinners');
        Route::any('viewteam/{matchkey}/{teamid}', [ResultController::class, 'viewteam'])->name('result.viewteam');
        Route::any('matchscore/{matchkey}', [ResultController::class, 'matchscore'])->name('result.matchscore');


        //  Stock Manager Routes

        Route::any('view-stockmatches', [StockMatchController::class, 'view'])->name('stock.matches');
        Route::any('view-company', [StockMatchController::class, 'company'])->name('stock.company');
        Route::any('view-commodity', [StockMatchController::class, 'commodity'])->name('stock.commodity');
        Route::any('view-exchange', [StockMatchController::class, 'exchange'])->name('stock.exchange');

        //StockCategory Manager
        Route::any('add-stockcategory', [StockCategoryController::class, 'index'])->name('stockcategory.create');
        Route::any('edit-stockcategory/{id}', [StockCategoryController::class, 'edit'])->name('stockcategory.edit');
        Route::any('delete-stockcategory/{id}', [StockCategoryController::class, 'deletecategory'])->name('stockcategory.deletecategory');
        Route::any('view-stockcategory', [StockCategoryController::class, 'view'])->name('stockcategory.view');

        Route::post('get_stockcontest_category', [HomeController::class, 'get_stockcontest_category'])->name('get_stockcontest_category');

        //StockContest Manager
        Route::any('add-stockglobalcontest', [StockContestController::class, 'index'])->name('stockglobalcontest.create');
        Route::any('edit-stockglobalcontest/{id}', [StockContestController::class, 'edit'])->name('stockglobalcontest.edit');
        Route::any('delete-stockglobalcontest', [StockContestController::class, 'deleteglobalcontest'])->name('stockglobalcontest.deleteglobalcontest');
        Route::any('view-stockglobalcontest', [StockContestController::class, 'view'])->name('stockglobalcontest.view');
        Route::any('pricecard-stockglobalcontest/{id}', [StockContestController::class, 'globalpricecard'])->name('stockglobalcontest.pricecard');
        Route::any('pricecard-stockglobaldelete', [StockContestController::class, 'globalpricecarddelete'])->name('stockglobalcontest.globalpricecarddelete');


        //Custom StockContest Manager
        Route::any('add-stockcustomcontest', [StockContestController::class, 'addcustom'])->name('stockcustomcontest.create');
        Route::any('edit-stockcustomcontest/{id}', [StockContestController::class, 'editcustom'])->name('stockcustomcontest.edit');
        Route::any('delete-stockcustomcontest', [StockContestController::class, 'deletecustomcontest'])->name('stockcustomcontest.deletecustomcontest');
        Route::any('stockcancelcontest', [StockContestController::class, 'cancelcontest'])->name('stockcustomcontest.cancelcontest');
        Route::any('pricecard-stockcustomcontest/{id}', [StockContestController::class, 'custompricecard'])->name('stockcustomcontest.pricecard');
        Route::any('pricecard-stockcustomdelete', [StockContestController::class, 'custompricecarddelete'])->name('stockcustomcontest.custompricecarddelete');
        Route::any('stockcustomcontest', [StockContestController::class, 'stockcustomcontest'])->name('match.stockcustomcontest');
        Route::any('importstockcontest/{matchkey}', [StockContestController::class, 'importstockcontest'])->name('match.importstockcontest');
        Route::any('importstockmatchcontest', [StockContestController::class, 'importstockmatchcontest'])->name('match.importstockmatchcontest');

        //Result Manager
        Route::any('view-stockresults', [StockResultController::class, 'view'])->name('result.stockview');
    });
});

Route::group(['auth', 'middleware' => ['role:superadmin|admin|cricket|football|basketball|stock|kabaddi']], function () {
    Route::any('/importseries/{fantasy_type}', [EntityController::class, 'importseries'])->name('importseries');
    Route::any('/importmatch/{fantasy_type}', [EntityController::class, 'importmatch'])->name('importmatch');
    Route::any('/importmatchplayers/{matchkey}', [EntityController::class, 'importmatchplayers'])->name('importmatchplayers');

    // import stocks
    Route::any('/getallstockexchange', [StockController::class, 'getallstockexchange'])->name('getallstockexchange');
    Route::any('/getallcommodity', [StockController::class, 'getallcommodity'])->name('getallcommodity');
    Route::any('/getcompanylist/{id}', [StockController::class, 'getcompanylist'])->name('getcompanylist');
    Route::any('/getcompanyprofile/{id}', [StockController::class, 'getcompanyprofile'])->name('getcompanyprofile');
    Route::any('/getcompanyprice/{id}', [StockController::class, 'getcompanyprice'])->name('getcompanyprice');
});


// cron

Route::any('/importstockmatch', [StockCronController::class, 'importstockmatch'])->name('importstockmatch');
Route::any('/update_results_of_matches', [ResultController::class, 'update_results_of_matches'])->name('update_results_of_matches');
Route::any('/refund_amount', [ResultController::class, 'refund_amount'])->name('refund_amount');
//compression
Route::any('/getallmatchestocompress', [ResultController::class, 'getallmatchestocompress'])->name('getallmatchestocompress');
//selection percentage
Route::any('/gettransform', [ResultController::class, 'gettransform'])->name('gettransform');



require __DIR__ . '/auth.php';
