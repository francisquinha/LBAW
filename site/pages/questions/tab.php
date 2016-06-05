<?php
include_once('../../config/init.php');
$_SESSION['tab'] = $_POST['n'];
echo $_SESSION['tab'];