@extends('admin.main')
@section('title')
    UI Settings
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">UI Settings</h1>
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
                        <h4 class="card-header-title">Update Project Settings</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <div class="card-body">
                        <form method="POST" action="#" enctype="multipart/form-data">
                            @csrf
                            <!-- Form -->
                            <!-- End Form -->
                            <div class="row">
                                <div class="col-sm-6">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="project_name" class="form-label">Project Name*</label>

                                        <input type="text" class="form-control" name="project_name" id="project_name"
                                            placeholder="Laravel Admin" aria-label="Laravel Admin" value="{{$settings->project_name}}" required>
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- End Col -->

                                <div class="col-sm-6">
                                    <!-- Form -->
                                    <div class="mb-4">
                                        <label for="short_name" class="form-label">Project Short Name*</label>

                                        <input type="text" class="form-control" name="short_name" id="short_name"
                                            placeholder="LA" aria-label="LA" value="{{$settings->short_name}}" required>
                                    </div>
                                    <!-- End Form -->
                                </div>
                                <!-- End Col -->
                            </div>
                            <div class="row">
                              <div class="col-sm-6">
                                <div class="mb-4 mb-lg-5">
                                    <label for="logo" class="form-label">Logo <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Logo"></i></label>
                                    <input type="file" name="logo" id="logo" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{asset('public/settings/'.$settings->logo)}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                              <div class="col-sm-6">
                                <div class="mb-4 mb-lg-5">
                                    <label for="favicon" class="form-label">Favicon <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Favicon"></i></label>
                                    <input type="file" name="favicon" id="favicon" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{asset('public/settings/'.$settings->favicon)}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-4">
                                <div class="mb-4 mb-lg-5">
                                    <label for="user_image" class="form-label">User Image <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="User Image"></i></label>
                                    <input type="file" name="user_image" id="user_image" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{asset('public/settings/'.$settings->user_image)}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                              <div class="col-sm-4">
                                <div class="mb-4 mb-lg-5">
                                    <label for="team_image" class="form-label">Team Image <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Image"></i></label>
                                    <input type="file" name="team_image" id="team_image" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{asset('public/settings/'.$settings->team_image)}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                              <div class="col-sm-4">
                                <div class="mb-4 mb-lg-5">
                                    <label for="player_image" class="form-label">Player Image <i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Player Image"></i></label>
                                    <input type="file" name="player_image" id="player_image" class="form-control">
                                    <div class="flex-shrink-0">
                                      <img class="avatar avatar-lg" src="{{asset('public/settings/'.$settings->player_image)}}" alt="Image Description">
                                    </div>
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-sm-12">
                                  <!-- Form -->
                                  <div class="mb-4">
                                      <label for="firebase_key" class="form-label">Firebase Key*</label>

                                      <input type="text" class="form-control" name="firebase_key" id="firebase_key"
                                          placeholder="Firebase Key" aria-label="Firebase Key" value="{{$settings->firebase_key}}" required>
                                  </div>
                                  <!-- End Form -->
                              </div>
                              <!-- End Col -->
                            </div>
                            <div class="row">
                              <div class="col-sm-6">
                                  <!-- Form -->
                                  <div class="mb-4">
                                      <label for="site_url" class="form-label">Site Url*</label>

                                      <input type="url" class="form-control" name="site_url" id="site_url"
                                          placeholder="https://www.project.com/" aria-label="https://www.project.com/" value="{{$settings->site_url}}" required>
                                  </div>
                                  <!-- End Form -->
                              </div>
                              <div class="col-sm-6">
                                  <!-- Form -->
                                  <div class="mb-4">
                                      <label for="mobile" class="form-label">Mobile*</label>

                                      <input type="number" class="form-control" name="mobile" id="mobile" maxlength="10" placeholder="9999999999" aria-label="9999999999" value="{{$settings->mobile}}" required>
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
