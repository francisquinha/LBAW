<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'database/questions.php');


$member = getMember([$_GET['membersid']]);
$questions = getMemberQuestions([$_GET['membersid']]);

$smarty->assign('member', $member);
$smarty->assign('questions', $questions);

$smarty->display('members/details.tpl');
$smarty->display('common/footer.tpl');
?>