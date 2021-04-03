<?php

namespace App\Models;

use TCG\Voyager\Models\Post as VoyagerPost;

class Post extends VoyagerPost
{
    public function scopeSearch($query, string $term = null)
    {
        if ($term) {
            $query->whereHas('translations', function ($query) use ($term) {
                $query->where('title', 'like', "%{$term}%");
            });
        }
    }
}
