@extends('template.layout')


@section('content')
     <!--Contact Section-->
    <section class="contact-section">
    	<div class="auto-container">
            <div class="contact-info-section">
                <div class="row clearfix">
                	<!--Contact Info Box-->
                	<div class="contact-info-box col-md-4 col-sm-6 col-xs-12">
                    	<div class="inner-box">
                        	<div class="icon-box"><span class="icon flaticon-location-pin"></span></div>
                            <h3>{{trans('text.address')}}</h3>
                            <div class="text">{!!setting(App::getLocale() . '.addresses')!!}</div>
                            <div class="large-icon"><span class="icon flaticon-location-pin"></span></div>
                        </div>
                    </div>
                    <!--Contact Info Box-->
                    <div class="contact-info-box col-md-4 col-sm-6 col-xs-12">
                    	<div class="inner-box">
                        	<div class="icon-box"><span class="icon flaticon-headphones"></span></div>
                            <h3>{{trans('text.call_us')}}</h3>
                            <div class="text">{!!setting('site.phones')!!}</div>
                            <div class="large-icon"><span class="icon flaticon-headphones"></span></div>
                        </div>
                    </div>
                    <!--Contact Info Box-->
                    <div class="contact-info-box col-md-4 col-sm-6 col-xs-12">
                    	<div class="inner-box">
                        	<div class="icon-box"><span class="icon flaticon-business-2"></span></div>
                            <h3>{{trans('text.mail_us')}}</h3>
                            <div class="text">{{setting('site.email')}}</div>
                            <div class="large-icon"><span class="icon flaticon-business-2"></span></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="contact-form-section">
            	<div class="row clearfix">
                	<!--Map Column-->
                	<div class="map-column col-md-5 col-sm-12 col-xs-12">

                        <div class="map-outer">
							<!--Map Canvas-->
                            <iframe src="https://maps.google.it/maps?q=گروه صنایع تحفه&amp;output=embed" width="100%" height="450px" frameborder="1" style="border:2px" allowfullscreen></iframe>

                		</div>

                    </div>

                    <!--form column-->
                    <div class="form-column col-md-6 col-sm-12 col-xs-12">

                        <!-- Comment Form -->
                        <div class="contact-form">
                            <h2>{{trans('texts.send_us_a_message')}}</h2>
                            <!--Comment Form-->
                            <form method="post" action="{{route(App::getLocale() . '.contacts.store')}}" id="contact-form-2">
                                @csrf
                                <div class="form-group">
                                	<input type="text" name="username" placeholder="{{trans('texts.name')}} *" required>
                                </div>

                                <div class="form-group">
                                    <input type="email" name="email" placeholder="{{trans('texts.email')}}" required>
                                </div>

                                <div class="form-group">
                                    <input type="text" name="subject" placeholder="{{trans('texts.subject')}}">
                                </div>

                                <div class="form-group">
                                    <textarea name="message" placeholder="{{trans('texts.message')}} *"></textarea>
                                </div>

                                <div class="form-group">
                                    <button class="theme-btn btn-style-one" type="submit" name="submit-form">{{trans('texts.send_message')}}</button>
                                </div>
                            </form>

                        </div>
                        <!--End Comment Form -->

                    </div>
                </div>
            </div>

        </div>
    </section>
    <!--End Contact Section-->



@endsection
