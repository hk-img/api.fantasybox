<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;

class GeneralController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function view(Request $request)
    {
        if ($request->isMethod('post')) {
            $input = $request->all();
            unset($input['_token']);
            DB::table('generaltabs')->where('type', $input['type'])->update(['amount'=>$input['amount']]);
            return redirect()->route('general.view')->with('success', 'Successfully Updated !');
        } else {
            $collection = DB::table('generaltabs')->get();
            return view('admin.general.view', compact('collection'));
        }
    }
}
