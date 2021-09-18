<ul>
    @foreach ($item->children as $child)
        <li class="{{$child->children->count() > 0 ? 'dropdown' : ''}}">
            <a href="{{'/' . App::getLocale() . $child->link()}}">
                {{$child->getTranslatedAttribute('title')}}
            </a>

            @if ($item->children->count() > 0 )
                @include('template.menus.sub-menu', ['item' => $child])
            @endif
        </li>
    @endforeach
</ul>
