<?php

use App\Helpers\Helpers;
use App\Traits\SettingsTrait;

// Firebase API Key
define('FIREBASE_API_KEY', SettingsTrait::settings('firebase_key') ?? '');
