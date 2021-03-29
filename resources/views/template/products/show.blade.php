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
                                    <div class="item-categories">Category:&ensp; <a href="#">{{optional($product->category)->getTranslatedAttribute('name')}}</a></div>

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

                        <!--Related Post-->
                        <div class="related-posts">
                        	<h2>RELATED PRODUCTS</h2>
                            <div class="row clearfix">

                                <!--Shop Item-->
                                <div class="shop-item col-md-4 col-sm-6 col-xs-12">
                                    <div class="inner-box">
                                        <div class="image-box"><img src="/images/resource/products/7.jpg" alt="">
                                            <div class="overlay-box">
                                                <div class="option-box">
                                                    <a href="shop-single.html" class="cart-btn"><span class="flaticon-shopping-cart-1"></span></a>
                                                    <a href="shop-single.html" class="like-btn"><span class="flaticon-heart-1"></span></a>
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
                                                    <h3><a href="shop-single.html">Carrot Juice</a></h3>
                                                    <span class="price">$ 7.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--Shop Item-->
                                <div class="shop-item col-md-4 col-sm-6 col-xs-12">
                                    <div class="inner-box">
                                        <div class="image-box"><img src="images/resource/products/8.jpg" alt="">
                                            <div class="overlay-box">
                                                <div class="option-box">
                                                    <a href="shop-single.html" class="cart-btn"><span class="flaticon-shopping-cart-1"></span></a>
                                                    <a href="shop-single.html" class="like-btn"><span class="flaticon-heart-1"></span></a>
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
                                                    <h3><a href="shop-single.html">Strawberry</a></h3>
                                                    <span class="price">$ 14.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--Shop Item-->
                                <div class="shop-item col-md-4 col-sm-6 col-xs-12">
                                    <div class="inner-box">
                                        <div class="image-box"><img src="images/resource/products/9.jpg" alt="">
                                            <div class="overlay-box">
                                                <div class="option-box">
                                                    <a href="shop-single.html" class="cart-btn"><span class="flaticon-shopping-cart-1"></span></a>
                                                    <a href="shop-single.html" class="like-btn"><span class="flaticon-heart-1"></span></a>
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
                                                    <h3><a href="shop-single.html">Lemon Juice</a></h3>
                                                    <span class="price">$ 6.00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!--End Related Post-->

                    </div>
            	</div>
                <!--End content Side-->

                <!--Sidebar Side-->
                <div class="sidebar-side col-lg-3 col-md-4 col-sm-8 col-xs-12">
                	<div class="sidebar">

                        <!--search box-->
                        <div class="sidebar-widget search-box">
                        	<form method="post" action="http://wp.hostlin.com/tyumen/blog.html">
                                <div class="form-group">
                                    <input type="search" name="search-field" value="" placeholder="Search" required="">
                                    <button type="submit"><span class="icon fa fa-search"></span></button>
                                </div>
                            </form>
                        </div>

                        <!--Category Widget-->
                        <div class="sidebar-widget sidebar-category">
                        	<div class="sidebar-title">
                                <h2>PRODUCT CATEGORIES</h2>
                            </div>
                            <ul class="list">
                            	<li><a href="#">Vegetables &ensp; (10)</a></li>
                                <li><a href="#">Fruits &ensp; (25)</a></li>
                                <li><a href="#">Dry Fruits &ensp; (6)</a></li>
                                <li><a href="#">Organic Boxes &ensp; (4)</a></li>
                                <li><a href="#">Breads &ensp; (12)</a></li>
                                <li><a href="#">Juices &ensp; (3)</a></li>
                            </ul>
                        </div>

                        <!-- Price Filters -->
                        <div class="sidebar-widget price-filters rangeslider-widget">
                            <div class="sidebar-title">
                            	<h2>FILTER BY PRICE</h2>
                            </div>

                            <div class="outer-box">
                                <div class="range-slider-price noUi-target noUi-ltr noUi-horizontal noUi-background" id="range-slider-price"><div class="noUi-base"><div class="noUi-origin noUi-connect noUi-dragable" style="left: 0%;"><div class="noUi-handle noUi-handle-lower"></div></div><div class="noUi-origin noUi-background" style="left: 51.1111%;"><div class="noUi-handle noUi-handle-upper"></div></div></div></div>
                                <div class="form-group clearfix">
                                	<div class="pull-right">
                                    	<span class="left-val">$<input type="text" class="val-box text-left" id="min-value-rangeslider" readonly=""></span> - &ensp;<span class="right-val">$<input type="text" class="val-box text-right" id="max-value-rangeslider" readonly=""></span>
                                    </div>
                                    <div class="pull-left">
                                    	<button type="button" class="theme-btn btn-style-one">Filter</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Popular Tags -->
                        <div class="sidebar-widget popular-tags">
                        	<div class="sidebar-title">
                                <h2>PRODUCT TAGS</h2>
                            </div>
                            <a href="#">Dried Fruits</a>
                            <a href="#">Vegetables</a>
                            <a href="#">Fruits</a>
                            <a href="#">Juices</a>
                            <a href="#">Breads</a>
                        </div>

                    </div>
                </div>
                <!--End Sidebar Side-->

            </div>
        </div>
    </section>


@endsection
