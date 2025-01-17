@php
    use App\Traits\SettingsTrait;
    $getfantasy = SettingsTrait::getfantasy();
@endphp
@extends('admin.main')
@section('title')
    Mail Notification
@endsection('title')
@section('content')
    <style>
        #boxx.saerach-box-list .bi-patch-minus-fill {
            display: none;
        }

        #showuserseses .bi-patch-plus-fill {
            display: none;
        }
    </style>
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Notification Manager</h1>
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
                        <h4 class="card-header-title">Send Mail Notification</h4>
                    </div>
                    <!-- End Header -->

                    <!-- Body -->
                    <form method="POST" action="#" enctype="multipart/form-data">
                        @csrf
                        <div class="card-body">
                            <!-- Form -->
                            <div class="mb-4">
                                <div class="input-group input-group-sm-vertical">
                                    <!-- Radio Check -->
                                    <label class="form-control" for="all">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="type" id="all" onclick="divshowhide('all')"
                                            value="all" checked>
                                            <span class="form-check-label">All</span>
                                        </span>
                                    </label>
                                    <label class="form-control" for="Specific">
                                        <span class="form-check">
                                            <input type="radio" class="form-check-input" name="type" id="Specific" onclick="divshowhide('specific')"
                                                value="specific">
                                            <span class="form-check-label">Specific</span>
                                        </span>
                                    </label>
                                    <!-- End Radio Check -->
                                </div>
                            </div>
                            <div class="mb-4 d-none" id="specificdiv">
                                <input type="hidden" id="uservalues" name="uservalues">
                                <label for="email" class="form-label">Email <i class="bi-question-circle text-body ms-1"
                                        data-bs-toggle="tooltip" data-bs-placement="top" title="Email"></i></label>

                                <input type="text" class="form-control multipleInputDynamic" name="users"
                                    id="selectusers" placeholder="Search Your Email" aria-label="" value="">
                                <div id="boxx"
                                    class="saerach-box-list position-absolute left-15px right-15px top-91px bg-white shadow rounded border border-primary z-index-1 px-3 py-2 d-none">
                                    <ul id="item_list" class="d-none list-unstyled mb-0"></ul>
                                </div>
                                <div id="showusers" class="row">
                                </div>

                            </div>
                            <div class="mb-4">
                                <label for="categoryNameLabel" class="form-label">Title <i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Title"></i></label>

                                <input type="text" class="form-control" name="title" id="categoryNameLabel"
                                    placeholder="Enter Title" aria-label="title" value="" required>
                            </div>
                            <div class="mb-4">
                                <label for="categoryNameLabel" class="form-label">Message <i
                                        class="bi-question-circle text-body ms-1" data-bs-toggle="tooltip"
                                        data-bs-placement="top" title="Message"></i></label>

                                <textarea type="text" class="form-control" name="message" id="categoryNameLabel" placeholder="Enter Message" aria-label=""
                                    value="" required></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Send</button>
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
    var usersarry = [];
    $(document).ready(function() {
        $("#selectusers").keyup(function() {
            var gettypevalue = $("#selectusers").val();
            if (gettypevalue != "") {
                $.ajax({
                    type: 'POST',
                    url: '<?php echo route('notification.getusers'); ?>',
                    data: '_token=<?php echo csrf_token(); ?>&gettypevalue=' + gettypevalue +
                        '&userspresent=' +
                        usersarry,
                    success: function(data) {
                        $('#item_list').removeClass('d-none');
                        $('#boxx').removeClass('d-none');
                        $("#item_list").html(data);
                    }
                });
            }
        });
    });

    function set_item(item) {
        usersarry.push(item);
        $("#uservalues").val(usersarry);
        $("#selectusers").val('');
        $('#item_list').addClass('d-none');
        var gettext = $('#userid' + item).html();
        $("#showusers").append('<div class="col-md-6" id="showuserseses">' + gettext + '</div>');
        $('#boxx').addClass('d-none');
    }

    function deletediv(e, item) {
        usersarry.splice(usersarry.indexOf(item), 1);
        $("#uservalues").val(usersarry);
        // e.parentNode.parentNode.remove(e.parentNode);
        $('#showuserseses').remove();
    }
    $(function() {
        $(document).click(function() {
            $('#box').addClass('d-none'); //hide the button
            //$('#boxx').hide(); //hide the button
        });
    });

    function divshowhide(value) {
        if (value == 'specific') {
            $("#specificdiv").removeClass('d-none');
        } else {
            $("#specificdiv").addClass('d-none');
        }
    }

    function deletediv1(e, item) {
        $('#dsafd' + item).remove();
    }
</script>
