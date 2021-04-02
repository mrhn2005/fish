<?php

namespace App\Http\Controllers;

use App\Enums\SearchEnum;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function show(int $id)
    {
        $product = Product::withTranslation(app()->getLocale())->with('category')->findOrFail($id);
        $relatedProducts = Product::withTranslation(app()->getLocale())
            ->where('category_id', $product->category_id)
            // ->where('id', '<>', $id)
            ->get();

        return view('template.products.show', compact('product', 'relatedProducts'));
    }


    public function index()
    {
        $products = Product::withTranslation(app()->getLocale())
            ->with('category')
            ->filter(request()->query())
            ->search(request(SearchEnum::TERM))
            ->paginate(16);

        return view('template.products.index', compact('products'));
    }
}
