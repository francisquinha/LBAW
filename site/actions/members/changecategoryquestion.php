<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/categories.php');


$question = $_POST['questionid'];
$category = $_POST['category'];

try {
    changecategoryquestion(strip_tags($_POST['questionid']), strip_tags($_POST['category']));
    header("Location: ".$BASE_URL."pages/questions/details.php?questionid=$question");
}
catch(PDOException $e) {
    header("Location: ".$BASE_URL."pages/questions/details.php?questionid=$question");
}
exit;

?>
