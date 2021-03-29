<div>

    <section class="product-section">
    	<div class="auto-container">

        	<!--Sec Title Two-->
            <div class="sec-title-two">
                <h2>Our Products</h2>
                <div class="title-text">We deliver to your door</div>
            </div>
        	<!--Sortable Gallery-->
            <div class="mixitup-gallery">

                <!--Filter-->
                <div class="filters clearfix">
                    <ul class="filter-tabs filter-btns text-center">
                        <li class="filter active" data-role="button" data-filter="all">{{trans('labels.all')}}</li>
                        @foreach ($categories as $category)
                            <li class="filter {{$loop->first ? 'active' : ''}}" data-role="button" data-filter=".{{$category->slug}}">
                                {{$category->getTranslatedAttribute('name')}}
                            </li>
                        @endforeach
                    </ul>
                </div>

                <div class="filter-list row clearfix">
                    @foreach ($categories as $category)
                        @foreach ($category->products as $product)
                        <!--Shop Item-->
                        <div class="shop-item col-md-4 col-sm-6 col-xs-12 mix mix_all {{$category->slug}}">
                            <div class="inner-box">
                                <div class="image-box"><img src="{{ Helper::getThumbnail($product, 'medium') }}" alt="">
                                    <div class="overlay-box">
                                        <div class="option-box">
                                            <a href="#" class="like-btn"><span class="fa fa-eye"></span></a>
                                        </div>
                                        <!--lower box-->
                                        <div class="lower-box">
                                            <div class="rating">
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div>
                                            <h3><a href="#">{{$product->getTranslatedAttribute('name')}}</a></h3>
                                            {{-- <span class="price">$ 3.50</span> --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--Shop Item-->
                        @endforeach
                    @endforeach
                </div>

            </div>
            <!--End Sortable Gallery-->
        </div>
    </section>
</div>
