<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Resizable;
use TCG\Voyager\Traits\Translatable;

class Product extends Model
{
    use Translatable, Resizable;
    protected $translatable = ['name', 'scientific_name', 'description'];

    public function getDecodedPhotosAttribute()
    {
        return json_decode($this->photos);
    }
}
