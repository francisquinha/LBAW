<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/answers.php');

if (!$_POST['body']) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
 
    header("Location: $BASE_URL");
    exit;
}

$body = $_POST['body'];
$questionid = $_GET['questionid'];
$memberid = $_SESSION['userid'];

createNewAnswer($questionid, $body, $memberid);

$_SESSION['success_messages'][] = 'New answer registered successfully';
header("Location: $BASE_URL");
echo 'something get wrong';
exit;
?>
