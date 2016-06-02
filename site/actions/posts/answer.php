<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/answers.php');

if (!$_POST['body']) {

    $_SESSION['error_messages'][] = 'All fields are mandatory';
    #$_SESSION['form_values'] = $_POST;
    //echo 'false';
    //header("Location: $BASE_URL");
    exit;
}

echo 'ola';
$body = strip_tags($_POST['body']);
$questionid = $_GET[questionid];
$memberid = $_GET[$memberid]; // fix

try {
    createNewAnswer($questionid, $body, $memberid);

} catch (PDOException $e) {
    echo 'false';
    #if (strpos($e->getMessage(), 'users_pkey') !== false) {
       # $_SESSION['error_messages'][] = 'Duplicate username';
       # $_SESSION['field_errors']['username'] = 'Username already exists';
    #} else $_SESSION['error_messages'][] = 'Error creating user';

    $_SESSION['form_values'] = $_POST;
    header("Location: $BASE_URL");
    exit;
}
echo 'true';
$_SESSION['success_messages'][] = 'New answer registered successfully';
header("Location: $BASE_URL");
exit;
?>
