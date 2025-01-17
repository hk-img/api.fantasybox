<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use DB;
use Illuminate\Support\Facades\Auth;

class CheckBlockedStatus
{
    public function handle($request, Closure $next)
    {
        $mobile = $request->input('mobile');
        if (!empty($mobile)) {
            $user = DB::table('users')
                ->where('mobile', $mobile)
                ->first();
        } elseif(isset(Auth::user()->id)) {
            $user = DB::table('users')
                ->where('id', Auth::user()->id)
                ->first();
        }
        if (isset($user) && $user->status == 0) {
            return response()->json([
                'success' => false,
                'message' => '⚠️ This user is blocked! Please contact the administrator for assistance. ⚠️',
                'data' => ['error' => 'User Blocked'],
            ], 403);
        }
        return $next($request);
    }
}
