@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    View Transaction History
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">User Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('user.view') }}">
                        <i class="bi-eye"></i> View Users
                    </a>
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
                    <h4 class="card-header-title">View Transaction History</h4>
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
                    class="table table-lg table-borderless table-thead-bordered table-nowrap table-align-middle card-table table-bordered table-hover text-nowrap"
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
                        <tr>
                            <th rowspan="2" data-toggle="tooltip" title="Sr.No.">#</th>
                            <th rowspan="2" data-toggle="tooltip" title="Transaction ID">Transaction ID</th>
                            <th rowspan="2">Date & Time</th>
                            <th rowspan="2" data-toggle="tooltip" title="Amount">Amount</th>
                            <th colspan="2" class="text-center text-dark">Transaction</th>
                            <th colspan="3" class="text-center text-dark">Bonus</th>
                            <th colspan="3" class="text-center text-dark">Winning</th>
                            <th colspan="3" class="text-center text-dark">Balance</th>
                            <th rowspan="2">Total</th>
                        </tr>
                        <tr>
                            <th class="text-center">Type</th>
                            <th class="text-center">Reason</th>
                            <th class="text-center" data-toggle="tooltip" title="Available">AVL</th>
                            <th class="text-center" data-toggle="tooltip" title="Credit">Cr</th>
                            <th class="text-center" data-toggle="tooltip" title="Debit">Dr</th>
                            <th class="text-center" data-toggle="tooltip" title="Available">AVL</th>
                            <th class="text-center" data-toggle="tooltip" title="Credit">Cr</th>
                            <th class="text-center" data-toggle="tooltip" title="Debit">Dr</th>
                            <th class="text-center" data-toggle="tooltip" title="Available">AVL</th>
                            <th class="text-center" data-toggle="tooltip" title="Credit">Cr</th>
                            <th class="text-center" data-toggle="tooltip" title="Debit">Dr</th>
                        </tr>
                    </thead>

                    <tbody>
                        @php
                            $i = 1;
                        @endphp

                        @foreach ($collection as $item)
                            <tr>
                                <td class="table-column-pe-0">
                                    {{ $i }}
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->transaction_id }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0"><span
                                                class='text-warning font-weight-bold'>{{ date('d-m-Y', strtotime($item->created_at)) }}</span><span
                                                class='text-success font-weight-bold'>{{ date(' h:i:s', strtotime($item->created_at)) }}</span></span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ round($item->amount, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0 <?php if (SettingsTrait::creditdebit($item->type) == 'Credit') {
                                            echo 'text-success';
                                        } else {
                                            echo 'text-danger';
                                        } ?>">
                                            {{ SettingsTrait::creditdebit($item->type) }}
                                        </span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->type }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->bal_bonus_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ round($item->bonus_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->cons_bonus, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->bal_win_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ round($item->win_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ round($item->cons_win, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->bal_fund_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->addfund_amt, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ round($item->cons_amount, 2) }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->total_available_amt }}</span>
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
