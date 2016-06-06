<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/categories.php');

$category = $_GET['categoryid'];

try {
    deletecategory($category);
    header("Location: ".$BASE_URL."pages/categories/list_all.php");
}
catch(PDOException $e) {
    header("Location: ".$BASE_URL."pages/categories/list_all.php");
}

exit;

?>