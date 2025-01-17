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
                <h1 class="page-header-title">Change Password</h1>
            </div>
        </div>
        <!-- End Row -->
    </div>
    <!-- End Page Header -->

    <!-- Stats -->
    <div class="row">
        <div class="col-lg-8 mb-3 mb-lg-0">
            <!-- Card -->
            <div class="card mb-3 mb-lg-5">
                <!-- Header -->
                <div class="card-header">
                    <h4 class="card-header-title">Update Your Password</h4>
                </div>
                <!-- End Header -->

                <!-- Body -->
                <div class="card-body">
                    <form method="POST" action="{{route('updatepass.update')}}" enctype="multipart/form-data">
                        @csrf
                        <!-- Form -->
                        <!-- End Form -->
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Form -->
                                <div class="mb-4">
                                    <label for="currentpass" class="form-label">Current Password*</label>

                                    <input type="text" class="form-control" name="currentpass" id="currentpass" placeholder="Current Password" aria-label="Current Password" value="" required>
                                </div>
                                <!-- End Form -->
                            </div>
                            <!-- End Col -->
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Form -->
                                <div class="mb-4">
                                    <label for="newpass" class="form-label">New Password*</label>

                                    <input type="text" class="form-control" name="newpass" id="newpass" placeholder="New Password" aria-label="New Password" value="" required>
                                </div>
                                <!-- End Form -->
                            </div>
                            <!-- End Col -->
                        </div>

                        <div class="row">
                            <div class="col-sm-12">
                                <!-- Form -->
                                <div class="mb-4">
                                    <label for="confpass" class="form-label">Confirm Password*</label>

                                    <input type="text" class="form-control" name="confpass" id="confpass" placeholder="Confirm Password" aria-label="Confirm Password" value="" required>
                                </div>
                                <!-- End Form -->
                            </div>
                            <!-- End Col -->
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