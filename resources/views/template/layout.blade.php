<!DOCTYPE html>
<html>

<!-- Mirrored from wp.hostlin.com/tyumen/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Mar 2021 18:15:05 GMT -->
<head>
<meta charset="utf-8">
<title>{{setting(App::getLocale().'.title')}}</title>
<!-- Stylesheets -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/revolution-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<style>
.search-box-outer {
    border: none;
}
.main-header .main-box .logo-box .logo img {
    max-height: 80px;
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
    {{-- <div class="preloader"></div> --}}

    <!-- Main Header-->
    <x-header/>
    <!--End Main Header -->

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

    <!--Footer Section-->
    <x-footer/>
    <!--End Footer Section-->

</div>
<!--End pagewrapper-->

<!--Scroll to top-->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="fa fa-long-arrow-up"></span></div>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/revolution.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/owl.js"></script>
<script src="js/wow.js"></script>
<script src="js/appear.js"></script>
<script src="js/isotope.js"></script>
<script src="js/mixitup.js"></script>
<script src="js/script.js"></script>
</body>

<!-- Mirrored from wp.hostlin.com/tyumen/ by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 07 Mar 2021 18:19:46 GMT -->
</html>
