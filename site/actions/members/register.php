<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

if (!$_POST['username'] || !$_POST['name'] || !$_POST['password'] || !$_POST['email']) {
    $_SESSION['error_messages'][] = 'All fields are mandatory';
    $_SESSION['form_values'] = $_POST;
    //echo 'false';
    //header("Location: $BASE_URL");
    exit;
}

$realname = strip_tags($_POST['name']);
$username = strip_tags($_POST['username']);
$password = $_POST['password'];
$email = strip_tags($_POST['email']);
/*
$photo = $_FILES['photo'];
$extension = end(explode(".", $photo["name"]));
*/
try {
    createUser($realname, $username, $password, $email);
#    move_uploaded_file($photo["tmp_name"], $BASE_DIR . "images/users/" . $username . '.' . $extension); // this is dangerous
#    chmod($BASE_DIR . "images/users/" . $username . '.' . $extension, 0644);
} catch (PDOException $e) {
    echo 'false';
    if (strpos($e->getMessage(), 'users_pkey') !== false) {
        $_SESSION['error_messages'][] = 'Duplicate username';
        $_SESSION['field_errors']['username'] = 'Username already exists';
    } else $_SESSION['error_messages'][] = 'Error creating user';
    
    $_SESSION['form_values'] = $_POST;
    //header("Location: $BASE_URL");
    exit;
}
echo 'true';
$_SESSION['success_messages'][] = 'User registered successfully';
//header("Location: $BASE_URL");
exit;
?>
