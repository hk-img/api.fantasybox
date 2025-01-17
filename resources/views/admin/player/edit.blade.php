@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Players
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Player Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('player.view', base64_encode($getfantasy[0]->name)) }}">
                        <i class="bi-eye"></i> View Player
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
                        <h4 class="card-header-title">Edit Player</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="players_key" class="form-label">Player Key *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Player Key"></i></label>

                                    <input type="text" class="form-control" name="players_key" id="players_key"
                                        placeholder="" aria-label="" value="{{ $collection->players_key }}" readonly>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="player_name" class="form-label">Player Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Player Name"></i></label>

                                    <input type="text" class="form-control" name="player_name" id="player_name"
                                        placeholder="" aria-label="" value="{{ $collection->player_name }}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="dob" class="form-label">DOB *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Date of Birth"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Date of Birth" name="dob" value="{{ $collection->dob }}"
                                        data-hs-flatpickr-options='{
                                                  "dateFormat": "Y-m-d",
                                                  "maxDate": "today"
                                                }'>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="country" class="form-label">Country *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Country"></i></label>

                                    <input type="text" class="form-control" name="country" id="country"
                                        placeholder="Enter Country" aria-label="" value="{{ $collection->country }}"
                                        required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="credit" class="form-label">Player Credit *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Player Credit"></i></label>

                                    <input type="text" class="form-control" name="credit" id="credit" placeholder=""
                                        aria-label="" value="{{ $collection->credit }}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="role" class="form-label">Player Role *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Player Role"></i></label>

                                    <select class="js-select form-select" id="role" name="role"
                                        data-hs-tom-select-options='{
                                                          "searchInDropdown": false,
                                                          "hideSearch": true
                                                        }'
                                        required>
                                        @foreach (config('entity.values.cricket_roles') as $val)
                                            <option <?php if ($collection->role == $val) {
                                                echo 'selected';
                                            } ?> value="{{$val}}"
                                                data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{$val}}</span></span>'>
                                                {{ $val }}</option>
                                        @endforeach
                                    </select>
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
                                        @if (strpos($collection->image, 'https') === 0)
                                            <img class="avatar avatar-lg" src="{{ $collection->image }}"
                                                alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('player_image')) }}'">
                                        @else
                                            <img class="avatar avatar-lg" src="{{ asset('public/' . $collection->image) }}"
                                                alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('player_image')) }}'">
                                        @endif
                                    </div>
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
