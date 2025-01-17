@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
    if (!isset($_GET['series'])) {
        $_GET['series'] = '';
    }
@endphp
@extends('admin.main')
@section('title')
    View Full Series
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Series Manager</h1>
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
                    <h4 class="card-header-title">View Full Series</h4>
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
                    <div class="tom-select-custom">
                        <select class="js-select form-select" id="series" name="series" onchange="getmatch(this.value)"
                            data-hs-tom-select-options='{
                                          "searchInDropdown": false,
                                          "hideSearch": true
                                        }'
                            required>
                            <option value=""
                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">Select Series</span></span>'>
                                Select Series
                            </option>
                            @foreach ($collection as $val)
                                <option <?php if (base64_decode($_GET['series']) == $val->id) {
                                    echo 'selected';
                                } ?> value="{{ $val->id }}"
                                    data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                    {{ $val->name }}</option>
                            @endforeach
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
                            <th class="table-column-ps-0">Match Name</th>
                            <th class="table-column-ps-0">First Team</th>
                            <th class="table-column-ps-0">Second Team</th>
                            <th class="table-column-ps-0">Match Key</th>
                            <th class="table-column-ps-0">Match Format</th>
                            <th class="table-column-ps-0">Start Date</th>
                            <th class="table-column-ps-0">Match Status</th>
                            <th class="table-column-ps-0">Launch Status</th>
                            <th class="table-column-ps-0">Final Status</th>
                            <th class="table-column-ps-0">Squad Status</th>
                        </tr>
                    </thead>

                    <tbody>
                        @if (!empty($matchdata))
                            @php
                                $i = 1;
                            @endphp
                            @foreach ($matchdata as $item)
                                <tr class="text-center">
                                    <td class="table-column-pe-0">
                                        {{ $i }}
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->name }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->team1name }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->team2name }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->matchkey }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->format }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span
                                                class="d-block h5 text-inherit mb-0 text-warning">{{ $item->start_date }}</span>
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            @if ($item->status == 'notstarted')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-danger">{{ $item->status }}</span>
                                            @elseif ($item->status == 'started')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-warning">{{ $item->status }}</span>
                                            @else
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-success">{{ $item->status }}</span>
                                            @endif
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            @if ($item->launch_status == 'pending')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-danger">{{ $item->launch_status }}</span>
                                            @else
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-success">{{ $item->launch_status }}</span>
                                            @endif
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            @if ($item->final_status == 'completed')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-success">{{ $item->final_status }}</span>
                                            @elseif ($item->final_status == 'pending')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-warning">{{ $item->final_status }}</span>
                                            @else
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-danger">{{ $item->final_status }}</span>
                                            @endif
                                        </div>
                                    </td>
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            @if ($item->squadstatus == 'yes')
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-success">{{ $item->squadstatus }}</span>
                                            @else
                                                <span
                                                    class="d-block h5 text-inherit mb-0 text-danger">{{ $item->squadstatus }}</span>
                                            @endif
                                        </div>
                                    </td>
                                </tr>
                                @php
                                    $i++;
                                @endphp
                            @endforeach
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
    function getfantasytype(selectElement) {
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedName = selectedOption.textContent.trim();
        // Encode the selectedName using Base64
        var encodedName = btoa(selectedName);
        window.location.href = '{{ route('series.viewfullseries', ':encodedName') }}'.replace(':encodedName',
            encodedName);
    }

    function getmatch(series) {
        var selectedText = $.trim($("#fantasy_type option:selected").text());
        var encodedName = btoa(selectedText);
        var baseUrl = '{{ route('series.viewfullseries', ':encodedName') }}';
        var url = baseUrl.replace(':encodedName', encodedName) + '?series=' + btoa(series);
        window.location.href = url;
    }
</script>
