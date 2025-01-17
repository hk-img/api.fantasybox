@php
    use App\Traits\SettingsTrait;
@endphp
@extends('admin.main')
@section('title')
    View Team
@endsection('title')
@section('content')
    <div class="content container-fluid">
        <!-- Page Header -->
        <div class="page-header">
            <div class="row align-items-center">
                <div class="col">
                    <h1 class="page-header-title">Result Manager</h1>
                </div>
            </div>
            <!-- End Row -->
        </div>
        <!-- End Page Header -->
        <!-- Stats -->
        <div class="card">

            <div class="row">
                <div class="col-lg-12 mb-3 mb-lg-12">
                    <!-- Card -->
                    <div class="card h-100">
                        <!-- Header -->
                        <div class="card-header card-header-content-between">
                            <h4 class="card-header-title">Team Detail</h4>
                            <!-- End Dropdown -->
                        </div>
                        <!-- End Header -->

                        <!-- Body -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-12 mb-3 mb-lg-5">
                                    <!-- Card -->
                                    <div class="card h-100">
                                        <div class="card-body">
                                            <ul class="list-group list-group-flush list-group-no-gutters">
                                                <!-- List Item -->
                                                <li class="list-group-item">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-shrink-0" style="min-width: 110px">
                                                            <h5 class="mb-0">Captain :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0 py-2 px-3 d-inline-flex rounded-pill bg-success bg-opacity-25 border border-success">
                                                                {{ DB::table('matchplayers')->where('playerid', $collection->captain)->where('matchkey', $collection->matchkey)->value('name') }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-shrink-0" style="min-width: 110px">
                                                            <h5 class="mb-0">Vice Captain :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3">
                                                            <h5 class="mb-0 py-2 px-3 d-inline-flex rounded-pill bg-primary bg-opacity-25 border border-primary">
                                                                {{ DB::table('matchplayers')->where('playerid', $collection->vicecaptain)->where('matchkey', $collection->matchkey)->value('name') }}
                                                            </h5>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="list-group-item">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-shrink-0" style="min-width: 110px">
                                                            <h5 class="mb-0">Other Players :-</h5>
                                                        </div>

                                                        <div class="flex-grow-1 ms-3 d-flex flex-wrap align-items-center gap-2">
                                                            @php
                                                                $allplayers = explode(',', $collection->players);
                                                            @endphp
                                                            @foreach ($allplayers as $players)
                                                                @if ($players != $collection->captain && $players != $collection->vicecaptain)
                                                                    <p class="py-2 px-3 d-inline-flex rounded-pill bg-light border mb-0">
                                                                        {{ DB::table('matchplayers')->where('playerid', $players)->where('matchkey', $collection->matchkey)->value('name') }}
                                                                    </p>
                                                                @endif
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- End Card -->
                                </div>
                            </div>
                        </div>
                        <!-- End Body -->
                    </div>
                    <!-- End Card -->
                </div>
            </div>
        </div>
        <!-- End Stats -->
    </div>
@endsection
