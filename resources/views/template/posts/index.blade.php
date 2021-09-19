@extends('template.layout')


@section('content')
<!--Blog Section-->
<section class="blog-section blog-page">
    <div class="auto-container">
        <div class="row clearfix">

            @foreach ($posts as $post)
            <!--News Style Three-->
            <div class="news-style-three col-lg-4 col-md-6 col-sm-6 col-xs-12">
                <div class="inner-box">
                    <div class="image-box">
                        <a href="{{route(App::getLocale() . '.posts.show', $post->id)}}"><img src="{{Helper::getThumbnailSingle($post, 'medium')}}" alt="{{$post->title}}" /></a>
                    </div>
                    <!--Content Box-->
                    <div class="content-box">
                        <div class="upper-box clearfix">
                            <div class="pull-left">
                                <div class="date"><span class="icon fa fa-calendar"></span> {{$post->created_at->diffForHumans()}}</div>
                            </div>
                        </div>

                        <div class="lower-box">
                            <div class="title">{{optional($post->category)->getTranslatedAttribute('name')}}</div>
                            <h3><a href="{{route(App::getLocale() . '.posts.show', $post->id)}}">{{$post->getTranslatedAttribute('title')}}</a></h3>
                            <div class="text">{{Str::limit($post->getTranslatedAttribute('excerpt'), 100)}}</div>
                            <a href="{{route(App::getLocale() . '.posts.show', $post->id)}}" class="read-more">Read More</a>
                        </div>

                    </div>
                </div>
            </div>
            @endforeach

        </div>

    </div>
</section>
<!--End Blog Section-->
@endsection
