<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

$user = $_POST["membersid"];
$oldpass = $_POST["oldpass"];
$newpass1 = $_POST["newpass1"];
$newpass2 = $_POST["newpass2"];

if (strcmp($newpass1,$newpass2) == 0){
    if(checkpass($user,$oldpass) == true){
        updatepass($_POST['newpass1'], $_POST['membersid']);
        session_destroy();
        //header('Location: ' . $_SERVER['HTTP_REFERER']);
        echo 'ok';
    }
    else{
        //header("Location: $BASE_URL/pages/members/details.php?membersid=$user");
        $message = "Wrong password!";
        echo $message;
        //echo "<script type='text/javascript'>alert('$message');</script>";
    }
}else{
    //header("Location: $BASE_URL/pages/members/details.php?membersid=$user");
    $message = "New passwords don't match!";
    echo $message;
    // echo "<script type='text/javascript'>alert('$message');</script>";
}
exit;
?>
