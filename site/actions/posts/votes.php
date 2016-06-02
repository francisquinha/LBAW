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
$up = "true";

/*
$body = strip_tags($_POST['body']);
$questionid = $_GET['questionid'];
$memberid = $_SESSION['userid'];
*/

updateVotes($voterid, $postid, $up);
/*
$_SESSION['success_messages'][] = 'Vote updated successfully';
header("Location: $BASE_URL");
echo 'something get wrong';
exit;
*/
?>
