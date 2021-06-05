<div class="auto-container">
    <div class="sec-title-two">
        <h2>Our Certificates</h2>
        {{-- <div class="title-text">We deliver to your door</div> --}}
    </div>
    <div class="row clearfix">
        @foreach ($certificates as $certificate)
            <div class="col-md-3 shop-item">
                <div class="inner-box">
                    <div class="image-box">
                        <a href="{{Helper::placeholder($certificate->photo)}}" class="fancybox-thumb" rel="fancybox-thumb" title="{{$certificate->getTranslatedAttribute('title')}}">
                            <img src="{{Helper::placeholder($certificate->photo)}}" alt="{{$certificate->title}}">
                        </a>
                    </div>
                </div>

            </div>
        @endforeach
    </div>
</div>
