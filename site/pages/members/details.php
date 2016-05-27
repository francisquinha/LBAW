<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/reports.php');


$member = getMember([$_GET['membersid']]);
$questions = getMemberQuestions([$_GET['membersid']]);
$reports = getAllReports();

$smarty->assign('member', $member);
$smarty->assign('questions', $questions);
$smarty->assign('reports', $reports);


$smarty->display('members/details.tpl');
$smarty->display('common/footer.tpl');
?>