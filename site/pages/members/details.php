<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/reports.php');
include_once($BASE_DIR . 'database/moderator.php');


$member = getMember([$_GET['membersid']]);
$questions = getMemberQuestions([$_GET['membersid']]);
$reports = getAllReports();
$moderators = getAllModerator();

$smarty->assign('member', $member);
$smarty->assign('questions', $questions);
$smarty->assign('reports', $reports);
$smarty->assign('moderators', $moderators);



$smarty->display('members/details.tpl');
$smarty->display('common/footer.tpl');
?>