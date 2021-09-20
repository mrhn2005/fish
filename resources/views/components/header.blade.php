<div>

    <header class="main-header">

        <!-- Main Box -->
    	<div class="main-box">
        	<div class="auto-container">
            	<div class="outer-container clearfix">
                    <!--Logo Box-->
                    <div class="logo-box">
                        <div class="logo"><a href="{{route(App::getLocale() . '.home')}}"><img src="{{Helper::placeholder(setting('site.logo'))}}" alt="logo"></a></div>
                    </div>

                    <!--Nav Outer-->
                    <div class="nav-outer clearfix">
                        <!-- Main Menu -->
                        <nav class="main-menu">
                            <div class="navbar-header">
                                <!-- Toggle Button -->
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>

                            <div class="navbar-collapse collapse clearfix">
                                {{menu('header', 'template.menus.header-menu')}}
                            </div>
                        </nav>
                        <!-- Main Menu End-->

                        <!--Right Info-->
                        <div class="info-options">
                        	<!--Info Block-->
                            <div class="info-block clearfix">
                                <!--Search Box-->
                                <div class="search-box-outer">
                                    <div class="dropdown">
                                        <button class="search-box-btn dropdown-toggle" type="button" id="dropdownMenu3" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-search"></span></button>
                                        <ul class="dropdown-menu pull-right search-panel" aria-labelledby="dropdownMenu3">
                                            <li class="panel-outer">
                                                <div class="form-container">
                                                    <form method="get" action="{{route(App::getLocale() . '.products.index')}}">
                                                        <div class="form-group">
                                                            <input type="search" name="{{SearchEnum::TERM}}" value="" placeholder="{{trans('texts.search_here')}}" required>
                                                            <button type="submit" class="search-btn"><span class="fa fa-search"></span></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!--Nav Outer End-->

            	</div>
            </div>
        </div>

    </header>
</div>
