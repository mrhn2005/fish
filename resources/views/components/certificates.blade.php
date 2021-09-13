<div class="auto-container">
    <div class="sec-title-two">
        <h2>Our Certificates</h2>
        {{-- <div class="title-text">We deliver to your door</div> --}}
    </div>
    <div class="row clearfix">
        @foreach ($certificates as $certificate)
            <div class="col-md-2 shop-item">
                <img src="{{Helper::placeholder($certificate->photo)}}" alt="{{$certificate->title}}" class="image-fluid mx-5">
            </div>
        @endforeach
    </div>
</div>
