<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

$user = getUser([$_GET['username']]);


$smarty->assign('username', $username);
$smarty->assign('email', $email);
$smarty->assign('memberrating', $memberrating);
$smarty->assign('birthDate', $birthDate);
$smarty->assign('registrationDate', $registrationDate);
$smarty->assign('name', $name);


$smarty->assign('members', $members);

$smarty->display('members/details.tpl');
$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');
}

?>