<?php

namespace App\View\Components;

use App\Models\Social;
use Illuminate\View\Component;

class Footer extends Component
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
        $socials = Social::orderBy('position', 'asc')->limit(8)->withTranslation(app()->getLocale())->get();

        return view('components.footer', compact('socials'));
    }
}
