@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Add Influencer
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Influencer Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('influencer.view') }}">
                        <i class="bi-eye"></i> View Influencer
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
                        <h4 class="card-header-title">Add Influencer</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="name" class="form-label">Name *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Name"></i></label>

                                    <input type="text" class="form-control" name="name" id="name" placeholder="Enter Your Name"
                                        aria-label="" value="" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="email" class="form-label">Email *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Email"></i></label>

                                    <input type="text" class="form-control" name="email" id="email" placeholder="Enter Your Email"
                                        aria-label="" value="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="mobile" class="form-label">Mobile *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Mobile"></i></label>

                                    <input type="text" class="form-control" name="mobile" id="mobile" placeholder="Enter Your Mobile"
                                        aria-label="" value="" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="Password" class="form-label">Password *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Password"></i></label>

                                    <input type="text" class="form-control" name="password" id="password" placeholder="Enter Your Password"
                                        aria-label="" value="" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="refer_code" class="form-label">Refer Code *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Refer Code"></i></label>

                                    <input type="text" class="form-control" name="refer_code" id="refer_code" placeholder="Enter Your Refer Code"
                                        aria-label="" value="" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="percentage" class="form-label">Percentage *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Percentage"></i></label>

                                    <input type="text" class="form-control" name="percentage" id="percentage" placeholder="Enter Percentage"
                                        aria-label="" value="" required>
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
