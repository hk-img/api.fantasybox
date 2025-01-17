@php
    use App\Traits\SettingsTrait;
@endphp
@extends('admin.main')
@section('title')
    Edit Offer
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Offer Manager</h1>
                </div>
                <div class="col-auto">
                    <a class="btn btn-primary" href="{{ route('offer.view') }}">
                        <i class="bi-eye"></i> View Offer
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
                        <h4 class="card-header-title">Edit Offer</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="title" class="form-label">Title *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Title"></i></label>

                                    <input type="text" class="form-control" name="title" id="title" placeholder=""
                                        aria-label="" value="{{$collection->title}}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="description" class="form-label">Description *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" description="Description"></i></label>

                                    <input type="text" class="form-control" name="description" id="description"
                                        placeholder="" aria-label="" value="{{$collection->title}}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="prize_type" class="form-label">Prize Type *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Prize Type"></i></label>
                                    <div class="input-group input-group-sm-vertical">
                                        <!-- Radio Check -->
                                        <label class="form-control" for="bonus">
                                            <span class="form-check">
                                                <input type="radio" class="form-check-input" name="prize_type"
                                                    id="bonus" value="bonus" <?php if ($collection->prize_type == 'bonus') {
                                                        echo 'checked';
                                                    } ?>>
                                                <span class="form-check-label">Bonus</span>
                                            </span>
                                        </label>
                                        <!-- End Radio Check -->

                                        <!-- Radio Check -->
                                        <label class="form-control" for="addfund">
                                            <span class="form-check">
                                                <input type="radio" class="form-check-input" name="prize_type"
                                                    id="addfund" value="addfund" <?php if ($collection->prize_type == 'addfund') {
                                                        echo 'checked';
                                                    } ?>>
                                                <span class="form-check-label">Add Fund</span>
                                            </span>
                                        </label>
                                        <!-- End Radio Check -->
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="bonus_type" class="form-label">Bonus Type *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" description="Bonus Type"></i></label>

                                    <div class="input-group input-group-sm-vertical">
                                        <!-- Radio Check -->
                                        <label class="form-control" for="Amount">
                                            <span class="form-check">
                                                <input type="radio" class="form-check-input" name="bonus_type"
                                                    id="Amount" value="rs" <?php if ($collection->bonus_type == 'rs') {
                                                        echo 'checked';
                                                    } ?>>
                                                <span class="form-check-label">Amount</span>
                                            </span>
                                        </label>
                                        <!-- End Radio Check -->

                                        <!-- Radio Check -->
                                        <label class="form-control" for="Percentage">
                                            <span class="form-check">
                                                <input type="radio" class="form-check-input" name="bonus_type"
                                                    id="Percentage" value="per" <?php if ($collection->bonus_type == 'per') {
                                                        echo 'checked';
                                                    } ?>>
                                                <span class="form-check-label">Percentage</span>
                                            </span>
                                        </label>
                                        <!-- End Radio Check -->
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="offercode" class="form-label">Offer Code *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Offer Code"></i></label>

                                    <input type="text" class="form-control" name="offercode" id="offercode"
                                        placeholder="" aria-label="" value="{{$collection->offercode}}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="bonus" class="form-label">Bonus Amount *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Bonus Amount"></i></label>

                                    <input type="text" class="form-control" name="bonus" id="bonus"
                                        placeholder="" pattern="[1-9][0-9]*" title="Amount must be greater than 0" aria-label="" value="{{$collection->bonus}}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="minamount" class="form-label">Minimum Amount *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Minimum Amount"></i></label>

                                    <input type="text" class="form-control" name="minamount" id="minamount"
                                        placeholder="" pattern="[1-9][0-9]*" title="Amount must be greater than 0" aria-label="" value="{{$collection->minamount}}" required>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="maxamount" class="form-label">Maximum Amount *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Maximum Amount"></i></label>

                                    <input type="text" class="form-control" name="maxamount" id="maxamount"
                                        placeholder="" pattern="[1-9][0-9]*" title="Amount must be greater than 0" aria-label="" value="{{$collection->maxamount}}" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="start_date" class="form-label">Start Date *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Start Date"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Start Date" name="start_date" required value="{{$collection->start_date}}"
                                        data-hs-flatpickr-options='{
                                                  "dateFormat": "Y-m-d H:i",
                                                  "enableTime": true,
                                                  "minDate": "today"
                                                }'>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="expire_date" class="form-label">Expire Date *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Expire Date"></i></label>

                                    <input type="text" class="js-flatpickr form-control flatpickr-custom"
                                        placeholder="Select Expire Date" name="expire_date" required value="{{$collection->expire_date}}"
                                        data-hs-flatpickr-options='{
                                                  "dateFormat": "Y-m-d H:i",
                                                  "enableTime": true,
                                                  "minDate": "today"
                                                }'>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="user_time" class="form-label">Max Used *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Max Used"></i></label>

                                    <input type="text" class="form-control" name="user_time" id="user_time"
                                        placeholder="" aria-label="" pattern="[1-9][0-9]*" title="Max Used be greater than 0" value="{{$collection->user_time}}" required>
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
