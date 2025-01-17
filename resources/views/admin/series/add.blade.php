@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Add Series
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Series Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('series.view', base64_encode($getfantasy[0]->name)) }}">
                        <i class="bi-eye"></i> View Series
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
                        <h4 class="card-header-title">Add Series</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="fantasy_type" class="form-label">Fantasy Type *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Fantasy Type"></i></label>
                                    <div class="tom-select-custom">
                                        <select class="js-select form-select" id="fantasy_type" name="fantasy_type"
                                            data-hs-tom-select-options='{
                                                          "searchInDropdown": false,
                                                          "hideSearch": true
                                                        }'
                                            required>
                                            @foreach ($getfantasy as $val)
                                                <option <?php if ($getfantasy[0]->name == $val->name) {
                                                    echo 'selected';
                                                } ?> value="{{ $val->id }}"
                                                    data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                                    {{ $val->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Series Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Series Name"></i></label>

                                    <input type="text" class="form-control" name="name" id="name" placeholder=""
                                        aria-label="" value="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="start_date" class="form-label">Start Date *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Start Date"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Start Date" name="start_date"
                                        data-hs-flatpickr-options='{
                                              "dateFormat": "Y-m-d H:i",
                                              "enableTime": true,
                                              "minDate": "today"
                                            }'>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="end_date" class="form-label">End Date *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="End Date"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select End Date" name="end_date"
                                        data-hs-flatpickr-options='{
                                              "dateFormat": "Y-m-d H:i",
                                              "enableTime": true,
                                              "minDate": "today"
                                            }'>
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
