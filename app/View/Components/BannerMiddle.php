<?php

namespace App\View\Components;

use App\Models\Banner;
use Illuminate\View\Component;

class BannerMiddle extends Component
{
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|string
     */
    public function render()
    {
        $banner = Banner::where('location', 'middle')->orderBy('position')->first();

        return view('components.banner-middle', compact('banner'));
    }
}
