<div>
    <footer class="main-footer footer-style-two">
    	<!--footer upper-->
    	<div class="footer-upper">
        	<div class="auto-container">
                <div class="row clearfix">

                	<!--big column-->
                	<div class="big-column col-md-6 col-sm-12 col-xs-12">
                    	<div class="row clearfix">

                            <div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            	<div class="footer-widget about-widget">
                                	<div class="widget-content">
                                    	<div class="footer-logo"><a href="{{route('home')}}"><img src="{{Helper::placeholder(setting('site.logo'))}}" alt="logo"></a></div>
                                        <div class="text">{{setting(App::getLocale() . '.footer-desc')}}</div>
                                        <ul class="social-icon-one">
                                            @foreach ($socials as $social)
                                                <li><a target="_blank" href="{{$social->getTranslatedAttribute('link')}}"><span class="{{$social->getTranslatedAttribute('icon')}}"></span></a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <!--Footer Column-->
                        	<div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            	<div class="footer-widget links-widget">
                                	<h2>INFORMATION</h2>
                                    <div class="widget-content">
                                    	<ul class="list">
                                            @foreach (menu('footer', '_json') as $item)
                                                <li><a href="{{$item->url}}">{{$item->getTranslatedAttribute('title')}}</a></li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!--big column-->
                    <div class="big-column col-md-6 col-sm-12 col-xs-12">
                    	<div class="row clearfix">

                            <!--Footer Column-->


                            <!--Footer Column-->
                        	<div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            	<div class="footer-widget contact-widget">
                                	<h2>Contact</h2>
                                    <div class="widget-content">
                                        <ul class="contact-info">
                                        	<li><span>Address</span> {{setting(App::getLocale() . '.address')}}</li>
                                            <li><span>Call Us</span> {{setting(App::getLocale() . '.phone')}}</li>
                                            <li><span>Mail Us</span> {{setting('site.email')}}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>
					</div>

                </div>
            </div>
        </div>
        <!--End Footer Upper-->

        <!--footer bottom-->
        <div class="footer-bottom">
        	<div class="auto-container">
            	<div class="copyright">&copy; {{date("Y")}} {{config('app.name')}}. All Rights Reserved</div>
            </div>
        </div>
        <!--End Footer Bottom-->

    </footer>

</div>
