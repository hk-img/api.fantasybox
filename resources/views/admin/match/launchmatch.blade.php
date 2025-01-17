@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Launch Match
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Match Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('importmatchplayers', base64_encode($findmatchdetails->id)) }}">
                        <i class="bi bi-cloud-download-fill"></i> Import Players
                    </a>
                    @if ($findmatchdetails->launch_status != 'launched')
                        <a class="btn btn-success" href="{{ route('match.launch', base64_encode($findmatchdetails->id)) }}">
                            <i class=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    fill="currentColor" class="bi bi-rocket-takeoff-fill" viewBox="0 0 16 16">
                                    <path
                                        d="M12.17 9.53c2.307-2.592 3.278-4.684 3.641-6.218.21-.887.214-1.58.16-2.065a3.578 3.578 0 0 0-.108-.563 2.22 2.22 0 0 0-.078-.23V.453c-.073-.164-.168-.234-.352-.295a2.35 2.35 0 0 0-.16-.045 3.797 3.797 0 0 0-.57-.093c-.49-.044-1.19-.03-2.08.188-1.536.374-3.618 1.343-6.161 3.604l-2.4.238h-.006a2.552 2.552 0 0 0-1.524.734L.15 7.17a.512.512 0 0 0 .433.868l1.896-.271c.28-.04.592.013.955.132.232.076.437.16.655.248l.203.083c.196.816.66 1.58 1.275 2.195.613.614 1.376 1.08 2.191 1.277l.082.202c.089.218.173.424.249.657.118.363.172.676.132.956l-.271 1.9a.512.512 0 0 0 .867.433l2.382-2.386c.41-.41.668-.949.732-1.526l.24-2.408Zm.11-3.699c-.797.8-1.93.961-2.528.362-.598-.6-.436-1.733.361-2.532.798-.799 1.93-.96 2.528-.361.599.599.437 1.732-.36 2.531Z" />
                                    <path
                                        d="M5.205 10.787a7.632 7.632 0 0 0 1.804 1.352c-1.118 1.007-4.929 2.028-5.054 1.903-.126-.127.737-4.189 1.839-5.18.346.69.837 1.35 1.411 1.925Z" />
                                </svg></i> Launch Match
                        </a>
                    @else
                        <a class="btn btn-danger"
                            href="{{ route('match.unlaunch', base64_encode($findmatchdetails->id)) }}">
                            <i class="">
                                <!DOCTYPE svg
                                    PUBLIC "-//W3C//DTD SVG 20010904//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    viewBox="0 0 582.000000 580.000000" preserveAspectRatio="xMidYMid meet">

                                    <g transform="translate(0.000000,580.000000) scale(0.100000,-0.100000)" fill="#ffff"
                                        stroke="none">
                                        <path
                                            d="M2725 5555 c-16 -7 -238 -222 -491 -477 l-462 -463 -56 -115 c-65
                            -137 -81 -197 -100 -396 -9 -82 -17 -171 -20 -199 -3 -27 -10 -108 -15 -180
                            -11 -130 -28 -290 -37 -333 -2 -12 -42 -64 -87 -115 -46 -51 -94 -105 -108
                            -121 -13 -16 -38 -46 -54 -65 -61 -72 -110 -135 -130 -167 -11 -18 -58 -84
                            -105 -146 -79 -105 -132 -182 -185 -268 -12 -19 -39 -62 -61 -95 -22 -33 -94
                            -170 -161 -305 -174 -353 -187 -384 -297 -730 -62 -193 -79 -311 -80 -550 -1
                            -308 25 -452 96 -521 30 -29 56 -42 121 -59 71 -20 111 -23 292 -26 140 -1
                            238 2 295 11 47 7 103 16 125 19 176 24 485 107 602 161 17 8 34 15 37 15 8 0
                            166 72 221 101 111 58 251 132 260 139 6 4 37 22 70 40 103 57 385 243 495
                            326 58 44 134 102 170 129 36 27 139 112 229 189 l164 139 86 9 c162 16 296
                            28 421 38 319 24 454 52 605 128 143 71 157 83 775 720 245 251 255 264 262
                            310 11 71 1 105 -43 148 l-40 39 -113 -1 c-62 -1 -134 -6 -162 -12 -27 -6
                            -103 -18 -169 -27 -66 -9 -145 -20 -175 -25 -114 -18 -177 -21 -245 -10 -38 6
                            -95 15 -125 19 -50 8 -309 109 -336 131 -6 6 -19 37 -29 70 -10 34 -22 63 -27
                            66 -4 3 -8 13 -8 22 0 21 -88 204 -137 286 -186 309 -515 567 -895 701 l-77
                            27 -62 157 c-64 164 -99 299 -99 391 0 50 54 473 81 632 21 121 2 178 -79 229
                            -50 31 -89 36 -137 14z m-583 -3166 c68 -15 158 -60 207 -104 102 -93 149
                            -312 101 -478 -66 -233 -218 -420 -425 -522 -324 -161 -582 -112 -714 135 -33
                            61 -35 73 -39 177 -8 200 44 345 180 502 116 134 239 218 408 278 74 26 192
                            31 282 12z" />
                                        <path
                                            d="M4790 4875 c-14 -8 -45 -17 -70 -21 -25 -4 -53 -11 -63 -16 -10 -5
                            -30 -12 -44 -14 -14 -3 -44 -11 -66 -19 -23 -8 -50 -15 -59 -15 -10 0 -37 -6
                            -60 -14 -24 -7 -83 -26 -133 -41 -120 -37 -206 -64 -230 -75 -11 -5 -56 -21
                            -100 -36 -44 -15 -97 -35 -117 -45 -21 -11 -42 -19 -48 -19 -6 0 -84 -36 -173
                            -81 -153 -76 -327 -182 -327 -200 0 -5 21 -20 48 -35 26 -15 90 -57 142 -93
                            329 -227 626 -545 815 -873 22 -38 45 -68 51 -68 7 0 34 24 60 53 62 68 193
                            325 254 497 13 36 27 69 32 75 4 5 8 17 8 27 0 10 4 26 9 36 43 79 115 327
                            161 552 11 52 29 138 41 190 27 121 31 155 24 208 l-6 42 -62 0 c-34 -1 -73
                            -7 -87 -15z" />
                                    </g>
                                </svg>
                            </i> UnLaunch Match
                        </a>
                    @endif
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">Match Info</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card h-100">
                                    <div class="card-body card-body-height">
                                        <ul class="list-group list-group-flush list-group-no-gutters">
                                            <!-- List Item -->
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Match Name :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $findmatchdetails->name }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Team 1 Display Name :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $findmatchdetails->team1team }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Team 2 Display Name :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $findmatchdetails->team2team }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Date and time :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ date('j-M-Y h:i A (D)', strtotime($findmatchdetails->start_date)) }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Format :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="badge bg-soft-info text-info rounded-pill">
                                                            <i class="bi-check-circle-fill me-1"></i>
                                                            {{ $findmatchdetails->format }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Card -->
                            </div>
                            <div class="col-lg-6 mb-3 mb-lg-5 text-center">
                                <!-- Card -->
                                <div class="card h-100">
                                    <div class="row mt-5">
                                        <div class="card-body avatar avatar-xxl avatar-circle ">
                                            <img style="width: 120px;height: 120px;border-radius: 50%;margin-bottom: 30px;"
                                                src="{{ $findmatchdetails->team1logo }}" alt="Image Description">
                                            <h5>{{ $findmatchdetails->team1team }} </h5>
                                        </div>
                                        <div class="card-body avatar avatar-xxl avatar-circle ">
                                            <img style="width: 120px;height: 120px;border-radius: 50%;margin-bottom: 30px;"
                                                src="{{ $findmatchdetails->team2logo }}" alt="Image Description">
                                            <h5>{{ $findmatchdetails->team2team }}</h5>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Card -->
                            </div>
                        </div>
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>

        <div class="row">
            <div class="col-6 mb-12">
                <div class="js-add-field card mb-3 mb-lg-5">
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <div id="datatable_wrapper" class="dataTables_wrapper no-footer">
                            <table id=""
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table dataTable no-footer"
                                role="grid" aria-describedby="datatable_info">
                                <thead class="thead-light">
                                    <tr role="row" class="text-center">
                                        <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""
                                            style="width: 42px;">#</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Player Name: activate to sort column ascending"
                                            style="width: 58.4875px;">
                                            Player Name</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Role: activate to sort column descending"
                                            style="width: 103.625px;" aria-sort="ascending">Role</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Credit: activate to sort column ascending"
                                            style="width: 120.762px;">
                                            Credit</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1" style="width: 153.35px;">
                                            Action</th>
                                    </tr>
                                </thead>

                                <tbody id="addVariantsContainer">
                                    @foreach ($findplayer1details as $key => $player)
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1">
                                                <h5>{{ $key + 1 }}</h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->name }} </h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->role }}</h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->credit }}</h5>
                                            </th>
                                            <th>
                                                <a onclick="deletematchplayer(<?php echo $player->id; ?>)"
                                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                                    title="Delete Match Player" style="cursor: pointer;"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="red" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                        <path
                                                            d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                                    </svg></a>
                                            </th>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End Table -->

                    <!-- Footer -->
                    <div class="card-footer">
                        <div class="col-lg-12 mb-3 mb-lg-5">
                            <table class="table table-bordered no-footer w-100 d-table">
                                <tbody>
                                    <tr>
                                        <th colspan="5" class="text-center">Selection Criteria</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>WK</td>
                                        <td>Bat</td>
                                        <td>AR</td>
                                        <td>Bowl</td>
                                    </tr>
                                    <tr>
                                        <th data-toggle="tooltip" title="" data-original-title="Minimum">Min</th>
                                        <td>1</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <th data-toggle="tooltip" title="" data-original-title="Maximum">Max</th>
                                        <td>4</td>
                                        <td>6</td>
                                        <td>4</td>
                                        <td>5</td>
                                    </tr>
                                    <tr>
                                        <th>Your Selection</th>
                                        @if ($wk1 < 1)
                                            <td class="font-weight-bold bg-danger"
                                                title="Criteria fulfill for wicket-Keeper">{{ $wk1 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Criteria fulfill for wicket-Keeper">{{ $wk1 }}</td>
                                        @endif
                                        @if ($batsman1 < 3)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast three Batsman">{{ $batsman1 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast three Batsman">{{ $batsman1 }}</td>
                                        @endif
                                        @if ($allrounder1 < 1)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast one All-Rounders">{{ $allrounder1 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast one All-Rounders">{{ $allrounder1 }}</td>
                                        @endif
                                        @if ($bowlers1 < 3)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast three Bowlers">{{ $bowlers1 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast three Bowlers">{{ $bowlers1 }}</td>
                                        @endif
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End Footer -->
                </div>
            </div>
            <div class="col-6 mb-12">
                <div class="js-add-field card mb-3 mb-lg-5">
                    <!-- Table -->
                    <div class="table-responsive datatable-custom">
                        <div id="datatable_wrapper" class="dataTables_wrapper no-footer">
                            <table id=""
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table dataTable no-footer"
                                role="grid" aria-describedby="datatable_info">
                                <thead class="thead-light">
                                    <tr role="row" class="text-center">
                                        <th class="sorting_disabled" rowspan="1" colspan="1" aria-label=""
                                            style="width: 42px;">#</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Player Name: activate to sort column ascending"
                                            style="width: 58.4875px;">
                                            Player Name</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Role: activate to sort column descending"
                                            style="width: 103.625px;" aria-sort="ascending">Role</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1"
                                            aria-label="Credit: activate to sort column ascending"
                                            style="width: 120.762px;">
                                            Credit</th>
                                        <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                            rowspan="1" colspan="1" style="width: 153.35px;">
                                            Action</th>
                                    </tr>
                                </thead>

                                <tbody id="addVariantsContainer">
                                    @foreach ($findplayer2details as $key => $player)
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1">
                                                <h5>{{ $key + 1 }}</h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->name }} </h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->role }}</h5>
                                            </th>
                                            <th>
                                                <h5>{{ $player->credit }}</h5>
                                            </th>
                                            <th>
                                                <a onclick="deletematchplayer(<?php echo $player->id; ?>)"
                                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                                    title="Delete Match Player" style="cursor: pointer;"><svg
                                                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="red" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                                        <path
                                                            d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                                    </svg></a>
                                            </th>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End Table -->

                    <!-- Footer -->
                    <div class="card-footer">
                        <div class="col-lg-12 mb-3 mb-lg-5">
                            <table class="table table-bordered no-footer w-100 d-table">
                                <tbody>
                                    <tr>
                                        <th colspan="5" class="text-center">Selection Criteria</th>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>WK</td>
                                        <td>Bat</td>
                                        <td>AR</td>
                                        <td>Bowl</td>
                                    </tr>
                                    <tr>
                                        <th data-toggle="tooltip" title="" data-original-title="Minimum">Min</th>
                                        <td>1</td>
                                        <td>3</td>
                                        <td>1</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <th data-toggle="tooltip" title="" data-original-title="Maximum">Max</th>
                                        <td>4</td>
                                        <td>6</td>
                                        <td>4</td>
                                        <td>5</td>
                                    </tr>
                                    <tr>
                                        <th>Your Selection</th>
                                        @if ($wk2 < 1)
                                            <td class="font-weight-bold bg-danger"
                                                title="Criteria fulfill for wicket-Keeper">{{ $wk2 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Criteria fulfill for wicket-Keeper">{{ $wk2 }}</td>
                                        @endif
                                        @if ($batsman2 < 3)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast three Batsman">{{ $batsman2 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast three Batsman">{{ $batsman2 }}</td>
                                        @endif
                                        @if ($allrounder2 < 1)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast one All-Rounders">{{ $allrounder2 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast one All-Rounders">{{ $allrounder2 }}</td>
                                        @endif
                                        @if ($bowlers2 < 3)
                                            <td class="font-weight-bold bg-danger"
                                                title="Please select atleast three Bowlers">{{ $bowlers2 }}</td>
                                        @else
                                            <td class="font-weight-bold bg-success"
                                                title="Please select atleast three Bowlers">{{ $bowlers2 }}</td>
                                        @endif
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- End Footer -->
                </div>
            </div>
        </div>
        <!-- End Body -->
    </div>
@endsection
<script>
    function deletematchplayer(id) {
        swal({
            title: "Are you sure?",
            text: "You want to Delete!",
            icon: "error",
            buttons: {
                confirm: {
                    className: "btn-danger",
                    text: "Yes",
                    value: true,
                },
                cancel: true,
            },
        }).then((confirmed) => {
            if (confirmed) {
                $.ajax({
                    type: "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: "{{ route('match.deletematchplayer') }}",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        swal("Match Player has been deleted!", {
                            icon: "success",
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        swal("Error Occured!");
                    }
                });
            } else {
                swal("Decline Delete Request!");
            }
        });
    }
</script>
