<div>
    <section class="shop-banner" style="background-image:url({{Helper::placeholder($banner->photo)}});">
    	<div class="auto-container">
        	{!! $banner->getTranslatedAttribute('title') !!}
            <a href="{{Helper::getLink($banner->url)}}" class="theme-btn btn-style-one">{{ $banner->getTranslatedAttribute('subtitle') }}</a>
        </div>
    </section>
</div>
