<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'pages/pagination/pagination.php');

$letters=array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
$letters1=array("A%","B%","C%","D%","E%","F%","G%","H%","I%","J%","K%","L%","M%","N%","O%","P%","Q%","R%","S%","T%","U%","V%","W%","X%","Y%","Z%");
$letters2=array("a%","b%","c%","d%","e%","f%","g%","h%","i%","j%","k%","l%","m%","n%","o%","p%","q%","r%","s%","t%","u%","v%","w%","x%","y%","z%");

$length = count($letters);

for ($i = 0; $i < $length; $i++) {
    $members_name = 'members'.$letters[$i];
    $$members_name = getMembersStartingWith($letters1[$i], $letters2[$i]);
    foreach ($$members_name as $key => $member) {
        ${$members_name}[$key]['emailhash'] = md5(strtolower(trim($member['email'])));
    }
    $smarty->assign($members_name, $$members_name);
}

$items = 27;

$members = getAllMembers($items, ($_GET['page'] - 1) * $items);

foreach ($members as $key => $member) {
    unset($emailhash);
    $emailhash = md5(strtolower(trim($member['email'])));
    $members[$key]['emailhash'] = $emailhash;
}

$smarty->assign('members', $members);

$smarty->display('members/list.tpl');

pagination($_GET['page'], getNumberMembers()['number'], $items, 2, "list_all.php?page=%d");

$smarty->display('members/list_az.tpl');

$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');

?>