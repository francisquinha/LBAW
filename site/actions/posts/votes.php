<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');

/*
if (!$_POST['body']) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    #$_SESSION['form_values'] = $_POST;
    //echo 'false';
    header("Location: $BASE_URL");
    exit;
}
*/
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
