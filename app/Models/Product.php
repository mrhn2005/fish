<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Support\Str;

class Product extends Model
{
    use Translatable, Resizable;
    protected $translatable = ['name', 'scientific_name', 'description', 'excerpt'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function getDecodedPhotosAttribute()
    {
        return json_decode($this->photos);
    }

    public function getSlugAttribute()
    {
        return Str::slug($this->title);
    }
}
