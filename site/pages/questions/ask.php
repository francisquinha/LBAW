<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/categories.php');
include_once($BASE_DIR . 'database/tags.php');

if (! $_SESSION['username']){
    header("Location: ".$BASE_URL);
}

function recursiveChildren($children_category) {
    global $smarty;
    foreach ($children_category as $child_category) {
        $name_subcategory = 'child_categories_'.$child_category['categoryid'];
        $$name_subcategory = getChildCategories([$child_category['categoryid']]);
        $smarty->assign($name_subcategory, $$name_subcategory);
        recursiveChildren($$name_subcategory);
    }
}

$root_categories = getRootCategories();
foreach ($root_categories as $category ) {
    $name_category = 'child_categories_'.$category['categoryid'];
    $$name_category = getChildCategories([$category['categoryid']]);
    $smarty->assign($name_category, $$name_category);
    recursiveChildren($$name_category);
}

$smarty->assign('root_categories', $root_categories);

$tags = getTopTags([25]);
$smarty->assign('tags', $tags);

$all_tags = getAllTags();
$smarty->assign('all_tags', $all_tags);

$smarty->display('questions/ask.tpl');
$smarty->display('common/menu_side.tpl');
$smarty->display('categories/list_side.tpl');
$smarty->display('tags/list_side.tpl');
$smarty->display('common/footer.tpl');
