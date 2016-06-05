<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');


$user = $_POST['moderatorid'];
$category = $_POST['category'];
try {
    addcategorymod(strip_tags($_POST['moderatorid']), strip_tags($_POST['category']));
    header("Location: $BASE_URL/pages/members/details.php?membersid=$user");
}
catch(PDOException $e) {
    header("Location: $BASE_URL/pages/members/details.php?membersid=$user");
}
exit;

?>
