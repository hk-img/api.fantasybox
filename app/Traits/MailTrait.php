<?php

namespace App\Traits;

use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use URL;
use App\Traits\SettingsTrait;
use Illuminate\Support\Facades\Mail;
use App\Mail\SendMailable;

trait MailTrait
{


    public static function commonmailformat($content, $name)
    {
        $emailcontent = '<!DOCTYPE html>
                        <html>
                        <head></head>
                        <body>
                        <table style="border-collapse: collapse; table-layout: fixed; margin: 0 auto; border-spacing: 0; padding: 0; height: 100% !important; width: 100% !important; font-weight: normal; color: #3e4152; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.4" height="100%" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <td style="background: #ffffff; padding: 16px 0">
                                <table style="max-width: 600px; margin: auto; border-spacing: 0; background: #673ab7; padding: 4px; border-radius: 16px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                    <tr>
                                        <td style="border-collapse: collapse">
                                        <table style="margin: auto; border-spacing: 0; background: white; border-radius: 12px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td style="border-collapse: collapse">
                                                <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td style="border-collapse: collapse; padding: 16px 32px" align="left" valign="middle">
                                                        <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td style="padding: 0; text-align: left; border-collapse: collapse" width="40" align="left" valign="middle">
                                                                <a href="#" style="text-decoration: none; color: #ffffff; outline: 0; border: 0; border-none" target="_blank" data-saferedirecturl="">
                                                                    <img src="'.asset('public/settings/' . SettingsTrait::settings('logo')).'" title="" alt="" style="margin: auto; text-align: center; border: 0; outline: none; text-decoration: none; min-height: 40px" align="middle" border="0" width="100" class="CToWUd" data-bit="iit">
                                                                </a>
                                                                </td>
                                                                <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                                <td align="right" valign="middle">
                                                                ' . date('M j, Y') . '
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 32px; background: #ffffff; font-family: \'roboto\', Arial, Helvetica, sans-serif">
                                                <p style="padding: 0; margin: 0">
                                                    Hi ' . $name . ' User,
                                                    <br><br>
                                                    '.$content.'
                                                    <br><br>
                                                    Good luck and enjoy the games!<br>The ' . $name . ' Team
                                                </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 16px 32px; border-top: 1px solid #eaeaed; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 12px">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td align="left" valign="middle" style="border-collapse: collapse; font-weight: normal">
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            About us
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Privacy Policy
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Terms and Conditions
                                                        </a>
                                                        </td>
                                                        <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-collapse: collapse; font-weight: normal; padding-top: 16px; font-style: italic; color: #7e818c" colspan="3">
                                                        Important Note: Do not share your OTP with anyone. We will never ask for your OTP or personal information via email. For any inquiries, contact our support team at <a href="#" style="color: #673ab7" target="_blank" data-saferedirecturl="">support@beatmysquad.com</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </body>
                        </html>';
        return $emailcontent;
    }


    public static function otpemail($otp, $name){
        $emailcontent = '<!DOCTYPE html>
                        <html>
                        <head></head>
                        <body>
                        <table style="border-collapse: collapse; table-layout: fixed; margin: 0 auto; border-spacing: 0; padding: 0; height: 100% !important; width: 100% !important; font-weight: normal; color: #3e4152; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.4" height="100%" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <td style="background: #ffffff; padding: 16px 0">
                                <table style="max-width: 600px; margin: auto; border-spacing: 0; background: #673ab7; padding: 4px; border-radius: 16px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                    <tr>
                                        <td style="border-collapse: collapse">
                                        <table style="margin: auto; border-spacing: 0; background: white; border-radius: 12px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td style="border-collapse: collapse">
                                                <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td style="border-collapse: collapse; padding: 16px 32px" align="left" valign="middle">
                                                        <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td style="padding: 0; text-align: left; border-collapse: collapse" width="40" align="left" valign="middle">
                                                                <a href="#" style="text-decoration: none; color: #ffffff; outline: 0; border: 0; border-none" target="_blank" data-saferedirecturl="">
                                                                    <img src="'.asset('public/settings/' . SettingsTrait::settings('logo')).'" title="" alt="" style="margin: auto; text-align: center; border: 0; outline: none; text-decoration: none; min-height: 40px" align="middle" border="0" width="100" class="CToWUd" data-bit="iit">
                                                                </a>
                                                                </td>
                                                                <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                                <td align="right" valign="middle">
                                                                ' . date('M j, Y') . '
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 32px; background: #ffffff; font-family: \'roboto\', Arial, Helvetica, sans-serif">
                                                <p style="padding: 0; margin: 0">
                                                    Hi ' . $name . ' User,
                                                    <br><br>
                                                    Your OTP verification code is: 
                                                    <br><br>
                                                    <div style="border: 2px solid #673ab7; padding: 10px; text-align: center; font-size: 24px; font-weight: bold; width: 120px; margin: 0 auto;">
                                                    ' . $otp . '
                                                    </div>
                                                    <br><br>
                                                    If you didn\'t request this OTP, please ignore this message.
                                                    <br><br>
                                                    Good luck and enjoy the games!<br>The ' . $name . ' Team
                                                </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 16px 32px; border-top: 1px solid #eaeaed; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 12px">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td align="left" valign="middle" style="border-collapse: collapse; font-weight: normal">
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            About us
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Privacy Policy
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Terms and Conditions
                                                        </a>
                                                        </td>
                                                        <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-collapse: collapse; font-weight: normal; padding-top: 16px; font-style: italic; color: #7e818c" colspan="3">
                                                        Important Note: Do not share your OTP with anyone. We will never ask for your OTP or personal information via email. For any inquiries, contact our support team at <a href="#" style="color: #673ab7" target="_blank" data-saferedirecturl="">support@beatmysquad.com</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </body>
                        </html>';


        return $emailcontent;
    }

    public static function documentreject($docname,$reason, $name)
    {
        $emailcontent = '<!DOCTYPE html>
                        <html>
                        <head></head>
                        <body>
                        <table style="border-collapse: collapse; table-layout: fixed; margin: 0 auto; border-spacing: 0; padding: 0; height: 100% !important; width: 100% !important; font-weight: normal; color: #3e4152; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.4" height="100%" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <td style="background: #ffffff; padding: 16px 0">
                                <table style="max-width: 600px; margin: auto; border-spacing: 0; background: #673ab7; padding: 4px; border-radius: 16px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                    <tr>
                                        <td style="border-collapse: collapse">
                                        <table style="margin: auto; border-spacing: 0; background: white; border-radius: 12px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td style="border-collapse: collapse">
                                                <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td style="border-collapse: collapse; padding: 16px 32px" align="left" valign="middle">
                                                        <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td style="padding: 0; text-align: left; border-collapse: collapse" width="40" align="left" valign="middle">
                                                                <a href="#" style="text-decoration: none; color: #ffffff; outline: 0; border: 0; border-none" target="_blank" data-saferedirecturl="">
                                                                    <img src="'.asset('public/settings/' . SettingsTrait::settings('logo')).'" title="" alt="" style="margin: auto; text-align: center; border: 0; outline: none; text-decoration: none; min-height: 40px" align="middle" border="0" width="100" class="CToWUd" data-bit="iit">
                                                                </a>
                                                                </td>
                                                                <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                                <td align="right" valign="middle">
                                                                ' . date('M j, Y') . '
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 32px; background: #ffffff; font-family: \'roboto\', Arial, Helvetica, sans-serif">
                                                <p style="padding: 0; margin: 0">
                                                    Hi ' . $name . ' User,
                                                    <br><br>
                                                    Your '.$docname.' Rejected By '.$name.'
                                                    <br><br>
                                                    Reason : '.$reason.'
                                                    <br><br>
                                                    Please Resubmit Your Document With Correct Details
                                                    <br><br>
                                                    Good luck and enjoy the games!<br>The ' . $name . ' Team
                                                </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 16px 32px; border-top: 1px solid #eaeaed; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 12px">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td align="left" valign="middle" style="border-collapse: collapse; font-weight: normal">
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            About us
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Privacy Policy
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Terms and Conditions
                                                        </a>
                                                        </td>
                                                        <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-collapse: collapse; font-weight: normal; padding-top: 16px; font-style: italic; color: #7e818c" colspan="3">
                                                        Important Note: Do not share your OTP with anyone. We will never ask for your OTP or personal information via email. For any inquiries, contact our support team at <a href="#" style="color: #673ab7" target="_blank" data-saferedirecturl="">support@beatmysquad.com</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </body>
                        </html>';
        return $emailcontent;
    }

    public static function documentapprove($docname, $name)
    {
        $emailcontent = '<!DOCTYPE html>
                        <html>
                        <head></head>
                        <body>
                        <table style="border-collapse: collapse; table-layout: fixed; margin: 0 auto; border-spacing: 0; padding: 0; height: 100% !important; width: 100% !important; font-weight: normal; color: #3e4152; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 14px; line-height: 1.4" height="100%" border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tbody>
                            <tr>
                                <td style="background: #ffffff; padding: 16px 0">
                                <table style="max-width: 600px; margin: auto; border-spacing: 0; background: #673ab7; padding: 4px; border-radius: 16px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                    <tr>
                                        <td style="border-collapse: collapse">
                                        <table style="margin: auto; border-spacing: 0; background: white; border-radius: 12px; overflow: hidden" align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <td style="border-collapse: collapse">
                                                <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td style="border-collapse: collapse; padding: 16px 32px" align="left" valign="middle">
                                                        <table style="border-spacing: 0; border-collapse: collapse" bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tbody>
                                                            <tr>
                                                                <td style="padding: 0; text-align: left; border-collapse: collapse" width="40" align="left" valign="middle">
                                                                <a href="#" style="text-decoration: none; color: #ffffff; outline: 0; border: 0; border-none" target="_blank" data-saferedirecturl="">
                                                                    <img src="'.asset('public/settings/' . SettingsTrait::settings('logo')).'" title="" alt="" style="margin: auto; text-align: center; border: 0; outline: none; text-decoration: none; min-height: 40px" align="middle" border="0" width="100" class="CToWUd" data-bit="iit">
                                                                </a>
                                                                </td>
                                                                <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                                <td align="right" valign="middle">
                                                                ' . date('M j, Y') . '
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </table>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 32px; background: #ffffff; font-family: \'roboto\', Arial, Helvetica, sans-serif">
                                                <p style="padding: 0; margin: 0">
                                                    Hi ' . $name . ' User,
                                                    <br><br>
                                                    Your '.$docname.' Approved Successfully.
                                                    <br><br>
                                                    Good luck and enjoy the games!<br>The ' . $name . ' Team
                                                </p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="border-collapse: collapse; padding: 16px 32px; border-top: 1px solid #eaeaed; font-family: \'roboto\', Arial, Helvetica, sans-serif; font-size: 12px">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tbody>
                                                    <tr>
                                                        <td align="left" valign="middle" style="border-collapse: collapse; font-weight: normal">
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            About us
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Privacy Policy
                                                        </a>
                                                        <a href="#" style="color: #673ab7; font-size: 12px; padding: 4px; height: 24px; display: inline-block; text-transform: capitalize; outline: 0; border: 0; border: none" target="_blank" data-saferedirecturl="">
                                                            Terms and Conditions
                                                        </a>
                                                        </td>
                                                        <td width="16" align="left" valign="middle" style="border-collapse: collapse">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="border-collapse: collapse; font-weight: normal; padding-top: 16px; font-style: italic; color: #7e818c" colspan="3">
                                                        Important Note: Do not share your OTP with anyone. We will never ask for your OTP or personal information via email. For any inquiries, contact our support team at <a href="#" style="color: #673ab7" target="_blank" data-saferedirecturl="">support@beatmysquad.com</a>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </body>
                        </html>';
        return $emailcontent;
    }


    public static function mailSmtpSend($datamessage)
    {
        Mail::to($datamessage['email'])->send(new SendMailable($datamessage));
    }
}
