@extends('admin.main')
@section('title')
    Admin Profile
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Profile Edit</h1>
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
                        <h4 class="card-header-title">Update Admin Profile</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <form method="POST" action="{{route('profile.update')}}" enctype="multipart/form-data">
                            @csrf
                            @method('patch')
                            <!-- Form -->
                            <!-- End Form -->
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="name" class="form-label">Name*</label>

                                        <input type="text" class="form-control" name="name" id="name"
                                            placeholder="Admin" aria-label="Admin" value="{{Auth::user()->name}}" required>
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- End Col -->

                                <div class="col-sm-6">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="email" class="form-label">Email*</label>

                                        <input type="text" class="form-control" name="email" id="email"
                                            placeholder="abc@gmail.com" aria-label="abc@gmail.com" value="{{Auth::user()->email}}" readonly>
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- End Col -->
                            </div>
                            <div class="row">
                              <div class="col-sm-6">
                                <div class="mb-4 mb-lg-5">
                                    <label for="image" class="form-label">Image <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Image"></i></label>
                                    <input type="file" name="image" id="image" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{Auth::user()->image}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <!-- Form -->
                                <div class="mb-4">
                                    <label for="mobile" class="form-label">Mobile*</label>

                                    <input type="number" class="form-control" name="mobile" id="mobile"
                                        placeholder="9999999999" aria-label="9999999999" value="{{Auth::user()->mobile}}" required>
                                </div>
                                <!-- End Form -->
                            </div>
                            </div>

                            <!-- End Row -->
                            <button type="submit" class="btn btn-primary">Save</button>
                        </form>
                    </div>

                    <!-- Body -->
                </div>
                <!-- End Card -->
            </div>
        </div>
        <!-- End Stats -->

    </div>
@endsection
