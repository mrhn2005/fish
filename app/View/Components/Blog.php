<?php

namespace App\View\Components;

use App\Models\Post;
use Illuminate\View\Component;

class Blog extends Component
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
        $posts = Post::where('status', 'published')->latest('id')->limit(3)->withTranslation(app()->getLocale())->with('category.translations')->get();
        $firstPost = $posts->first();
        $posts = $posts->forget(0);

        return view('components.blog', compact('posts', 'firstPost'));
    }
}
