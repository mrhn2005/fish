<div class="row">
    @foreach ($certificates as $certificate)
        <div class="col-md-4">
            <figure class="image-box">
                <a href="{{Helper::placeholder($certificate->photo)}}" class="fancybox-thumb" rel="fancybox-thumb" title="{{$certificate->getTranslatedAttribute('title')}}">
                    <img src="{{Helper::placeholder($certificate->photo)}}" alt="{{$certificate->title}}">
                </a>
            </figure>
        </div>
    @endforeach
</div>
