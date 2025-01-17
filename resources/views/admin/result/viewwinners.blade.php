@php
    use App\Traits\SettingsTrait;
@endphp
@extends('admin.main')
@section('title')
    View Winner
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Result Manager</h1>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->
        <!-- Stats -->
        <div class="card">
            <!-- Header -->
            <div class="card-header card-header-content-md-between">
                <div class="mb-2 mb-md-0">
                    <h4 class="card-header-title">View Winners</h4>
                </div>
                <div class="mb-2 mb-md-0">
                    <form>
                        <!-- Search -->
                        <div class="input-group input-group-merge input-group-flush">
                            <div class="input-group-prepend input-group-text">
                                <i class="bi-search"></i>
                            </div>
                            <input id="datatableSearch" type="search" class="form-control" placeholder="Search"
                                aria-label="Search">
                        </div>
                        <!-- End Search -->
                    </form>
                </div>

                <div class="d-grid d-sm-flex justify-content-md-end align-items-sm-center gap-2">
                    <!-- Datatable Info -->
                    <div id="datatableCounterInfo" style="display: none;">
                        <div class="d-flex align-items-center">
                            <span class="fs-5 me-3">
                                <span id="datatableCounter">0</span>
                                Selected
                            </span>
                            <a class="btn btn-outline-danger btn-sm" href="javascript:;">
                                <i class="bi-trash"></i> Delete
                            </a>
                        </div>
                    </div>
                    <!-- End Datatable Info -->
                    <!-- Dropdown -->
                    <div class="dropdown">
                        <button type="button" class="btn btn-white btn-sm dropdown-toggle w-100" id="usersExportDropdown"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi-download me-2"></i> Export
                        </button>

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
                     "pageLength": 10,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                        <tr class="text-center">
                            <th class="table-column-pe-0" >#</th>
                            <th class="table-column-ps-0">ChallengeId</th>
                            <th class="table-column-ps-0">IsJoin</th>
                            <th class="table-column-ps-0">IsRefund</th>
                            <th class="table-column-ps-0">Iswin</th>
                            <th class="table-column-ps-0">Userid</th>
                            <th class="table-column-ps-0">JoinDate</th>
                            <th class="table-column-ps-0">RefundDate</th>
                            <th class="table-column-ps-0">WinDate</th>
                            <th class="table-column-ps-0">UserEmail</th>
                            <th class="table-column-ps-0">Username</th>
                            <th class="table-column-ps-0">TeamRank</th>
                            <th class="table-column-ps-0">RefundAmount</th>
                            <th class="table-column-ps-0">Winamount</th>
                            <th class="table-column-ps-0">TotalPoints</th>
                            <th class="table-column-ps-0">ChallengeName</th>
                            <th class="table-column-ps-0">EntryFee</th>
                            <th class="table-column-ps-0">ConfirmedLeague</th>
                            <th class="table-column-ps-0">UserTeamName</th>
                            <th class="table-column-ps-0">Bonus %</th>
                            <th class="table-column-ps-0">MaximumUsers</th>
                            <th class="table-column-ps-0">IsPrivate</th>
                            <th class="table-column-ps-0">MaxNumberofwinners</th>
                            <th class="table-column-ps-0">Joined users</th>
                        </tr>
                    </thead>

                    <tbody>
                        @php
                            $i = 1;
                        @endphp

                        @foreach ($collection as $item)
                            @php
                                $findifrefunds = [];
                                $findfinalresults = [];
                                $findifrefunds = DB::table('refunds')
                                    ->where('userid', $item->userid)
                                    ->where('challengeid', $item->challengeid)
                                    ->first();
                                $findfinalresults = DB::table('finalresults')
                                    ->where('userid', $item->userid)
                                    ->where('challengeid', $item->challengeid)
                                    ->where('joinedid', $item->id)
                                    ->first();
                            @endphp
                            <tr class="text-center">
                                <td class="table-column-pe-0">
                                    {{ $i }}
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->challengeid }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">Yes</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findifrefunds)) {
                                            echo 'Yes';
                                        } else {
                                            echo 'No';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findfinalresults)) {
                                            echo 'Yes';
                                        } else {
                                            echo 'No';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->userid }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->created_at }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findifrefunds)) {
                                            echo $findifrefunds->created_at;
                                        } else {
                                            echo 'Not Available';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findfinalresults)) {
                                            echo $findfinalresults->created_at;
                                        } else {
                                            echo 'Not Available';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->email }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->username }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findfinalresults)) {
                                            echo $findfinalresults->rank;
                                        } else {
                                            echo 'Not Available';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findifrefunds)) {
                                            echo $findifrefunds->amount;
                                        } else {
                                            echo 0;
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if (!empty($findfinalresults)) {
                                            echo $findfinalresults->amount;
                                        } else {
                                            echo 0;
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->points }}</span>
                                    </div>
                                </td>
                                <?php
                                $cname = '';
                                if ($item->win_amount == 0) {
                                    $cname = 'Net Practice';
                                } else {
                                    $cname = 'Win Rs.' . $item->win_amount;
                                }
                                ?>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $cname }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->entryfee }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if ($item->confirmed_challenge == 1) {
                                            echo 'Yes';
                                        } else {
                                            echo 'No';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->team }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->bonus_percentage }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->maximum_user }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><?php if ($item->is_private == 1) {
                                            echo 'Yes';
                                        } else {
                                            echo 'No';
                                        } ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0"><?php
                                            $findpricecards = DB::table('matchpricecards')
                                                ->where('challenge_id', $item->challengeid)
                                                ->get();
                                            $winners = 0;
                                            if (!empty($findpricecards)) {
                                                foreach ($findpricecards as $prc) {
                                                    $winners += $prc->winners;
                                                }
                                            } else {
                                                $winners = 1;
                                            }
                                            ?><?php echo $winners; ?></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{$item->joinedusers}}</span>
                                    </div>
                                </td>

                            </tr>
                            @php
                                $i++;
                            @endphp
                        @endforeach
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
                                    <option value="10" selected>10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
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
        <!-- End Stats -->
    </div>
@endsection
