<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Validator;
use Redirect;
use Hash;
use App\Traits\SettingsTrait;
use Carbon\Carbon;

class InfluencerBonusController extends Controller
{
    public $influencers = [];

    public function give_influencer_bonus()
    {

        $matchkey = request()->get('matchkey');

        $challenges = DB::table('matchchallenges')->where('matchkey', $matchkey)->where('status', '!=', 'canceled')->select('id', 'entryfee', 'is_bonus', 'bonus_percentage')->get();

        if (!empty($challenges->toArray())) {

            foreach ($challenges as $challenge) {

                $challenge_joined_users = DB::table('joinedleauges')->where('challengeid', $challenge->id)->select('userid', 'id')->get();

                # Admin Amt Received
                if ($challenge->is_bonus) {

                    $bonus_allowed = ($challenge->entryfee * $challenge->bonus_percentage) / 100;

                    $remaining_entryfee = $challenge->entryfee - $bonus_allowed;

                    $admin_amt_received = $remaining_entryfee * count($challenge_joined_users);
                } else {

                    $admin_amt_received = $challenge->entryfee * count($challenge_joined_users);
                }

                # Final Result Amount
                $final_result_amt = DB::table('finalresults')->where('challengeid', $challenge->id)->sum('amount');

                if ($final_result_amt > $admin_amt_received) {
                    $profit = $final_result_amt - $admin_amt_received;
                } else {
                    $profit = $admin_amt_received - $final_result_amt;
                }

                # Find influencer users
                foreach ($challenge_joined_users as $user) {
                    $is_influencer = $this->is_influencer($user->userid);
                    if ($is_influencer) {

                        $this->influencers[$challenge->id][$is_influencer]['count'] = !empty($this->influencers[$challenge->id][$is_influencer]) ?
                            $this->influencers[$challenge->id][$is_influencer]['count'] + 1 :
                            1;

                        $this->influencers[$challenge->id][$is_influencer]['refer'][] = $user->userid;
                        $this->influencers[$challenge->id][$is_influencer]['joinid'][] = $user->id;
                    }
                }


                // # Give influencer profit according to percentage
                if (!empty($this->influencers)) {

                    foreach ($this->influencers[$challenge->id] as $influencer => $total_refer) {

                        $influencer_percentage = DB::table('users')->where('id', $influencer)->first(['percentage', 'type']);

                        $influencer_profit = ((($profit * $total_refer['count']) / count($challenge_joined_users)) * $influencer_percentage->percentage) / 100;

                        $influencer_profit = number_format($influencer_profit, 2, '.', '');

                        $fromid = $total_refer['refer'];
                        $joinid = $total_refer['joinid'];
                        $this->give_influencer_profit($influencer, $influencer_profit, $fromid, $matchkey, $challenge->id, $joinid);
                    }

                    $this->influencers = [];
                }
            }
            return redirect()->back()->with('success', 'Bonus reflected to Influencers Account.');
        } else {
            return redirect()->back()->with('danger', 'No Contest available for the Influencers Account.');
        }
    }

    public function is_influencer($id)
    {

        $refer = DB::table('users')->where('id', $id)->value('refer_id');

        $is_influencer = DB::table('users')->where('id', $refer)->where('type', 'influencer')->exists();
        if (!$is_influencer) {
            return $refer;
        } else {
            return $is_influencer ? $refer : false;
        }
    }


    public function give_influencer_profit($influencer, $profit, $fromid, $matchkey, $challengeid, $joinid)
    {

        $influencer_current_wallet = DB::table('userbalance')
            ->where('user_id', $influencer)
            ->first();
        $exist_transaction = DB::table('transactions')->whereIn('type', 'influencer Bonus')->where('challengeid', $challengeid)->where('userid', $influencer)->first();

        if (empty($exist_transaction)) {
            # Make a transaction 
            $bal_fund_amt = number_format($influencer_current_wallet->balance, 2, '.', '');;
            $bal_win_amt = number_format($influencer_current_wallet->winning, 2, '.', '');;
            $bal_bonus_amt = number_format($influencer_current_wallet->bonus, 2, '.', '');;

            $influencer_updated_wallet['winning'] = number_format($influencer_current_wallet->winning + $profit, 2, '.', '');;

            DB::table('userbalance')->where('id', $influencer_current_wallet->id)->update($influencer_updated_wallet);

            $total_available_amt = number_format($influencer_current_wallet->balance + $influencer_updated_wallet['winning'] + $influencer_current_wallet->bonus, 2, '.', '');

            $transactionsdata['userid'] = $influencer;
            $transactionsdata['type'] = 'Influencer Bonus';


            $transactionsdata['transaction_id'] = SettingsTrait::settings('short_name') . '-YP-' . time() . $influencer;
            $transactionsdata['transaction_by'] = 'wallet';
            $transactionsdata['challengeid'] = $challengeid;
            $transactionsdata['amount'] = number_format($profit, 2, '.', '');
            $transactionsdata['paymentstatus'] = 'confirmed';
            $transactionsdata['bal_fund_amt'] = number_format($bal_fund_amt, 2, '.', '');;
            $transactionsdata['bal_win_amt'] = number_format($influencer_updated_wallet['winning'], 2, '.', '');
            $transactionsdata['bal_bonus_amt'] = number_format($bal_bonus_amt, 2, '.', '');;
            $transactionsdata['total_available_amt'] = number_format($total_available_amt, 2, '.', '');
            DB::table('transactions')->insert($transactionsdata);
        }
        foreach ($fromid as $key => $user) {

            $influencerbonus['userid'] = $influencer;
            $influencerbonus['fromid'] = $user;
            $influencerbonus['amount'] = number_format($profit / count($fromid), 2, '.', '');
            $influencerbonus['matchkey'] = $matchkey;
            $influencerbonus['joinid'] = $joinid[$key];
            $influencerbonus['challengeid'] = $challengeid;
            $influencerbonus['txnid'] = SettingsTrait::settings('short_name') . '-IF-' . time() . $influencer;
            $influencerbonus['type'] = 'Influencer Bonus';
            $existdata = DB::table('influencer_bonus')->where('matchkey', $matchkey)->where('joinid', $joinid[$key])->first();
            if (empty($existdata)) {
                DB::table('influencer_bonus')->insert($influencerbonus);
            }
        }
    }
}
