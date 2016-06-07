<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/categories.php');
include_once($BASE_DIR . 'database/questions.php');

$category = $_POST['categorytodelete'];
$kids = getChildCategories($category);

if(getNumberCategoryQuestions($category)['number'] == 0){
    if(empty($kids)){
        deletecategory($category);
    }
}

header("Location: ".$BASE_URL."pages/categories/list_all.php");


exit;
?>