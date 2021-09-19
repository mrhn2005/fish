<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\App;

class Localize
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        $firstSegment = $request->segment(1);
        if (! in_array($firstSegment, array_merge(config('voyager.multilingual.locales'), ['admin', 'deploy']))) {
            $segments = $request->segments();
            $segments = Arr::prepend($segments, config('app.locale'));
            App::setLocale(config('app.locale'));
            return redirect()->to(implode('/', $segments));
        } elseif (in_array($firstSegment, config('voyager.multilingual.locales'))) {
            App::setLocale($firstSegment);
        } else {
            App::setLocale(config('app.locale'));
        }

        return $next($request);
    }
}
