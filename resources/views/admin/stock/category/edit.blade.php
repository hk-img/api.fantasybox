@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Category
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Stock Category Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('stockcategory.view') }}">
                        <i class="bi-eye"></i> View Category
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
                        <h4 class="card-header-title">Edit Category</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="exchange_id" class="form-label">Exchange *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Exchange"></i></label>
                                    <div class="tom-select-custom">
                                        <select class="js-select form-select" id="exchange_id" name="exchange_id"
                                            data-hs-tom-select-options='{
                                                          "searchInDropdown": false,
                                                          "hideSearch": true
                                                        }'
                                            required>
                                            @foreach ($exchanges as $val)
                                                <option <?php if ($collection->exchange_id == $val->id) {
                                                    echo 'selected';
                                                } ?> value="{{ $val->id }}"
                                                    data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                                    {{ $val->name }} ({{$val->country}})</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Category Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Category Name"></i></label>

                                    <input type="text" class="form-control" name="name" id="name" placeholder=""
                                        aria-label="" value="{{ $collection->name }}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="sub_title" class="form-label">Sub Title *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Sub Title"></i></label>

                                    <input type="text" class="form-control" name="sub_title" id="sub_title"
                                        placeholder="" aria-label="" value="{{ $collection->sub_title }}" required>
                                </div>
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
