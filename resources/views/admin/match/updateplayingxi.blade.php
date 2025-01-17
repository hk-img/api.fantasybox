@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
    if (isset($_GET['matchkey'])) {
        $matchkey = $_GET['matchkey'];
    } else {
        $matchkey = '';
    }
@endphp
@extends('admin.main')
@section('title')
    Update PlayingXI
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-   header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Match Manager</h1>
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
                        <h4 class="card-header-title">Choose Match</h4>
                        <!-- End Dropdown -->

                        <div class="tom-select-custom">
                            <select class="js-select form-select" id="fantasy_type" name="fantasy_type"
                                onchange="getfantasytype(this)"
                                data-hs-tom-select-options='{
                                              "searchInDropdown": false,
                                              "hideSearch": true
                                            }'
                                required>
                                @foreach ($getfantasy as $val)
                                    <option <?php if ($fantasy_type == $val->name) {
                                        echo 'selected';
                                    } ?> value="{{ $val->id }}"
                                        data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                        {{ $val->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <!-- Card -->
                            <div class="col-9">
                                <select class="js-select form-select" id="matchkey" name="matchkey"
                                    onchange="updateplayingxi(this.value)"
                                    data-hs-tom-select-options='{
                                                                  "searchInDropdown": false,
                                                                  "hideSearch": true
                                                                }'
                                    required>
                                    <option value=""
                                        data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">Please Select Match</span></span>'>
                                        Please Select Match</option>
                                    @foreach ($launchedmatch as $val)
                                        <option <?php if ($matchkey == $val->matchkey) {
                                            echo 'selected';
                                        } ?> value="{{ $val->matchkey }}"
                                            data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                            {{ $val->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-3">
                                @if (!empty($findmatchdetails) && $findmatchdetails->playing11_status == 1)
                                    <a class="btn btn-danger <?php if (empty($matchkey)) {
                                        echo 'disabled';
                                    } ?>"
                                        href="{{ route('match.unlaunchplayingxi', base64_encode($matchkey)) }}">
                                        <i class="">
                                            <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 20010904//EN"
                                             "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
                                            <svg version="1.0" xmlns="http://www.w3.org/2000/svg"
                                             width="16" height="16" viewBox="0 0 582.000000 580.000000"
                                             preserveAspectRatio="xMidYMid meet">
                                            
                                            <g transform="translate(0.000000,580.000000) scale(0.100000,-0.100000)"
                                            fill="#ffff" stroke="none">
                                            <path d="M2725 5555 c-16 -7 -238 -222 -491 -477 l-462 -463 -56 -115 c-65
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
                                            31 282 12z"/>
                                            <path d="M4790 4875 c-14 -8 -45 -17 -70 -21 -25 -4 -53 -11 -63 -16 -10 -5
                                            -30 -12 -44 -14 -14 -3 -44 -11 -66 -19 -23 -8 -50 -15 -59 -15 -10 0 -37 -6
                                            -60 -14 -24 -7 -83 -26 -133 -41 -120 -37 -206 -64 -230 -75 -11 -5 -56 -21
                                            -100 -36 -44 -15 -97 -35 -117 -45 -21 -11 -42 -19 -48 -19 -6 0 -84 -36 -173
                                            -81 -153 -76 -327 -182 -327 -200 0 -5 21 -20 48 -35 26 -15 90 -57 142 -93
                                            329 -227 626 -545 815 -873 22 -38 45 -68 51 -68 7 0 34 24 60 53 62 68 193
                                            325 254 497 13 36 27 69 32 75 4 5 8 17 8 27 0 10 4 26 9 36 43 79 115 327
                                            161 552 11 52 29 138 41 190 27 121 31 155 24 208 l-6 42 -62 0 c-34 -1 -73
                                            -7 -87 -15z"/>
                                            </g>
                                            </svg>
                                            </i>Un Launch Update Playing XI
                                    </a>
                                @else
                                    <a class="btn btn-warning <?php if (empty($matchkey)) {
                                        echo 'disabled';
                                    } ?>"
                                        href="{{ route('match.launchplayingxi', base64_encode($matchkey)) }}">
                                        <i class=""><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                height="16" fill="currentColor" class="bi bi-rocket-takeoff-fill"
                                                viewBox="0 0 16 16">
                                                <path
                                                    d="M12.17 9.53c2.307-2.592 3.278-4.684 3.641-6.218.21-.887.214-1.58.16-2.065a3.578 3.578 0 0 0-.108-.563 2.22 2.22 0 0 0-.078-.23V.453c-.073-.164-.168-.234-.352-.295a2.35 2.35 0 0 0-.16-.045 3.797 3.797 0 0 0-.57-.093c-.49-.044-1.19-.03-2.08.188-1.536.374-3.618 1.343-6.161 3.604l-2.4.238h-.006a2.552 2.552 0 0 0-1.524.734L.15 7.17a.512.512 0 0 0 .433.868l1.896-.271c.28-.04.592.013.955.132.232.076.437.16.655.248l.203.083c.196.816.66 1.58 1.275 2.195.613.614 1.376 1.08 2.191 1.277l.082.202c.089.218.173.424.249.657.118.363.172.676.132.956l-.271 1.9a.512.512 0 0 0 .867.433l2.382-2.386c.41-.41.668-.949.732-1.526l.24-2.408Zm.11-3.699c-.797.8-1.93.961-2.528.362-.598-.6-.436-1.733.361-2.532.798-.799 1.93-.96 2.528-.361.599.599.437 1.732-.36 2.531Z" />
                                                <path
                                                    d="M5.205 10.787a7.632 7.632 0 0 0 1.804 1.352c-1.118 1.007-4.929 2.028-5.054 1.903-.126-.127.737-4.189 1.839-5.18.346.69.837 1.35 1.411 1.925Z" />
                                            </svg></i> Launch Update Playing XI
                                    </a>
                                @endif
                            </div>
                        </div>
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>

        <div class="card">
            <!-- Header -->
            <div class="card-header card-header-content-md-between">
                <div class="mb-2 mb-md-0">
                    <h4 class="card-header-title">Team :-
                        {{ isset($findmatchdetails->team1team) ? $findmatchdetails->team1team : '' }}</h4>
                </div>
                <div class="mb-2 mb-md-0">
                    <form>
                        <!-- Search -->
                        <div class="input-group input-group-merge input-group-flush">
                            <div class="input-group-prepend input-group-text">
                                <i class="bi-search"></i>
                            </div>
                            {{-- <input id="datatableSearch" type="search" class="form-control" placeholder="Search"
                                aria-label="Search"> --}}
                        </div>
                        <!-- End Search -->
                    </form>
                </div>

                <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2">
                    <!-- Datatable Info -->
                    <!-- Dropdown -->
                    <div class="dropdown">
                        {{-- <button type="button" class="btn btn-white btn-sm dropdown-toggle w-100" id="usersExportDropdown"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi-download me-2"></i> Export
                        </button> --}}

                        <div class="dropdown-menu dropdown-menu-sm-end" aria-labelledby="usersExportDropdown">
                            <span class="dropdown-header">Options</span>
                            <a id="export-copy" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/illustrations/copy-icon.svg') }}"
                                    alt="Image Description">
                                Copy
                            </a>
                            <a id="export-print" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/illustrations/print-icon.svg') }}"
                                    alt="Image Description">
                                Print
                            </a>
                            <div class="dropdown-divider"></div>
                            <span class="dropdown-header">Download options</span>
                            <a id="export-excel" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/brands/excel-icon.svg') }}" alt="Image Description">
                                Excel
                            </a>
                            <a id="export-csv" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/components/placeholder-csv-format.svg') }}"
                                    alt="Image Description">
                                .CSV
                            </a>
                            <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/brands/pdf-icon.svg') }}" alt="Image Description">
                                PDF
                            </a>
                        </div>
                    </div>
                    <!-- End Dropdown -->
                </div>
            </div>
            <!-- End Header -->
            <!-- Table -->
            <div class="table-responsive datatable-custom position-relative">
                <table id="datatable"
                    class="table table-lg table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                    data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0, 3],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 30,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                        <tr class="text-center">
                            <th class="table-column-pe-0">#</th>
                            <th class="table-column-ps-0">S.No.</th>
                            <th class="table-column-ps-0">Fantasy</th>
                            <th class="table-column-ps-0">Player Name</th>
                            <th class="table-column-ps-0">Player Role</th>
                            <th class="table-column-ps-0">Player Credit</th>
                        </tr>
                    </thead>

                    <tbody>
                        @if (!empty($findplayer1details))
                            @forelse ($findplayer1details as $key=> $item)
                                <tr class="text-center">
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" name="checkcontest" type="checkbox"
                                                value="{{ $item->id }}" onclick="updateplaying(<?php echo $item->id; ?>)"
                                                id="datatableCheckAll1" {{ $item->vplaying == 1 ? 'checked' : '' }}  {{ $findmatchdetails->playing11_status ? 'disabled' : '' }}>
                                            <label class="form-check-label" for="datatableCheckAll1"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $key + 1 }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $fantasy_type }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->name }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->role }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->credit }}</span>
                                        </div>
                                    </td>
                                </tr>
                            @empty
                            @endforelse
                        @endif
                    </tbody>
                </table>
            </div>
            <!-- End Table -->

            <!-- Footer -->
            <div class="card-footer">
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-sm mb-2 mb-sm-0">
                        <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                            <span class="me-2">Showing:</span>

                            <!-- Select -->
                            <div class="tom-select-custom">
                                <select id="datatableEntries" class="js-select form-select form-select-borderless w-auto"
                                    autocomplete="off"
                                    data-hs-tom-select-options='{
                              "searchInDropdown": false,
                              "hideSearch": true
                            }'>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="30" selected>30</option>
                                    <option value="20">100</option>
                                </select>
                            </div>
                            <!-- End Select -->

                            <span class="text-secondary me-2">of</span>

                            <!-- Pagination Quantity -->
                            <span id="datatableWithPaginationInfoTotalQty"></span>
                        </div>
                    </div>
                    <!-- End Col -->

                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <!-- End Footer -->
        </div>

        <div class="card">
            <!-- Header -->
            <div class="card-header card-header-content-md-between">
                <div class="mb-2 mb-md-0">
                    <h4 class="card-header-title">Team :-
                        {{ isset($findmatchdetails->team2team) ? $findmatchdetails->team2team : '' }}</h4>
                </div>
                <div class="mb-2 mb-md-0">
                    <form>
                        <!-- Search -->
                        <div class="input-group input-group-merge input-group-flush">
                            <div class="input-group-prepend input-group-text">
                                <i class="bi-search"></i>
                            </div>
                            {{-- <input id="datatableSearch" type="search" class="form-control" placeholder="Search"
                                aria-label="Search"> --}}
                        </div>
                        <!-- End Search -->
                    </form>
                </div>

                <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2">
                    <!-- Datatable Info -->
                    <!-- Dropdown -->
                    <div class="dropdown">
                        {{-- <button type="button" class="btn btn-white btn-sm dropdown-toggle w-100" id="usersExportDropdown"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi-download me-2"></i> Export
                        </button> --}}

                        <div class="dropdown-menu dropdown-menu-sm-end" aria-labelledby="usersExportDropdown">
                            <span class="dropdown-header">Options</span>
                            <a id="export-copy" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/illustrations/copy-icon.svg') }}"
                                    alt="Image Description">
                                Copy
                            </a>
                            <a id="export-print" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/illustrations/print-icon.svg') }}"
                                    alt="Image Description">
                                Print
                            </a>
                            <div class="dropdown-divider"></div>
                            <span class="dropdown-header">Download options</span>
                            <a id="export-excel" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/brands/excel-icon.svg') }}" alt="Image Description">
                                Excel
                            </a>
                            <a id="export-csv" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/components/placeholder-csv-format.svg') }}"
                                    alt="Image Description">
                                .CSV
                            </a>
                            <a id="export-pdf" class="dropdown-item" href="javascript:;">
                                <img class="avatar avatar-xss avatar-4x3 me-2"
                                    src="{{ asset('public/assets/svg/brands/pdf-icon.svg') }}" alt="Image Description">
                                PDF
                            </a>
                        </div>
                    </div>
                    <!-- End Dropdown -->
                </div>
            </div>
            <!-- End Header -->
            <!-- Table -->
            <div class="table-responsive datatable-custom position-relative">
                <table id="datatable"
                    class="table table-lg table-borderless table-thead-bordered table-nowrap table-align-middle card-table"
                    data-hs-datatables-options='{
                     "columnDefs": [{
                        "targets": [0, 3],
                        "orderable": false
                      }],
                     "order": [],
                     "info": {
                       "totalQty": "#datatableWithPaginationInfoTotalQty"
                     },
                     "search": "#datatableSearch",
                     "entries": "#datatableEntries",
                     "pageLength": 30,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                        <tr class="text-center">
                            <th class="table-column-pe-0">#</th>
                            <th class="table-column-ps-0">S.No.</th>
                            <th class="table-column-ps-0">Fantasy</th>
                            <th class="table-column-ps-0">Player Name</th>
                            <th class="table-column-ps-0">Player Role</th>
                            <th class="table-column-ps-0">Player Credit</th>
                        </tr>
                    </thead>

                    <tbody>
                        @if (!empty($findplayer2details))
                            @forelse ($findplayer2details as $key=> $item)
                                <tr class="text-center">
                                    <td class="table-column-pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" name="checkcontest" type="checkbox"
                                                value="{{ $item->id }}" onclick="updateplaying(<?php echo $item->id; ?>)"
                                                id="datatableCheckAll1" {{ $item->vplaying == 1 ? 'checked' : '' }} {{ $findmatchdetails->playing11_status ? 'disabled' : '' }}>
                                            <label class="form-check-label" for="datatableCheckAll1"></label>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $key + 1 }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $fantasy_type }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->name }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->role }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->credit }}</span>
                                        </div>
                                    </td>
                                </tr>
                            @empty
                            @endforelse
                        @endif
                    </tbody>
                </table>
            </div>
            <!-- End Table -->

            <!-- Footer -->
            <div class="card-footer">
                <div class="row justify-content-center justify-content-sm-between align-items-sm-center">
                    <div class="col-sm mb-2 mb-sm-0">
                        <div class="d-flex justify-content-center justify-content-sm-start align-items-center">
                            <span class="me-2">Showing:</span>

                            <!-- Select -->
                            <div class="tom-select-custom">
                                <select id="datatableEntries" class="js-select form-select form-select-borderless w-auto"
                                    autocomplete="off"
                                    data-hs-tom-select-options='{
                              "searchInDropdown": false,
                              "hideSearch": true
                            }'>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="30" selected>30</option>
                                    <option value="20">100</option>
                                </select>
                            </div>
                            <!-- End Select -->

                            <span class="text-secondary me-2">of</span>

                            <!-- Pagination Quantity -->
                            <span id="datatableWithPaginationInfoTotalQty"></span>
                        </div>
                    </div>
                    <!-- End Col -->

                    <div class="col-sm-auto">
                        <div class="d-flex justify-content-center justify-content-sm-end">
                            <!-- Pagination -->
                            <nav id="datatablePagination" aria-label="Activity pagination"></nav>
                        </div>
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <!-- End Footer -->
        </div>

        <!-- End Body -->
    </div>
@endsection
<script>
    function updateplayingxi(value) {
        // Encode the selectedName using Base64
        var encodedName = 'Q3JpY2tldA==';
        console.log(value);
        var url = "{{ route('match.updateplayingxi', ':encodedName') }}";
        url = url.replace(':encodedName', encodedName);
        url = url + "?matchkey=" + value; // Append the matchkey parameter
        window.location.href = url;
    }
</script>
<script>
    function getfantasytype(selectElement) {
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedName = selectedOption.textContent.trim();
        // Encode the selectedName using Base64
        var encodedName = btoa(selectedName);
        console.log(encodedName);
        window.location.href = '{{ route('match.updateplayingxi', ':encodedName') }}'.replace(':encodedName',
            encodedName);
    }

    function updateplaying(matchplayerid) {
        console.log(matchplayerid);
        $.ajax({
            url: "{{ route('match.updateplayingxiplayer') }}", // Replace with the actual endpoint
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            method: 'POST', // Or 'GET' depending on your needs
            data: {
                matchplayerid: matchplayerid
            },
            success: function(response) {
                console.log('Update successful:', response);
                // Handle success response, if needed
            },
            error: function(xhr, status, error) {
                console.log('Error:', error);
                // Handle error response, if needed
            }
        });
    }
</script>
