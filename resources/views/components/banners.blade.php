<div>

    <section class="main-slider" data-start-height="650" data-slide-overlay="yes">

        <div class="tp-banner-container">
            <div class="tp-banner">
                <ul>
                    @foreach ($banners as $banner)
                    <li data-transition="fade" data-slotamount="1" data-masterspeed="1000" data-thumb="images/main-slider/image-1.jpg"  data-saveperformance="off"  data-title="Awesome Title Here">
                        <img src="{{Helper::placeholder($banner->photo)}}"  alt=""  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">

                        <div class="tp-caption sfb sfb tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="center" data-voffset="0"
                        data-speed="1500"
                        data-start="500"
                        data-easing="easeOutExpo"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.01"
                        data-endelementdelay="0.3"
                        data-endspeed="1200"
                        data-endeasing="Power4.easeIn">
                            {!!$banner->getTranslatedAttribute('title')!!}
                        </div>

                        <div class="tp-caption sfb sfb tp-resizeme"
                        data-x="center" data-hoffset="0"
                        data-y="center" data-voffset="80"
                        data-speed="1500"
                        data-start="1000"
                        data-easing="easeOutExpo"
                        data-splitin="none"
                        data-splitout="none"
                        data-elementdelay="0.01"
                        data-endelementdelay="0.3"
                        data-endspeed="1200"
                        data-endeasing="Power4.easeIn">
                            <a href="{{$banner->url}}" class="theme-btn btn-style-one">{{$banner->getTranslatedAttribute('subtitle')}}</a>
                        </div>

                        </li>
                    @endforeach
                </ul>

            	<div class="tp-bannertimer"></div>
            </div>
        </div>
    </section>
</div>
