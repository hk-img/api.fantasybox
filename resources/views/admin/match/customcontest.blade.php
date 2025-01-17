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
    Custom Match Contest
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
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
                                    onchange="getcustommatch(this.value)"
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
                                <a class="btn btn-warning <?php if (empty($matchkey)) {
                                    echo 'disabled';
                                } ?>"
                                    href="{{ route('match.importcontest', base64_encode($matchkey)) }}">
                                    <i class="bi bi-cloud-download-fill"></i> Import Contest
                                </a>
                                <a class="btn btn-primary <?php if (empty($matchkey)) {
                                    echo 'disabled';
                                } ?>"
                                    href="{{ route('customcontest.create', ['fantasy_type' => base64_encode($fantasy_type), 'matchkey' => $matchkey]) }}">
                                    <i class="bi bi-plus-lg"></i> Add
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>

        <div class="row">
            @foreach ($matchchallenges as $challenge)
                <div class="col-4 mb-12">
                    <div class="js-add-field card mb-3 mb-lg-5">
                        <!-- Table -->
                        <div class="table-responsive datatable-custom">
                            <div id="datatable_wrapper" class="dataTables_wrapper no-footer">
                                <table id=""
                                    class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table dataTable no-footer"
                                    role="grid" aria-describedby="datatable_info">
                                    <thead class="thead-light">
                                        <tr role="row" class="text-center">
                                            <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Win Amount: activate to sort column ascending"
                                                style="width: 58.4875px;border: 2px solid black;">
                                                Win Amount</th>
                                            <th class="table-column-ps-0" tabindex="0" aria-controls="datatable"
                                                rowspan="1" colspan="1"
                                                aria-label="Fantasy Type: activate to sort column ascending"
                                                style="width: 58.4875px;border: 2px solid black;">
                                                {{ $challenge->win_amount }} <svg xmlns="http://www.w3.org/2000/svg"
                                                    width="16" height="16" fill="currentColor"
                                                    class="bi bi-trophy-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M2.5.5A.5.5 0 0 1 3 0h10a.5.5 0 0 1 .5.5c0 .538-.012 1.05-.034 1.536a3 3 0 1 1-1.133 5.89c-.79 1.865-1.878 2.777-2.833 3.011v2.173l1.425.356c.194.048.377.135.537.255L13.3 15.1a.5.5 0 0 1-.3.9H3a.5.5 0 0 1-.3-.9l1.838-1.379c.16-.12.343-.207.537-.255L6.5 13.11v-2.173c-.955-.234-2.043-1.146-2.833-3.012a3 3 0 1 1-1.132-5.89A33.076 33.076 0 0 1 2.5.5zm.099 2.54a2 2 0 0 0 .72 3.935c-.333-1.05-.588-2.346-.72-3.935zm10.083 3.935a2 2 0 0 0 .72-3.935c-.133 1.59-.388 2.885-.72 3.935z" />
                                                </svg></th>
                                        </tr>
                                    </thead>

                                    <tbody id="addVariantsContainer">
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Fantasy Type</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->fantasyname }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>League Size</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->maximum_user }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Entry Fee</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->entryfee }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Contest Type</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->contest_type }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>League Type</h5>
                                            </th>
                                            @if ($challenge->confirmed_challenge == 1)
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>Confirmed Leauge</h5>
                                                </th>
                                            @else
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>Not Confirmed</h5>
                                                </th>
                                            @endif
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Multi Entry</h5>
                                            </th>
                                            @if ($challenge->multi_entry == 1)
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>Yes</h5>
                                                </th>
                                            @else
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>No</h5>
                                                </th>
                                            @endif
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Auto Repeat</h5>
                                            </th>
                                            @if ($challenge->is_running == 1)
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>Yes</h5>
                                                </th>
                                            @else
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>No</h5>
                                                </th>
                                            @endif
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Joined Users</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->joinedusers }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Bonus Percentage</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ $challenge->bonus_percentage }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Created Date</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>{{ date('j-M-Y h:i A (D)', strtotime($challenge->created_at)) }}</h5>
                                            </th>
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Created By</h5>
                                            </th>
                                            @if ($challenge->created_by == 0)
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>Admin</h5>
                                                </th>
                                            @else
                                                <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                    <h5>User</h5>
                                                </th>
                                            @endif
                                        </tr>
                                        <tr role="row" class="text-center">
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                <h5>Action</h5>
                                            </th>
                                            <th rowspan="1" colspan="1" style="border: 2px solid black;">
                                                @if ($challenge->status == 'cancelled')
                                                    <h5 class="text-danger">Contest Cancelled</h5>
                                                @else
                                                    <div class="btn-group">
                                                        <button type="button"
                                                            class="btn btn-white dropdown-toggle dropdown-toggle-empty"
                                                            id="productsEditDropdown2" data-bs-toggle="dropdown"
                                                            aria-expanded="false">Action</button>

                                                        <div class="dropdown-menu dropdown-menu-end mt-1"
                                                            aria-labelledby="productsEditDropdown2">
                                                            @if ($challenge->joinedusers == 0)
                                                                <a class="dropdown-item"
                                                                    onclick="deletecustomcontest(<?php echo $challenge->id; ?>)"
                                                                    style="cursor: pointer">
                                                                    <i class="bi-trash dropdown-item-icon"></i> Delete
                                                                    Contest
                                                                </a>
                                                                <a class="dropdown-item"
                                                                    href="{{ route('customcontest.edit', base64_encode($challenge->id)) }}">
                                                                    <i class="bi-pencil-fill dropdown-item-icon"></i> Edit
                                                                    Contest
                                                                </a>
                                                                <a class="dropdown-item" href="{{ route('customcontest.pricecard', base64_encode($challenge->id)) }}">
                                                                    <i class="bi-archive dropdown-item-icon"></i> Add/Edit
                                                                    Price Card
                                                                </a>
                                                            @endif
                                                            <a class="dropdown-item"
                                                                onclick="cancelcontest(<?php echo $challenge->id; ?>)"
                                                                style="cursor: pointer">
                                                                <i class="bi-x-lg dropdown-item-icon"></i> Cancel Contest
                                                            </a>
                                                        </div>
                                                    </div>
                                                @endif
                                            </th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- End Table -->
                    </div>
                </div>
            @endforeach
        </div>
        <!-- End Body -->
    </div>
@endsection
<script>
    function getcustommatch(value) {
        // Encode the selectedName using Base64
        var encodedName = 'Q3JpY2tldA==';
        console.log(value);
        var url = "{{ route('match.customcontest', ':encodedName') }}";
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
        window.location.href = '{{ route('match.customcontest', ':encodedName') }}'.replace(':encodedName',
            encodedName);
    }
</script>
<script>
    function deletecustomcontest(id) {
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
                    url: "{{ route('customcontest.deletecustomcontest') }}",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        if (data == 1) {
                            swal("Contest has been deleted!", {
                                icon: "success",
                            }).then(() => {
                                location.reload();
                            });
                        } else {
                            swal("After User Join You Can Not Delete Contest!");
                        }
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
<script>
    function cancelcontest(id) {
        swal({
            title: "Are you sure?",
            text: "You want to Cancel Contest!",
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
                    url: "{{ route('customcontest.cancelcontest') }}",
                    data: {
                        id: id
                    },
                    success: function(data) {
                        swal("Contest has been Cancelled!", {
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
                swal("Decline Cancelled Request!");
            }
        });
    }
</script>
