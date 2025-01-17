@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Teams
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Team Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('team.view', base64_encode($getfantasy[0]->name)) }}">
                        <i class="bi-eye"></i> View Team
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
                        <h4 class="card-header-title">Edit Team</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="team" class="form-label">Team Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Name"></i></label>

                                    <input type="text" class="form-control" name="team" id="team" placeholder=""
                                        aria-label="" value="{{ $collection->team }}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="short_name" class="form-label">Team Short Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Short Name"></i></label>

                                    <input type="text" class="form-control" name="short_name" id="short_name"
                                        placeholder="" aria-label="" value="{{ $collection->short_name }}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="team_key" class="form-label">Team Key *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Key"></i></label>

                                    <input type="text" class="form-control" name="team_key" id="team_key" placeholder=""
                                        aria-label="" value="{{ $collection->team_key }}" readonly>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="color" class="form-label">Team Color *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Color"></i> {{ $collection->color }}</label>

                                    <input type="color" class="form-control" name="color" id="color" placeholder=""
                                        aria-label="" value="{{ $collection->color }}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="logo" class="form-label">Team Logo*<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Logo"></i></label>

                                    <input type="file" class="form-control" name="logo" id="logo" placeholder=""
                                        aria-label="" value="">
                                    <div class="flex-shrink-0">
                                        @if (strpos($collection->logo, 'https') === 0)
                                            <img class="avatar avatar-lg" src="{{ $collection->logo }}"
                                                alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
                                        @else
                                            <img class="avatar avatar-lg" src="{{ asset('public/' . $collection->logo) }}"
                                                alt="Image Description"
                                                onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('team_image')) }}'">
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
