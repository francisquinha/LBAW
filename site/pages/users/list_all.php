<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/users.php');




$membersa = getAllUsers('A%','a%');
$membersb = getAllUsers('B%','b%');
$membersc = getAllUsers('C%','c%');
$membersd = getAllUsers('D%','d%');
$memberse = getAllUsers('E%','e%');
$membersf = getAllUsers('F%','f%');
$membersg = getAllUsers('G%','g%');
$membersh = getAllUsers('H%','H%');
$membersi = getAllUsers('I%','i%');
$membersj = getAllUsers('J%','j%');
$membersk = getAllUsers('K%','k%');
$membersl = getAllUsers('L%','l%');
$membersm = getAllUsers('M%','m%');
$membersn = getAllUsers('N%','n%');
$memberso = getAllUsers('O%','o%');
$membersp = getAllUsers('P%','p%');
$membersq = getAllUsers('Q%','q%');
$membersr = getAllUsers('R%','r%');
$memberss = getAllUsers('S%','s%');
$memberst = getAllUsers('T%','t%');
$membersu = getAllUsers('U%','u%');
$membersv = getAllUsers('V%','v%');
$membersw = getAllUsers('W%','w%');
$membersx = getAllUsers('X%','x%');
$membersy = getAllUsers('Y%','y%');
$membersz = getAllUsers('Z%','z%');

$all = All();


$smarty->assign('all', $all);

$smarty->assign('membersa', $membersa);
$smarty->assign('membersb', $membersb);
$smarty->assign('membersc', $membersc);
$smarty->assign('membersd', $membersd);
$smarty->assign('memberse', $memberse);
$smarty->assign('membersf', $membersf);
$smarty->assign('membersg', $membersg);
$smarty->assign('membersh', $membersh);
$smarty->assign('membersi', $membersi);
$smarty->assign('membersj', $membersj);
$smarty->assign('membersk', $membersk);
$smarty->assign('membersl', $membersl);
$smarty->assign('membersm', $membersm);
$smarty->assign('membersn', $membersn);
$smarty->assign('memberso', $memberso);
$smarty->assign('membersp', $membersp);
$smarty->assign('membersq', $membersq);
$smarty->assign('membersr', $membersr);
$smarty->assign('memberss', $memberss);
$smarty->assign('memberst', $memberst);
$smarty->assign('membersu', $membersu);
$smarty->assign('membersv', $membersv);
$smarty->assign('membersw', $membersw);
$smarty->assign('membersx', $membersx);
$smarty->assign('membersy', $membersy);
$smarty->assign('membersz', $membersz);


$smarty->display('users/list.tpl');
$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');

?>