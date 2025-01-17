@php
    use App\Traits\SettingsTrait;
    $getgraphdata = SettingsTrait::total_amount_received_in_week();
    $getgraphdata1 = SettingsTrait::total_amount_withdraw_in_week();
@endphp
@extends('admin.main')
@section('title')
    Dashboard
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Dashboard</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{env('APP_URL')}}">
                        <i class="bi bi-browser-chrome me-1"></i> Website
                    </a>
                </div>
                <!-- End Col -->
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->

        <!-- Stats -->

        @role('superadmin|admin|cricket|football|basketball|stock|kabaddi')
            <div class="row">
                <div class="col-lg-12 mb-3 mb-lg-5">
                    <!-- Card -->
                    <div class="card h-100">
                        <!-- Header -->
                        <div class="card-header card-header-content-sm-between">
                            <h4 class="card-header-title mb-2 mb-sm-0">Total Amount</h4>

                            <!-- Nav -->
                            <ul class="nav nav-segment nav-fill" id="expensesTab" role="tablist">
                                <li class="nav-item" data-bs-toggle="chart-bar" data-datasets="thisWeek" data-trigger="click"
                                    data-action="toggle" role="presentation">
                                    <a class="nav-link active" href="javascript:;" data-bs-toggle="tab" aria-selected="true"
                                        role="tab">This week</a>
                                </li>
                                {{-- <li class="nav-item" data-bs-toggle="chart-bar" data-datasets="lastWeek" data-trigger="click"
                                    data-action="toggle" role="presentation">
                                    <a class="nav-link" href="javascript:;" data-bs-toggle="tab" aria-selected="false"
                                        tabindex="-1" role="tab">Last week</a>
                                </li> --}}
                            </ul>
                            <!-- End Nav -->
                        </div>
                        <!-- End Header -->

                        <!-- Body -->
                        <div class="card-body">
                            <div class="row mb-4">
                                <div class="col-sm mb-2 mb-sm-0">
                                    <div class="d-flex align-items-center">
                                        <span class="h1 mb-0"></span>
                                        <span class="text-success ms-2">
                                        </span>
                                    </div>
                                </div>
                                <!-- End Col -->

                                <div class="col-sm-auto align-self-sm-end">
                                    <div class="row fs-6 text-body">
                                        <div class="col-auto">
                                            <span class="legend-indicator bg-primary"></span> Deposit
                                        </div>
                                        <!-- End Col -->

                                        <div class="col-auto">
                                            <span class="legend-indicator"></span> Withdraw
                                        </div>
                                        <!-- End Col -->
                                    </div>
                                    <!-- End Row -->
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                            <!-- Bar Chart -->
                            <div class="chartjs-custom">
                                <canvas id="updatingBarChart"
                                    style="height: 320px; display: block; box-sizing: border-box; width: 652.8px;"
                                    data-hs-chartjs-options="{
                                    &quot;type&quot;: &quot;bar&quot;,
                                    &quot;data&quot;: {
                                      &quot;labels&quot;: [&quot;{{$getgraphdata[0][0]}}&quot;, &quot;{{$getgraphdata[0][1]}}&quot;, &quot;{{$getgraphdata[0][2]}}&quot;, &quot;{{$getgraphdata[0][3]}}&quot;, &quot;{{$getgraphdata[0][4]}}&quot;, &quot;{{$getgraphdata[0][5]}}&quot;, &quot;{{$getgraphdata[0][6]}}&quot;],
                                      &quot;datasets&quot;: [{
                                        &quot;data&quot;: @json($getgraphdata[1]),
                                        &quot;backgroundColor&quot;: &quot;#377dff&quot;,
                                        &quot;hoverBackgroundColor&quot;: &quot;#377dff&quot;,
                                        &quot;borderColor&quot;: &quot;#377dff&quot;,
                                        &quot;maxBarThickness&quot;: &quot;10&quot;
                                      },
                                      {
                                        &quot;data&quot;: @json($getgraphdata1[1]),
                                        &quot;backgroundColor&quot;: &quot;#e7eaf3&quot;,
                                        &quot;borderColor&quot;: &quot;#e7eaf3&quot;,
                                        &quot;maxBarThickness&quot;: &quot;10&quot;
                                      }]
                                    },
                                    &quot;options&quot;: {
                                      &quot;scales&quot;: {
                                        &quot;y&quot;: {
                                          &quot;grid&quot;: {
                                            &quot;color&quot;: &quot;#e7eaf3&quot;,
                                            &quot;drawBorder&quot;: false,
                                            &quot;zeroLineColor&quot;: &quot;#e7eaf3&quot;
                                          },
                                          &quot;ticks&quot;: {
                                            &quot;beginAtZero&quot;: true,
                                            &quot;stepSize&quot;: 100,
                                            &quot;fontSize&quot;: 12,
                                            &quot;fontColor&quot;:  &quot;#97a4af&quot;,
                                            &quot;fontFamily&quot;: &quot;Open Sans, sans-serif&quot;,
                                            &quot;padding&quot;: 10,
                                            &quot;postfix&quot;: &quot;₹ &quot;
                                          }
                                        },
                                        &quot;x&quot;: {
                                          &quot;grid&quot;: {
                                            &quot;display&quot;: false,
                                            &quot;drawBorder&quot;: false
                                          },
                                          &quot;ticks&quot;: {
                                            &quot;fontSize&quot;: 12,
                                            &quot;fontColor&quot;:  &quot;#97a4af&quot;,
                                            &quot;fontFamily&quot;: &quot;Open Sans, sans-serif&quot;,
                                            &quot;padding&quot;: 5
                                          },
                                          &quot;categoryPercentage&quot;: 0.5,
                                          &quot;maxBarThickness&quot;: &quot;10&quot;
                                        }
                                      },
                                      &quot;cornerRadius&quot;: 2,
                                      &quot;plugins&quot;: {
                                        &quot;tooltip&quot;: {
                                          &quot;prefix&quot;: &quot;₹ &quot;,
                                          &quot;hasIndicator&quot;: true,
                                          &quot;mode&quot;: &quot;index&quot;,
                                          &quot;intersect&quot;: false
                                        }
                                      },
                                      &quot;hover&quot;: {
                                        &quot;mode&quot;: &quot;nearest&quot;,
                                        &quot;intersect&quot;: true
                                      }
                                    }
                                  }"
                                    width="816" height="400"></canvas>
                            </div>
                            <!-- End Bar Chart -->
                        </div>
                        <!-- End Body -->
                    </div>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Live Matches</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['livematch']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="red"
                                            stroke="none">
                                            <path
                                                d="M843 4152 c-274 -301 -455 -633 -551 -1007 -55 -217 -72 -356 -72
-585 0 -612 218 -1157 647 -1619 l68 -74 147 155 147 155 -31 29 c-58 54 -181
209 -248 310 -313 474 -396 1080 -223 1619 90 280 234 526 430 735 l71 75
-147 154 -147 154 -91 -101z" />
                                            <path
                                                d="M4039 4099 l-146 -154 70 -75 c473 -503 639 -1233 430 -1885 -90
-280 -234 -526 -430 -735 l-70 -75 146 -154 147 -154 86 94 c412 450 628 999
628 1599 0 603 -223 1165 -637 1609 l-78 83 -146 -153z" />
                                            <path
                                                d="M1455 3558 c-128 -141 -248 -345 -309 -528 -54 -162 -70 -270 -70
-470 0 -200 15 -298 70 -466 60 -187 217 -447 341 -567 l39 -38 116 118 c64
65 128 133 143 151 l27 32 -38 46 c-127 150 -207 297 -251 461 -23 87 -26 117
-26 263 0 146 3 176 26 263 44 164 124 311 251 461 l38 46 -27 32 c-27 33
-256 268 -261 268 -1 0 -32 -33 -69 -72z" />
                                            <path
                                                d="M3473 3511 c-61 -64 -123 -131 -138 -149 l-27 -32 38 -46 c127 -150
205 -292 250 -459 25 -90 27 -117 27 -265 0 -148 -2 -175 -27 -265 -44 -163
-125 -312 -250 -459 l-38 -46 27 -32 c15 -18 79 -86 143 -151 l116 -118 39 38
c124 120 281 380 341 567 55 168 70 266 70 466 0 199 -14 295 -69 466 -39 121
-136 308 -215 414 -69 92 -159 191 -170 189 -3 -1 -55 -54 -117 -118z" />
                                            <path
                                                d="M2465 3189 c-249 -38 -458 -227 -522 -472 -21 -81 -21 -233 0 -314
46 -174 165 -322 327 -407 92 -49 178 -69 290 -69 112 0 198 20 290 69 161 84
280 232 326 404 22 86 22 234 0 320 -47 173 -169 324 -329 406 -115 59 -258
82 -382 63z" />
                                        </g>
                                    </svg>


                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Launched Matches</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['launchedmatch']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
                                        fill="currentColor" class="bi bi-rocket-takeoff-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M12.17 9.53c2.307-2.592 3.278-4.684 3.641-6.218.21-.887.214-1.58.16-2.065a3.578 3.578 0 0 0-.108-.563 2.22 2.22 0 0 0-.078-.23V.453c-.073-.164-.168-.234-.352-.295a2.35 2.35 0 0 0-.16-.045 3.797 3.797 0 0 0-.57-.093c-.49-.044-1.19-.03-2.08.188-1.536.374-3.618 1.343-6.161 3.604l-2.4.238h-.006a2.552 2.552 0 0 0-1.524.734L.15 7.17a.512.512 0 0 0 .433.868l1.896-.271c.28-.04.592.013.955.132.232.076.437.16.655.248l.203.083c.196.816.66 1.58 1.275 2.195.613.614 1.376 1.08 2.191 1.277l.082.202c.089.218.173.424.249.657.118.363.172.676.132.956l-.271 1.9a.512.512 0 0 0 .867.433l2.382-2.386c.41-.41.668-.949.732-1.526l.24-2.408Zm.11-3.699c-.797.8-1.93.961-2.528.362-.598-.6-.436-1.733.361-2.532.798-.799 1.93-.96 2.528-.361.599.599.437 1.732-.36 2.531Z" />
                                        <path
                                            d="M5.205 10.787a7.632 7.632 0 0 0 1.804 1.352c-1.118 1.007-4.929 2.028-5.054 1.903-.126-.127.737-4.189 1.839-5.18.346.69.837 1.35 1.411 1.925Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Completed Matches</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['completedmatch']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="green"
                                            stroke="none">
                                            <path
                                                d="M3720 5083 c-40 -50 -80 -130 -80 -163 0 -15 11 -48 25 -74 l25 -46
-408 -605 c-224 -332 -413 -607 -420 -609 -7 -3 -41 -8 -77 -12 l-65 -7 0 458
c0 445 -1 460 -21 502 -25 53 -86 106 -138 121 -21 7 -90 12 -152 12 -99 0
-121 -3 -164 -24 -28 -13 -63 -38 -78 -56 -59 -69 -57 -44 -57 -767 l0 -665
-147 -216 -148 -217 -5 895 -5 895 -28 47 c-58 99 -123 127 -292 127 -100 1
-128 -3 -165 -20 -55 -25 -105 -71 -133 -124 l-22 -40 -5 -1376 -5 -1375 -140
-208 -140 -207 -5 1578 -5 1578 -22 41 c-28 53 -92 110 -140 124 -23 7 -88 10
-164 8 -120 -3 -128 -4 -175 -33 -30 -19 -60 -49 -79 -79 l-30 -49 -3 -2054
c-2 -2044 -2 -2053 18 -2073 19 -19 33 -20 223 -20 l203 0 70 -56 c108 -87
254 -181 372 -240 l107 -54 167 0 167 0 39 53 c22 28 140 201 263 382 l224
330 5 -193 c5 -177 7 -195 24 -208 16 -11 72 -14 286 -14 246 0 268 1 283 18
15 17 17 77 17 661 l0 642 321 472 c177 260 332 495 345 522 32 69 45 161 34
233 -6 31 -29 127 -53 213 l-44 157 414 608 413 609 60 0 c73 0 98 17 162 110
54 77 66 120 50 174 -16 50 -38 69 -261 220 l-193 131 -108 0 -109 0 -31 -37z
m210 -441 c52 -36 96 -66 98 -67 3 -2 -784 -1163 -799 -1179 -9 -10 -209 120
-209 136 0 21 794 1187 804 1181 6 -3 54 -35 106 -71z m-3210 -2066 l0 -1474
-112 -164 c-61 -89 -118 -181 -125 -203 -18 -48 -6 -105 38 -182 16 -29 29
-55 29 -58 0 -3 -34 -5 -75 -5 l-75 0 0 1780 0 1780 160 0 160 0 0 -1474z
m950 699 l0 -775 -171 -252 c-95 -139 -176 -257 -180 -262 -5 -6 -9 457 -9
1027 l0 1037 180 0 180 0 0 -775z m905 521 l0 -249 -57 -13 c-81 -19 -150 -56
-210 -114 -29 -28 -53 -50 -55 -50 -6 0 -3 667 4 674 4 3 77 5 162 4 l156 -3
0 -249z m205 -380 c0 -2 -64 -170 -141 -373 -78 -202 -145 -379 -149 -393 -15
-54 31 -109 82 -97 13 4 161 137 328 297 l304 291 34 -118 c39 -133 45 -226
20 -284 -13 -30 -701 -1052 -729 -1083 -4 -5 -27 2 -51 17 -110 64 -198 174
-270 339 -60 135 -249 641 -244 653 8 22 419 621 445 648 14 16 44 38 66 49
48 25 305 70 305 54z m-205 -2914 c-3 -10 -42 -12 -162 -10 l-158 3 -3 242 -2
242 76 113 c42 62 116 169 163 238 l86 125 3 -470 c1 -259 0 -476 -3 -483z
m-1366 742 c290 -75 524 -268 631 -521 l22 -52 -182 -268 c-101 -147 -190
-276 -198 -285 -38 -44 -157 -6 -354 111 -251 150 -508 374 -508 443 0 18 98
167 328 501 l74 108 47 -6 c25 -4 88 -18 140 -31z" />
                                            <path
                                                d="M3812 2040 c-598 -84 -965 -663 -782 -1234 78 -242 275 -462 507
-568 183 -83 422 -106 607 -60 340 85 611 348 696 677 30 113 37 285 16 401
-66 381 -340 676 -707 764 -98 23 -250 32 -337 20z m58 -240 c-27 -55 -50
-111 -50 -125 0 -28 40 -75 64 -75 43 0 64 25 127 152 l64 130 38 -6 c21 -4
51 -12 67 -19 l28 -12 -351 -712 -350 -712 -42 29 c-73 50 -73 43 0 190 36 73
65 145 65 161 0 33 -40 69 -77 69 -35 0 -64 -38 -113 -145 -24 -52 -46 -95
-51 -95 -14 0 -80 119 -109 197 -133 366 11 763 348 963 100 59 253 105 360
109 l32 1 -50 -100z m547 -69 l41 -33 -64 -130 c-35 -72 -64 -139 -64 -150 0
-29 45 -68 78 -68 39 0 63 29 112 133 23 48 44 87 49 87 15 0 93 -151 117
-226 149 -468 -149 -951 -636 -1031 -55 -9 -102 -14 -105 -11 -3 3 20 58 52
123 54 111 56 118 42 143 -22 39 -58 56 -91 43 -22 -8 -42 -39 -98 -151 -51
-103 -75 -140 -88 -140 -19 0 -112 29 -112 35 0 4 207 427 494 1009 154 312
209 416 219 409 6 -5 31 -24 54 -42z" />
                                            <path
                                                d="M3735 1496 c-11 -8 -69 -113 -129 -234 -103 -209 -108 -222 -97 -250
16 -38 57 -57 94 -43 22 9 47 50 138 233 117 235 122 253 77 291 -24 21 -57
22 -83 3z" />
                                            <path
                                                d="M4252 1245 c-29 -21 -232 -425 -232 -463 0 -50 55 -85 105 -66 20 8
235 435 235 468 0 54 -66 90 -108 61z" />
                                        </g>
                                    </svg>

                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-3 mb-3 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Total Matches</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['livematch']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#000000"
                                            stroke="none">
                                            <path
                                                d="M664 4910 c-41 -16 -74 -68 -74 -116 0 -36 6 -51 34 -82 l34 -37 486
-3 c538 -3 527 -4 566 61 36 59 18 130 -43 167 -31 19 -53 20 -507 19 -261 0
-484 -4 -496 -9z" />
                                            <path
                                                d="M1869 4897 c-48 -32 -68 -91 -48 -143 8 -22 29 -48 48 -61 l34 -23
474 0 c522 0 527 1 558 61 33 64 10 145 -49 173 -30 14 -90 16 -509 16 l-474
0 -34 -23z" />
                                            <path
                                                d="M454 4601 c-53 -24 -109 -91 -123 -146 -8 -31 -11 -647 -11 -2149 l0
-2106 225 0 225 0 0 2106 c0 1502 -3 2118 -11 2149 -14 55 -70 122 -123 146
-23 10 -63 19 -91 19 -27 0 -68 -9 -91 -19z" />
                                            <path
                                                d="M1690 4609 c-48 -19 -93 -62 -116 -113 l-24 -51 0 -2122 0 -2123 220
0 220 0 0 143 -1 142 -150 105 c-82 57 -156 114 -164 127 -17 25 -22 76 -11
109 4 12 79 122 166 245 l160 224 0 1580 c0 1517 -1 1582 -19 1620 -23 49 -64
89 -113 109 -42 18 -130 20 -168 5z" />
                                            <path
                                                d="M2905 4602 c-50 -24 -101 -80 -115 -129 -8 -27 -10 -343 -8 -1053 l3
-1014 217 304 218 305 0 716 0 715 -27 55 c-40 78 -94 112 -181 117 -50 2 -77
-2 -107 -16z" />
                                            <path
                                                d="M4468 4232 l-47 -69 22 -21 c19 -20 20 -25 8 -45 -11 -18 -327 -447
-654 -889 l-57 -76 86 -62 c48 -34 87 -60 89 -58 1 2 150 203 330 448 385 523
393 533 411 526 8 -3 20 -9 28 -12 8 -3 30 18 60 60 25 35 46 68 46 73 0 9
-247 186 -264 190 -6 2 -32 -28 -58 -65z" />
                                            <path
                                                d="M3361 3058 c-29 -21 -1597 -2206 -1589 -2214 9 -8 515 149 529 164
26 27 1439 2010 1439 2019 0 4 -14 18 -31 30 -26 18 -36 20 -61 11 -21 -7 -60
-7 -129 1 -128 14 -121 15 -158 -11z" />
                                            <path
                                                d="M3085 1964 l-727 -1017 12 -266 c6 -146 13 -270 14 -275 1 -5 350
479 776 1075 425 596 782 1096 793 1110 29 40 24 86 -19 170 -21 41 -43 98
-49 127 -9 43 -17 57 -42 73 l-31 20 -727 -1017z" />
                                            <path
                                                d="M4045 1490 c-246 -33 -448 -221 -500 -465 -8 -39 -15 -91 -15 -116 0
-46 16 -148 25 -157 2 -2 34 21 70 52 69 58 83 64 103 44 26 -26 11 -53 -63
-116 -41 -35 -75 -69 -75 -76 0 -7 14 -34 30 -60 l30 -47 93 78 c50 43 250
213 444 376 194 164 355 302 358 307 7 12 -89 87 -158 121 -101 52 -231 74
-342 59z m365 -104 c0 -18 -22 -42 -82 -92 -123 -103 -114 -97 -137 -84 -40
21 -26 52 56 120 109 92 123 101 145 89 10 -5 18 -20 18 -33z m-340 -261 c20
-24 3 -48 -95 -130 -90 -75 -111 -85 -133 -63 -25 25 -9 48 84 127 98 82 121
93 144 66z" />
                                            <path
                                                d="M2997 1116 l-217 -305 0 -250 0 -251 220 0 220 0 0 555 c0 305 -1
555 -3 555 -1 0 -100 -137 -220 -304z" />
                                            <path
                                                d="M4163 879 c-235 -199 -434 -367 -442 -375 -17 -16 -8 -30 49 -69 l39
-27 77 66 c79 67 102 77 124 51 19 -23 4 -48 -60 -101 -33 -27 -60 -52 -60
-55 0 -16 115 -42 205 -46 182 -10 310 40 440 171 120 120 175 250 175 411 0
76 -9 145 -19 145 -3 0 -48 -36 -99 -80 -52 -44 -102 -80 -112 -80 -23 0 -44
35 -33 54 16 28 186 166 204 166 10 0 19 6 19 13 0 18 -59 117 -70 117 -5 0
-202 -163 -437 -361z m187 -93 c0 -16 -23 -42 -82 -92 -101 -86 -117 -95 -140
-83 -37 20 -21 52 64 124 45 39 91 75 102 82 27 15 56 -1 56 -31z" />
                                            <path
                                                d="M2017 832 c-137 -42 -249 -81 -249 -86 0 -9 525 -386 531 -380 2 2 0
125 -4 274 -5 190 -11 270 -19 269 -6 0 -123 -35 -259 -77z" />
                                        </g>
                                    </svg>


                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Pending Pan Requests</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['pendingpan']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange"
                                        class="bi bi-person-vcard-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Not Uploaded Pan Users</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['notuploadedpan']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#00000"
                                        class="bi bi-person-vcard-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Verified Pan Requests</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['approvedpan']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="green"
                                        class="bi bi-person-vcard-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm9 1.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4a.5.5 0 0 0-.5.5ZM9 8a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 0-1h-4A.5.5 0 0 0 9 8Zm1 2.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 0-1h-3a.5.5 0 0 0-.5.5Zm-1 2C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 0 2 13h6.96c.026-.163.04-.33.04-.5ZM7 6a2 2 0 1 0-4 0 2 2 0 0 0 4 0Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Pending Bank Requests</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['pendingbank']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="orange"
                                            stroke="none">
                                            <path
                                                d="M2447 4714 c-31 -7 -72 -21 -89 -30 -48 -25 -1778 -1093 -1815 -1121
-79 -59 -116 -199 -79 -297 35 -90 126 -157 233 -172 l53 -7 0 -811 0 -811
-49 -23 c-116 -53 -212 -164 -251 -289 -17 -55 -20 -92 -20 -237 1 -115 5
-183 14 -208 21 -60 72 -115 134 -145 l57 -28 265 0 c233 0 269 2 297 17 76
42 105 142 62 218 -42 74 -66 80 -304 80 l-205 0 0 108 c0 121 13 156 72 192
33 20 54 20 1738 20 1684 0 1705 0 1738 -20 59 -36 72 -71 72 -192 l0 -108
-1266 0 -1266 0 -38 -21 c-21 -12 -48 -39 -60 -61 -42 -74 -12 -174 63 -216
30 -16 118 -17 1357 -17 l1325 0 57 28 c62 30 113 85 134 145 9 25 13 93 14
208 0 145 -3 182 -20 237 -39 125 -147 249 -257 295 l-43 17 0 811 0 811 53 7
c154 20 254 131 245 275 -4 71 -23 120 -66 169 -15 17 -236 160 -492 318 -256
158 -656 405 -890 549 -234 144 -439 270 -457 279 -84 43 -213 55 -316 30z
m214 -342 c142 -82 1539 -948 1539 -954 0 -5 -236 -8 -525 -8 -557 0 -554 1
-597 -47 -58 -64 -58 -151 -1 -214 45 -49 81 -59 221 -59 l112 0 0 -622 c0
-378 4 -637 10 -658 21 -75 117 -131 189 -110 47 13 79 36 101 73 19 31 20 55
20 675 l0 642 160 0 160 0 0 -800 0 -800 -1490 0 -1490 0 0 800 0 800 160 0
160 0 0 -642 c0 -620 1 -644 20 -675 22 -37 54 -60 101 -73 72 -21 168 35 189
110 6 21 10 280 10 657 l0 622 493 3 c476 3 493 4 527 24 58 34 82 79 78 145
-5 65 -32 109 -82 133 -31 14 -124 16 -927 16 -507 0 -889 4 -883 9 5 5 279
175 609 378 330 204 679 419 775 478 96 60 191 114 210 122 45 16 93 8 151
-25z" />
                                            <path
                                                d="M2460 4028 c-25 -14 -58 -44 -75 -67 -27 -39 -30 -50 -30 -120 0 -68
3 -82 27 -117 15 -21 44 -50 65 -64 31 -21 48 -25 113 -25 65 0 82 4 113 25
21 14 50 43 65 64 24 35 27 49 27 116 0 67 -3 81 -27 116 -44 62 -90 88 -167
92 -55 3 -74 -1 -111 -20z" />
                                            <path
                                                d="M2470 2989 c-50 -20 -100 -84 -100 -128 0 -13 -14 -26 -45 -41 -69
-33 -140 -104 -171 -168 -23 -47 -28 -71 -28 -137 0 -69 4 -90 31 -147 72
-153 204 -228 404 -228 66 0 82 -13 77 -62 l-3 -33 -150 -5 c-116 -4 -157 -9
-182 -22 -66 -36 -97 -119 -74 -191 14 -43 71 -96 111 -104 19 -3 32 -15 40
-34 15 -36 72 -86 106 -95 37 -10 104 2 133 23 14 10 37 41 50 69 21 42 32 53
78 73 182 80 266 301 185 485 -29 64 -114 150 -180 183 -45 22 -73 27 -169 33
-97 5 -118 9 -129 25 -19 26 -18 41 6 65 17 17 34 20 118 20 115 0 168 19 199
71 29 49 35 84 22 132 -11 43 -68 107 -95 107 -7 0 -25 18 -39 41 -41 64 -128
94 -195 68z" />
                                        </g>
                                    </svg>

                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Not Uploaded Bank Users</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['notuploadedbank']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#000000"
                                            stroke="none">
                                            <path
                                                d="M2447 4714 c-31 -7 -72 -21 -89 -30 -48 -25 -1778 -1093 -1815 -1121
-79 -59 -116 -199 -79 -297 35 -90 126 -157 233 -172 l53 -7 0 -811 0 -811
-49 -23 c-116 -53 -212 -164 -251 -289 -17 -55 -20 -92 -20 -237 1 -115 5
-183 14 -208 21 -60 72 -115 134 -145 l57 -28 265 0 c233 0 269 2 297 17 76
42 105 142 62 218 -42 74 -66 80 -304 80 l-205 0 0 108 c0 121 13 156 72 192
33 20 54 20 1738 20 1684 0 1705 0 1738 -20 59 -36 72 -71 72 -192 l0 -108
-1266 0 -1266 0 -38 -21 c-21 -12 -48 -39 -60 -61 -42 -74 -12 -174 63 -216
30 -16 118 -17 1357 -17 l1325 0 57 28 c62 30 113 85 134 145 9 25 13 93 14
208 0 145 -3 182 -20 237 -39 125 -147 249 -257 295 l-43 17 0 811 0 811 53 7
c154 20 254 131 245 275 -4 71 -23 120 -66 169 -15 17 -236 160 -492 318 -256
158 -656 405 -890 549 -234 144 -439 270 -457 279 -84 43 -213 55 -316 30z
m214 -342 c142 -82 1539 -948 1539 -954 0 -5 -236 -8 -525 -8 -557 0 -554 1
-597 -47 -58 -64 -58 -151 -1 -214 45 -49 81 -59 221 -59 l112 0 0 -622 c0
-378 4 -637 10 -658 21 -75 117 -131 189 -110 47 13 79 36 101 73 19 31 20 55
20 675 l0 642 160 0 160 0 0 -800 0 -800 -1490 0 -1490 0 0 800 0 800 160 0
160 0 0 -642 c0 -620 1 -644 20 -675 22 -37 54 -60 101 -73 72 -21 168 35 189
110 6 21 10 280 10 657 l0 622 493 3 c476 3 493 4 527 24 58 34 82 79 78 145
-5 65 -32 109 -82 133 -31 14 -124 16 -927 16 -507 0 -889 4 -883 9 5 5 279
175 609 378 330 204 679 419 775 478 96 60 191 114 210 122 45 16 93 8 151
-25z" />
                                            <path
                                                d="M2460 4028 c-25 -14 -58 -44 -75 -67 -27 -39 -30 -50 -30 -120 0 -68
3 -82 27 -117 15 -21 44 -50 65 -64 31 -21 48 -25 113 -25 65 0 82 4 113 25
21 14 50 43 65 64 24 35 27 49 27 116 0 67 -3 81 -27 116 -44 62 -90 88 -167
92 -55 3 -74 -1 -111 -20z" />
                                            <path
                                                d="M2470 2989 c-50 -20 -100 -84 -100 -128 0 -13 -14 -26 -45 -41 -69
-33 -140 -104 -171 -168 -23 -47 -28 -71 -28 -137 0 -69 4 -90 31 -147 72
-153 204 -228 404 -228 66 0 82 -13 77 -62 l-3 -33 -150 -5 c-116 -4 -157 -9
-182 -22 -66 -36 -97 -119 -74 -191 14 -43 71 -96 111 -104 19 -3 32 -15 40
-34 15 -36 72 -86 106 -95 37 -10 104 2 133 23 14 10 37 41 50 69 21 42 32 53
78 73 182 80 266 301 185 485 -29 64 -114 150 -180 183 -45 22 -73 27 -169 33
-97 5 -118 9 -129 25 -19 26 -18 41 6 65 17 17 34 20 118 20 115 0 168 19 199
71 29 49 35 84 22 132 -11 43 -68 107 -95 107 -7 0 -25 18 -39 41 -41 64 -128
94 -195 68z" />
                                        </g>
                                    </svg>

                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Verified Bank Requests</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['approvedbank']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="green"
                                            stroke="none">
                                            <path
                                                d="M2447 4714 c-31 -7 -72 -21 -89 -30 -48 -25 -1778 -1093 -1815 -1121
-79 -59 -116 -199 -79 -297 35 -90 126 -157 233 -172 l53 -7 0 -811 0 -811
-49 -23 c-116 -53 -212 -164 -251 -289 -17 -55 -20 -92 -20 -237 1 -115 5
-183 14 -208 21 -60 72 -115 134 -145 l57 -28 265 0 c233 0 269 2 297 17 76
42 105 142 62 218 -42 74 -66 80 -304 80 l-205 0 0 108 c0 121 13 156 72 192
33 20 54 20 1738 20 1684 0 1705 0 1738 -20 59 -36 72 -71 72 -192 l0 -108
-1266 0 -1266 0 -38 -21 c-21 -12 -48 -39 -60 -61 -42 -74 -12 -174 63 -216
30 -16 118 -17 1357 -17 l1325 0 57 28 c62 30 113 85 134 145 9 25 13 93 14
208 0 145 -3 182 -20 237 -39 125 -147 249 -257 295 l-43 17 0 811 0 811 53 7
c154 20 254 131 245 275 -4 71 -23 120 -66 169 -15 17 -236 160 -492 318 -256
158 -656 405 -890 549 -234 144 -439 270 -457 279 -84 43 -213 55 -316 30z
m214 -342 c142 -82 1539 -948 1539 -954 0 -5 -236 -8 -525 -8 -557 0 -554 1
-597 -47 -58 -64 -58 -151 -1 -214 45 -49 81 -59 221 -59 l112 0 0 -622 c0
-378 4 -637 10 -658 21 -75 117 -131 189 -110 47 13 79 36 101 73 19 31 20 55
20 675 l0 642 160 0 160 0 0 -800 0 -800 -1490 0 -1490 0 0 800 0 800 160 0
160 0 0 -642 c0 -620 1 -644 20 -675 22 -37 54 -60 101 -73 72 -21 168 35 189
110 6 21 10 280 10 657 l0 622 493 3 c476 3 493 4 527 24 58 34 82 79 78 145
-5 65 -32 109 -82 133 -31 14 -124 16 -927 16 -507 0 -889 4 -883 9 5 5 279
175 609 378 330 204 679 419 775 478 96 60 191 114 210 122 45 16 93 8 151
-25z" />
                                            <path
                                                d="M2460 4028 c-25 -14 -58 -44 -75 -67 -27 -39 -30 -50 -30 -120 0 -68
3 -82 27 -117 15 -21 44 -50 65 -64 31 -21 48 -25 113 -25 65 0 82 4 113 25
21 14 50 43 65 64 24 35 27 49 27 116 0 67 -3 81 -27 116 -44 62 -90 88 -167
92 -55 3 -74 -1 -111 -20z" />
                                            <path
                                                d="M2470 2989 c-50 -20 -100 -84 -100 -128 0 -13 -14 -26 -45 -41 -69
-33 -140 -104 -171 -168 -23 -47 -28 -71 -28 -137 0 -69 4 -90 31 -147 72
-153 204 -228 404 -228 66 0 82 -13 77 -62 l-3 -33 -150 -5 c-116 -4 -157 -9
-182 -22 -66 -36 -97 -119 -74 -191 14 -43 71 -96 111 -104 19 -3 32 -15 40
-34 15 -36 72 -86 106 -95 37 -10 104 2 133 23 14 10 37 41 50 69 21 42 32 53
78 73 182 80 266 301 185 485 -29 64 -114 150 -180 183 -45 22 -73 27 -169 33
-97 5 -118 9 -129 25 -19 26 -18 41 6 65 17 17 34 20 118 20 115 0 168 19 199
71 29 49 35 84 22 132 -11 43 -68 107 -95 107 -7 0 -25 18 -39 41 -41 64 -128
94 -195 68z" />
                                        </g>
                                    </svg>

                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Pending Withdrawal Request</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['pendingwithdrawal']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="orange"
                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                        <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                        <path
                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Verified Withdrawal Request</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['approvedwithdrawal']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#00000"
                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                        <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                        <path
                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Total Withdrawal Amount</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['totalwithdrawalamount']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="green"
                                        class="bi bi-cash-stack" viewBox="0 0 16 16">
                                        <path d="M1 3a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1H1zm7 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4z" />
                                        <path
                                            d="M0 5a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1V5zm3 0a2 2 0 0 1-2 2v4a2 2 0 0 1 2 2h10a2 2 0 0 1 2-2V7a2 2 0 0 1-2-2H3z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">No. of user register</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['totaluser']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#00000"
                                        class="bi bi-person-circle" viewBox="0 0 16 16">
                                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                        <path fill-rule="evenodd"
                                            d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">No. of active users</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['activeuser']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="green"
                                        class="bi bi-people-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Pending Winner Declare</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['pendingwinnerdeclear']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="orange"
                                            stroke="none">
                                            <path
                                                d="M2043 4641 c-85 -29 -130 -68 -239 -209 -56 -74 -111 -140 -121 -147
-10 -7 -83 -36 -163 -65 -80 -28 -169 -68 -198 -87 -107 -72 -161 -186 -163
-341 0 -48 -4 -126 -7 -173 l-7 -85 -91 -135 c-103 -152 -123 -195 -131 -286
-10 -109 15 -174 131 -347 l100 -148 7 -182 c8 -215 22 -264 99 -349 53 -58
109 -92 213 -128 51 -18 66 -28 61 -39 -33 -86 -455 -1244 -459 -1263 -14 -54
52 -137 109 -137 10 0 56 12 102 26 72 23 98 26 173 22 78 -4 99 -9 163 -40
84 -42 157 -109 200 -186 16 -28 41 -61 55 -72 46 -36 137 -18 165 33 7 12
116 308 244 657 l231 635 32 3 c18 2 98 -16 179 -40 302 -89 407 -56 589 185
37 48 69 87 73 87 3 0 87 -224 186 -497 l181 -498 -86 -7 c-147 -13 -261 -56
-378 -142 l-62 -45 -21 57 c-12 31 -60 161 -106 287 -94 253 -112 283 -180
292 -53 7 -104 -28 -123 -82 -13 -40 -13 -42 138 -459 84 -231 157 -426 163
-434 34 -41 116 -54 156 -26 13 9 41 44 62 79 100 157 242 234 414 222 49 -3
103 -14 136 -27 94 -38 167 -11 191 70 10 33 -4 75 -220 673 -127 351 -231
642 -231 647 0 4 33 21 73 36 121 46 183 98 232 193 33 66 45 145 45 293 0 86
5 139 14 161 7 18 54 93 105 167 98 144 121 199 121 290 0 95 -24 151 -133
312 l-101 150 -7 182 c-8 216 -21 264 -101 352 -60 65 -104 89 -273 149 -68
24 -133 49 -144 55 -11 5 -63 65 -115 133 -113 146 -144 177 -216 213 -44 22
-72 29 -140 32 -78 3 -98 -1 -239 -42 -85 -25 -163 -46 -173 -46 -10 0 -88 20
-174 45 -175 51 -253 57 -341 26z m732 -875 c114 -36 198 -89 290 -181 93 -94
135 -161 178 -282 29 -82 31 -98 31 -223 0 -125 -2 -141 -31 -223 -43 -122
-85 -189 -178 -282 -93 -93 -160 -135 -282 -178 -82 -29 -97 -31 -223 -31
-121 0 -143 3 -215 28 -116 40 -209 98 -295 185 -87 89 -140 174 -177 286 -23
71 -26 96 -26 215 0 119 3 144 26 215 38 115 91 199 182 290 113 113 235 179
379 205 89 16 251 5 341 -24z m-957 -2045 c121 -156 211 -212 345 -214 37 0
67 -2 67 -3 0 -2 -279 -768 -306 -841 l-16 -41 -54 43 c-105 86 -271 145 -409
145 -37 0 -65 4 -63 9 2 4 84 227 182 495 99 267 182 486 186 486 4 0 35 -35
68 -79z" />
                                            <path
                                                d="M2503 3384 c-57 -28 -63 -56 -63 -304 0 -181 3 -228 16 -255 16 -35
65 -65 104 -65 39 0 88 30 104 65 13 27 16 74 16 255 0 249 -6 276 -65 304
-41 20 -71 20 -112 0z" />
                                        </g>
                                    </svg>


                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Total number of teams</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['totalteam']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="black"
                                        class="bi bi-people-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7Zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216ZM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5Z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Total number of players</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['totalplayer']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    
                                    <!DOCTYPE svg
                                        PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                    <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="40pt" height="40pt"
                                        viewBox="0 0 512.000000 512.000000" preserveAspectRatio="xMidYMid meet">

                                        <g transform="translate(0.000000,512.000000) scale(0.100000,-0.100000)" fill="#000000"
                                            stroke="none">
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

                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>

                <div class="col-sm-6 col-lg-4 mb-4 mb-lg-5">
                    <!-- Card -->
                    <a class="card card-hover-shadow h-100" href="#">
                        <div class="card-body">
                            <h6 class="card-subtitle">Global Contest</h6>

                            <div class="row align-items-center gx-2 mb-1">
                                <div class="col-9">
                                    <h2 class="card-title text-inherit">{{$data['globalcontest']}}</h2>
                                </div>
                                <!-- End Col -->

                                <div class="col-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="#00000"
                                        class="bi bi-trophy-fill" viewBox="0 0 16 16">
                                        <path
                                            d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z" />
                                    </svg>
                                </div>
                                <!-- End Col -->
                            </div>
                            <!-- End Row -->
                        </div>
                    </a>
                    <!-- End Card -->
                </div>
            </div>
        @endrole
        <!-- End Stats -->

    </div>
@endsection
