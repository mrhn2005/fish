<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Models\Category as VoyagerCategory;

class Category extends VoyagerCategory
{
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
