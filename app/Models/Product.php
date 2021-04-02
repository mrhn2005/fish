<?php

namespace App\Models;

use App\Enums\SearchEnum;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Validator;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;
use Illuminate\Support\Str;

class Product extends Model
{
    use Translatable, Resizable;
    protected $translatable = ['name', 'scientific_name', 'description', 'excerpt'];

    public function scopeFilter($query, array $filters)
    {
        $data = Validator::validate($filters, [
            SearchEnum::CATEGORY_ID => ['nullable', 'numeric'],
        ]);

        if (isset($data[SearchEnum::CATEGORY_ID])) {
            $query->where('category_id', $data[SearchEnum::CATEGORY_ID]);
        }
    }

    public function scopeSearch($query, string $term = null)
    {
        if ($term) {
            $query->whereHas('translations', function ($query) use ($term) {
                $query->where('name', 'like', "%{$term}%");
            });
        }
    }

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
