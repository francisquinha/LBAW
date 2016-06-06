<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

$user = strip_tags($_GET['membersid']);


updatename(strip_tags($_GET['newname']), strip_tags($_GET['membersid']));
header("Location: ".$BASE_URL."pages/members/details.php?membersid=$user");

exit;

?>
