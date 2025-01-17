@php
    use App\Traits\SettingsTrait;
@endphp
@extends('admin.main')
@section('title')
    View Match Listing
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Result Manager</h1>
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
                    <h4 class="card-header-title">View Match Listing</h4>
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
                     "pageLength": 10,
                     "isResponsive": false,
                     "isShowPaging": false,
                     "pagination": "datatablePagination"
                   }'>
                    <thead class="thead-light">
                        <tr>
                            <th class="table-column-pe-0">
                                #
                            </th>
                            <th class="table-column-ps-0">Match Name</th>
                            <th class="table-column-ps-0">Status</th>
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
                                        <a href="{{ route('result.matchscore', base64_encode($item->matchkey)) }}" class="d-block h5 text-danger mb-2" style="cursor: pointer">{{ $item->name }}<i
                                                class="bi bi-arrow-right-circle-fill" style="margin-left: 5px"></i></a>
                                        <span
                                            class="d-block h5 text-success mb-2">{{ date('j-M-Y h:i A (D)', strtotime($item->start_date)) }}
                                        </span>
                                        <a class="d-block h5 text-inherit mb-2 mt-2"
                                            href="{{ route('result.matchcontests', base64_encode($item->matchkey)) }}"
                                            style="cursor: pointer">Total
                                            Contest :
                                            {{ DB::table('matchchallenges')->where('matchkey', $item->matchkey)->count() }}<i
                                                class="bi bi-arrow-right-circle-fill" style="margin-left: 5px"></i></a>
                                        <span class="d-block h5 text-inherit mb-2">Match Status :
                                            {{ $item->status }}</span>
                                        <span class="d-block h5 text-inherit mb-2">Match Final Status :
                                            {{ $item->final_status }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        @if ($item->final_status == 'pending' || $item->final_status == 'IsReviewed')
                                            @if ($item->status == 'completed')
                                                <a class="d-block h5 text-success mb-2" style="cursor: pointer"
                                                    data-bs-toggle="modal" data-bs-target="#exampleModalTopCover"
                                                    data-id="{{ $item->id }}">Is Winner
                                                    Declared<i class="bi bi-arrow-right-circle-fill"
                                                        style="margin-left: 5px"></i></a>
                                            @endif
                                            <a class="d-block h5 text-danger mb-2"
                                                onclick="matchcancel(<?php echo $item->id; ?>)" style="cursor: pointer">Is
                                                Cacelled<i class="bi bi-arrow-right-circle-fill"
                                                    style="margin-left: 5px"></i></a>
                                        @elseif($item->final_status == 'winnerdeclared')
                                            <a class="btn btn-success d-block h5 mb-2"
                                                href="{{ route('result.viewwinners', base64_encode($item->matchkey)) }}"
                                                style="border-radius: 10px;width: fit-content;">
                                                <i class="bi bi-eye-fill"></i> View Winners
                                            </a>
                                            <a class="d-block h5 text-success mb-2" style="cursor: pointer"
                                            href="{{ route('give_influencer_bonus', ['matchkey'=>$item->matchkey]) }}">Distribute Influencers Amount<i class="bi bi-arrow-right-circle-fill"
                                                        style="margin-left: 5px"></i></a>
                                        @else
                                            <p class="text-danger">Match Cacelled</p>
                                        @endif
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
                        <i class="bi bi-key-fill"></i>
                    </span>
                </div>
                <form method="POST" action="{{ route('result.matchwinnerdeclear') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <label for="masterpassword" class="form-label">Master Password *<i
                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                data-bs-placement="top" title="masterpassword"></i></label>
                        <input type="hidden" value="" name="matchkey" id="modalItemId">
                        <input type="password" class="form-control" name="masterpassword" required id="masterpassword"
                            placeholder="Please Enter Masterpassword" aria-label="" value="" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white" data-bs-dismiss="modal"><i
                                class="bi bi-x-circle-fill"></i> Close</button>
                        <button type="submit" class="btn btn-success"><i class="bi bi-trophy-fill"></i> Winner
                            Declear</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
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
    });
</script>
<script>
    function matchcancel(id) {
        swal({
            title: "Are you sure?",
            text: "You want to cancel match!",
            icon: "error",
            buttons: {
                confirm: {
                    className: "btn-danger",
                    text: "Yes",
                    value: true,
                },
                cancel: {
                    text: "No",
                    value: null,
                    visible: true,
                    className: "",
                },
            },
        }).then((confirmed) => {
            if (confirmed) {
                $.ajax({
                    type: "POST",
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    },
                    url: "{{ route('result.matchcancel') }}",
                    data: {
                        matchkey: id
                    },
                    success: function(data) {
                        swal("Match has been cancelled !", {
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
                swal("Decline Cancel Request!");
            }
        });
    }
</script>
