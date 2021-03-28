
<ul class="navigation clearfix">
    @foreach ($items as $item)
    <li class="current dropdown">
        <a href="{{$item->link()}}">{{$item->getTranslatedAttribute('title')}}</a>
        <ul>
            @foreach ($item->children as $child)
                <li>
                    <a href="{{$child->link()}}">
                    {{$child->getTranslatedAttribute('title')}}
                    </a>
                </li>
            @endforeach
        </ul>
    </li>
    @endforeach

    <li class="dropdown">
        <a href="#">{{trans('labels.languages')}}</a>
        <ul>
        @foreach (config('voyager.multilingual.locales') as $locale)
            <li>
                <a href="#">
                    {{$locale}}
                </a>
            </li>
        @endforeach
        </ul>
    </li>

 </ul>
