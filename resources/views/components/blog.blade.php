<div>

    <section class="blog-section">
    	<div class="auto-container">
        	<!--Sec Title Two-->
            <div class="sec-title-two">
                <h2>Our Blog</h2>
                <div class="title-text">Latest News</div>
            </div>

            <div class="row clearfix">
                @if($firstPost)
            	<!--New Blog-->
            	<div class="column col-md-6 col-sm-12 col-xs-12">
                	<div class="news-style-one">
                        <div class="inner-box">
                            <div class="image-box">
                                <a href="{{route('posts.show', $firstPost->id)}}"><img src="{{Helper::placeholder($firstPost->image)}}" alt="{{$firstPost->title}}" /></a>
                            </div>
                            <div class="lower-box">
                                <div class="title">{{optional($firstPost->category)->getTranslatedAttribute('name')}}</div>
                                <h3><a href="{{route('posts.show', $firstPost->id)}}">{{$firstPost->getTranslatedAttribute('title')}}</a></h3>
                                <div class="text">{{Str::limit($firstPost->getTranslatedAttribute('excerpt'), 90)}} </div>
                                <a href="{{route('posts.show', $firstPost->id)}}" class="read-more">Read More</a>
                            </div>
                        </div>
                	</div>
                </div>

                <!--New Blog Two-->
                <div class="column col-md-6 col-sm-12 col-xs-12">
                    @foreach ($posts as $post)
                    <div class="news-style-two">
                        <div class="inner-box">
                            <div class="clearfix">

                                <!--Image Column-->
                                <div class="image-column pull-{{$loop->first ? 'right' : 'left'}} col-md-6 col-sm-6 col-xs-12">
                                	<div class="image-box">
                                    	<a href="{{route('posts.show', $post->id)}}"><img src="{{Helper::getThumbnailSingle($post, 'medium')}}" alt="{{$post->title}}" /></a>
                                    </div>
                                </div>
                                <!--Content Column-->
                                <div class="content-column pull-{{$loop->first ? 'left' : 'right'}} col-md-6 col-sm-6 col-xs-12">
                                	<div class="content-box">
                                        <div class="inner">
                                            <div class="title">{{optional($post->category)->getTranslatedAttribute('name')}}</div>
                                            <h3><a href="{{route('posts.show', $post->id)}}">{{$post->getTranslatedAttribute('title')}}</a></h3>
                                            <div class="text">{{Str::limit($post->getTranslatedAttribute('excerpt'), 90)}}</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    @endforeach

                </div>
                @endif
            </div>

        </div>
    </section>
</div>
