<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\View;

class PageController extends Controller
{
    public function show($pageName)
    {
        $view = "template.pages.{$pageName}.{$pageName}";
        if (View::exists("template.pages.{$pageName}.{$pageName}")) {
            return view($view);
        }

        abort(404);
    }
}
