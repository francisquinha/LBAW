<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');


$user = $_POST["membersid"];
$category = $_POST["category"];


updatecategorymod($_POST["membersid"], $_POST["category"]);
header("Location: $BASE_URL/pages/members/details.php?membersid=$user");



?>
