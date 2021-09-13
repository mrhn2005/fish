<?php

namespace App\View\Components;

use App\Models\Banner;
use Illuminate\View\Component;

class Banners extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|string
     */
    public function render()
    {
        $banners = Banner::where('location', 'top')->orderBy('position')->limit(4)->get();

        return view('components.banners', compact('banners'));
    }
}
