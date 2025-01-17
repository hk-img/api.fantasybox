@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    View Matches
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
                    <a class="btn btn-primary" href="{{ route('importmatch', base64_encode($fantasy_type)) }}">
                        <i class="bi bi-cloud-download-fill"></i> Import Matches
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
                    <h4 class="card-header-title">View Matches</h4>
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
                            <th class="table-column-ps-0">Action</th>
                            <th class="table-column-ps-0">Fantasy</th>
                            <th class="table-column-ps-0">Match</th>
                            <th class="table-column-ps-0">Match Time</th>
                            <th class="table-column-ps-0">Squad Available</th>
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
                                <td>
                                    @if ($item->squadstatus == 'no')
                                        <a href="{{ route('match.edit', base64_encode($item->id)) }}" type="button"
                                            class="btn btn-success btn-sm" data-bs-toggle="tooltip" data-bs-placement="top"
                                            title="Import Squad">
                                            <i class="bi bi-cloud-download-fill"></i> Import Squad
                                        </a>
                                    @else
                                        <a href="{{ route('match.edit', base64_encode($item->id)) }}" type="button"
                                            class="btn btn-white btn-sm" data-bs-toggle="tooltip" data-bs-placement="top"
                                            title="Edit Match & Series">
                                            <i class="bi-pencil-fill me-1"></i>
                                        </a>
                                        @if (!empty($item->series))
                                            @if ($item->launch_status == 'launched')
                                                <a href="{{ route('match.launchmatch', base64_encode($item->id)) }}"
                                                    type="button" class="btn btn-danger btn-sm" data-bs-toggle="tooltip"
                                                    data-bs-placement="top" title="View Match">
                                                    <i class="bi-eye me-1"></i>
                                                </a>
                                            @endif
                                            @if ($item->launch_status == 'pending')
                                                <a href="{{ route('match.launchmatch', base64_encode($item->id)) }}"
                                                    type="button" class="btn btn-success btn-sm"
                                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                                    title="Launch Match">
                                                    <i class="me-1"><svg xmlns="http://www.w3.org/2000/svg"
                                                            width="16" height="16" fill="currentColor"
                                                            class="bi bi-rocket-takeoff-fill" viewBox="0 0 16 16">
                                                            <path
                                                                d="M12.17 9.53c2.307-2.592 3.278-4.684 3.641-6.218.21-.887.214-1.58.16-2.065a3.578 3.578 0 0 0-.108-.563 2.22 2.22 0 0 0-.078-.23V.453c-.073-.164-.168-.234-.352-.295a2.35 2.35 0 0 0-.16-.045 3.797 3.797 0 0 0-.57-.093c-.49-.044-1.19-.03-2.08.188-1.536.374-3.618 1.343-6.161 3.604l-2.4.238h-.006a2.552 2.552 0 0 0-1.524.734L.15 7.17a.512.512 0 0 0 .433.868l1.896-.271c.28-.04.592.013.955.132.232.076.437.16.655.248l.203.083c.196.816.66 1.58 1.275 2.195.613.614 1.376 1.08 2.191 1.277l.082.202c.089.218.173.424.249.657.118.363.172.676.132.956l-.271 1.9a.512.512 0 0 0 .867.433l2.382-2.386c.41-.41.668-.949.732-1.526l.24-2.408Zm.11-3.699c-.797.8-1.93.961-2.528.362-.598-.6-.436-1.733.361-2.532.798-.799 1.93-.96 2.528-.361.599.599.437 1.732-.36 2.531Z" />
                                                            <path
                                                                d="M5.205 10.787a7.632 7.632 0 0 0 1.804 1.352c-1.118 1.007-4.929 2.028-5.054 1.903-.126-.127.737-4.189 1.839-5.18.346.69.837 1.35 1.411 1.925Z" />
                                                        </svg></i>
                                                </a>
                                            @endif
                                        @endif
                                    @endif
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->fantasyname }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <div class="row">
                                            <div class="col-5">
                                                <div class="col-12 fs-13 mb-1 text-center"><?php echo $item->team1team; ?></div>
                                                <div class="col-12 text-center">
                                                    @if (strpos($item->team1logo, 'https') === 0)
                                                        <img class="avatar avatar-lg" src="{{ $item->team1logo }}"
                                                            class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                            onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
                                                    @else
                                                        <img class="avatar avatar-lg"
                                                            src="{{ asset('public/' . $item->team1logo) }}"
                                                            class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                            onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="col-12 text-center h5">V/S</div>
                                            </div>
                                            <div class="col-5">
                                                <div class="col-12 fs-13 mb-1 text-center"><?php echo $item->team2team; ?></div>
                                                <div class="col-12 text-center">
                                                    @if (strpos($item->team2logo, 'https') === 0)
                                                        <img class="avatar avatar-lg" src="{{ $item->team2logo }}"
                                                            class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                            onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
                                                    @else
                                                        <img class="avatar avatar-lg"
                                                            src="{{ asset('public/' . $item->team2logo) }}"
                                                            class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                            onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span
                                            class="d-block h5 text-inherit mb-0">{{ date('j-M-Y h:i A (D)', strtotime($item->start_date)) }}</span>
                                    </div>
                                </td>
                                @if ($item->squadstatus == 'no')
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0 text-danger">No</span>
                                        </div>
                                    </td>
                                @else
                                    <td class="table-column-ps-0">
                                        <div class="ms-3">
                                            <span class="d-block h5 text-inherit mb-0 text-success"><i
                                                    class="bi bi-people-fill nav-icon"></i> Yes</span>
                                        </div>
                                    </td>
                                @endif
                            </tr>
                            @php
                                $i++; // Increment the counter
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
    function getfantasytype(selectElement) {
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var selectedName = selectedOption.textContent.trim();
        // Encode the selectedName using Base64
        var encodedName = btoa(selectedName);
        console.log(encodedName);
        window.location.href = '{{ route('match.view', ':encodedName') }}'.replace(':encodedName', encodedName);
    }
</script>
