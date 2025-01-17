@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Banner
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Banner Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('banner.view') }}">
                        <i class="bi-eye"></i> View Banner
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
                        <h4 class="card-header-title">Edit Banner</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="image" class="form-label">Image *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Image"></i></label>

                                    <input type="file" class="form-control" name="image" id="image" placeholder=""
                                        aria-label="" value="">
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
                                <div class="col-md-6 mb-4">
                                    <label for="url" class="form-label">URL *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="URL"></i></label>

                                    <input type="url" class="form-control" name="url" id="url"
                                        placeholder="https://www.google.com" aria-label="" value="{{$collection->url}}">
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
