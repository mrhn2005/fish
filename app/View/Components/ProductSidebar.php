<?php

namespace App\View\Components;

use App\Models\Category;
use Illuminate\View\Component;

class ProductSidebar extends Component
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
        $categories = Category::withTranslation(app()->getLocale())->limit(6)->withCount('products')->get();

        return view('components.product-sidebar', compact('categories'));
    }
}
