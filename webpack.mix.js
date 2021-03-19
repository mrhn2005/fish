const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel applications. By default, we are compiling the CSS
 | file for the application as well as bundling up all the JS files.
 |
 */
 mix.styles([
    'resources/template/css/bootstrap.css',
    'resources/template/css/revolution-slider.css',
    'resources/template/css/style.css',
    'resources/template/css/responsive.css',
], 'public/css/main.css');

// mix.js([
//     // 'resources/template/js/jquery.js',
//     'resources/template/js/bootstrap.min.js',
//     'resources/template/js/custom.scrollbar.js',
//     // 'resources/template/js/revolution.min.js',
//     'resources/template/js/jquery.fancybox.pack.js',
//     'resources/template/js/jquery.fancybox-media.js',
//     'resources/template/js/owl.js',
//     'resources/template/js/wow.js',
//     'resources/template/js/appear.js',
//     // 'resources/template/js/isotope.js',
//     'resources/template/js/mixitup.js',
//     'resources/template/js/script.js',
// ], 'public/template/main.js');

// mix.copyDirectory('resources/template/fonts', 'public/template/fonts');

// mix.copyDirectory('resources/template/images', 'public/images');

// mix.copyDirectory('resources/template/css/assets', 'public/template/css/assets');

