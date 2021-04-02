@extends('template.layout')


@section('content')
     <section class="shop-single">
    	<div class="auto-container">
        	<div class="row clearfix">
            	<!--content column-->
            	<div class="content-column col-lg-9 col-md-8 col-sm-12 col-xs-12">
        			<div class="product-details">

                        <!--Basic Details-->
                        <div class="basic-details">
                            <div class="row clearfix">
                                <div class="image-column col-md-5 col-sm-12 col-xs-12">
                                    <figure class="image-box">
                                        <a href="{{Helper::placeholder($product->decodedPhotos[0] ?? null)}}" class="lightbox-image" title="{{$product->getTranslatedAttribute('name')}}">
                                            <img src="{{Helper::placeholder($product->decodedPhotos[0] ?? null)}}" alt="{{$product->name}}">
                                        </a>
                                    </figure>
                                </div>
                                <div class="info-column col-md-7 col-sm-12 col-xs-12">
                                    <div class="details-header">
                                        <h4>{{$product->getTranslatedAttribute('name')}}</h4>
                                        <div class="rating">
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                            <span class="fa fa-star"></span>
                                        </div>
                                    </div>
                                    <div class="text">
                                        {{$product->getTranslatedAttribute('excerpt')}}
                                    </div>
                                    <div class="item-categories">Category:&ensp; <a href="{{route('products.index', [SearchEnum::CATEGORY_ID => optional($product->category)->id])}}">{{optional($product->category)->getTranslatedAttribute('name')}}</a></div>

                                </div>
                            </div>
                        </div>
                        <!--Basic Details-->

                        <!--Product Info Tabs-->
                        <div class="product-info-tabs">

                            <!--Product Tabs-->
                            <div class="prod-tabs tabs-box" id="product-tabs">

                                <!--Tab Btns-->
                                <ul class="tab-btns tab-buttons clearfix">
                                    <li data-tab="#prod-description" class="tab-btn active-btn">description</li>
                                    <li data-tab="#prod-reviews" class="tab-btn">Features</li>
                                </ul>

                                <!--Tabs Content-->
                                <div class="tabs-container tabs-content">

                                    <!--Tab / Active Tab-->
                                    <div class="tab active-tab" id="prod-description">

                                        <div class="content">
                                            {!! $product->getTranslatedAttribute('description') !!}
                                        </div>
                                    </div>

                                    <!--Tab-->
                                    <div class="tab" id="prod-reviews">


                                    </div>

                                </div>
                            </div>

                        </div>
                        <!--End Product Info Tabs-->

                        @if($relatedProducts->count())
                        <!--Related Post-->
                        <div class="related-posts">
                        	<h2>RELATED PRODUCTS</h2>
                            <div class="row clearfix">
                                @foreach ($relatedProducts as $relatedProduct)
                                <!--Shop Item-->
                                <div class="shop-item col-md-4 col-sm-6 col-xs-12">
                                    @include('template.partials.product-card', ['product' => $relatedProduct])
                                </div>
                                @endforeach
                            </div>
                        </div>
                        <!--End Related Post-->
                        @endif

                    </div>
            	</div>
                <!--End content Side-->
                <x-product-sidebar/>

            </div>
        </div>
    </section>


@endsection
