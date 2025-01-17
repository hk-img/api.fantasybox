<?php

return [
    'endpoint'      => 'http://rest.entitysport.com/v2/',
    // 'entityToken'   => '437bdbd273e3a69b69a93dc0706a74d0',
    'entityToken'   => '0930876c70b22c531c1e27d6bf2bd8a5',
    'competitions'  => 'http://rest.entitysport.com/v2/seasons/2023/competitions',
    'upcoming'      => 'https://rest.entitysport.com/v2/matches/',
    'values'        => [
        'match_status' => [1 => 'notstarted', 2 => 'completed', 3 => 'started', 4 => 'completed'],
        'cricket_roles' => ['keeper','batsman','allrounder','bowler'],
        'format_status' => ['one-day','test','t20','t10','the-hundred'],
    ],

];