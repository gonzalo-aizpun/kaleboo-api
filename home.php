<?php
error_reporting(E_ALL);
include 'application/init.php';
$Kaleboo = new Kaleboo();

$result['code'] = 0;
$result['message'] = 'Service OK';
$result['data']['states'] = $Kaleboo->getLocationTree();
$result['data']['filters'] = $Kaleboo->getFilters();

$json = json_encode($result);

die($json);
?>