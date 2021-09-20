<!DOCTYPE html>
<html>
<!-- Mirrored from wp.hostlin.com/tyumen/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Mar 2021 18:15:05 GMT -->
<head>
<meta charset="utf-8">
<title>{{setting(App::getLocale().'.title')}}</title>
<!-- Stylesheets -->
<link href="{{asset('css/bootstrap.css')}}" rel="stylesheet">
<link href="{{asset('css/revolution-slider.css')}}" rel="stylesheet">
<link href="{{asset('css/style.css')}}" rel="stylesheet">
<link href="{{asset('css/responsive.css')}}" rel="stylesheet">
<link rel="shortcut icon" href="{{asset('images/favicon.png')}}" type="image/x-icon">
<link rel="icon" href="{{asset('images/favicon.png')}}" type="image/x-icon">
<style>
.search-box-outer {
    border: none;
}

.main-header {
    border-bottom: 1px solid #e0e0e0;
}
.main-header .main-box .logo-box .logo img {
    max-height: 80px;
}

.footer-logo img {
    max-height: 80px
}

.logo-box .logo img{
    max-height: 60px !important;
}
.product-name h5{
    white-space:nowrap;
    overflow:hidden;
    padding:22px 4px;
}

.product-photos {
    display: flex;
    margin:10px;
}
.product-photos figure{
    max-width:80px;
    margin-right:5px;
    object-fit: center;
}

.product-name a:hover {
    color: #f5a64a;
}

.sec-title:before {
    background:none;
}

.sec-title-two:before {
    background:none;
}

.contact-info-section .inner-box {
    height: 300px;
}

@media only screen and (max-width: 767px) {
    .main-slider .tp-caption {
        display: block !important;
    }
}

.contact-info-box .inner-box {
    padding: 45px 5px 70px;
}
/* .main-menu .navigation > li {
    padding: 15px 0px;
}
.main-header .main-box .logo-box {
    padding: 15px 0px;
}
.main-header .search-box-outer .dropdown-menu {
    top: 71px;
} */
</style>
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
</head>

<body>

<div class="page-wrapper">

    <!-- Preloader -->
    <div class="preloader" style="background-image:url({{Helper::placeholder(setting('site.loader')) ?: '../images/icons/preloader.gif'}});"></div>

    <x-header/>
    @if (session()->has('message'))
    <div class="container" style="margin-top:15px">
        <div class="alert alert-success">
            {{ session()->get('message') }}
        </div>
    </div>

    @endif
    @yield('content')

    <x-footer/>
</div>
<!--End pagewrapper-->

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-long-arrow-up"></span></div>

<script src="{{asset('js/jquery.js')}}"></script>
<script src="{{asset('js/bootstrap.min.js')}}"></script>
<script src="{{asset('js/jquery.mCustomScrollbar.concat.min.js')}}"></script>
<script src="{{asset('js/revolution.min.js')}}"></script>
<script src="{{asset('js/jquery.fancybox.pack.js')}}"></script>
<script src="{{asset('js/jquery.fancybox-media.js')}}"></script>
<script src="{{asset('js/owl.js')}}"></script>
<script src="{{asset('js/wow.js')}}"></script>
<script src="{{asset('js/appear.js')}}"></script>
<script src="{{asset('js/isotope.js')}}"></script>
<script src="{{asset('js/mixitup.js')}}"></script>
<script src="{{asset('js/script.js')}}"></script>
<script>
    $(document).ready(function() {
	$(".fancybox-thumb").fancybox({
		prevEffect	: 'none',
		nextEffect	: 'none',
		helpers	: {
			title	: {
				type: 'outside'
			},
			thumbs	: {
				width	: 50,
				height	: 50
			}
		}
	});
});
</script>
</body>

<!-- Mirrored from wp.hostlin.com/tyumen/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Mar 2021 18:19:46 GMT -->
</html>
