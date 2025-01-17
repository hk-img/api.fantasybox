<!DOCTYPE html>
<html lang="en">
@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp

<head>
    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <!-- Title -->
    <title>@yield('title')</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="{{ asset('/public/settings/' . SettingsTrait::settings('favicon')) }}">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&amp;display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="{{ asset('/public/assets/css/vendor.min.css') }}">

    <!-- CSS Front Template -->
    <link rel="stylesheet" href="{{ asset('/public/assets/css/theme.minc619.css?v=1.0') }}">

    <link rel="preload" href="{{ asset('/public/assets/css/theme.min.css') }}" data-hs-appearance="default"
        as="style">
    <link rel="preload" href="{{ asset('/public/assets/css/theme-dark.min.css') }}" data-hs-appearance="dark"
        as="style">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="https://biati-digital.github.io/glightbox/dist/css/glightbox.css">
<script src="https://biati-digital.github.io/glightbox/dist/js/glightbox.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <style data-hs-appearance-onload-styles>
        * {
            transition: unset !important;
        }
    </style>

    <!-- ONLY DEV -->


    <!-- END ONLY DEV -->

    <script>
        window.hs_config = {
            "autopath": "@@autopath",
            "deleteLine": "hs-builder:delete",
            "deleteLine:build": "hs-builder:build-delete",
            "deleteLine:dist": "hs-builder:dist-delete",
            "previewMode": false,
            "startPath": "/{{ route('dashboard') }}",
            "vars": {
                "themeFont": "https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap",
                "version": "?v=1.0"
            },
            "layoutBuilder": {
                "extend": {
                    "switcherSupport": true
                },
                "header": {
                    "layoutMode": "default",
                    "containerMode": "container-fluid"
                },
                "sidebarLayout": "default"
            },
            "themeAppearance": {
                "layoutSkin": "default",
                "sidebarSkin": "default",
                "styles": {
                    "colors": {
                        "primary": "#377dff",
                        "transparent": "transparent",
                        "white": "#fff",
                        "dark": "132144",
                        "gray": {
                            "100": "#f9fafc",
                            "900": "#1e2022"
                        }
                    },
                    "font": "Inter"
                }
            },
            "languageDirection": {
                "lang": "en"
            },
            "skipFilesFromBundle": {
                "dist": ["assets/js/hs.theme-appearance.js", "assets/js/hs.theme-appearance-charts.js",
                    "assets/js/demo.js"
                ],
                "build": ["assets/css/theme.css",
                    "assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside-mini-cache.js",
                    "assets/js/demo.js", "assets/css/theme-dark.html", "assets/css/docs.css",
                    "assets/vendor/icon-set/style.html", "assets/js/hs.theme-appearance.js",
                    "assets/js/hs.theme-appearance-charts.js",
                    "node_modules/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.html",
                    "assets/js/demo.js"
                ]
            },
            "minifyCSSFiles": ["assets/css/theme.css", "assets/css/theme-dark.css"],
            "copyDependencies": {
                "dist": {
                    "*assets/js/theme-custom.js": ""
                },
                "build": {
                    "*assets/js/theme-custom.js": "",
                    "node_modules/bootstrap-icons/font/*fonts/**": "assets/css"
                }
            },
            "buildFolder": "",
            "replacePathsToCDN": {},
            "directoryNames": {
                "src": "./src",
                "dist": "./dist",
                "build": "./build"
            },
            "fileNames": {
                "dist": {
                    "js": "theme.min.js",
                    "css": "theme.min.css"
                },
                "build": {
                    "css": "theme.min.css",
                    "js": "theme.min.js",
                    "vendorCSS": "vendor.min.css",
                    "vendorJS": "vendor.min.js"
                }
            },
            "fileTypes": "jpg|png|svg|mp4|webm|ogv|json"
        }
        window.hs_config.gulpRGBA = (p1) => {
            const options = p1.split(',')
            const hex = options[0].toString()
            const transparent = options[1].toString()

            var c;
            if (/^#([A-Fa-f0-9]{3}){1,2}$/.test(hex)) {
                c = hex.substring(1).split('');
                if (c.length == 3) {
                    c = [c[0], c[0], c[1], c[1], c[2], c[2]];
                }
                c = '0x' + c.join('');
                return 'rgba(' + [(c >> 16) & 255, (c >> 8) & 255, c & 255].join(',') + ',' + transparent + ')';
            }
            throw new Error('Bad Hex');
        }
        window.hs_config.gulpDarken = (p1) => {
            const options = p1.split(',')

            let col = options[0].toString()
            let amt = -parseInt(options[1])
            var usePound = false

            if (col[0] == "#") {
                col = col.slice(1)
                usePound = true
            }
            var num = parseInt(col, 16)
            var r = (num >> 16) + amt
            if (r > 255) {
                r = 255
            } else if (r < 0) {
                r = 0
            }
            var b = ((num >> 8) & 0x00FF) + amt
            if (b > 255) {
                b = 255
            } else if (b < 0) {
                b = 0
            }
            var g = (num & 0x0000FF) + amt
            if (g > 255) {
                g = 255
            } else if (g < 0) {
                g = 0
            }
            return (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16)
        }
        window.hs_config.gulpLighten = (p1) => {
            const options = p1.split(',')

            let col = options[0].toString()
            let amt = parseInt(options[1])
            var usePound = false

            if (col[0] == "#") {
                col = col.slice(1)
                usePound = true
            }
            var num = parseInt(col, 16)
            var r = (num >> 16) + amt
            if (r > 255) {
                r = 255
            } else if (r < 0) {
                r = 0
            }
            var b = ((num >> 8) & 0x00FF) + amt
            if (b > 255) {
                b = 255
            } else if (b < 0) {
                b = 0
            }
            var g = (num & 0x0000FF) + amt
            if (g > 255) {
                g = 255
            } else if (g < 0) {
                g = 0
            }
            return (usePound ? "#" : "") + (g | (b << 8) | (r << 16)).toString(16)
        }
    </script>
</head>

<body class="has-navbar-vertical-aside navbar-vertical-aside-show-xl   footer-offset">

    <script src="{{ asset('/public/assets/js/hs.theme-appearance.js') }}"></script>

    <script src="{{ asset('/public/assets/vendor/hs-navbar-vertical-aside/dist/hs-navbar-vertical-aside-mini-cache.js') }}">
    </script>

    <!-- ========== HEADER ========== -->

    <header id="header"
        class="navbar navbar-expand-lg navbar-fixed navbar-height navbar-container navbar-bordered bg-white">
        <div class="navbar-nav-wrap">
            <!-- Logo -->
            <a class="navbar-brand" href="{{ route('dashboard') }}" aria-label="Front">
                <img class="navbar-brand-logo" src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}"
                    alt="Logo" data-hs-theme-appearance="default">
                <img class="navbar-brand-logo" src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}"
                    alt="Logo" data-hs-theme-appearance="dark">
                <img class="navbar-brand-logo-mini"
                    src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                    data-hs-theme-appearance="default">
                <img class="navbar-brand-logo-mini"
                    src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                    data-hs-theme-appearance="dark">
            </a>
            <!-- End Logo -->

            <div class="navbar-nav-wrap-content-start">
                <!-- Navbar Vertical Toggle -->
                <button type="button" class="js-navbar-vertical-aside-toggle-invoker navbar-aside-toggler">
                    <i class="bi-arrow-bar-left navbar-toggler-short-align"
                        data-bs-template='<div class="tooltip d-none d-md-block" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Collapse"></i>
                    <i class="bi-arrow-bar-right navbar-toggler-full-align"
                        data-bs-template='<div class="tooltip d-none d-md-block" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Expand"></i>
                </button>

                <!-- End Navbar Vertical Toggle -->
            </div>

            <div class="navbar-nav-wrap-content-end">
                <!-- Navbar -->
                <ul class="navbar-nav">

                    <li class="nav-item">
                        <!-- Account -->
                        <div class="dropdown">
                            <a class="navbar-dropdown-account-wrapper" href="javascript:;" id="accountNavbarDropdown"
                                data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="outside"
                                data-bs-dropdown-animation>
                                <div class="avatar avatar-sm avatar-circle">
                                    <img class="avatar-img" src="{{ Auth::user()->image }}" alt="Image Description">
                                    <span class="avatar-status avatar-sm-status avatar-status-success"></span>
                                </div>
                            </a>

                            <div class="dropdown-menu dropdown-menu-end navbar-dropdown-menu navbar-dropdown-menu-borderless navbar-dropdown-account"
                                aria-labelledby="accountNavbarDropdown" style="width: 16rem;">
                                <div class="dropdown-item-text">
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-sm avatar-circle">
                                            <img class="avatar-img" src="{{ Auth::user()->image }}"
                                                alt="Image Description">
                                        </div>
                                        <div class="flex-grow-1 ms-3">
                                            <h5 class="mb-0">{{ Auth::user()->name }}</h5>
                                            <p class="card-text text-body">{{ Auth::user()->email }}</p>
                                        </div>
                                    </div>
                                </div>

                                <div class="dropdown-divider"></div>

                                <a class="dropdown-item" href="{{ route('profile.edit') }}">Profile &amp; account</a>
                                <a class="dropdown-item" href="{{ route('password.edit') }}">Change Password</a>
                                @hasrole('subadmin')
                                    <a class="dropdown-item" href="{{ route('settings') }}">Settings</a>
                                @endhasrole
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{ route('logout') }}"
                                    onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">Sign
                                    out</a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                    @csrf
                                </form>
                            </div>
                        </div>
                        <!-- End Account -->
                    </li>
                </ul>
                <!-- End Navbar -->
            </div>
        </div>
    </header>

    <!-- ========== END HEADER ========== -->

    <!-- ========== MAIN CONTENT ========== -->
    <!-- Navbar Vertical -->

    <aside
        class="js-navbar-vertical-aside navbar navbar-vertical-aside navbar-vertical navbar-vertical-fixed navbar-expand-xl navbar-bordered bg-dark navbar-dark  ">
        <div class="navbar-vertical-container">
            <div class="navbar-vertical-footer-offset">
                <!-- Logo -->

                <a class="navbar-brand" href="{{ route('dashboard') }}" aria-label="Front">
                    <img class="navbar-brand-logo"
                        src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                        data-hs-theme-appearance="default">
                    <img class="navbar-brand-logo"
                        src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                        data-hs-theme-appearance="dark">
                    <img class="navbar-brand-logo-mini"
                        src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                        data-hs-theme-appearance="default">
                    <img class="navbar-brand-logo-mini"
                        src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}" alt="Logo"
                        data-hs-theme-appearance="dark">
                </a>

                <!-- End Logo -->

                <!-- Navbar Vertical Toggle -->
                <button type="button" class="js-navbar-vertical-aside-toggle-invoker navbar-aside-toggler">
                    <i class="bi-arrow-bar-left navbar-toggler-short-align"
                        data-bs-template='<div class="tooltip d-none d-md-block" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Collapse"></i>
                    <i class="bi-arrow-bar-right navbar-toggler-full-align"
                        data-bs-template='<div class="tooltip d-none d-md-block" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'
                        data-bs-toggle="tooltip" data-bs-placement="right" title="Expand"></i>
                </button>

                <!-- End Navbar Vertical Toggle -->

                <!-- Content -->
                <div class="navbar-vertical-content">
                    <div id="navbarVerticalMenu" class="nav nav-pills nav-vertical card-navbar-nav">
                        <div class="nav-item">
                            <a class="nav-link" href="{{ route('dashboard') }}" data-placement="left">
                                <i class="bi-house-door nav-icon"></i>
                                <span class="nav-link-title">Dashboard</span>
                            </a>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuUser" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuUser"
                                aria-expanded="false" aria-controls="navbarVerticalMenuUser">
                                <i class="bi bi-people-fill nav-icon"></i>
                                <span class="nav-link-title">User Manager</span>
                            </a>
                            <div id="navbarVerticalMenuUser" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('user.view') }}">View All Registered Users</a>
                                <a class="nav-link " href="{{ route('user.userswallet') }}">View Wallet Report</a>
                                <a class="nav-link " href="{{ route('user.adminwallet') }}">Admin Wallet</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuVerification" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuVerification"
                                aria-expanded="false" aria-controls="navbarVerticalMenuVerification">
                                <i class="nav-icon"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                        height="16" fill="currentColor" class="bi bi-person-vcard-fill"
                                        viewBox="0 0 16 16">
                                        <path
                                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z" />
                                    </svg></i>
                                <span class="nav-link-title">Verification Manager</span>
                            </a>
                            <div id="navbarVerticalMenuVerification" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('verification.viewpan') }}">View All Pan
                                    Requests</a>
                                <a class="nav-link " href="{{ route('verification.viewbank') }}">View All Bank
                                    Requests</a>
                                <a class="nav-link " href="{{ route('verification.viewaadhar') }}">View All Aadhar
                                    Requests</a>
                                <a class="nav-link " href="{{ route('verification.viewwithdrawal') }}">View All
                                    Withdrawal Requests</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuFund" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuFund"
                                aria-expanded="false" aria-controls="navbarVerticalMenuFund">
                                <i class="bi bi-cash-coin nav-icon"></i>
                                <span class="nav-link-title">Fund Manager</span>
                            </a>
                            <div id="navbarVerticalMenuFund" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('verification.receivedfund') }}">View Received
                                    Fund</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuNotification" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuNotification"
                                aria-expanded="false" aria-controls="navbarVerticalMenuNotification">
                                <i class="bi bi-bell-fill nav-icon"></i>
                                <span class="nav-link-title">Notification Manager</span>
                            </a>
                            <div id="navbarVerticalMenuNotification" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('notification.app') }}">App Notification</a>
                                <a class="nav-link " href="{{ route('notification.mail') }}">Email Notification</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuBanner" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuBanner"
                                aria-expanded="false" aria-controls="navbarVerticalMenuBanner">
                                <i class="bi bi-images nav-icon"></i>
                                <span class="nav-link-title">Banner Manager</span>
                            </a>
                            <div id="navbarVerticalMenuBanner" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('banner.create') }}">Add Banner</a>
                                <a class="nav-link " href="{{ route('banner.view') }}">View Banner</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuGeneraltab" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuGeneraltab"
                                aria-expanded="false" aria-controls="navbarVerticalMenuGeneraltab">
                                <i class="bi bi-gear-fill nav-icon"></i>
                                <span class="nav-link-title">General Tab Manager</span>
                            </a>
                            <div id="navbarVerticalMenuGeneraltab" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link" href="{{ route('general.view') }}">View All General Tabs</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuOffer" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuOffer"
                                aria-expanded="false" aria-controls="navbarVerticalMenuOffer">
                                <i class="nav-icon">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="16"
                                        height="16" viewBox="0 0 512.000000 512.000000"
                                        preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                            fill="currentColor" stroke="none">
                                            <path
                                                d="M2340 4959 c-635 -60 -1223 -369 -1631 -858 -256 -306 -441 -701
                                        -514 -1097 -143 -773 90 -1548 639 -2122 271 -283 664 -519 1047 -631 236 -68
                                        425 -95 679 -95 385 0 714 76 1055 243 741 364 1230 1051 1336 1881 16 122 16
                                        438 0 560 -36 287 -109 528 -236 785 -137 278 -277 470 -498 681 -500 477
                                        -1192 718 -1877 653z m965 -948 c45 -15 106 -44 137 -65 122 -81 226 -225 263
                                        -366 20 -73 19 -226 -1 -304 -35 -136 -140 -282 -262 -362 -72 -48 -195 -91
                                        -286 -99 -240 -21 -488 119 -595 336 -93 189 -93 369 0 558 134 272 455 402
                                        744 302z m-1650 -1856 l0 -560 -365 0 -365 0 -3 554 c-2 437 0 556 10 563 7 4
                                        173 7 368 5 l355 -2 0 -560z m659 394 c134 -23 325 -114 438 -210 l47 -39 198
                                        0 c109 0 215 -5 236 -11 49 -13 103 -61 117 -105 7 -19 10 -57 8 -84 -1 -28
                                        -1 -50 2 -50 3 0 147 66 320 146 354 164 375 170 450 120 99 -66 101 -196 4
                                        -273 -21 -16 -121 -85 -222 -152 -495 -330 -918 -543 -1152 -580 -44 -7 -85
                                        -7 -130 0 -171 27 -499 170 -862 377 l-98 56 0 407 0 408 83 4 c130 6 496 -3
                                        561 -14z" />
                                            <path
                                                d="M2990 3964 c-158 -34 -303 -149 -374 -296 -155 -322 32 -700 384
                                        -774 275 -58 555 114 635 389 22 75 22 219 0 294 -44 151 -147 275 -286 341
                                        -128 62 -229 74 -359 46z m27 -269 c39 -26 56 -62 56 -121 0 -64 -20 -99 -74
                                        -127 -38 -20 -86 -16 -125 9 -25 17 -54 81 -54 119 0 38 29 102 54 118 45 30
                                        99 30 143 2z m271 -6 c3 -16 -284 -487 -318 -523 -19 -20 -50 -16 -50 7 0 11
                                        294 491 323 525 13 17 41 11 45 -9z m48 -284 c56 -36 70 -151 25 -213 -42 -59
                                        -139 -62 -192 -6 -21 22 -24 35 -24 99 0 64 3 77 24 99 42 45 115 54 167 21z" />
                                            <path
                                                d="M2901 3634 c-12 -15 -21 -41 -21 -59 0 -40 34 -85 65 -85 43 0 68 32
                                        68 85 0 38 -4 52 -22 67 -33 26 -66 23 -90 -8z" />
                                            <path
                                                d="M3220 3350 c-14 -14 -20 -33 -20 -65 0 -79 66 -114 109 -59 59 75
                                        -24 189 -89 124z" />
                                        </g>
                                    </svg>
                                </i>

                                <span class="nav-link-title">Offer Manager</span>
                            </a>
                            <div id="navbarVerticalMenuOffer" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('offer.create') }}">Add Offer</a>
                                <a class="nav-link " href="{{ route('offer.view') }}">View Offer</a>
                            </div>
                        </div>
                        <div class="nav-item">
                            <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuInfluencer" role="button"
                                data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuInfluencer"
                                aria-expanded="false" aria-controls="navbarVerticalMenuInfluencer">
                                <i class="nav-icon">
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="16"
                                        height="16" viewBox="0 0 512.000000 512.000000"
                                        preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                            fill="currentColor" stroke="none">
                                            <path
                                                d="M3427 4899 c-43 -25 -47 -53 -47 -344 0 -184 4 -284 11 -298 32 -63
                                        111 -77 160 -28 l29 29 0 300 0 300 -31 26 c-32 28 -88 35 -122 15z" />
                                            <path
                                                d="M2317 4706 c-136 -49 -209 -200 -162 -337 13 -38 154 -183 1043
                                        -1071 1104 -1105 1053 -1058 1156 -1058 109 0 217 77 251 179 22 67 16 150
                                        -15 212 -16 31 -308 330 -1018 1041 -1093 1093 -1043 1048 -1162 1047 -30 0
                                        -72 -6 -93 -13z" />
                                            <path
                                                d="M4073 4427 l-283 -282 0 -43 c0 -81 76 -126 148 -88 32 18 535 522
                                        551 553 34 68 -13 143 -91 143 l-43 0 -282 -283z" />
                                            <path
                                                d="M1812 3401 c-172 -374 -315 -687 -318 -695 -4 -9 168 -177 516 -505
                                        286 -270 525 -491 530 -491 12 0 1342 579 1352 589 4 3 -392 406 -880 894
                                        l-888 888 -312 -680z" />
                                            <path
                                                d="M4043 3771 c-47 -29 -61 -97 -29 -146 27 -41 71 -47 364 -43 l274 3
                                        29 33 c39 44 39 90 0 134 l-29 33 -289 3 c-271 2 -290 1 -320 -17z" />
                                            <path
                                                d="M1029 2123 c-207 -208 -380 -391 -398 -420 -60 -96 -84 -184 -84
                                        -303 0 -184 55 -295 224 -452 183 -169 266 -217 413 -239 87 -13 158 -1 221
                                        36 22 13 235 219 473 457 l433 434 -451 425 c-248 233 -454 425 -458 427 -4 1
                                        -172 -163 -373 -365z" />
                                            <path
                                                d="M2172 1228 l-291 -313 392 -393 c364 -364 397 -396 466 -430 72 -36
                                        79 -37 181 -37 102 0 109 1 182 38 91 44 146 102 192 197 29 60 31 73 31 170
                                        0 97 -2 110 -32 172 -24 50 -57 94 -127 166 l-96 99 0 285 c0 272 -1 286 -20
                                        311 -12 15 -38 31 -58 37 -21 5 -145 10 -283 10 l-246 0 -291 -312z m698 -13
                                        c0 -63 -1 -115 -3 -115 -1 0 -54 52 -117 115 l-115 115 118 0 117 0 0 -115z" />
                                        </g>
                                    </svg>
                                </i>
                                <span class="nav-link-title">Influencer Manager</span>
                            </a>
                            <div id="navbarVerticalMenuInfluencer" class="nav-collapse collapse hide"
                                data-bs-parent="#navbarVerticalMenu">
                                <a class="nav-link " href="{{ route('influencer.create') }}">Add Influencer</a>
                                <a class="nav-link " href="{{ route('influencer.view') }}">View Influencer</a>
                            </div>
                        </div>

                        @hasanyrole('superadmin|admin|cricket|football|basketball|kabaddi')
                        @if(isset($getfantasy[1]))
                            <div class="nav-item">
                                <a class="nav-link" style="color: red;font-weight: 900;background: #fff;">
                                    <i class="nav-icon">
                                        
                                        <!DOCTYPE svg
                                            PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="16pt"
                                            height="16pt" viewBox="0 0 773.000000 1280.000000"
                                            preserveAspectRatio="xMidYMid meet">
                                            <metadata>
                                                Created by potrace 1.15, written by Peter Selinger 2001-2017
                                            </metadata>
                                            <g transform="translate(0.000000,1280.000000) scale(0.100000,-0.100000)"
                                                fill="currentcolor" stroke="none">
                                                <path
                                                    d="M2733 12774 c-24 -24 -25 -31 -20 -88 3 -34 20 -121 37 -194 18 -73
                                        30 -136 28 -142 -2 -5 -39 17 -82 50 -69 52 -86 60 -123 60 l-43 0 0 -43 c0
                                        -59 64 -151 199 -287 75 -76 135 -150 208 -256 130 -190 179 -244 373 -409
                                        165 -140 325 -303 387 -393 l36 -52 -21 -23 c-12 -13 -22 -26 -22 -29 0 -3 29
                                        -8 65 -12 87 -9 121 -27 173 -91 24 -30 102 -109 173 -177 72 -68 188 -177
                                        257 -243 70 -67 150 -137 177 -157 28 -19 178 -111 335 -203 310 -183 384
                                        -230 446 -284 23 -20 64 -55 93 -79 28 -24 58 -57 67 -74 15 -28 37 -195 36
                                        -260 -1 -38 -54 -150 -106 -222 -53 -74 -67 -87 -106 -95 -29 -6 -35 -16 -114
                                        -206 -95 -230 -107 -255 -116 -255 -3 0 -26 41 -50 92 -35 71 -61 109 -115
                                        164 -69 70 -154 124 -196 124 -32 0 -205 -97 -229 -128 -56 -73 -87 -133 -92
                                        -176 -3 -26 -8 -49 -11 -53 -3 -3 -85 0 -183 7 -179 12 -259 8 -304 -15 -29
                                        -15 -125 0 -154 24 -38 32 -55 95 -91 351 -28 191 -52 297 -87 372 -30 66 -38
                                        75 -107 120 -132 86 -254 106 -456 73 -192 -31 -254 -65 -400 -221 l-109 -116
                                        -4 -269 -5 -269 30 -27 c23 -22 41 -61 77 -170 52 -156 99 -260 169 -373 26
                                        -41 47 -82 47 -91 0 -9 9 -28 20 -41 11 -14 24 -37 29 -51 13 -33 -3 -46 -130
                                        -107 -52 -25 -97 -49 -101 -55 -12 -17 -76 -292 -97 -416 -21 -120 -41 -352
                                        -41 -472 l0 -68 -131 -223 c-135 -228 -228 -367 -339 -503 -102 -124 -304
                                        -345 -469 -511 -83 -85 -164 -173 -181 -197 -43 -62 -170 -176 -280 -251 -116
                                        -79 -319 -252 -456 -388 -245 -244 -287 -279 -501 -425 -50 -34 -99 -73 -107
                                        -86 -15 -22 -23 -105 -11 -105 15 0 180 89 243 132 65 44 130 78 147 78 4 0
                                        -13 -24 -38 -52 -24 -29 -79 -97 -121 -151 -64 -83 -76 -104 -76 -137 0 -46
                                        19 -56 63 -34 17 9 103 89 190 178 l159 161 -7 -50 c-6 -43 -14 -58 -64 -110
                                        -32 -33 -83 -94 -114 -136 -30 -42 -84 -109 -118 -149 l-63 -73 0 -291 -1
                                        -291 28 -60 c40 -85 96 -155 169 -210 135 -102 278 -138 553 -139 175 -1 182
                                        0 237 26 138 64 279 188 336 295 60 114 99 347 82 503 -10 96 -26 153 -76 257
                                        -31 65 -42 77 -117 132 -131 94 -242 144 -382 171 -75 15 -125 35 -125 51 0 6
                                        58 91 129 188 70 97 144 201 163 231 44 69 158 178 263 251 44 31 161 105 260
                                        164 302 179 390 244 631 465 252 230 392 407 504 635 83 171 131 290 165 415
                                        15 52 28 101 31 108 3 9 12 7 33 -9 22 -16 39 -20 63 -17 31 5 36 2 86 -67 29
                                        -40 102 -125 162 -188 130 -139 146 -161 180 -244 25 -64 27 -65 90 -92 36
                                        -15 65 -32 65 -37 -1 -5 -23 -52 -49 -105 -33 -67 -53 -124 -64 -184 l-16 -86
                                        -141 -124 c-77 -68 -168 -152 -201 -187 -82 -83 -350 -420 -426 -532 -72 -108
                                        -152 -270 -173 -351 -15 -58 -15 -61 7 -89 15 -21 18 -31 9 -34 -6 -2 -38 -43
                                        -71 -92 -60 -89 -121 -150 -176 -177 -31 -15 -32 -16 -32 -92 0 -74 -2 -80
                                        -64 -201 -36 -69 -96 -198 -134 -288 -56 -131 -73 -164 -92 -169 -57 -14 -157
                                        -166 -250 -381 -26 -59 -61 -132 -78 -162 -18 -30 -48 -107 -68 -170 -44 -136
                                        -60 -163 -134 -232 -32 -29 -78 -78 -102 -110 -35 -43 -55 -59 -88 -68 -29 -9
                                        -53 -26 -75 -52 -31 -37 -37 -40 -98 -44 -95 -8 -109 -12 -109 -34 0 -13 -7
                                        -20 -19 -20 -11 0 -31 -15 -46 -32 -14 -18 -38 -46 -53 -62 -38 -40 -289 -161
                                        -401 -192 -119 -34 -257 -93 -316 -135 -25 -18 -59 -54 -76 -80 -19 -30 -35
                                        -46 -44 -43 -11 5 -12 0 -5 -23 30 -101 50 -131 105 -161 27 -15 76 -17 450
                                        -16 231 1 617 9 859 18 241 9 446 16 456 16 11 0 27 21 46 63 26 56 29 72 28
                                        162 -1 109 -26 226 -70 326 l-25 56 21 59 c12 32 25 77 29 99 10 59 18 68 55
                                        61 l31 -6 43 124 c51 145 75 182 142 216 27 14 103 78 173 145 108 104 129
                                        130 159 195 29 60 125 339 188 541 8 29 56 79 208 221 247 231 277 258 291
                                        258 6 0 45 -44 88 -98 42 -53 98 -122 123 -152 43 -50 48 -62 59 -133 14 -101
                                        13 -183 -3 -230 -13 -36 -13 -38 14 -57 28 -20 34 -36 110 -287 28 -94 36
                                        -108 95 -175 145 -165 347 -427 385 -500 22 -42 49 -79 59 -83 21 -6 50 -68
                                        110 -232 49 -136 51 -151 14 -155 -27 -3 -28 -5 -50 -128 -12 -69 -24 -139
                                        -28 -155 -5 -29 -10 -32 -101 -60 -53 -16 -112 -29 -130 -29 -19 -1 -34 -6
                                        -34 -13 0 -23 52 -178 76 -224 33 -67 106 -127 228 -189 l107 -55 -6 -45 c-19
                                        -141 -18 -205 4 -254 11 -27 21 -68 21 -91 0 -52 29 -98 88 -139 55 -39 125
                                        -44 303 -21 200 25 268 41 317 75 23 17 46 30 51 30 4 0 17 10 29 23 30 32 43
                                        144 18 162 -15 12 -14 22 14 136 17 68 31 143 32 166 l1 42 96 21 c167 38 244
                                        60 298 86 44 21 54 31 63 62 14 51 13 68 -6 86 -13 14 -14 22 -4 49 7 17 14
                                        104 17 192 l5 160 -45 115 c-25 63 -72 193 -104 287 -32 95 -62 173 -68 173
                                        -6 0 -10 78 -11 213 -1 257 -13 334 -88 560 -58 173 -81 257 -89 323 -7 62 1
                                        68 59 46 27 -11 78 -28 112 -37 75 -21 78 -19 88 65 8 68 18 82 53 74 57 -14
                                        76 -49 302 -547 123 -269 231 -497 240 -506 10 -9 26 -50 37 -93 14 -57 28
                                        -84 52 -110 39 -39 164 -247 221 -367 56 -117 77 -173 100 -271 14 -59 32
                                        -104 59 -145 67 -103 90 -179 101 -339 5 -77 14 -173 19 -212 12 -92 -9 -172
                                        -91 -344 -47 -98 -63 -143 -74 -215 -24 -143 -21 -168 21 -215 27 -29 35 -46
                                        32 -64 -4 -22 -1 -25 34 -31 46 -8 200 0 408 21 172 18 208 26 320 72 47 19
                                        95 38 106 42 12 5 33 24 47 42 22 29 31 63 58 228 34 213 34 240 -6 360 -82
                                        251 -122 337 -151 326 -10 -4 -18 4 -25 22 -20 55 -33 72 -70 89 -36 16 -39
                                        20 -97 182 -68 188 -145 439 -161 521 -5 30 -13 90 -16 133 -6 72 -8 77 -29
                                        77 -21 0 -24 6 -30 58 -4 31 -20 111 -36 177 -51 209 -98 524 -87 590 5 29 2
                                        34 -18 39 -18 5 -31 24 -55 83 -19 48 -44 90 -64 108 -18 17 -59 72 -91 124
                                        -59 94 -139 197 -274 352 l-73 84 -4 132 c-4 125 -3 133 19 160 13 15 49 74
                                        80 130 32 56 73 120 93 144 19 23 58 81 85 127 l51 86 -26 91 c-14 50 -26 101
                                        -26 114 0 12 40 102 89 199 59 118 94 202 106 252 10 41 28 98 40 126 15 34
                                        25 82 30 147 l7 96 52 11 c68 14 152 74 160 114 10 46 7 78 -13 134 -17 50
                                        -17 63 -5 185 15 147 17 355 5 462 -5 44 -4 72 2 77 22 14 -13 212 -74 413
                                        -45 150 -120 378 -130 397 -6 11 -5 28 3 48 l13 31 38 -31 c40 -34 41 -34 27
                                        25 -32 132 -29 305 7 332 15 11 14 27 -1 190 -9 98 -26 232 -38 298 -21 116
                                        -25 234 -9 245 5 3 16 19 24 37 15 29 15 41 2 140 -22 162 -24 173 -38 167 -9
                                        -3 -11 16 -7 80 3 46 8 87 12 91 3 4 -2 27 -12 51 -27 62 -81 287 -79 326 2
                                        26 -11 52 -60 123 -133 190 -266 329 -459 480 -2 1 29 63 67 136 127 243 163
                                        397 165 696 l1 182 -35 36 c-66 68 -158 110 -325 145 -131 28 -375 53 -475 48
                                        -83 -4 -90 -6 -160 -51 -67 -43 -77 -54 -107 -115 -18 -37 -50 -88 -70 -114
                                        -82 -101 -106 -153 -113 -241 -4 -45 -13 -99 -21 -120 -12 -34 -16 -37 -39
                                        -32 -43 11 -131 71 -235 161 -278 240 -515 408 -903 644 -342 207 -440 276
                                        -548 384 -118 119 -214 240 -320 409 -43 67 -107 162 -142 212 -92 127 -168
                                        247 -220 345 -57 109 -57 110 -104 110 -29 0 -46 -7 -65 -26z m-1963 -8513
                                        c13 -24 13 -58 1 -66 -13 -7 -91 6 -91 16 0 14 52 69 66 69 7 0 18 -9 24 -19z
                                        m3646 -138 c-3 -16 -8 -103 -12 -195 -6 -145 -5 -168 8 -168 8 0 23 -18 33
                                        -40 24 -53 43 -69 112 -89 l58 -17 2 -80 c9 -294 36 -493 103 -738 54 -198
                                        118 -345 209 -481 76 -113 125 -216 116 -245 -4 -14 32 -198 51 -263 5 -15 1
                                        -17 -38 -11 -24 4 -45 11 -47 16 -2 5 -25 42 -51 81 -36 55 -60 109 -98 227
                                        -94 289 -180 594 -227 810 -141 646 -203 802 -401 1009 -67 71 -71 78 -58 96
                                        12 16 208 110 237 114 5 1 6 -11 3 -26z" />
                                            </g>
                                        </svg>
                                    </i>

                                    <span class="nav-link-title">FANTASY</span>
                                </a>
                            </div>
                            @endif
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuSeries" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuSeries"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuSeries">
                                    <i class="bi bi-diagram-3-fill nav-icon"></i>
                                    <span class="nav-link-title">Series Manager</span>
                                </a>
                                <div id="navbarVerticalMenuSeries" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{ route('series.create') }}">Add Series</a>
                                    <a class="nav-link "
                                        href="{{ route('series.view', base64_encode($getfantasy[0]->name)) }}">View
                                        Series</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuAccess" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuAccess"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuAccess">
                                    <i class="bi bi-diagram-3-fill nav-icon"></i>
                                    <span class="nav-link-title">Access Manager</span>
                                </a>
                                <div id="navbarVerticalMenuAccess" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{ route('access.create') }}">Add Access</a>
                                    <a class="nav-link "
                                        href="{{ route('access.view', base64_encode($getfantasy[0]->name)) }}">View
                                        Access</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuTeam" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuTeam"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuTeam">
                                    <i class="bi bi-people-fill nav-icon"></i>
                                    <span class="nav-link-title">Team Manager</span>
                                </a>
                                <div id="navbarVerticalMenuTeam" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('team.view', base64_encode($getfantasy[0]->name)) }}">View Team</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuPlayer" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuPlayer"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuPlayer">
                                    <i class="nav-icon">
                                        
                                        <!DOCTYPE svg
                                            PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="16pt"
                                            height="16pt" viewBox="0 0 512.000000 512.000000"
                                            preserveAspectRatio="xMidYMid meet">

                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="#bdc5d1" stroke="none">
                                                <path
                                                    d="M2400 4887 c-407 -138 -475 -674 -117 -912 89 -59 157 -78 277 -78
                                        83 0 118 5 165 22 358 130 462 575 196 842 -106 106 -212 149 -365 149 -67 0
                                        -108 -6 -156 -23z" />
                                                <path
                                                    d="M4336 4595 c-114 -40 -169 -180 -113 -286 66 -125 235 -145 331 -39
                                        33 36 56 92 56 134 0 76 -72 171 -146 194 -52 15 -79 15 -128 -3z" />
                                                <path
                                                    d="M420 4493 c-60 -23 -110 -94 -110 -158 0 -41 28 -101 62 -131 30 -28
                                        489 -299 594 -352 44 -22 190 -86 325 -142 248 -103 529 -235 529 -248 0 -5
                                        -39 -21 -87 -36 -206 -67 -245 -86 -303 -145 -43 -43 -60 -70 -74 -115 -63
                                        -200 82 -402 289 -400 61 1 104 12 337 91 l266 91 4 -291 c4 -268 6 -297 26
                                        -349 30 -82 85 -160 157 -225 l62 -55 -92 -282 -91 -282 -316 -406 c-206 -266
                                        -322 -423 -334 -454 -54 -140 13 -305 151 -370 38 -18 66 -24 120 -23 72 1
                                        106 10 164 44 37 23 791 915 827 979 67 119 210 476 268 667 77 257 79 276 85
                                        845 l6 511 165 134 c196 160 221 192 228 303 4 63 1 81 -20 127 -28 61 -75
                                        111 -133 142 -30 16 -58 21 -115 22 -72 0 -98 -8 -741 -232 -366 -128 -671
                                        -233 -678 -233 -19 0 -199 110 -288 176 -42 31 -176 136 -297 233 -272 218
                                        -261 210 -595 408 -261 155 -277 163 -325 162 -28 0 -58 -3 -66 -6z" />
                                                <path
                                                    d="M3331 1668 c-37 -124 -228 -558 -263 -595 -12 -13 -17 -27 -12 -35
                                        30 -51 445 -611 477 -645 57 -60 124 -86 206 -81 77 5 125 25 174 75 50 49 70
                                        97 75 174 3 51 0 77 -16 110 -18 40 -604 1014 -621 1032 -4 4 -13 -12 -20 -35z" />
                                            </g>
                                        </svg>
                                    </i>
                                    <span class="nav-link-title">Player Manager</span>
                                </a>
                                <div id="navbarVerticalMenuPlayer" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('player.view', base64_encode($getfantasy[0]->name)) }}">View
                                        Player</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuMatch" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuMatch"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuMatch">
                                    <i class="bi bi-controller nav-icon"></i>
                                    <span class="nav-link-title">Match Manager</span>
                                </a>
                                <div id="navbarVerticalMenuMatch" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('match.view', base64_encode($getfantasy[0]->name)) }}">All Upcoming
                                        Matches</a>
                                    <a class="nav-link "
                                        href="{{ route('allmatches.view', base64_encode($getfantasy[0]->name)) }}">All
                                        View All Matches</a>
                                    <a class="nav-link "
                                        href="{{ route('match.updateplayingxi', base64_encode($getfantasy[0]->name)) }}">Update
                                        Playing XI</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuContest" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuContest"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuContest">
                                    <i class="bi bi-trophy-fill nav-icon"></i>
                                    <span class="nav-link-title">Contest Manager</span>
                                </a>
                                <div id="navbarVerticalMenuContest" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('category.view', base64_encode($getfantasy[0]->name)) }}">View All
                                        Contest Category</a>
                                    <a class="nav-link "
                                        href="{{ route('globalcontest.view', base64_encode($getfantasy[0]->name)) }}">View
                                        All Global Contest</a>
                                    <a class="nav-link "
                                        href="{{ route('match.customcontest', base64_encode($getfantasy[0]->name)) }}">View
                                        All Custom Contest</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuResult" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuResult"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuResult">
                                    <i class="bi bi-r-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Result Manager</span>
                                </a>
                                <div id="navbarVerticalMenuResult" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('result.view', base64_encode($getfantasy[0]->name)) }}">Match
                                        Result</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuSeriesdetail" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuSeriesdetail"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuSeriesdetail">
                                    <i class="bi bi-controller nav-icon"></i>
                                    <span class="nav-link-title">Full Series Details</span>
                                </a>
                                <div id="navbarVerticalMenuSeriesdetail" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('series.viewfullseries', base64_encode($getfantasy[0]->name)) }}">Series
                                        Detail</a>
                                </div>
                            </div>
                        @endhasrole


                        {{-- Stock --}}
                        @hasanyrole('superadmin|admin|stock')
                            @php
                                $stfantasy = DB::table('fantasy')
                                    ->where('name', 'Stock')
                                    ->where('status', 1)
                                    ->first();
                            @endphp
                            @if($getfantasy[0]->name=="Stock")
                            <div class="nav-item">
                                <a class="nav-link" style="color: red;font-weight: 900;background: #fff;">
                                    <i class="nav-icon">
                                         <svg version="1.0"
                                            xmlns="http://www.w3.org/2000/svg" width="16pt" height="16pt"
                                            viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="currentColor" stroke="none">
                                                <path
                                                    d="M870 4501 c-29 -29 -85 -67 -155 -103 -202 -106 -327 -224 -406 -383
                                        -35 -70 -41 -92 -46 -170 -3 -56 -1 -106 6 -133 17 -60 71 -117 135 -141 90
                                        -33 389 -71 569 -71 72 0 87 3 87 16 0 29 51 169 76 206 21 33 24 49 24 133 0
                                        67 5 105 15 125 l16 30 -184 0 -183 0 -32 -27 c-18 -16 -48 -57 -68 -93 l-35
                                        -65 4 56 c5 74 47 162 153 316 104 151 123 192 124 258 0 52 -21 96 -43 93 -7
                                        0 -32 -22 -57 -47z" />
                                                <path
                                                    d="M2934 4542 c-35 -23 -45 -113 -20 -174 8 -19 54 -92 101 -162 108
                                        -159 157 -260 163 -335 l4 -56 -37 73 c-21 41 -51 83 -69 97 -32 25 -36 25
                                        -215 25 l-182 0 16 -30 c10 -20 15 -59 15 -125 0 -85 3 -100 24 -132 20 -29
                                        48 -105 82 -221 5 -16 162 -10 374 13 360 40 429 92 418 314 -4 80 -10 107
                                        -37 166 -75 163 -208 293 -401 390 -95 48 -182 107 -206 139 -11 15 -24 22
                                        -30 18z" />
                                                <path
                                                    d="M1483 4100 c-76 -25 -138 -71 -180 -134 -32 -47 -33 -51 -33 -156 l0
                                        -108 -47 -83 c-43 -76 -47 -90 -49 -153 -1 -55 -5 -72 -19 -82 -29 -21 -55
                                        -17 -146 24 -79 35 -90 37 -184 37 -85 0 -106 -3 -143 -23 -140 -75 -55 -273
                                        146 -344 84 -30 143 -22 250 34 48 25 98 48 112 49 23 4 26 -1 43 -71 33 -140
                                        80 -280 189 -570 9 -24 11 -22 28 29 11 29 31 68 45 85 77 94 80 101 84 225
                                        l5 116 12 -90 c21 -155 19 -171 -27 -232 -66 -88 -89 -147 -88 -228 1 -88 15
                                        -127 64 -176 84 -84 202 -120 395 -120 259 0 408 74 459 228 39 117 20 207
                                        -69 329 -56 76 -54 60 -25 264 l12 85 2 -123 c1 -137 7 -157 73 -231 21 -24
                                        46 -66 55 -93 10 -26 20 -48 23 -48 10 0 152 414 169 495 15 68 21 82 43 93
                                        29 14 38 11 167 -43 56 -23 75 -27 133 -23 172 13 322 163 288 289 -28 105
                                        -215 131 -389 56 -133 -58 -154 -49 -156 61 0 60 -5 76 -48 153 l-47 86 0 102
                                        c0 64 -5 114 -14 135 -20 49 -83 105 -156 140 -57 27 -78 31 -169 34 -89 4
                                        -121 0 -218 -24 l-114 -28 -102 24 c-142 33 -291 37 -374 10z m77 -739 c31
                                        -22 49 -66 33 -82 -17 -17 -97 -23 -136 -10 -37 13 -97 71 -97 96 0 30 158 27
                                        200 -4z m966 19 c35 0 30 -24 -15 -69 -45 -45 -86 -57 -156 -47 -41 7 -45 10
                                        -45 35 0 15 6 35 13 44 19 27 86 48 136 42 24 -3 54 -5 67 -5z m-297 -841 c16
                                        -47 13 -90 -8 -123 -20 -30 -95 -86 -116 -86 -19 0 -44 34 -51 69 -6 29 -3 36
                                        41 74 26 23 60 54 74 69 34 36 47 35 60 -3z m-459 -11 c20 -18 51 -45 68 -60
                                        38 -31 43 -82 13 -119 l-20 -24 -44 23 c-67 35 -89 63 -95 120 -4 49 9 92 30
                                        92 6 0 27 -15 48 -32z" />
                                                <path
                                                    d="M4353 3631 c-277 -53 -503 -98 -503 -101 0 -6 152 -141 202 -181 20
                                        -15 18 -19 -72 -125 -126 -147 -491 -510 -673 -669 -591 -514 -1298 -1003
                                        -2137 -1474 -80 -45 -134 -79 -120 -77 104 21 350 86 498 131 430 131 790 277
                                        1216 493 632 320 1163 697 1648 1171 l138 134 100 -88 c55 -48 104 -85 107
                                        -81 8 8 104 912 101 941 -3 20 -21 17 -505 -74z" />
                                                <path
                                                    d="M4409 2642 c-75 -70 -180 -163 -233 -207 l-96 -80 0 -892 0 -893 235
                                        0 235 0 0 1100 c0 605 -1 1100 -2 1099 -2 0 -64 -58 -139 -127z" />
                                                <path
                                                    d="M3715 2075 c-66 -47 -171 -118 -232 -157 l-113 -71 0 -639 0 -638
                                        235 0 235 0 0 795 c0 437 -1 795 -2 795 -2 0 -57 -38 -123 -85z" />
                                                <path
                                                    d="M2984 1617 c-73 -40 -173 -92 -223 -117 l-91 -44 0 -443 0 -443 230
                                        0 230 0 0 560 c0 308 -3 560 -7 560 -5 -1 -67 -33 -139 -73z" />
                                                <path
                                                    d="M2183 1247 l-223 -91 0 -293 0 -293 235 0 235 0 0 385 c0 302 -3 385
                                        -12 384 -7 -1 -113 -42 -235 -92z" />
                                                <path
                                                    d="M1515 1014 c-99 -29 -199 -58 -222 -64 l-43 -11 0 -184 0 -185 235 0
                                        235 0 0 250 c0 194 -3 250 -12 249 -7 -1 -94 -25 -193 -55z" />
                                            </g>
                                        </svg>
                                    </i>

                                    <span class="nav-link-title">STOCK FANTASY</span>
                                </a>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockMatch" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockMatch"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMatch">
                                    <i class="bi bi-controller nav-icon"></i>
                                    <span class="nav-link-title">Match Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockMatch" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Match</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockExchange"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockExchange" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockExchange">
                                    <i class="bi bi-currency-exchange nav-icon"></i>
                                    <span class="nav-link-title">Exchange Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockExchange" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Exchange</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCommodity"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockCommodity" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockCommodity">
                                    <i class="bi bi-c-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Commodity Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCommodity" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Commodity</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCompany" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockCompany"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockCompany">
                                    <i class="bi bi-building nav-icon"></i>
                                    <span class="nav-link-title">Company Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCompany" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Company</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockContest" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockContest"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockContest">
                                    <i class="bi bi-trophy-fill nav-icon"></i>
                                    <span class="nav-link-title">Contest Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockContest" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('category.view', base64_encode($getfantasy[0]->name)) }}">View All
                                        Contest Category</a>
                                    <a class="nav-link "
                                        href="{{ route('globalcontest.view', base64_encode($getfantasy[0]->name)) }}">View
                                        All Global Contest</a>
                                    <a class="nav-link "
                                        href="{{ route('match.customcontest', base64_encode($getfantasy[0]->name)) }}">View
                                        All Custom Contest</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockResult" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockResult"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMResult">
                                    <i class="bi bi-r-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Result Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockResult" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">Match Result</a>
                                </div>
                            </div>
                            @elseif(!empty($stfantasy))
                            <div class="nav-item">
                                <a class="nav-link" style="color: red;font-weight: 900;background: #fff;">
                                    <i class="nav-icon">
                                         <svg version="1.0"
                                            xmlns="http://www.w3.org/2000/svg" width="16pt" height="16pt"
                                            viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="currentColor" stroke="none">
                                                <path
                                                    d="M870 4501 c-29 -29 -85 -67 -155 -103 -202 -106 -327 -224 -406 -383
                                        -35 -70 -41 -92 -46 -170 -3 -56 -1 -106 6 -133 17 -60 71 -117 135 -141 90
                                        -33 389 -71 569 -71 72 0 87 3 87 16 0 29 51 169 76 206 21 33 24 49 24 133 0
                                        67 5 105 15 125 l16 30 -184 0 -183 0 -32 -27 c-18 -16 -48 -57 -68 -93 l-35
                                        -65 4 56 c5 74 47 162 153 316 104 151 123 192 124 258 0 52 -21 96 -43 93 -7
                                        0 -32 -22 -57 -47z" />
                                                <path
                                                    d="M2934 4542 c-35 -23 -45 -113 -20 -174 8 -19 54 -92 101 -162 108
                                        -159 157 -260 163 -335 l4 -56 -37 73 c-21 41 -51 83 -69 97 -32 25 -36 25
                                        -215 25 l-182 0 16 -30 c10 -20 15 -59 15 -125 0 -85 3 -100 24 -132 20 -29
                                        48 -105 82 -221 5 -16 162 -10 374 13 360 40 429 92 418 314 -4 80 -10 107
                                        -37 166 -75 163 -208 293 -401 390 -95 48 -182 107 -206 139 -11 15 -24 22
                                        -30 18z" />
                                                <path
                                                    d="M1483 4100 c-76 -25 -138 -71 -180 -134 -32 -47 -33 -51 -33 -156 l0
                                        -108 -47 -83 c-43 -76 -47 -90 -49 -153 -1 -55 -5 -72 -19 -82 -29 -21 -55
                                        -17 -146 24 -79 35 -90 37 -184 37 -85 0 -106 -3 -143 -23 -140 -75 -55 -273
                                        146 -344 84 -30 143 -22 250 34 48 25 98 48 112 49 23 4 26 -1 43 -71 33 -140
                                        80 -280 189 -570 9 -24 11 -22 28 29 11 29 31 68 45 85 77 94 80 101 84 225
                                        l5 116 12 -90 c21 -155 19 -171 -27 -232 -66 -88 -89 -147 -88 -228 1 -88 15
                                        -127 64 -176 84 -84 202 -120 395 -120 259 0 408 74 459 228 39 117 20 207
                                        -69 329 -56 76 -54 60 -25 264 l12 85 2 -123 c1 -137 7 -157 73 -231 21 -24
                                        46 -66 55 -93 10 -26 20 -48 23 -48 10 0 152 414 169 495 15 68 21 82 43 93
                                        29 14 38 11 167 -43 56 -23 75 -27 133 -23 172 13 322 163 288 289 -28 105
                                        -215 131 -389 56 -133 -58 -154 -49 -156 61 0 60 -5 76 -48 153 l-47 86 0 102
                                        c0 64 -5 114 -14 135 -20 49 -83 105 -156 140 -57 27 -78 31 -169 34 -89 4
                                        -121 0 -218 -24 l-114 -28 -102 24 c-142 33 -291 37 -374 10z m77 -739 c31
                                        -22 49 -66 33 -82 -17 -17 -97 -23 -136 -10 -37 13 -97 71 -97 96 0 30 158 27
                                        200 -4z m966 19 c35 0 30 -24 -15 -69 -45 -45 -86 -57 -156 -47 -41 7 -45 10
                                        -45 35 0 15 6 35 13 44 19 27 86 48 136 42 24 -3 54 -5 67 -5z m-297 -841 c16
                                        -47 13 -90 -8 -123 -20 -30 -95 -86 -116 -86 -19 0 -44 34 -51 69 -6 29 -3 36
                                        41 74 26 23 60 54 74 69 34 36 47 35 60 -3z m-459 -11 c20 -18 51 -45 68 -60
                                        38 -31 43 -82 13 -119 l-20 -24 -44 23 c-67 35 -89 63 -95 120 -4 49 9 92 30
                                        92 6 0 27 -15 48 -32z" />
                                                <path
                                                    d="M4353 3631 c-277 -53 -503 -98 -503 -101 0 -6 152 -141 202 -181 20
                                        -15 18 -19 -72 -125 -126 -147 -491 -510 -673 -669 -591 -514 -1298 -1003
                                        -2137 -1474 -80 -45 -134 -79 -120 -77 104 21 350 86 498 131 430 131 790 277
                                        1216 493 632 320 1163 697 1648 1171 l138 134 100 -88 c55 -48 104 -85 107
                                        -81 8 8 104 912 101 941 -3 20 -21 17 -505 -74z" />
                                                <path
                                                    d="M4409 2642 c-75 -70 -180 -163 -233 -207 l-96 -80 0 -892 0 -893 235
                                        0 235 0 0 1100 c0 605 -1 1100 -2 1099 -2 0 -64 -58 -139 -127z" />
                                                <path
                                                    d="M3715 2075 c-66 -47 -171 -118 -232 -157 l-113 -71 0 -639 0 -638
                                        235 0 235 0 0 795 c0 437 -1 795 -2 795 -2 0 -57 -38 -123 -85z" />
                                                <path
                                                    d="M2984 1617 c-73 -40 -173 -92 -223 -117 l-91 -44 0 -443 0 -443 230
                                        0 230 0 0 560 c0 308 -3 560 -7 560 -5 -1 -67 -33 -139 -73z" />
                                                <path
                                                    d="M2183 1247 l-223 -91 0 -293 0 -293 235 0 235 0 0 385 c0 302 -3 385
                                        -12 384 -7 -1 -113 -42 -235 -92z" />
                                                <path
                                                    d="M1515 1014 c-99 -29 -199 -58 -222 -64 l-43 -11 0 -184 0 -185 235 0
                                        235 0 0 250 c0 194 -3 250 -12 249 -7 -1 -94 -25 -193 -55z" />
                                            </g>
                                        </svg>
                                    </i>

                                    <span class="nav-link-title">STOCK FANTASY</span>
                                </a>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockMatch" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockMatch"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMatch">
                                    <i class="bi bi-controller nav-icon"></i>
                                    <span class="nav-link-title">Match Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockMatch" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Match</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockExchange"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockExchange" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockExchange">
                                    <i class="bi bi-currency-exchange nav-icon"></i>
                                    <span class="nav-link-title">Exchange Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockExchange" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Exchange</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCommodity"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockCommodity" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockCommodity">
                                    <i class="bi bi-c-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Commodity Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCommodity" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Commodity</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCompany" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockCompany"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockCompany">
                                    <i class="bi bi-building nav-icon"></i>
                                    <span class="nav-link-title">Company Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCompany" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">View Company</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockContest" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockContest"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockContest">
                                    <i class="bi bi-trophy-fill nav-icon"></i>
                                    <span class="nav-link-title">Contest Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockContest" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('category.view', base64_encode($getfantasy[0]->name)) }}">View All
                                        Contest Category</a>
                                    <a class="nav-link "
                                        href="{{ route('globalcontest.view', base64_encode($getfantasy[0]->name)) }}">View
                                        All Global Contest</a>
                                    <a class="nav-link "
                                        href="{{ route('match.customcontest', base64_encode($getfantasy[0]->name)) }}">View
                                        All Custom Contest</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockResult" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockResult"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMResult">
                                    <i class="bi bi-r-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Result Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockResult" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="#">Match Result</a>
                                </div>
                            </div>
                            @else
                            @hasanyrole('superadmin')
                            <div class="nav-item">
                                <a class="nav-link" style="color: red;font-weight: 900;background: #fff;">
                                    <i class="nav-icon">
                                         <svg version="1.0"
                                            xmlns="http://www.w3.org/2000/svg" width="16pt" height="16pt"
                                            viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">
                                            <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)"
                                                fill="currentColor" stroke="none">
                                                <path
                                                    d="M870 4501 c-29 -29 -85 -67 -155 -103 -202 -106 -327 -224 -406 -383
                                        -35 -70 -41 -92 -46 -170 -3 -56 -1 -106 6 -133 17 -60 71 -117 135 -141 90
                                        -33 389 -71 569 -71 72 0 87 3 87 16 0 29 51 169 76 206 21 33 24 49 24 133 0
                                        67 5 105 15 125 l16 30 -184 0 -183 0 -32 -27 c-18 -16 -48 -57 -68 -93 l-35
                                        -65 4 56 c5 74 47 162 153 316 104 151 123 192 124 258 0 52 -21 96 -43 93 -7
                                        0 -32 -22 -57 -47z" />
                                                <path
                                                    d="M2934 4542 c-35 -23 -45 -113 -20 -174 8 -19 54 -92 101 -162 108
                                        -159 157 -260 163 -335 l4 -56 -37 73 c-21 41 -51 83 -69 97 -32 25 -36 25
                                        -215 25 l-182 0 16 -30 c10 -20 15 -59 15 -125 0 -85 3 -100 24 -132 20 -29
                                        48 -105 82 -221 5 -16 162 -10 374 13 360 40 429 92 418 314 -4 80 -10 107
                                        -37 166 -75 163 -208 293 -401 390 -95 48 -182 107 -206 139 -11 15 -24 22
                                        -30 18z" />
                                                <path
                                                    d="M1483 4100 c-76 -25 -138 -71 -180 -134 -32 -47 -33 -51 -33 -156 l0
                                        -108 -47 -83 c-43 -76 -47 -90 -49 -153 -1 -55 -5 -72 -19 -82 -29 -21 -55
                                        -17 -146 24 -79 35 -90 37 -184 37 -85 0 -106 -3 -143 -23 -140 -75 -55 -273
                                        146 -344 84 -30 143 -22 250 34 48 25 98 48 112 49 23 4 26 -1 43 -71 33 -140
                                        80 -280 189 -570 9 -24 11 -22 28 29 11 29 31 68 45 85 77 94 80 101 84 225
                                        l5 116 12 -90 c21 -155 19 -171 -27 -232 -66 -88 -89 -147 -88 -228 1 -88 15
                                        -127 64 -176 84 -84 202 -120 395 -120 259 0 408 74 459 228 39 117 20 207
                                        -69 329 -56 76 -54 60 -25 264 l12 85 2 -123 c1 -137 7 -157 73 -231 21 -24
                                        46 -66 55 -93 10 -26 20 -48 23 -48 10 0 152 414 169 495 15 68 21 82 43 93
                                        29 14 38 11 167 -43 56 -23 75 -27 133 -23 172 13 322 163 288 289 -28 105
                                        -215 131 -389 56 -133 -58 -154 -49 -156 61 0 60 -5 76 -48 153 l-47 86 0 102
                                        c0 64 -5 114 -14 135 -20 49 -83 105 -156 140 -57 27 -78 31 -169 34 -89 4
                                        -121 0 -218 -24 l-114 -28 -102 24 c-142 33 -291 37 -374 10z m77 -739 c31
                                        -22 49 -66 33 -82 -17 -17 -97 -23 -136 -10 -37 13 -97 71 -97 96 0 30 158 27
                                        200 -4z m966 19 c35 0 30 -24 -15 -69 -45 -45 -86 -57 -156 -47 -41 7 -45 10
                                        -45 35 0 15 6 35 13 44 19 27 86 48 136 42 24 -3 54 -5 67 -5z m-297 -841 c16
                                        -47 13 -90 -8 -123 -20 -30 -95 -86 -116 -86 -19 0 -44 34 -51 69 -6 29 -3 36
                                        41 74 26 23 60 54 74 69 34 36 47 35 60 -3z m-459 -11 c20 -18 51 -45 68 -60
                                        38 -31 43 -82 13 -119 l-20 -24 -44 23 c-67 35 -89 63 -95 120 -4 49 9 92 30
                                        92 6 0 27 -15 48 -32z" />
                                                <path
                                                    d="M4353 3631 c-277 -53 -503 -98 -503 -101 0 -6 152 -141 202 -181 20
                                        -15 18 -19 -72 -125 -126 -147 -491 -510 -673 -669 -591 -514 -1298 -1003
                                        -2137 -1474 -80 -45 -134 -79 -120 -77 104 21 350 86 498 131 430 131 790 277
                                        1216 493 632 320 1163 697 1648 1171 l138 134 100 -88 c55 -48 104 -85 107
                                        -81 8 8 104 912 101 941 -3 20 -21 17 -505 -74z" />
                                                <path
                                                    d="M4409 2642 c-75 -70 -180 -163 -233 -207 l-96 -80 0 -892 0 -893 235
                                        0 235 0 0 1100 c0 605 -1 1100 -2 1099 -2 0 -64 -58 -139 -127z" />
                                                <path
                                                    d="M3715 2075 c-66 -47 -171 -118 -232 -157 l-113 -71 0 -639 0 -638
                                        235 0 235 0 0 795 c0 437 -1 795 -2 795 -2 0 -57 -38 -123 -85z" />
                                                <path
                                                    d="M2984 1617 c-73 -40 -173 -92 -223 -117 l-91 -44 0 -443 0 -443 230
                                        0 230 0 0 560 c0 308 -3 560 -7 560 -5 -1 -67 -33 -139 -73z" />
                                                <path
                                                    d="M2183 1247 l-223 -91 0 -293 0 -293 235 0 235 0 0 385 c0 302 -3 385
                                        -12 384 -7 -1 -113 -42 -235 -92z" />
                                                <path
                                                    d="M1515 1014 c-99 -29 -199 -58 -222 -64 l-43 -11 0 -184 0 -185 235 0
                                        235 0 0 250 c0 194 -3 250 -12 249 -7 -1 -94 -25 -193 -55z" />
                                            </g>
                                        </svg>
                                    </i>

                                    <span class="nav-link-title">STOCK FANTASY</span>
                                </a>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockMatch" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockMatch"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMatch">
                                    <i class="bi bi-controller nav-icon"></i>
                                    <span class="nav-link-title">Match Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockMatch" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{route('stock.matches')}}">View Match</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockExchange"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockExchange" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockExchange">
                                    <i class="bi bi-currency-exchange nav-icon"></i>
                                    <span class="nav-link-title">Exchange Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockExchange" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{route('stock.exchange')}}">View Exchange</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCommodity"
                                    role="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarVerticalMenuStockCommodity" aria-expanded="false"
                                    aria-controls="navbarVerticalMenuStockCommodity">
                                    <i class="bi bi-c-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Commodity Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCommodity" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{route('stock.commodity')}}">View Commodity</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockCompany" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockCompany"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockCompany">
                                    <i class="bi bi-building nav-icon"></i>
                                    <span class="nav-link-title">Company Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockCompany" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{route('stock.company')}}">View Company</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockContest" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockContest"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockContest">
                                    <i class="bi bi-trophy-fill nav-icon"></i>
                                    <span class="nav-link-title">Contest Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockContest" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link "
                                        href="{{ route('stockcategory.view') }}">View All
                                        Contest Category</a>
                                    <a class="nav-link "
                                        href="{{ route('stockglobalcontest.view') }}">View
                                        All Global Contest</a>
                                    <a class="nav-link "
                                        href="{{ route('match.stockcustomcontest') }}">View
                                        All Custom Contest</a>
                                </div>
                            </div>
                            <div class="nav-item">
                                <a class="nav-link dropdown-toggle" href="#navbarVerticalMenuStockResult" role="button"
                                    data-bs-toggle="collapse" data-bs-target="#navbarVerticalMenuStockResult"
                                    aria-expanded="false" aria-controls="navbarVerticalMenuStockMResult">
                                    <i class="bi bi-r-circle-fill nav-icon"></i>
                                    <span class="nav-link-title">Result Manager</span>
                                </a>
                                <div id="navbarVerticalMenuStockResult" class="nav-collapse collapse hide"
                                    data-bs-parent="#navbarVerticalMenu">
                                    <a class="nav-link" href="{{route('result.stockview')}}">Match Result</a>
                                </div>
                            </div>
                            @endhasrole
                            @endif
                        @endhasrole
                    </div>
                </div>
                <!-- End Content -->

                <!-- Footer -->
                <div class="navbar-vertical-footer">
                    <ul class="navbar-vertical-footer-list">
                        <li class="navbar-vertical-footer-list-item">
                            <!-- Style Switcher -->
                            <div class="dropdown dropup">
                                <button type="button" class="btn btn-ghost-secondary btn-icon rounded-circle"
                                    id="selectThemeDropdown" data-bs-toggle="dropdown" aria-expanded="false"
                                    data-bs-dropdown-animation>

                                </button>

                                <div class="dropdown-menu navbar-dropdown-menu navbar-dropdown-menu-borderless"
                                    aria-labelledby="selectThemeDropdown">
                                    <a class="dropdown-item" href="#" data-icon="bi-moon-stars"
                                        data-value="auto">
                                        <i class="bi-moon-stars me-2"></i>
                                        <span class="text-truncate" title="Auto (system default)">Auto (system
                                            default)</span>
                                    </a>
                                    <a class="dropdown-item" href="#" data-icon="bi-brightness-high"
                                        data-value="default">
                                        <i class="bi-brightness-high me-2"></i>
                                        <span class="text-truncate" title="Default (light mode)">Default (light
                                            mode)</span>
                                    </a>
                                    <a class="dropdown-item active" href="#" data-icon="bi-moon"
                                        data-value="dark">
                                        <i class="bi-moon me-2"></i>
                                        <span class="text-truncate" title="Dark">Dark</span>
                                    </a>
                                </div>
                            </div>

                            <!-- End Style Switcher -->
                        </li>

                        <li class="navbar-vertical-footer-list-item">
                            <!-- Other Links -->
                            <div class="dropdown dropup">
                                <button type="button" class="btn btn-ghost-secondary btn-icon rounded-circle"
                                    id="otherLinksDropdown" data-bs-toggle="dropdown" aria-expanded="false"
                                    data-bs-dropdown-animation>
                                    <i class="bi-info-circle"></i>
                                </button>

                                <div class="dropdown-menu navbar-dropdown-menu-borderless"
                                    aria-labelledby="otherLinksDropdown">
                                    <span class="dropdown-header">Contacts</span>
                                    <a class="dropdown-item" href="#">
                                        <i class="bi bi-envelope dropdown-item-icon"></i>
                                        <span class="text-truncate"
                                            title="Contact support">ajays1.img@gmail.com</span>
                                    </a>
                                </div>
                            </div>
                            <!-- End Other Links -->
                        </li>
                    </ul>
                </div>
                <!-- End Footer -->
            </div>
        </div>
    </aside>

    <!-- End Navbar Vertical -->
    <div id="liveToast" class="position-fixed toast hide" role="alert" aria-live="assertive" aria-atomic="true"
        style="top: 20px; right: 20px; z-index: 1000;">
        <div class="toast-header bg-success text-white">
            <div class="d-flex align-items-center flex-grow-1">
                <div class="flex-shrink-0">
                    <img class="avatar avatar-sm avatar-circle"
                        src="{{ asset('/public/settings/' . SettingsTrait::settings('favicon')) }}"
                        alt="Image description">
                </div>
                <div class="flex-grow-1 ms-3">
                    <h5 class="mb-0 text-white">{{ SettingsTrait::settings('project_name') }}</h5>
                    <small class="ms-auto">Just Now</small>
                </div>
                <div class="text-end">
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        </div>
        <div class="toast-body">
            @if ($errors->any())
                <ul>
                    @foreach ($errors->all() as $error)
                        <li class="text-danger">{{ $error }}</li>
                    @endforeach
                </ul>
            @else
                {{ session('error') }}{{ session('success') }}
            @endif
        </div>
    </div>
    <main id="content" role="main" class="main">
        <!-- Content -->
        @yield('content')
        <!-- End Content -->

        <!-- Footer -->

        <div class="footer">
            <div class="row justify-content-between align-items-center">
                <div class="col">
                    <p class="fs-6 mb-0">Copyright &copy;<span class="d-none d-sm-inline-block">Admin 2023.</span></p>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>

        <!-- End Footer -->
    </main>
    <!-- ========== END MAIN CONTENT ========== -->

    <!-- ONLY DEV -->

    <!-- Builder -->
    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasBuilder"
        aria-labelledby="offcanvasBuilderLabel">
        <div class="offcanvas-header align-items-start">
            <div>
                <h3 id="offcanvasBuilderLabel">Front Builder</h3>
                <p class="mb-0">Customize the overview page layout.</p>
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>

        <div class="offcanvas-body">
            <h4 class="mb-1">Theme Appearance Mode</h4>
            <p>Check out all <a href="documentation/layout.html">Layout Options here</a></p>

            <div class="row gx-3">
                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layoutSkinsRadio"
                            id="layoutSkinsRadio1" checked value="default">
                        <label class="form-check-label mb-2" for="layoutSkinsRadio1">
                            <img class="form-check-img" src="{{ asset('/public/assets/img/415x310/img1.jpg') }}"
                                alt="Image Description">
                        </label>
                        <span class="form-check-text">Default</span>
                    </div>
                </div>
                <!-- End Check -->

                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layoutSkinsRadio"
                            id="layoutSkinsRadio2" value="dark">
                        <label class="form-check-label mb-2" for="layoutSkinsRadio2">
                            <img class="form-check-img" src="{{ asset('/public/assets/img/415x310/img2.jpg') }}"
                                alt="Image Description">
                        </label>
                        <span class="form-check-text">Dark Mode</span>
                    </div>
                </div>
                <!-- End Check -->
            </div>
            <!-- End Row -->

            <hr>

            <div class="row gx-3">
                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layout" id="navbarLayoutSkinsRadio1"
                            checked value="default">
                        <label class="form-check-label mb-2" for="navbarLayoutSkinsRadio1">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/sidebar-default.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/sidebar-default.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                        </label>
                        <span class="form-check-text">Default</span>
                    </div>
                </div>
                <!-- End Check -->

                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layout" id="navbarLayoutSkinsRadio2"
                            value="navbar-dark">
                        <label class="form-check-label mb-2" for="navbarLayoutSkinsRadio2">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/sidebar-dark.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/sidebar-dark.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                        </label>
                        <span class="form-check-text">Dark</span>
                    </div>
                </div>
                <!-- End Check -->
            </div>
            <!-- End Row -->

            <hr>

            <h4 class="mb-1">Sidebar Nav</h4>
            <p>Check out all <a href="documentation/layout.html">Layout Options here</a></p>

            <div class="row gx-3">
                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="sidebarNavOptions"
                            id="sidebarNavOptions1" value="pills" checked>
                        <label class="form-check-label mb-2" for="sidebarNavOptions1">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/demo-layouts-default-classic.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/demo-layouts-default-classic.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                        </label>
                        <span class="form-check-text">Pills</span>
                    </div>
                </div>
                <!-- End Check -->

                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="sidebarNavOptions"
                            id="sidebarNavOptions2" value="tabs">
                        <label class="form-check-label mb-2" for="sidebarNavOptions2">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/demo-layouts-nav-tabs.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/demo-layouts-nav-tabs.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                        </label>
                        <span class="form-check-text">Tabs</span>
                    </div>
                </div>
                <!-- End Check -->
            </div>
            <!-- End Row -->

            <hr>

            <!-- Form Switch -->
            <label class="row form-check form-switch mb-3" for="builderFluidSwitch">
                <span class="col-10 ms-0">
                    <span class="d-block h4 mb-1">Header Layout Options</span>
                    <span class="d-block fs-5">Toggle to container-fluid layout</span>
                </span>
                <span class="col-2 text-end">
                    <input type="checkbox" class="form-check-input" id="builderFluidSwitch">
                </span>
            </label>
            <!-- End Form Switch -->

            <div class="row gx-3">
                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layout" id="headerLayoutOptions1"
                            value="single-header">
                        <label class="form-check-label mb-2" for="headerLayoutOptions1">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/header-default-container.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/header-default-container.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                        </label>
                        <span class="form-check-text">Default</span>
                    </div>
                </div>
                <!-- End Check -->

                <!-- Check -->
                <div class="col-6">
                    <div class="form-check form-check-label-highlighter text-center">
                        <input type="radio" class="form-check-input" name="layout" id="headerLayoutOptions2"
                            value="double-header">
                        <label class="form-check-label mb-2" for="headerLayoutOptions2">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts/header-double-line-container.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="default">
                            <img class="form-check-img"
                                src="{{ asset('/public/assets/svg/layouts-light/header-double-line-container.svg') }}"
                                alt="Image Description" data-hs-theme-appearance="dark">
                        </label>
                        <span class="form-check-text">Double line</span>
                    </div>
                </div>
                <!-- End Check -->
            </div>
            <!-- End Row -->
        </div>

        <!-- Footer -->
        <div class="offcanvas-footer">
            <div class="row gx-3">
                <div class="col">
                    <div class="d-grid">
                        <button type="button" id="js-builder-reset" class="btn btn-white btn-lg">
                            <i class="bi-arrow-counterclockwise"></i> Reset
                        </button>
                    </div>
                </div>
                <!-- End Col -->

                <div class="col">
                    <div class="d-grid">
                        <button type="button" id="js-builder-preview" class="btn btn-primary btn-lg">
                            <i class="eye-visible"></i> Preview
                        </button>
                    </div>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Footer -->
    </div>

    <!-- End Builder -->

    <!-- Builder Toggle -->
    @hasrole('superadmin')
        {{-- <div id="builderOffcanvas" class="position-fixed bottom-0 end-0 me-5 mb-5" style="z-index: 3;"
            data-bs-toggle="offcanvas" data-bs-target="#offcanvasBuilder" aria-controls="offcanvasBuilder">
            <a class="btn btn-dark btn-lg" href="javascript:;">
                <i class="bi-sliders fs-6 me-2"></i> Customize
            </a>
        </div> --}}
    @endhasrole
    <!-- End Builder Toggle -->

    <div class="d-none js-build-layouts">
        <div class="js-build-layout-header-default">
            <!-- Single Header -->
            <header id="header" class="navbar navbar-expand-lg navbar-bordered bg-white  ">
                <div class="container">
                    <nav class="js-mega-menu navbar-nav-wrap">
                        <!-- Logo -->
                        <a class="navbar-brand" href="{{ route('dashboard') }}" aria-label="Front">
                            <img class="navbar-brand-logo"
                                src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}"
                                alt="Logo" data-hs-theme-appearance="default">
                            <img class="navbar-brand-logo"
                                src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}"
                                alt="Logo" data-hs-theme-appearance="dark">
                        </a>

                        <!-- End Logo -->

                        <!-- Secondary Content -->
                        <div class="navbar-nav-wrap-secondary-content">
                            <!-- Navbar -->
                            <ul class="navbar-nav">

                                <li class="nav-item">
                                    <!-- Account -->
                                    <div class="dropdown">
                                        <a class="navbar-dropdown-account-wrapper" href="javascript:;"
                                            id="accountNavbarDropdown" data-bs-toggle="dropdown"
                                            aria-expanded="false" data-bs-auto-close="outside"
                                            data-bs-dropdown-animation>
                                            <div class="avatar avatar-sm avatar-circle">
                                                <img class="avatar-img" src="{{ Auth::user()->image }}"
                                                    alt="Image Description">
                                                <span
                                                    class="avatar-status avatar-sm-status avatar-status-success"></span>
                                            </div>
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-end navbar-dropdown-menu navbar-dropdown-menu-borderless navbar-dropdown-account"
                                            aria-labelledby="accountNavbarDropdown" style="width: 16rem;">
                                            <div class="dropdown-item-text">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-sm avatar-circle">
                                                        <img class="avatar-img" src="{{ Auth::user()->image }}"
                                                            alt="Image Description">
                                                    </div>
                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ Auth::user()->name }}</h5>
                                                        <p class="card-text text-body">{{ Auth::user()->email }}</p>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="dropdown-divider"></div>

                                            <a class="dropdown-item" href="{{ route('profile.edit') }}">Profile &amp;
                                                account</a>
                                            @if (Auth::user()->hasRole('admin'))
                                                <a class="dropdown-item" href="{{ route('settings') }}">Settings</a>
                                            @endif
                                            <a class="dropdown-item" href="{{ route('password.edit') }}">Change
                                                Password</a>

                                            <div class="dropdown-divider"></div>

                                            <a class="dropdown-item" href="{{ route('logout') }}"
                                                onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">Sign
                                                out</a>
                                            <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                                class="d-none">
                                                @csrf
                                            </form>
                                        </div>
                                    </div>
                                    <!-- End Account -->
                                </li>
                            </ul>
                            <!-- End Navbar -->
                        </div>
                        <!-- End Secondary Content -->

                        <!-- Toggler -->
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarContainerNavDropdown" aria-controls="navbarContainerNavDropdown"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-default">
                                <i class="bi-list"></i>
                            </span>
                            <span class="navbar-toggler-toggled">
                                <i class="bi-x"></i>
                            </span>
                        </button>
                        <!-- End Toggler -->

                        <!-- Collapse -->
                        <div class="collapse navbar-collapse" id="navbarContainerNavDropdown">
                            <ul class="navbar-nav">
                                <!-- Dashboards -->
                                <li class="nav-item">
                                    <a class="nav-link " href="layouts/{{ route('dashboard') }}">
                                        <i class="bi-house-door dropdown-item-icon"></i> Dashboard
                                    </a>
                                </li>
                                <li class="hs-has-sub-menu nav-item">
                                    <a id="CategoryMenu" class="hs-mega-menu-invoker nav-link dropdown-toggle active"
                                        href="#" role="button"><i
                                            class="bi bi-car-front-fill dropdown-item-icon"></i>
                                        Category Manager</a>

                                    <!-- Mega Menu -->
                                    <div class="hs-sub-menu dropdown-menu navbar-dropdown-menu-borderless"
                                        aria-labelledby="CategoryMenu" style="min-width: 14rem;">
                                        <a class="dropdown-item active" href="">Add Category</a>
                                        <a class="dropdown-item " href="">View Category</a>
                                    </div>
                                    <!-- End Mega Menu -->
                                </li>
                                <!-- End Dashboards -->
                            </ul>

                        </div>
                        <!-- End Collapse -->
                    </nav>
                </div>
            </header>

            <!-- End Single Header -->
        </div>
        <div class="js-build-layout-header-double">
            <!-- Double Header -->
            <header id="header" class="navbar navbar-expand-lg navbar-bordered navbar-spacer-y-0 flex-lg-column">
                <div class="navbar-dark w-100 bg-dark py-2">
                    <div class="container">
                        <div class="navbar-nav-wrap">
                            <!-- Logo -->
                            <a class="navbar-brand" href="{{ route('dashboard') }}" aria-label="Front">
                                <img class="navbar-brand-logo"
                                    src="{{ asset('/public/settings/' . SettingsTrait::settings('logo')) }}"
                                    alt="Logo">
                            </a>
                            <!-- End Logo -->

                            <!-- Content End -->
                            <div class="navbar-nav-wrap-content-end">
                                <!-- Navbar -->
                                <ul class="navbar-nav">

                                    <li class="nav-item">
                                        <!-- Style Switcher -->
                                        <div class="dropdown ">
                                            <button type="button" class="btn btn-ghost-light btn-icon rounded-circle"
                                                id="selectThemeDropdown" data-bs-toggle="dropdown"
                                                aria-expanded="false" data-bs-dropdown-animation>

                                            </button>

                                            <div class="dropdown-menu dropdown-menu-end navbar-dropdown-menu navbar-dropdown-menu-borderless"
                                                aria-labelledby="selectThemeDropdown">
                                                <a class="dropdown-item" href="#" data-icon="bi-moon-stars"
                                                    data-value="auto">
                                                    <i class="bi-moon-stars me-2"></i>
                                                    <span class="text-truncate" title="Auto (system default)">Auto
                                                        (system default)</span>
                                                </a>
                                                <a class="dropdown-item" href="#"
                                                    data-icon="bi-brightness-high" data-value="default">
                                                    <i class="bi-brightness-high me-2"></i>
                                                    <span class="text-truncate" title="Default (light mode)">Default
                                                        (light mode)</span>
                                                </a>
                                                <a class="dropdown-item active" href="#" data-icon="bi-moon"
                                                    data-value="dark">
                                                    <i class="bi-moon me-2"></i>
                                                    <span class="text-truncate" title="Dark">Dark</span>
                                                </a>
                                            </div>
                                        </div>

                                        <!-- End Style Switcher -->
                                    </li>

                                    <li class="nav-item">
                                        <!-- Account -->
                                        <div class="dropdown">
                                            <a class="navbar-dropdown-account-wrapper" href="javascript:;"
                                                id="accountNavbarDropdown" data-bs-toggle="dropdown"
                                                aria-expanded="false" data-bs-auto-close="outside"
                                                data-bs-dropdown-animation>
                                                <div class="avatar avatar-sm avatar-circle">
                                                    <img class="avatar-img" src="{{ Auth::user()->image }}"
                                                        alt="Image Description">
                                                    <span
                                                        class="avatar-status avatar-sm-status avatar-status-success"></span>
                                                </div>
                                            </a>

                                            <div class="dropdown-menu dropdown-menu-end navbar-dropdown-menu navbar-dropdown-menu-borderless navbar-dropdown-account"
                                                aria-labelledby="accountNavbarDropdown" style="width: 16rem;">
                                                <div class="dropdown-item-text">
                                                    <div class="d-flex align-items-center">
                                                        <div class="avatar avatar-sm avatar-circle">
                                                            <img class="avatar-img" src="{{ Auth::user()->image }}"
                                                                alt="Image Description">
                                                        </div>
                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ Auth::user()->name }}</h5>
                                                            <p class="card-text text-body">{{ Auth::user()->email }}
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="dropdown-divider"></div>

                                                <a class="dropdown-item" href="{{ route('profile.edit') }}">Profile
                                                    &amp; account</a>
                                                <a class="dropdown-item"
                                                    href="{{ route('settings') }}">Settings</a>
                                                <a class="dropdown-item"
                                                    href="{{ route('password.edit') }}">Change
                                                    Password</a>

                                                <div class="dropdown-divider"></div>

                                                <a class="dropdown-item" href="{{ route('logout') }}"
                                                    onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">Sign
                                                    out</a>
                                                <form id="logout-form" action="{{ route('logout') }}"
                                                    method="POST" class="d-none">
                                                    @csrf
                                                </form>
                                            </div>
                                        </div>
                                        <!-- End Account -->
                                    </li>

                                    <li class="nav-item">
                                        <!-- Toggler -->
                                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                            data-bs-target="#navbarDoubleLineContainerNavDropdown"
                                            aria-controls="navbarDoubleLineContainerNavDropdown"
                                            aria-expanded="false" aria-label="Toggle navigation">
                                            <span class="navbar-toggler-default">
                                                <i class="bi-list"></i>
                                            </span>
                                            <span class="navbar-toggler-toggled">
                                                <i class="bi-x"></i>
                                            </span>
                                        </button>
                                        <!-- End Toggler -->
                                    </li>
                                </ul>
                                <!-- End Navbar -->
                            </div>
                            <!-- End Content End -->
                        </div>
                    </div>
                </div>

                <div class="container">
                    <nav class="js-mega-menu flex-grow-1">
                        <!-- Collapse -->
                        <div class="collapse navbar-collapse" id="navbarDoubleLineContainerNavDropdown">
                            <ul class="navbar-nav">
                                <!-- Dashboards -->
                                <li class="nav-item">
                                    <a class="nav-link " href="documentation/{{ route('dashboard') }}"
                                        data-placement="left">
                                        <i class="bi-house-door dropdown-item-icon"></i> Dashboard
                                    </a>
                                </li>
                                <li class="hs-has-sub-menu nav-item">
                                    <a id="PortfolioMegaMenu"
                                        class="hs-mega-menu-invoker nav-link dropdown-toggle active" href="#"
                                        role="button"><i class="bi bi-camera-fill dropdown-item-icon"></i>
                                        Portfolio Manager</a>

                                    <!-- Mega Menu -->
                                    <div class="hs-sub-menu dropdown-menu navbar-dropdown-menu-borderless"
                                        aria-labelledby="PortfolioMegaMenu" style="min-width: 14rem;">
                                        <a class="dropdown-item active" href="">Add Category</a>
                                        <a class="dropdown-item " href="">View Category</a>
                                    </div>
                                    <!-- End Mega Menu -->
                                </li>
                            </ul>

                        </div>
                        <!-- End Collapse -->
                    </nav>
                </div>
            </header>
            <!-- End Double Header -->
        </div>
    </div>

    <script src="{{ asset('/public/assets/js/demo.js') }}"></script>

    <!-- END ONLY DEV -->

    <!-- ========== END SECONDARY CONTENTS ========== -->

    <!-- JS Implementing Plugins -->
    <script src="{{ asset('/public/assets/js/vendor.min.js') }}"></script>

    <script src="{{ asset('/public/assets/vendor/chartjs-plugin-datalabels/dist/chartjs-plugin-datalabels.min.js') }}">
    </script>

    <!-- JS Front -->
    <script src="{{ asset('/public/assets/js/theme.min.js') }}"></script>
    <script src="{{ asset('/public/assets/js/hs.theme-appearance-charts.js') }}"></script>


    <script>
        @if (!empty($errors))
            @if ($errors->any())
                @foreach ($errors->all() as $error)
                    $("#liveToast").removeClass("hide");
                    $("#liveToast").addClass("fade");
                    $("#liveToast").addClass("show");
                    $(".toast-header").removeClass("bg-success");
                    $(".toast-header").addClass("bg-danger");
                    toastr.error('{{ $error }}');
                @endforeach
            @endif
        @endif
        @if (Session::has('message'))
            $("#liveToast").addClass("fade");
            $("#liveToast").addClass("show");
            $("#liveToast").removeClass("hide");
            toastr.options = {
                "closeButton": true,
                "progressBar": true
            }
            toastr.success("{{ session('message') }}");
        @endif
        @if (Session::has('success'))
            $("#liveToast").addClass("fade");
            $("#liveToast").addClass("show");
            $("#liveToast").removeClass("hide");
            toastr.options = {
                "closeButton": true,
                "progressBar": true
            }
            toastr.success("{{ session('success') }}");
        @endif
        @if (Session::has('error'))
            $("#liveToast").removeClass("hide");
            $("#liveToast").addClass("fade");
            $("#liveToast").addClass("show");
            $(".toast-header").removeClass("bg-success");
            $(".toast-header").addClass("bg-danger");
            toastr.options = {
                "closeButton": true,
                "progressBar": true
            }
            toastr.error("{{ session('error') }}");
        @endif
        @if (Session::has('info'))
            $("#liveToast").addClass("fade");
            $("#liveToast").addClass("show");
            $("#liveToast").removeClass("hide");
            toastr.options = {
                "closeButton": true,
                "progressBar": true
            }
            toastr.info("{{ session('info') }}");
        @endif
        @if (Session::has('warning'))
            toastr.options = {
                "closeButton": true,
                "progressBar": true
            }
            toastr.warning("{{ session('warning') }}");
        @endif
    </script>
    <script>
        // INITIALIZATION OF LIVE TOAST
        // =======================================================
        const liveToast = new bootstrap.Toast(document.querySelector('#liveToast'))
        document.querySelector('#liveToastBtn').addEventListener('click', () => liveToast.show())
    </script>

    <!-- JS Plugins Init. -->
    <script>
        (function() {
            localStorage.removeItem('hs_theme')

            window.onload = function() {


                // INITIALIZATION OF NAVBAR VERTICAL ASIDE
                // =======================================================
                new HSSideNav('.js-navbar-vertical-aside').init()


                // INITIALIZATION OF FORM SEARCH
                // =======================================================
                const HSFormSearchInstance = new HSFormSearch('.js-form-search')

                if (HSFormSearchInstance.collection.length) {
                    HSFormSearchInstance.getItem(1).on('close', function(el) {
                        el.classList.remove('top-0')
                    })

                    document.querySelector('.js-form-search-mobile-toggle').addEventListener('click', e => {
                        let dataOptions = JSON.parse(e.currentTarget.getAttribute(
                                'data-hs-form-search-options')),
                            $menu = document.querySelector(dataOptions.dropMenuElement)

                        $menu.classList.add('top-0')
                        $menu.style.left = 0
                    })
                }


                // INITIALIZATION OF BOOTSTRAP DROPDOWN
                // =======================================================
                HSBsDropdown.init()


                // INITIALIZATION OF CHARTJS
                // =======================================================
                HSCore.components.HSChartJS.init('.js-chart')


                // INITIALIZATION OF CHARTJS
                // =======================================================
                HSCore.components.HSChartJS.init('#updatingBarChart')
                const updatingBarChart = HSCore.components.HSChartJS.getItem('updatingBarChart')


                // INITIALIZATION OF SELECT
                // =======================================================
                HSCore.components.HSTomSelect.init('.js-select')

                // INITIALIZATION OF ADD FIELD
                // =======================================================
                new HSAddField('.js-add-field', {
                    addedField: field => {
                        HSCore.components.HSTomSelect.init(field.querySelector('.js-select-dynamic'))
                    }
                })


                // INITIALIZATION OF CLIPBOARD
                // =======================================================
                HSCore.components.HSClipboard.init('.js-clipboard')
            }
        })()
    </script>

    <!-- Style Switcher JS -->

    <script>
        (function() {
            // STYLE SWITCHER
            // =======================================================
            const $dropdownBtn = document.getElementById('selectThemeDropdown') // Dropdowon trigger
            const $variants = document.querySelectorAll(
                `[aria-labelledby="selectThemeDropdown"] [data-icon]`) // All items of the dropdown

            // Function to set active style in the dorpdown menu and set icon for dropdown trigger
            const setActiveStyle = function() {
                $variants.forEach($item => {
                    if ($item.getAttribute('data-value') === HSThemeAppearance.getOriginalAppearance()) {
                        $dropdownBtn.innerHTML = `<i class="${$item.getAttribute('data-icon')}" />`
                        return $item.classList.add('active')
                    }

                    $item.classList.remove('active')
                })
            }

            // Add a click event to all items of the dropdown to set the style
            $variants.forEach(function($item) {
                $item.addEventListener('click', function() {
                    HSThemeAppearance.setAppearance($item.getAttribute('data-value'))
                })
            })

            // Call the setActiveStyle on load page
            setActiveStyle()

            // Add event listener on change style to call the setActiveStyle function
            window.addEventListener('on-hs-appearance-change', function() {
                setActiveStyle()
            })
        })()
    </script>
    <script>
        $(document).on('ready', function() {
            // INITIALIZATION OF DATATABLES
            // =======================================================
            HSCore.components.HSDatatables.init($('#datatable'), {
                dom: 'Bfrtip',
                buttons: [{
                        extend: 'copy',
                        className: 'd-none'
                    },
                    {
                        extend: 'excel',
                        className: 'd-none'
                    },
                    {
                        extend: 'csv',
                        className: 'd-none'
                    },
                    {
                        extend: 'pdf',
                        className: 'd-none'
                    },
                    {
                        extend: 'print',
                        className: 'd-none'
                    },
                ],
                select: {
                    style: 'multi',
                    selector: 'td:first-child input[type="checkbox"]',
                    classMap: {
                        checkAll: '#datatableCheckAll',
                        counter: '#datatableCounter',
                        counterInfo: '#datatableCounterInfo'
                    }
                },
                language: {
                    zeroRecords: '<div class="text-center p-4">' +
                        '<img class="mb-3" src="{{ asset('public/assets/svg/illustrations/oc-error.svg') }}" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="default">' +
                        '<img class="mb-3" src="{{ asset('public/assets/svg/illustrations-light/oc-error.svg') }}" alt="Image Description" style="width: 10rem;" data-hs-theme-appearance="dark">' +
                        '<p class="mb-0">No data to show</p>' +
                        '</div>'
                }
            })

            const datatable = HSCore.components.HSDatatables.getItem(0)

            $('#export-copy').click(function() {
                datatable.button('.buttons-copy').trigger()
            });

            $('#export-excel').click(function() {
                datatable.button('.buttons-excel').trigger()
            });

            $('#export-csv').click(function() {
                datatable.button('.buttons-csv').trigger()
            });

            $('#export-pdf').click(function() {
                datatable.button('.buttons-pdf').trigger()
            });

            $('#export-print').click(function() {
                datatable.button('.buttons-print').trigger()
            });

            $('.js-datatable-filter').on('change', function() {
                var $this = $(this),
                    elVal = $this.val(),
                    targetColumnIndex = $this.data('target-column-index');

                if (elVal === 'null') elVal = ''

                datatable.column(targetColumnIndex).search(elVal).draw();
            });
        });
    </script>

    <script>
        // Get the current URL
        var currentUrl = window.location.href;

        // Loop through all navigation links
        var links = document.querySelectorAll(".nav-link");
        for (var i = 0; i < links.length; i++) {
            var link = links[i];

            // Check if the link's URL matches the current URL
            if (link.href === currentUrl) {
                // Add the "active" class to the link
                link.classList.add("active");
                break; // Stop the loop after the first match is found
            }
        }
    </script>
    <script>
        (function() {
            // INITIALIZATION OF FLATPICKR
            // =======================================================
            HSCore.components.HSFlatpickr.init('.js-flatpickr')
        })();
    </script>


    <!-- End Style Switcher JS -->

    <script>
     var lightboxDescription = GLightbox({
                selector: '.glightbox2'
            });
</script>
</body>

</html>
