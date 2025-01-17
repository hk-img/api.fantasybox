<?php
class RZPayout
{   
    
    public function postCurl($customerdata) {
        $ch = curl_init();
        $fields = array();
        $fields["name"] = $customerdata['name'];
        $fields["email"] = $customerdata['email'];
        $fields["contact"] = $customerdata['contact'];
        $fields["reference_id"] = $customerdata['reference_id'];
        $fields["type"] = $customerdata['type'];
        curl_setopt($ch, CURLOPT_URL, 'https://api.razorpay.com/v1/contacts');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        curl_setopt($ch, CURLOPT_USERPWD, 'rzp_live_7rp0RkSg5CjJx3' . ':' . '7d29F5x8ZOfyoyd9ZjeX0HjA');

        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Accept: application/json';
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $data = curl_exec($ch);
        if (empty($data) OR (curl_getinfo($ch, CURLINFO_HTTP_CODE != 200))) {
            $data = FALSE;
        } else {
            return json_decode($data, TRUE);
        }
        curl_close($ch);
    }

    public function fundaccid($contactdetail1){
        $ch = curl_init();
        $fields = array();
        $fields["contact_id"] = $contactdetail1['contact_id'];
        $fields["account_type"] = $contactdetail1['account_type'];
        $fields["bank_account"]['name'] = $contactdetail1['name'];
        $fields["bank_account"]['ifsc'] = $contactdetail1['ifsc'];
        $fields["bank_account"]['account_number'] = $contactdetail1['account_number'];
        curl_setopt($ch, CURLOPT_URL, 'https://api.razorpay.com/v1/fund_accounts');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        curl_setopt($ch, CURLOPT_USERPWD, 'rzp_live_7rp0RkSg5CjJx3' . ':' . '7d29F5x8ZOfyoyd9ZjeX0HjA');

        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Accept: application/json';
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $data = curl_exec($ch);
        if (empty($data) OR (curl_getinfo($ch, CURLINFO_HTTP_CODE != 200))) {
            $data = FALSE;
        } else {
            return json_decode($data, TRUE);
        }
        curl_close($ch);
    }

    public function ajaypayout($fundaccount){
        $ch = curl_init();
        $fields = array();
        $fields["account_number"] = $fundaccount['account_number'];
        $fields["fund_account_id"] = $fundaccount['fund_account_id'];
        $fields["amount"] = $fundaccount['amount'];
        $fields["currency"] = $fundaccount['currency'];
        $fields["mode"] = $fundaccount['mode'];
        $fields["purpose"] = $fundaccount['purpose'];
        curl_setopt($ch, CURLOPT_URL, 'https://api.razorpay.com/v1/payouts');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
        curl_setopt($ch, CURLOPT_USERPWD, 'rzp_live_7rp0RkSg5CjJx3' . ':' . '7d29F5x8ZOfyoyd9ZjeX0HjA');

        $headers = array();
        $headers[] = 'Content-Type: application/json';
        $headers[] = 'Accept: application/json';
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

        $data = curl_exec($ch);
        if (empty($data) OR (curl_getinfo($ch, CURLINFO_HTTP_CODE != 200))) {
            $data = FALSE;
        } else {
            return json_decode($data, TRUE);
        }
        curl_close($ch);
    }

}
?>
