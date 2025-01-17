@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Credit & Debit Amount
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
                    <a class="btn btn-primary" href="{{ route('user.adminwallet') }}">
                        <i class="bi-eye"></i> View Admin Wallet List
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
                    <h4 class="card-header-title">Credit & Debit Amount</h4>
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
                        <tr>
                            <th class="table-column-pe-0">#</th>
                            <th class="table-column-ps-0">Action</th>
                            <th class="table-column-ps-0">Team Name</th>
                            <th class="table-column-ps-0">Email</th>
                            <th class="table-column-ps-0">Mobile</th>
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
                                    <button type="button" class="btn btn-white btn-sm text-success" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalTopCover" data-id="{{ $item->id }}">
                                        <i class="bi bi-plus-circle-fill text-success"></i> Credit
                                    </button>
                                    <button type="button" class="btn btn-white btn-sm text-danger" data-bs-toggle="modal"
                                        data-bs-target="#exampleModalTopCover1" data-id="{{ $item->id }}">
                                        <i class="bi bi-dash-circle-fill text-danger"></i> Debit
                                    </button>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->team }}</span>
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
    <!-- Modal -->
    <div id="exampleModalTopCover" class="modal fade" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalTopCoverTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <!-- Header -->
                <div class="modal-top-cover bg-dark text-center">
                    <figure class="position-absolute end-0 bottom-0 start-0">
                        <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            viewBox="0 0 1920 100.1">
                            <path fill="#fff" d="M0,0c0,0,934.4,93.4,1920,0v100.1H0L0,0z" />
                        </svg>
                    </figure>

                    <div class="modal-close">
                        <button type="button" class="btn-close btn-close-light" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                </div>
                <!-- End Header -->

                <div class="modal-top-cover-icon">
                    <span class="icon icon-lg icon-light icon-circle icon-centered shadow-sm">
                        <i class="bi bi-chat-left-text"></i>
                    </span>
                </div>
                <form method="POST" action="{{ route('user.creditamount') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <label for="amount" class="form-label">Amount *<i class="bi-question-circle text-body ms-1"
                                data-bs-toggle="tooltip" data-bs-placement="top" title="amount"></i></label>
                        <input type="number" class="form-control" name="amount" required id="amount"
                            placeholder="Please Enter Amount" aria-label="" value="" required>
                        <label for="type" class="form-label">Select Amount Type *<i
                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="Type"></i></label>
                        <select class="js-select form-select" id="type" name="type"
                            data-hs-tom-select-options='{
                                          "searchInDropdown": false,
                                          "hideSearch": true
                                        }'>
                            <option value="">Select Amount Type</option>
                            <option value="add_fund">Add Fund</option>
                            <option value="winning">Winning</option>
                            <option value="bonus">Bonus</option>
                        </select>
                        <label for="description" class="form-label">Description *<i
                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="description"></i></label>
                        <input type="hidden" value="" name="userid" id="modalItemId">
                        <textarea type="text" class="form-control" name="description" required id="description" placeholder=""
                            aria-label="" value="" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-bs-dismiss="modal"><i
                                class="bi bi-x-circle-fill"></i> Close</button>
                        <button type="submit" class="btn btn-success"><i class="bi bi-plus-circle-fill text-white"></i>
                            Add Amount</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="exampleModalTopCover1" class="modal fade" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalTopCoverTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <!-- Header -->
                <div class="modal-top-cover bg-dark text-center">
                    <figure class="position-absolute end-0 bottom-0 start-0">
                        <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                            viewBox="0 0 1920 100.1">
                            <path fill="#fff" d="M0,0c0,0,934.4,93.4,1920,0v100.1H0L0,0z" />
                        </svg>
                    </figure>

                    <div class="modal-close">
                        <button type="button" class="btn-close btn-close-light" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                </div>
                <!-- End Header -->

                <div class="modal-top-cover-icon">
                    <span class="icon icon-lg icon-light icon-circle icon-centered shadow-sm">
                        <i class="bi bi-chat-left-text"></i>
                    </span>
                </div>
                <form method="POST" action="{{ route('user.debitamount') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <label for="amount" class="form-label">Amount *<i class="bi-question-circle text-body ms-1"
                                data-bs-toggle="tooltip" data-bs-placement="top" title="amount"></i></label>
                        <input type="number" class="form-control" name="amount" required id="amount"
                            placeholder="Please Enter Amount" aria-label="" value="" required>
                        <label for="type" class="form-label">Select Amount Type *<i
                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="Type"></i></label>
                        <select class="js-select form-select" id="type" name="type"
                            data-hs-tom-select-options='{
                                          "searchInDropdown": false,
                                          "hideSearch": true
                                        }'>
                            <option value="">Select Amount Type</option>
                            <option value="add_fund">Add Fund</option>
                            <option value="winning">Winning</option>
                            <option value="bonus">Bonus</option>
                        </select>
                        <label for="description" class="form-label">Description *<i
                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="description"></i></label>
                        <input type="hidden" value="" name="userid" id="modalItemId">
                        <textarea type="text" class="form-control" name="description" required id="description" placeholder=""
                            aria-label="" value="" required></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-bs-dismiss="modal"><i
                                class="bi bi-x-circle-fill"></i> Close</button>
                        <button type="submit" class="btn btn-danger text-white"><i
                                class="bi bi-dash-circle-fill text-white"></i> Debit Amount</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Modal -->
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#exampleModalTopCover').on('show.bs.modal', function(event) {
            console.log('aj');
            var button = $(event.relatedTarget); // Button that triggered the modal
            var itemId = button.data('id'); // Extract the ID from data-id attribute
            var modal = $(this);

            modal.find('#modalItemId').val(itemId); // Set the dynamic ID in the input field
        });
        $('#exampleModalTopCover1').on('show.bs.modal', function(event) {
            console.log('aj');
            var button = $(event.relatedTarget); // Button that triggered the modal
            var itemId = button.data('id'); // Extract the ID from data-id attribute
            var modal = $(this);

            modal.find('#modalItemId').val(itemId); // Set the dynamic ID in the input field
        });
    });
</script>
