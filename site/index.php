<?php
include_once('config/init.php');
$_SESSION['tab'] = 0;
header('Location: pages/questions/list_recent.php?page=1');
?>
