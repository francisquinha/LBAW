<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

$user = strip_tags($_GET['ownerid']);


Disabled(strip_tags($_GET['giverid']), strip_tags($_GET['ownerid']));
header("Location: ".$BASE_URL."pages/members/details.php?membersid=$user");



?>
