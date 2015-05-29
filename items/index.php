<?php
include '../application/init.php';
$Kaleboo = new Kaleboo();

$result['code'] = 0;
$result['message'] = 'Service OK';
$result['data']['items'] = $Kaleboo->getItems($_GET);

$json = json_encode($result);

header('Content-type: application/json');
die($json);
?>