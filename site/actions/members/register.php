<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

if (!$_POST['username'] || !$_POST['name'] || !$_POST['password'] || !$_POST['email']) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    exit;
}

$realname = strip_tags($_POST['name']);
$username = strip_tags($_POST['username']);
$password = $_POST['password'];
$email = strip_tags($_POST['email']);

try {
    createUser($realname, $username, $password, $email);

} catch (PDOException $e) {
    echo 'false';
    if (strpos($e->getMessage(), 'users_pkey') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate username';
        $_SESSION['field_errors']['username'] = 'Username already exists';
    } else $_SESSION['error_messages'][] = 'Error creating user';
    
    $_SESSION['form_values'] = $_POST;
    exit;
}
echo 'true';
$_SESSION['success_messages'][] = 'User registered successfully';
exit;
?>
