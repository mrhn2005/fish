<div class="inner-box">
    <div class="image-box"><img src="{{ Helper::getThumbnail($product, 'medium') }}" alt="">
        <div class="overlay-box">
            <div class="option-box">
                <a href="{{route('products.show', ['id' => $product->id])}}" class="like-btn"><span
                        class="fa fa-eye"></span></a>
            </div>
            <!--lower box-->
            <div class="lower-box">
                {{-- <div class="rating">
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div> --}}

                {{-- <span class="price">$ 3.50</span> --}}
            </div>
        </div>
    </div>
    <div class="text-center product-name">
        <h5><a
                href="{{route('products.show', ['id' => $product->id])}}">{{$product->getTranslatedAttribute('name')}}</a>
        </h5>
    </div>
</div>
