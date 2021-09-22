<?php

namespace App\Helpers;

use App;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Models\Category as Category;

class Helper
{
    //determine if right align language is used for styling and ordering, RTL language can be added in app/config
    public static function isRtl()
    {
        if (array_key_exists(App::getLocale(), config('app.rtlLocales'))) {
            return true;
        }

        return false;
    }

    //Front end menu view
    public static function menu()
    {
        $minutes = 1;
        $menu = Cache::remember('menu' . App::getLocale(), $minutes, function () {
            $categories = Category::withTranslations()->get();
            return menu('front', 'front.common.menu', ['categories' => $categories]);
        });

        return $menu;
    }

    // image handler

    public static function placeholder($imageRelative)
    {
        if ($imageRelative) {
            $image = Voyager::image($imageRelative);

            if ($image) {
                if (file_exists(public_path('storage') . DIRECTORY_SEPARATOR . $imageRelative)) {
                    return $image;
                }
            }
        }

        return Cache::rememberForever('placeholder2', function () {
            return 'https://via.placeholder.com/700x448.jpg?text=' . config('app.name');
        });
    }

    public static function getThumbnail(Model $model, string $size): string
    {
        if ($model->decodedPhotos && count($model->decodedPhotos)) {
            return Voyager::image($model->getThumbnail($model->decodedPhotos[0], $size));
        }

        return Cache::rememberForever('placeholder2', function () {
            return 'https://via.placeholder.com/700x448.jpg?text=' . config('app.name');
        });
    }

    public static function getThumbnailSingle(Model $model, string $size): string
    {
        return Voyager::image($model->thumbnail($size, 'image'));
    }


    public static function remove_space($name)
    {
        return preg_replace('/[\s,]+/', '', $name);
    }

    public static function color_badge($index)
    {
        $colors = array("warning", "info", "danger", "success");

        return $colors[$index % count($colors)];
    }

    public static function get_locale_url($locale, $url)
    {
        $segments = str_replace(url('/'), '', $url);
        $segments = array_filter(explode('/', $segments));

        array_shift($segments);
        array_unshift($segments, $locale);
        return url(implode('/', $segments));
    }

    public static function lazy_image($content)
    {
        $content = preg_replace('~<img[^>]*\K(?=src)~i', 'data-', $content);
        return $content;
    }

    public static function changeLanguage(string $locale)
    {
        if (App::getLocale() == $locale) {
            return '#';
        }

        $routeImplode = explode('/', request()->path(), 2);
        $routeImplode[0] = $locale;
        return '/' . implode('/', $routeImplode);
    }

    public static function getLink($link)
    {
        if (Str::contains($link,'http')) {
            return $link;
        }

        if ($link == '#' ) {
            return '#';
        }

        return '/' . App::getLocale() . $link;
    }
}
