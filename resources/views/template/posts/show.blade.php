@extends('template.layout')


@section('content')
<!--Blog Section-->
<section class="sidebar-page-container">
    <div class="auto-container">
        <div class="row clearfix">
            <div class="content-side col-lg-8 col-md-8 col-sm-12 col-xs-12">
                <div class="news-detail-section">
                    <!--News Style Three-->
                    <div class="news-style-three">
                        <div class="inner-box">
                            <div class="image-box">
                                <img src="{{Helper::placeholder($post->image)}}" alt="{{$post->title}}" />
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
                                    <h3>{{$post->getTranslatedAttribute('title')}}</h3>
                                    {!!$post->getTranslatedAttribute('body')!!}
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!--sidebar side-->
            <div class="sidebar-side col-lg-4 col-md-4 col-sm-8 col-xs-12">
                <div class="sidebar">

                    <!--search box-->
                    <div class="sidebar-widget search-box">
                        <form method="get" action="{{route(App::getLocale() . '.posts.index')}}">
                            <div class="form-group">
                                <input type="search" name="{{SearchEnum::TERM}}" value="" placeholder="{{trans('texts.search_here')}}" required>
                                <button type="submit" class="search-btn"><span class="fa fa-search"></span></button>
                            </div>
                        </form>
                    </div>

                    <!-- Popular Posts -->
                    <div class="sidebar-widget popular-posts">
                        <div class="sidebar-title"><h2>{{trans('texts.recent_posts')}}</h2></div>

                        @foreach ($latestPosts as $latestPost)
                        <article class="post">
                            <figure class="post-thumb"><a href="{{route(App::getLocale() . '.posts.show', $latestPost->id)}}"><img src="{{Helper::getThumbnailSingle($latestPost, 'small')}}" alt="{{$latestPost->title}}"></a></figure>
                            <div class="post-info">{{$latestPost->created_at->diffForHumans()}}</div>
                            <h4><a href="{{route(App::getLocale() . '.posts.show', $latestPost->id)}}">{{Str::limit($latestPost->getTranslatedAttribute('title'), 100)}}</a></h4>
                        </article>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End Blog Section-->

@endsection
