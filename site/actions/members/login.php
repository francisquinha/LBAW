<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

if (!$_POST['username'] || !$_POST['password']) {
    $_SESSION['error_messages'][] = 'Invalid login';
    $_SESSION['form_values'] = $_POST;
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

$username = $_POST['username'];
$password = $_POST['password'];
$userinfo = getLogin($username, $password);

if ($userinfo) {
    $_SESSION['username'] = $username;
    $_SESSION['permissiontype'] = $userinfo['permissiontype'];
    $_SESSION['userid'] = $userinfo['memberid'];
    $_SESSION['success_messages'][] = 'Login successful';
    echo 'true';
} else {
    $_SESSION['error_messages'][] = 'Login failed';
    echo 'false';
}
//header('Location: ' . $_SERVER['HTTP_REFERER']);
