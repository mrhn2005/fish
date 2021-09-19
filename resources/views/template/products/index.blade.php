@extends('template.layout')

@section('content')
     <section class="shop-single">
    	<div class="auto-container">
        	<div class="row clearfix">
                    @foreach ($products as $product)
                    <!--Shop Item-->
                    <div class="shop-item col-md-4 col-sm-6 col-xs-12">
                        @include('template.partials.product-card', ['product' => $product])
                    </div>
                    @endforeach
            </div>
            <div class="text-center">
                {!! $products->appends(request()->except('page'))->links() !!}
            </div>
        </div>
    </section>

@endsection
