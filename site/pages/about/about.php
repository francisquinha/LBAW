<?php
include_once('../../config/init.php');

    $smarty->display('about/about.tpl');


$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');

?>