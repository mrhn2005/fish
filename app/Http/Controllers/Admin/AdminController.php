<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;

class AdminController extends Controller
{
    public function deploy()
    {
        Artisan::call('optimize');
        Artisan::call('view:cache');

        return response()->json(['result' => 'ok']);
    }
}
