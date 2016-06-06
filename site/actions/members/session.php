<?php
include_once('../../config/init.php');

if(isset($_SESSION['userid']))
echo 'logged';
else echo 'notLogged';

exit
?>
