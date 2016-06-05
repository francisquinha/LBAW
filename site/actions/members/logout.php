<?php
include_once('../../config/init.php');
session_destroy();
echo 'ok';
header('Location: ' . $_SERVER['HTTP_REFERER']);
//header('Location: ' . $BASE_URL);
exit;
?>
