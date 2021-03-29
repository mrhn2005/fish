<div>
    <section class="welcome-section">
        <div class="container">

            <div class="row">
                <div class="col-md-7">
                    {{-- <div class="content-column">
                        <div class="inner-box"> --}}
                            <!--Sec Title-->
                            {!! setting(App::getLocale() . '.welcome') !!}
                        {{-- </div>
                    </div> --}}
                </div>
                <div class="col-md-5">
                    <div class="text-center">
                        <img class="img-fluid" src="{{Helper::placeholder(setting(App::getLocale() . '.welcome-image'))}}" alt="welcome-image" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
