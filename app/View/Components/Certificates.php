<?php

namespace App\View\Components;

use App\Models\Certificate;
use Illuminate\View\Component;

class Certificates extends Component
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
        $certificates = Certificate::orderBy('created_at')->limit(15)->get();

        return view('components.certificates', compact('certificates'));
    }
}
