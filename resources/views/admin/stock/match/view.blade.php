@extends('admin.main')
@section('title')
    View Stock Match Listing
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
                    <h4 class="card-header-title">View Stock Match Listing</h4>
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
                            <th class="table-column-pe-0">
                                #
                            </th>
                            <th class="table-column-ps-0">Match Date</th>
                            <th class="table-column-ps-0">Status</th>
                            <th class="table-column-ps-0">Launch Status</th>
                            <th class="table-column-ps-0">Final Status</th>
                            <th class="table-column-ps-0">Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        @php
                            $i = 1;
                        @endphp

                        @foreach ($collection as $item)
                            <tr class="text-center">
                                <td class="table-column-pe-0">
                                    {{ $i }}
                                </td>
                                <td class="table-column-pe-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0"><span class="text-dark">{{ date('l,',strtotime($item->date))}}</span><span class="text-warning">{{ date(' d-M-y',strtotime($item->date))}}</span><span class="text-success ml-2">{{ date(' h:i:s a',strtotime($item->date))}}</span></span>
                                    </div>
                                </td>
                                <td class="table-column-pe-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->status }}</span>
                                    </div>
                                </td>
                                <td class="table-column-pe-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->launch_status }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->final_status }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <a class="btn btn-success h5 mb-2" href="{{route('match.stockcustomcontest',['matchkey'=>$item->id])}}" style="cursor: pointer"><i
                                                class="bi bi-eye-fill" style="margin-right: 5px"></i>View
                                            Contest</a>
                                    </div>
                                </td>
                                {{-- <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <a class="d-block h5 text-warning mb-2" style="cursor: pointer">Is Reviewed<i
                                                class="bi bi-arrow-right-circle-fill" style="margin-left: 5px"></i></a>
                                        <a class="d-block h5 text-success mb-2" style="cursor: pointer">Is Winner
                                            Declared<i class="bi bi-arrow-right-circle-fill"
                                                style="margin-left: 5px"></i></a>
                                        <a class="d-block h5 text-danger mb-2" style="cursor: pointer">Is Cacelled<i
                                                class="bi bi-arrow-right-circle-fill" style="margin-left: 5px"></i></a>
                                        <a class="btn btn-success d-block h5 mb-2"
                                            style="border-radius: 10px;width: fit-content;">
                                            <i class="bi bi-eye-fill"></i> View Winners
                                        </a>
                                    </div>
                                </td> --}}
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
