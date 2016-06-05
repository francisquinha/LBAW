<?php

include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');

$questionid = $_GET['questionid'];
$answerid = $_GET['answerid'];

chooseBestAnswer($questionid, $answerid);
header("Location: ".$BASE_URL."pages/questions/details.php?questionid=$questionid");
 
exit;
