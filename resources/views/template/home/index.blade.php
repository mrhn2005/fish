@extends('template.layout')


@section('content')
     <!--Main Slider-->
     <x-banners/>
     <!--End Main Slider-->

     <!--Welcome Section-->
     <x-welcome/>
     <!--End Welcome Section-->

     <!--Shop Banner-->
     <x-banner-middle/>
     <!--End Shop Banner-->

     <!--Product Section-->
     <x-category-products/>
     <!--End product Section-->

     <!--Blog Section-->
     <x-blog/>
     <!--End Blog Section-->
@endsection
