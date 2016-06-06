<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');

$voterid = $_SESSION['userid'];
$postid = $_POST['questionid'];

$buttonid = $_POST['buttonid'];
if($buttonid == 'up')
    $up = "true";
else $up = "false";

try {
    updateVotes($voterid, $postid, $up);
} catch (PDOException $e) {
    if(isset($_SESSION['userid']))
        echo 'You already voted on this post';
    else echo 'You must login to vote';
    exit;
}
exit;
?>