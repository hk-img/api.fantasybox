@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Add Global Contest PriceCard
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Contest Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('globalcontest.view', base64_encode($getfantasy[0]->name)) }}">
                        <i class="bi-eye"></i> View Global Contest
                    </a>
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
                        <h4 class="card-header-title">Contest Info</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card h-100">
                                    <div class="card-body card-body-height">
                                        <div class="row">
                                            <div class="col-6">
                                                <ul class="list-group list-group-flush list-group-no-gutters">
                                                    <!-- List Item -->
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Winning Amount :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">{{ $collection->win_amount }}</h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Entry Fees :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">{{ $collection->entryfee }}</h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Maximum Users :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">{{ $collection->maximum_user }}</h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Multiple Entry :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">
                                                                    @if ($collection->multi_entry == 1)
                                                                        <h5 class="mb-0 text-success">Yes</h5>
                                                                    @else
                                                                        <h5 class="mb-0 text-danger">No</h5>
                                                                    @endif
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Is Running :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                @if ($collection->is_running == 1)
                                                                    <h5 class="mb-0 text-success">Yes</h5>
                                                                @else
                                                                    <h5 class="mb-0 text-danger">No</h5>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="col-6">
                                                <ul class="list-group list-group-flush list-group-no-gutters">
                                                    <!-- List Item -->
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Confirm Contest :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">
                                                                    @if ($collection->confirmed_challenge == 1)
                                                                        <h5 class="mb-0 text-success">Yes</h5>
                                                                    @else
                                                                        <h5 class="mb-0 text-danger">No</h5>
                                                                    @endif
                                                                </h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Is Bonus Allowed :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                @if ($collection->is_bonus == 1)
                                                                    <h5 class="mb-0 text-success">Yes</h5>
                                                                @else
                                                                    <h5 class="mb-0 text-danger">No</h5>
                                                                @endif
                                                            </div>
                                                        </div>
                                                    </li>
                                                    <li class="list-group-item">
                                                        <div class="d-flex">
                                                            <div class="flex-shrink-0">
                                                                <h5 class="mb-0">Contest Category :-</h5>
                                                            </div>

                                                            <div class="flex-grow-1 ms-3" style="text-align: right;">
                                                                <h5 class="mb-0">{{ $collection->categoryname }}</h5>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
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
        <!-- Stats -->
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-0">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Add PriceCard</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <label for="min_position" class="form-label">Start Position *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Min Position"></i></label>

                                    <input type="text" class="form-control" name="min_position" id="min_position"
                                        placeholder="" aria-label="" value="{{ $min_position }}" readonly>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <label for="winners" class="form-label">Number Of Winners *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Winning Users"></i></label>

                                    <input type="text" class="form-control" name="winners" id="winners"
                                        placeholder="" aria-label="" value="" required>
                                </div>
                                @if ($collection->pricecard_type == 'Percentage')
                                    <div class="col-md-4 mb-4">
                                        <label for="price" class="form-label">Price Amount In Percentage*<i
                                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                                data-bs-placement="top" title="Price Amount"></i></label>

                                        <input type="text" class="form-control" name="price_percent"
                                            id="winnerpercent" placeholder="" aria-label="" value="" required>
                                        <input type="hidden" class="form-control" id="winamount" placeholder=""
                                            aria-label="" value="{{ $collection->win_amount }}">
                                        <h4 class="text-danger">Amount Of Each User :- <span id="eachuser">0</span></h4>
                                        <h4 class="text-danger">Amount Of All User :- <span id="totaluser">0</span></h4>
                                    </div>
                                @else
                                    <div class="col-md-4 mb-4">
                                        <label for="price" class="form-label">Price Amount *<i
                                                class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                                data-bs-placement="top" title="Price Amount"></i></label>

                                        <input type="text" class="form-control" name="price" id="price"
                                            placeholder="" aria-label="" value="" required>
                                    </div>
                                @endif
                            </div>
                            <!-- End Form -->
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                    <!-- Body -->
                </div>
                <!-- End Card -->
            </div>
            <!-- End Col -->
        </div>
        <!-- End Stats -->

        <div class="card">
            <!-- Header -->
            <div class="card-header card-header-content-md-between">
                <div class="mb-2 mb-md-0">
                    <h4 class="card-header-title">View Price Cards</h4>
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
                            <th class="table-column-pe-0">Action</th>
                            <th class="table-column-ps-0">Price Card Type</th>
                            <th class="table-column-ps-0">Min Position</th>
                            <th class="table-column-ps-0">Max Position</th>
                            <th class="table-column-ps-0">Winning Users</th>
                            <th class="table-column-ps-0">Each Winner Amount</th>
                            <th class="table-column-ps-0">Total Amount</th>
                        </tr>
                    </thead>

                    <tbody>
                        @forelse ($pricecards as $key => $item)
                            <tr>
                                <td>
                                    @if (count($pricecards) == $key + 1)
                                        <a onclick="deletepricecard(<?php echo $item->id; ?>)" type="button"
                                            class="btn btn-danger btn-sm" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Delete Price Card">
                                            <i class="me-1"><svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                    height="16" fill="#ffff" class="bi bi-trash-fill"
                                                    viewBox="0 0 16 16">
                                                    <path
                                                        d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z" />
                                                </svg></i>
                                        </a>
                                    @endif
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->type }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->min_position }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->max_position }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        <span class="d-block h5 text-inherit mb-0">{{ $item->winners }}</span>
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        @if ($item->type == 'Percentage')
                                            <span class="d-block h5 text-inherit mb-0"><?php echo number_format(($collection->win_amount * $item->price_percent) / 100, 2, '.', '') . 'Rs - ' . $item->price_percent . '%'; ?></span>
                                        @else
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->price }} Rs</span>
                                        @endif
                                    </div>
                                </td>
                                <td class="table-column-ps-0">
                                    <div class="ms-3">
                                        @if ($item->type == 'Percentage')
                                            <span
                                                class="d-block h5 text-inherit mb-0"><?php echo $item->total; ?>rs(<?php echo $item->price_percent * $item->winners; ?>%)</span>
                                        @else
                                            <span class="d-block h5 text-inherit mb-0">{{ $item->total }} Rs</span>
                                        @endif
                                    </div>
                                </td>
                            </tr>
                        @empty
                        @endforelse
                    </tbody>
                </table>
            </div>
            <div style="text-align: end;border-top: dashed;padding-top: 10px;padding-right: 70px;">
                <h5>Total Amount : {{$totalam}} </h5>
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
    </div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#winnerpercent').keyup(function(event) {
            let winnerpercent = parseFloat($('#winnerpercent').val());
            let totalwinner = parseFloat($('#winners').val());
            let winamount = parseFloat($('#winamount').val());
            if (!isNaN(winnerpercent)) {
                let eachuser = (winnerpercent / 100) * winamount;
                let totaluser = eachuser * totalwinner;
                $('#eachuser').html(eachuser.toFixed(2));
                $('#totaluser').html(totaluser.toFixed(2));
            } else {
                $('#eachuser').html('0');
                $('#totaluser').html('0');
            }
        });

        $('#winners').keyup(function(event) {
            let winnerpercent = parseFloat($('#winnerpercent').val());
            let totalwinner = parseFloat($('#winners').val());
            let winamount = parseFloat($('#winamount').val());
            if (!isNaN(winnerpercent)) {
                let eachuser = (winnerpercent / 100) * winamount;
                let totaluser = eachuser * totalwinner;
                $('#eachuser').html(eachuser.toFixed(2));
                $('#totaluser').html(totaluser.toFixed(2));
            } else {
                $('#eachuser').html('0');
                $('#totaluser').html('0');
            }
        });
    });
</script>
<script>
    function deletepricecard(id) {
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
                    url: "{{ route('globalcontest.globalpricecarddelete') }}",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        swal("Price Card has been deleted!", {
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
