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
        echo 'ok';
    }
    else{
      
        $message = "Wrong password!";
        echo $message;
      
    }
}else{
    $message = "New passwords don't match!";
    echo $message;
}
exit;
?>
