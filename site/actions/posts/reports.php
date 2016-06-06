<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/reports.php');


$authorid = $_SESSION['userid'];
$postid = $_POST['postid'];
$reportbody = $_POST['reportbody']; 

echo 'author = '. $authorid.' postid - '.$postid.' body - '.$reportbody;

newReport($authorid, $postid, $reportbody);
exit;

?>


