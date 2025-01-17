@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Access
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Access Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('access.view', base64_encode('cricket')) }}">
                        <i class="bi-eye"></i> View Access
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
                        <h4 class="card-header-title">Edit Access</h4>
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
                                                <option <?php if (1 == $val->id) {
                                                    echo 'selected';
                                                } ?> value="{{ $val->id }}"
                                                    data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                                    {{ $val->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Code *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Code"></i></label>

                                    <input type="text" class="form-control" name="name" id="name" placeholder=""
                                        aria-label="" value="{{ $collection->name }}" required>
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
