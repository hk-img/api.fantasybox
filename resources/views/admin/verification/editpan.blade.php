@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Edit Pan Card
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Verification Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('verification.viewpan') }}">
                        <i class="bi-eye"></i> View Pan Cards
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
                        <h4 class="card-header-title">Edit Pan Card</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-2 mb-4">
                                    <label for="pan_name" class="form-label">Status *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pan Name"></i></label>
                                    @if ($collection->status == 0)
                                        <h5 class="text-warning">Pending</h5>
                                    @elseif($collection->status == -1)
                                        <h5 class="text-danger">Rejected</h5>
                                    @else
                                        <h5 class="text-success">Verified</h5>
                                    @endif

                                </div>
                                <div class="col-md-5 mb-4">
                                    <label for="pan_name" class="form-label">Pan Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pan Name"></i></label>

                                    <input type="text" class="form-control" name="pan_name" id="pan_name" placeholder=""
                                        aria-label="" value="{{ $collection->pan_name }}" required readonly>
                                </div>
                                <div class="col-md-5 mb-4">
                                    <label for="pan_number" class="form-label">Pan Number *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pan Number"></i></label>

                                    <input type="text" class="form-control" name="pan_number" id="pan_number"
                                        placeholder="" aria-label="" value="{{ $collection->pan_number }}" required
                                        readonly>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="pan_dob" class="form-label">Pan DOB *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pan DOB"></i></label>
                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Start Date" name="pan_dob" required disabled
                                        value="{{ $collection->pan_dob }}"
                                        data-hs-flatpickr-options='{
                                                  "dateFormat": "Y-m-d",
                                                  "maxDate": "today"
                                                }'>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="image" class="form-label">Pan Image *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Pan Image"></i></label>

                                    {{-- <input type="file" class="form-control" name="image" id="image" placeholder=""
                                        aria-label="" value=""> --}}
                                    <a href="{{ asset('public/'.$collection->image) }}" class="flex-shrink-0 glightbox2">
                                        <img class="avatar avatar-lg" src="{{ asset('public/' . $collection->image) }}"
                                        alt="Image Description"
                                        onerror="this.src='{{ asset('public/settings/' . SettingsTrait::settings('player_image')) }}'">
                                    </a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="comment" class="form-label">Comment *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Comment"></i></label>
                                    <textarea type="text" class="form-control" name="comment" required id="comment" placeholder="" aria-label=""
                                        value="{{ $collection->comment }}" required>{{ $collection->comment }}</textarea>
                                </div>
                                <div class="col-md-6 mb-4 mt-6">
                                    @if ($collection->status == 0)
                                        <a href="{{ route('verification.approvepan', base64_encode($collection->id)) }}"
                                            class="btn btn-success">Approve</a>
                                        <button type="submit" class="btn btn-danger">Reject</button>
                                    @elseif($collection->status == -1)
                                        <a href="{{ route('verification.approvepan', base64_encode($collection->id)) }}"
                                            class="btn btn-success">Approve</a>
                                    @else
                                        <button type="submit" class="btn btn-danger">Reject</button>
                                    @endif

                                </div>
                            </div>
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
