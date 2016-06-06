<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/categories.php');

$parent = $_POST['parentcategoryid'];
$category = $_POST['newCategory'];

if($parent == '')
{
    try {
        createnewparentcategory($category);
        header("Location: ".$BASE_URL."pages/categories/list_all.php");
    }
    catch(PDOException $e) {
        header("Location: ".$BASE_URL."pages/categories/list_all.php");
    }
}
else{
    try {
        createnewcategory($category, $parent);
        header("Location: ".$BASE_URL."pages/categories/list_all.php");
    }
    catch(PDOException $e) {
        header("Location: ".$BASE_URL."pages/categories/list_all.php");
    }
}


exit;

?>