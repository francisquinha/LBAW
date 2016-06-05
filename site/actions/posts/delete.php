<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');

$memberid = $_SESSION['userid'];
$postid = $_POST['postid'];

try {
    deletePost($postid, $memberid);
    echo "post removed";
} catch (PDOException $e) {
    echo "post removal failed";
}
exit;
