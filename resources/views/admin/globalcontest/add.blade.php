@php
use App\Traits\SettingsTrait;
$getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
Add Global Contest
@endsection('title')
@section('content')
 <div class="content container-fluid">
    <!-- Page Header -->
    <div class="page-header">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="page-header-title">Contest Manager</h1>
            </div>
            <div class="col-auto">
                <a class="btn btn-primary" href="{{ route('globalcontest.view', base64_encode($getfantasy[0]->name)) }}">
                    <i class="bi-eye"></i> View Global Contest
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
                    <h4 class="card-header-title">Add Global Contest</h4>
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
                                        onchange="get_contest_category(this.value);"
                                        data-hs-tom-select-options='{
                                                          "searchInDropdown": false,
                                                          "hideSearch": true
                                                        }'
                                        required>
                                        @foreach ($getfantasy as $val)
                                        <option <?php if ($getfantasy[0]->name == $val->name) {
                                                    echo 'selected';
                                                } ?> value="{{ $val->id }}"
                                            data-option-template='<span class="d-flex align-items-center"><span class="flex-grow-1 ms-2">{{ $val->name }}</span></span>'>
                                            {{ $val->name }}
                                        </option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label for="contest_cat" class="form-label">Contest Category*<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Category Name"></i></label>

                                <div class="tom-select-custom">
                                    <select class="js-select form-select" id="contest_cat" name="contest_cat"
                                        data-hs-tom-select-options='{
                                                                  "searchInDropdown": false,
                                                                  "hideSearch": true
                                                                }'
                                        required>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label for="contest_type" class="form-label">Contest Amount Type *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Contest Type"></i></label><br>

                                <div class="input-group input-group-sm-vertical">
                                    <!-- Radio Check -->
                                    <label class="form-control" for="Amountbased">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="contest_type"
                                                id="Amountbased" value="Amount" checked>
                                            <span class="form-check-label">Amount Based</span>
                                        </span>
                                    </label>
                                    <!-- End Radio Check -->

                                    <!-- Radio Check -->
                                    <label class="form-control" for="Percentagebased">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="contest_type"
                                                id="Percentagebased" value="Percentage">
                                            <span class="form-check-label">Percentage based</span>
                                        </span>
                                    </label>
                                    <!-- End Radio Check -->
                                </div>

                            </div>
                            <div class="col-md-6 mb-4 pricecard_type">
                                <label for="pricecard_type" class="form-label">Contest Price Card Type *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Price Card Type"></i></label><br>
                                <div class="input-group input-group-sm-vertical">
                                    <!-- Radio Check -->
                                    <label class="form-control" for="PriceAmountbased">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="pricecard_type"
                                                id="PriceAmountbased" value="Amount" checked>
                                            <span class="form-check-label">Amount Based</span>
                                        </span>
                                    </label>
                                    <!-- End Radio Check -->

                                    <!-- Radio Check -->
                                    <label class="form-control" for="PricePercentagebased">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="pricecard_type"
                                                id="PricePercentagebased" value="Percentage">
                                            <span class="form-check-label">Percentage based</span>
                                        </span>
                                    </label>
                                    <!-- End Radio Check -->
                                </div>

                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label for="entryfee" class="form-label">Entry Fee *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Entry Fee"></i></label>

                                <input type="text" class="form-control" name="entryfee" id="entryfee"
                                    placeholder="Enter Entry Fee" aria-label="" value="" required>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label for="win_amount" class="form-label">Winning Amount *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Winning Amount"></i></label>

                                <input type="text" class="form-control" name="win_amount" id="win_amount"
                                    placeholder="Enter Winning Amount" aria-label="" value="" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label for="teamsize" class="form-label">Team Size *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="teamsize"></i></label>
                                <select name="team_size" id="team_size" class="form-control" >
                                    <option value="1"> 2</option>
                                    <option value="5"> 5</option>
                                    <option value="7"> 7</option>
                                    <option value="9"> 9</option> 
                                    <option value="11">11</option>
                                </select>
                                <!-- <input type="text" class="form-control" name="team_size" id="teamsize"
                                        placeholder="Enter Teamsize" aria-label="" value="" required> -->
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 maximum_user mb-4">
                                <label for="maximum_user" class="form-label">Maximum number of users *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Maximum number of users"></i></label>

                                <input type="number" class="form-control" name="maximum_user" id="maximum_user"
                                    placeholder="Enter Maximum No. Of User" aria-label="" value="" required>
                            </div>
                        </div>
                        <div class="row winning_percentage d-none">
                            <div class="col-md-12 mb-4">
                                <label for="winning_percentage" class="form-label">Percentage of users who will win (In case of percentage) *<i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Percentage of users who will win"></i></label>

                                <input type="number" disabled class="form-control" name="winning_percentage" id="winning_percentage"
                                    placeholder="Enter Percentage" aria-label="" value="" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 mb-4">
                                <!-- Form Check -->
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" id="multi_entry" value="1" class="form-check-input"
                                        name="multi_entry">
                                    <label class="form-check-label" for="multi_entry">Multi Entry</label>
                                </div>
                                <!-- End Form Check -->

                                <!-- Form Check -->
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" id="confirmed_challenge" value="1"
                                        class="form-check-input indeterminate-checkbox" name="confirmed_challenge">
                                    <label class="form-check-label" for="confirmed_challenge">Is Confirmed</label>
                                </div>
                                <!-- End Form Check -->

                                <!-- Form Check -->
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" id="is_running" value="1" class="form-check-input"
                                        name="is_running">
                                    <label class="form-check-label" for="is_running">Is Running</label>
                                </div>
                                <!-- End Form Check -->

                                <!-- Form Check -->
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" id="is_bonus" value="1" class="form-check-input" name="is_bonus">
                                    <label class="form-check-label" for="is_bonus">Is Bonus Allowed</label>
                                </div>
                                <!-- End Form Check -->
                            </div>
                            <div class="row multientry d-none">
                                <div class="col-md-12 mb-4">
                                    <label for="team_limit" class="form-label">Team Limit<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Team Limit"></i></label>

                                    <input type="number" disabled class="form-control" name="team_limit" id="team_limit"
                                        placeholder="Enter Team Limit" aria-label="" value="11" required>
                                </div>
                            </div>
                            <div class="row bonuspercentage d-none">
                                <div class="col-md-12 mb-4">
                                    <label for="bonus_percentage" class="form-label">Bonus Percentage (No need to
                                        enter % here. Just enter number here) *<i
                                            class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                            data-bs-placement="top" title="Bonus Percentage"></i></label>
                                    <input type="number" class="form-control" name="bonus_percentage"
                                        id="bonus_percentage" placeholder="Enter Bonus Percentage" aria-label="" value="" required disabled>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('input[name=is_bonus]').change(function() {
            if ($(this).prop('checked')) {
                $(".bonuspercentage").removeClass('d-none');
                $("input[name=bonus_percentage]").prop('disabled', false);
            } else {
                $(".bonuspercentage").addClass('d-none');
                $("input[name=bonus_percentage]").prop('disabled', true);
            }
        });

        $('input[name=multi_entry]').change(function() {
            if ($(this).prop('checked')) {
                $(".multientry").removeClass('d-none');
                $("input[name=team_limit]").prop('disabled', false);
            } else {
                $(".multientry").addClass('d-none');
                $("input[name=team_limit]").prop('disabled', true);
            }
        });

        $('input[id=Percentagebased]').change(function() {
            if ($(this).prop('checked')) {
                $(".winning_percentage").removeClass('d-none');
                $(".pricecard_type").addClass('d-none');
                $(".maximum_user").addClass('d-none');
                $("input[name=winning_percentage]").prop('disabled', false);
                $("input[name=maximum_user]").prop('disabled', true);
            } else {
                $(".winning_percentage").addClass('d-none');
                $(".pricecard_type").removeClass('d-none');
                $(".maximum_user").removeClass('d-none');
                $("input[name=winning_percentage]").prop('disabled', true);
                $("input[name=maximum_user]").prop('disabled', false);
            }
        });

        $('input[id=Amountbased]').change(function() {
            if ($(this).prop('checked')) {
                $(".winning_percentage").addClass('d-none');
                $(".pricecard_type").removeClass('d-none');
                $(".maximum_user").removeClass('d-none');
                $("input[name=winning_percentage]").prop('disabled', true);
                $("input[name=maximum_user]").prop('disabled', false);
            } else {
                $(".winning_percentage").removeClass('d-none');
                $(".pricecard_type").addClass('d-none');
                $(".maximum_user").addClass('d-none');
                $("input[name=winning_percentage]").prop('disabled', false);
                $("input[name=maximum_user]").prop('disabled', true);
            }
        });
    });
</script>
<script>
    function get_contest_category(value) {
        var fantasy_type = value;
        console.log(fantasy_type);
        $.ajax({
            type: 'POST',
            url: '{{ route('get_contest_category') }}',
            data: '_token=<?php echo csrf_token(); ?>&fantasy_type=' + fantasy_type,
            success: function(data) {
                console.log(data);
                $('#contest_cat').html('<option value="">Select Contest Category</option>');
                for (var i = 0; i < data.length; i++) {
                    $('#contest_cat').append('<option value="' + data[i]['id'] + '">' + data[i]['name'] +
                        '</option>');
                }
            }
        });
    }
    $(document).ready(function() {
        var fantasy_type = $('#fantasy_type').val();
        get_contest_category(fantasy_type);
    });
</script>