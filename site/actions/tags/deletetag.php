<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/tags.php');
include_once($BASE_DIR . 'database/questions.php');


$tagtodelete = $_POST['tagtodelete'];

if(getNumberTagQuestions($_POST['tagtodelete'])['number'] == 0) {
    deleteTag($_POST['tagtodelete']);
    header("Location: ".$BASE_URL."pages/tags/list_all.php");

}else{
    header('Location: ' . $_SERVER['HTTP_REFERER']);
}
exit;
?>
