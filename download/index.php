<?php
$currentURL = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://') . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
$urlParts = explode('/', $currentURL);

// Get the last part of the URL, which should be "refercode"
$refercode = end($urlParts);
$fileName = $refercode;
$filePath = 'Fantasybox.apk';
$fileName = 'Fantasybox_' . $fileName . '.apk';
if (!empty($fileName) && file_exists($filePath)) {
    // Define headers
    header("Cache-Control: public");
    header("Content-Description: File Transfer");
    header("Content-Disposition: attachment; filename=$fileName");
    header("Content-Type: application/octet-stream");
    header("Content-Transfer-Encoding: binary");
    // Read the file
    readfile($filePath);
    exit;
} else {
    echo 'The file does not exist.';
}
