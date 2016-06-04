<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');

$letters=array("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z");
$letters1=array("A%","B%","C%","D%","E%","F%","G%","H%","I%","J%","K%","L%","M%","N%","O%","P%","Q%","R%","S%","T%","U%","V%","W%","X%","Y%","Z%");
$letters2=array("a%","b%","c%","d%","e%","f%","g%","h%","i%","j%","k%","l%","m%","n%","o%","p%","q%","r%","s%","t%","u%","v%","w%","x%","y%","z%");

$length = count($letters);
for ($i = 0; $i < $length; $i++) {
    $members_name = 'members'.$letters[$i];
    $$members_name = getMembersStartingWith($letters1[$i], $letters2[$i]);
    foreach ($$members_name as $key => $member) {
        unset($emailhash);
        $emailhash = md5(strtolower(trim($member['email'])));
        ${$members_name}[$key]['emailhash'] = $emailhash;
    }
    $smarty->assign($members_name, $$members_name);
}

$page = $_GET['page'] * 30;
if ($page == 0)
    $_SESSION['total_member_pages'] = ceil(getNumberMembers()['number']/30) - 1;

$members = getAllMembers(30, $page);

foreach ($members as $key => $member) {
    unset($emailhash);
    $emailhash = md5(strtolower(trim($member['email'])));
    $members[$key]['emailhash'] = $emailhash;
}

$smarty->assign('members', $members);

$smarty->display('members/list.tpl');
$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');

?>