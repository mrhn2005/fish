<?php

namespace App\View\Components;

use App\Models\Category;
use Illuminate\View\Component;

class CategoryProducts extends Component
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
        $categories = Category::with([
            'products' => function ($query) {
                $query->where('is_featured', true)->limit(6);
            }
        ])->limit(7)->get();

        return view('components.category-products', compact('categories'));
    }
}
