@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    User Detail
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
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">User Detail</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-6 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card h-100">
                                    <div class="card-body">
                                        <ul class="list-group list-group-flush list-group-no-gutters">
                                            <!-- List Item -->
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">User Name :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $collection->username }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Email :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $collection->email }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Mobile :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $collection->mobile }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">DOB :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->dob }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Gender :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->gender }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Address :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->address }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">City :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->city }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">State :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->state }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- End Card -->
                            </div>
                            <div class="col-lg-6 mb-3 mb-lg-5 text-center">
                                <!-- Card -->
                                <div class="card h-100">
                                    <div class="card-body card-body-height">
                                        <ul class="list-group list-group-flush list-group-no-gutters">
                                            <!-- List Item -->
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Country :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">
                                                            {{ $collection->country }}
                                                        </h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Pin Code :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $collection->pincode }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Team :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <h5 class="mb-0">{{ $collection->team }}</h5>
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Status :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        @if ($collection->status == 1)
                                                            <h5 class="mb-0 text-success">Activated</h5>
                                                        @else
                                                            <h5 class="mb-0 text-danger">Blocked</h5>
                                                        @endif
                                                    </div>
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <div class="d-flex">
                                                    <div class="flex-shrink-0">
                                                        <h5 class="mb-0">Image :-</h5>
                                                    </div>

                                                    <div class="flex-grow-1 ms-3">
                                                        <img style="width: 120px;height: 120px;border-radius: 50%;margin-bottom: 30px;"
                                                            src="{{ $collection->image }}" alt="Image Description" onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'">
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
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
        <!-- End Body -->
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">Pan Detail</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        @if (!empty($pancard))
                            <div class="row">
                                <div class="col-lg-6 mb-3 mb-lg-5">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush list-group-no-gutters">
                                                <!-- List Item -->
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Pan Name :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $pancard->pan_name }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Pan No. :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $pancard->pan_number }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Pan DOB :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $pancard->pan_dob }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Status :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            @if ($pancard->status == 0)
                                                                <h5 class="mb-0 text-warning">
                                                                    Pending
                                                                </h5>
                                                            @elseif($pancard->status == -1)
                                                                <h5 class="mb-0 text-danger">
                                                                    Rejected
                                                                </h5>
                                                            @else
                                                                <h5 class="mb-0 text-success">
                                                                    Approved
                                                                </h5>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">comment :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">
                                                                {{ $pancard->comment }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                                <div class="col-lg-6 mb-3 mb-lg-5 text-center">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body card-body-height">
                                            <img class="avatar avatar-lg" src="{{ asset('public/' . $pancard->image) }}"
                                                class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'">
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                            </div>
                        @endif
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">Bank Detail</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        @if (!empty($bank))
                            <div class="row">
                                <div class="col-lg-6 mb-3 mb-lg-5">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush list-group-no-gutters">
                                                <!-- List Item -->
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Account Holder Name :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $bank->accountholder }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Account No. :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $bank->accno }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">IFSC :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $bank->ifsc }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Bank Name :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">
                                                                {{ $bank->bankname }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Status :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            @if ($bank->status == 0)
                                                                <h5 class="mb-0 text-warning">
                                                                    Pending
                                                                </h5>
                                                            @elseif($bank->status == -1)
                                                                <h5 class="mb-0 text-danger">
                                                                    Rejected
                                                                </h5>
                                                            @else
                                                                <h5 class="mb-0 text-success">
                                                                    Approved
                                                                </h5>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Comment :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">
                                                                {{ $bank->comment }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                                <div class="col-lg-6 mb-3 mb-lg-5 text-center">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body card-body-height">
                                            <img class="avatar avatar-lg" src="{{ asset('public/' . $bank->image) }}"
                                                class="img-fluid" style="max-height: 50px; max-width: 50px;"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'">
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                            </div>
                        @endif
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">Aadhar Detail</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        @if (!empty($aadharcard))
                            <div class="row">
                                <div class="col-lg-6 mb-3 mb-lg-5">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush list-group-no-gutters">
                                                <!-- List Item -->
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Aadhar Name :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $aadharcard->aadhar_name }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Aadhar No. :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $aadharcard->aadhar_number }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Aadhar DOB :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">{{ $aadharcard->aadhar_dob }}</h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Status :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            @if ($aadharcard->status == 0)
                                                                <h5 class="mb-0 text-warning">
                                                                    Pending
                                                                </h5>
                                                            @elseif($aadharcard->status == -1)
                                                                <h5 class="mb-0 text-danger">
                                                                    Rejected
                                                                </h5>
                                                            @else
                                                                <h5 class="mb-0 text-success">
                                                                    Approved
                                                                </h5>
                                                            @endif
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex">
                                                        <div class="flex-shrink-0">
                                                            <h5 class="mb-0">Comment :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0">
                                                                {{ $aadharcard->comment }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                                <div class="col-lg-6 mb-3 mb-lg-5 text-center">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body card-body-height">
                                            <img class="avatar avatar-lg"
                                                src="{{ asset('public/' . $aadharcard->image) }}" class="img-fluid"
                                                style="max-height: 50px; max-width: 50px;"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'">
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                            </div>
                        @endif
                    </div>
                    <!-- End Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-12">
                <!-- Card -->
                <div class="card h-100">
                    <!-- Header -->
                    <div class="card-header card-header-content-between">
                        <h4 class="card-header-title">User Wallet</h4>
                        <!-- End Dropdown -->
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-4 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <span class="h5">Deposit : </span>{{ $userbalance->balance }}
                                    </div>
                                </div>
                                <!-- End Card -->
                            </div>
                            <div class="col-lg-4 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <span class="h5">Winning : </span>{{ $userbalance->winning }}
                                    </div>
                                </div>
                                <!-- End Card -->
                            </div>
                            <div class="col-lg-4 mb-3 mb-lg-5">
                                <!-- Card -->
                                <div class="card">
                                    <div class="card-body">
                                        <span class="h5">Bonus : </span>{{ $userbalance->bonus }}
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
    </div>
@endsection
