@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
    if (!isset($_GET['status'])) {
        $_GET['status'] = 0;
    }
@endphp
@extends('admin.main')
@section('title')
    View Aadhar Card
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Verification Manager</h1>
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
                    <h4 class="card-header-title">View Aadhar Card</h4>
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
                    <div class="tom-select-custom">
                        <select class="js-select form-select" id="fantasy_type" name="fantasy_type"
                            onchange="getstatus(this.value)"
                            data-hs-tom-select-options='{
                                          "searchInDropdown": false,
                                          "hideSearch": true
                                        }'
                            required>
                            <option <?php if (0 == $_GET['status']) {
                                echo 'selected';
                            } ?> value=0
                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">0</span></span>'>
                                Pending</option>
                            <option <?php if (1 == $_GET['status']) {
                                echo 'selected';
                            } ?> value=1
                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">1</span></span>'>
                                Approved</option>
                            <option <?php if (-1 == $_GET['status']) {
                                echo 'selected';
                            } ?> value=-1
                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">-1</span></span>'>
                                Rejected</option>
                        </select>
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
                            <th class="table-column-pe-0">#</th>
                            <th class="table-column-ps-0">Action</th>
                            <th class="table-column-ps-0">UID</th>
                            <th class="table-column-ps-0">Name</th>
                            <th class="table-column-ps-0">Email</th>
                            <th class="table-column-ps-0">Mobile</th>
                            <th class="table-column-ps-0">DOB</th>
                            <th class="table-column-ps-0">Aadhar No.</th>
                            <th class="table-column-ps-0">Image Front</th>
                            <th class="table-column-ps-0">Image Back</th>
                            <th class="table-column-ps-0">Status</th>
                            <th class="table-column-ps-0">Uploading Date</th>
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
                                    <a href="{{ route('verification.editaadhar', base64_encode($item->id)) }}"
                                        type="button" class="btn btn-white btn-sm">
                                        <i class="bi-eye me-1"></i> View
                                    </a>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <a href="{{ route('user.getuserdetail', base64_encode($item->uid)) }}"
                                            class="d-block h5 text-inherit mb-0">{{ $item->uid }}</a>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->aadhar_name }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->email }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->mobile }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->aadhar_dob }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->aadhar_number }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <a href="{{ asset('public/'.$item->image) }}" class="d-block h5 text-inherit mb-0 glightbox2"><img
                                                style="width: 50px;height: 50px;border-radius: 50%;margin-bottom: 30px;"
                                                src="{{ asset('public/'.$item->image) }}" alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'"></a>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <a href="{{ asset('public/'.$item->imageback) }}" class="d-block h5 text-inherit mb-0 glightbox2"><img
                                                style="width: 50px;height: 50px;border-radius: 50%;margin-bottom: 30px;"
                                                src="{{ asset('public/'.$item->imageback) }}" alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'"></a>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        @if ($item->status == 0)
                                            <h5 class="mb-0 text-warning">
                                                Pending
                                            </h5>
                                        @elseif($item->status == -1)
                                            <h5 class="mb-0 text-danger">
                                                Rejected
                                            </h5>
                                        @else
                                            <h5 class="mb-0 text-success">
                                                Approved
                                            </h5>
                                        @endif
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->created_at }}</span>
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
<script>
    function getstatus(selectElement) {
        var url = '{{ route('verification.viewaadhar', ['status' => '']) }}' + selectElement;
        window.location.href = url;
    }
</script>
