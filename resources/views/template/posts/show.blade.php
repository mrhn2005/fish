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
                                <img src="{{Helper::placeholder($post->photo)}}" alt="{{$post->title}}" />
                            </div>
                            <!--Content Box-->
                            <div class="content-box">
                                <div class="upper-box clearfix">
                                    <div class="pull-left">
                                        <div class="date"><span class="icon fa fa-calendar"></span> {{$post->created_at->diffForHumans()}}</div>
                                    </div>
                                </div>

                                <div class="lower-box">
                                    <div class="title">{{optional($post->categort)->getTranslatedAttribute('name')}}</div>
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
                        <form method="post" action="#">
                            <div class="form-group">
                                <input type="search" name="search-field" value="" placeholder="Search" required="">
                                <button type="submit"><span class="icon fa fa-search"></span></button>
                            </div>
                        </form>
                    </div>

                    <!-- Popular Posts -->
                    <div class="sidebar-widget popular-posts">
                        <div class="sidebar-title"><h2>RECENT POSTS</h2></div>

                        @foreach ($latestPosts as $latestPost)
                        <article class="post">
                            <figure class="post-thumb"><a href="blog-detail.html"><img src="{{Helper::getThumbnailSingle($latestPost, 'small')}}" alt="{{$latestPost->title}}"></a></figure>
                            <div class="post-info">{{$latestPost->created_at->diffForHumans()}}</div>
                            <h4><a href="blog-detail.html">{{Str::limit($latestPost->getTranslatedAttribute('excerpt'), 100)}}</a></h4>
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
