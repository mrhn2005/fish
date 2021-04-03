<?php

namespace App\Http\Controllers;

use App\Enums\SearchEnum;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function show(int $id)
    {
        $post = Post::withTranslation(app()->getLocale())->with('category')->findOrFail($id);
        $latestPosts = Post::withTranslation(app()->getLocale())
            ->latest('id')
            ->limit(4)
            ->get();

        return view('template.posts.show', compact('post', 'latestPosts'));
    }


    public function index()
    {
        $posts = Post::withTranslation(app()->getLocale())
            ->with('category')
            ->search(request(SearchEnum::TERM))
            ->paginate(16);

        return view('template.posts.index', compact('posts'));
    }
}
