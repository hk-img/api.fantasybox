@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Existing Match
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
                    <a class="btn btn-primary" href="{{ route('match.view', base64_encode($getfantasy[0]->name)) }}">
                        <i class="bi-eye"></i> View Matches
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
                        <h4 class="card-header-title">Edit Existing Match</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Match Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Name"></i></label>

                                    <input type="text" class="form-control" name="name" id="name" placeholder=""
                                        aria-label="" value="{{ $collection->name }}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="start_date" class="form-label">Match Start Date *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Start Date"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Start Date" name="start_date"
                                        value="{{ $collection->start_date }}"
                                        data-hs-flatpickr-options='{
                                              "dateFormat": "Y-m-d H:i",
                                              "enableTime": true,
                                              "minDate": "today"
                                            }'>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Team 1 *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Name"></i></label>

                                    <input type="text" class="form-control" id="name" placeholder="" aria-label=""
                                        value="{{ $collection->team1team }}" readonly>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Team 2 *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Name"></i></label>

                                    <input type="text" class="form-control" id="name" placeholder="" aria-label=""
                                        value="{{ $collection->team2team }}" readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Match Format *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Name"></i></label>
                                    <select class="js-select form-select" id="format" name="format"
                                        data-hs-tom-select-options='{
                                                              "searchInDropdown": false,
                                                              "hideSearch": true
                                                            }'
                                        required>
                                        @foreach (config('entity.values.format_status') as $val)
                                            <option <?php if ($collection->format == $val) {
                                                echo 'selected';
                                            } ?> value="{{ $val }}"
                                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val }}</span></span>'>
                                                {{ $val }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Series *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Match Name"></i></label>
                                    <select class="js-select form-select" id="series" name="series"
                                        data-hs-tom-select-options='{
                                                                  "searchInDropdown": false,
                                                                  "hideSearch": true
                                                                }'
                                        required>
                                        @foreach ($getallseries as $val)
                                            <option <?php if ($collection->series == $val->id) {
                                                echo 'selected';
                                            } ?> value="{{ $val->id }}"
                                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                                {{ $val->name }}</option>
                                        @endforeach
                                    </select>
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
