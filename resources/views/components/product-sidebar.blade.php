<!--Sidebar Side-->
<div class="sidebar-side col-lg-3 col-md-4 col-sm-8 col-xs-12">
    <div class="sidebar">
        <!--Category Widget-->
        <div class="sidebar-widget sidebar-category">
            <div class="sidebar-title">
                <h2>{{trans('texts.product_categories')}}</h2>
            </div>
            <ul class="list">
                @foreach ($categories as $category)
                <li><a href="{{route(App::getLocale() . '.products.index', [SearchEnum::CATEGORY_ID => $category->id])}}">{{$category->getTranslatedAttribute('name')}} &ensp; ({{$category->products_count}})</a></li>
                @endforeach
            </ul>
        </div>
    </div>
</div>
<!--End Sidebar Side-->
