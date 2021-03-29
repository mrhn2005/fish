<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function show(int $id)
    {
        $product = Product::withTranslation(app()->getLocale())->with('category')->findOrFail($id);

        return view('template.products.show', compact('product'));
    }
}
