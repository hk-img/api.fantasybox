@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit User
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
        <div class="row">
            <div class="col-lg-12 mb-3 mb-lg-0">
                <!-- Card -->
                <div class="card mb-3 mb-lg-5">
                    <!-- Header -->
                    <div class="card-header">
                        <h4 class="card-header-title">Edit User</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="type" class="form-label">Type *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Type"></i></label>
                                    <select class="js-select form-select" id="type" name="type"
                                        onchange="get_type(this.value);"
                                        data-hs-tom-select-options='{
                                                          "searchInDropdown": false,
                                                          "hideSearch": true
                                                        }'>
                                        <option <?php if ($collection->type == '') {
                                            echo 'selected';
                                        } ?> value=""
                                            data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">User</span></span>'>
                                            User</option>
                                        <option <?php if ($collection->type == 'Influencer') {
                                            echo 'selected';
                                        } ?> value="Influencer"
                                            data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">Influencer</span></span>'>
                                            Influencer</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="Name" class="form-label">Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Name"></i></label>

                                    <input type="text" class="form-control" name="Name" id="Name" placeholder=""
                                        aria-label="" value="{{ $collection->name }}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <label for="team" class="form-label">Team Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Name"></i></label>

                                    <input type="text" class="form-control" name="team" id="team" placeholder=""
                                        aria-label="" value="{{ $collection->team }}" readonly>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <label for="email" class="form-label">Email *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Email"></i></label>

                                    <input type="text" class="form-control" name="email" id="email" placeholder=""
                                        aria-label="" value="{{ $collection->email }}" readonly>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <label for="mobile" class="form-label">Mobile *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Mobile"></i></label>

                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder=""
                                        aria-label="" value="{{ $collection->mobile }}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <label for="refer_code" class="form-label">Refer Code *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Refer Code"></i></label>

                                    <input type="text" class="form-control" name="refer_code" id="refer_code"
                                        placeholder="" aria-label="" value="{{ $collection->refer_code }}" required>
                                </div>
                                <div class="col-md-4 mb-4">
                                    <label for="username" class="form-label">User Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="User Name"></i></label>

                                    <input type="text" class="form-control" name="username" id="username"
                                        placeholder="" aria-label="" value="{{ $collection->username }}">
                                </div>
                                <div class="col-md-4 mb-4">
                                    <label for="dob" class="form-label">DOB *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="User Name"></i></label>
                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select DOB" name="dob"
                                        value="{{ $collection->dob }}"
                                        data-hs-flatpickr-options='{
                                              "dateFormat": "Y-m-d",
                                              "maxDate": "today"
                                            }'>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-3 mb-3">
                                    <label for="address" class="form-label">Address *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Address"></i></label>

                                    <input type="text" class="form-control" name="address" id="address"
                                        placeholder="" aria-label="" value="{{ $collection->address }}">
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="state" class="form-label">State *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="State"></i></label>

                                    <input type="text" class="form-control" name="state" id="state"
                                        placeholder="" aria-label="" value="{{ $collection->state }}">
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="country" class="form-label">Country *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Country"></i></label>

                                    <input type="text" class="form-control" name="country" id="country"
                                        placeholder="" aria-label="" value="{{ $collection->country }}">
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="pincode" class="form-label">Pincode *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pincode"></i></label>

                                    <input type="text" class="form-control" name="pincode" id="pincode"
                                        placeholder="" aria-label="" value="{{ $collection->pincode }}">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="image" class="form-label">Image *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Image"></i></label>

                                    <input type="file" class="form-control" name="image" id="image"
                                        placeholder="" aria-label="" value="">
                                    <div class="flex-shrink-0">
                                        <img class="avatar avatar-lg" src="{{ $collection->image }}"
                                            alt="Image Description"
                                            onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('user_image')) }}'">
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4 d-none percentagein">
                                    <label for="percentage" class="form-label">Percentage *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Percentage"></i></label>

                                    <input type="text" class="form-control" name="percentage" id="percentage"
                                        placeholder="" aria-label="" value="{{ $collection->percentage }}" required
                                        disabled>
                                </div>
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
    </div>
@endsection
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    function get_type(value) {
        if (value == 'Influencer') {
            $(".percentagein").removeClass('d-none');
            $("input[name=percentage]").prop('disabled', false);
        } else {
            $(".percentagein").addClass('d-none');
            $("input[name=percentage]").prop('disabled', true);
        }
    }

    $(document).ready(function() {
        var selectBox = document.getElementById("type");
        var selectedValue = selectBox.value;
        if (selectedValue == 'Influencer') {
            $(".percentagein").removeClass('d-none');
            $("input[name=percentage]").prop('disabled', false);
        }
    });
</script>
