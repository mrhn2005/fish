
<ul class="navigation clearfix">
    @foreach ($items as $item)
    <li class="current dropdown">
        <a href="{{Helper::getLink($item->link())}}">{{$item->getTranslatedAttribute('title')}}</a>
        @if ($item->children->count() > 0 )
            @include('template.menus.sub-menu', ['item' => $item])
        @endif
    </li>
    @endforeach

    <li class="dropdown">
        <a href="#">{{trans('labels.languages')}}</a>
        <ul>
        @foreach (config('voyager.multilingual.locales') as $locale)
            <li>
                <a href="{{Helper::changeLanguage($locale)}}">
                    {{$locale}}
                </a>
            </li>
        @endforeach
        </ul>
    </li>

 </ul>
