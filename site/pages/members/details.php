<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/reports.php');
include_once($BASE_DIR . 'database/answers.php');
include_once($BASE_DIR . 'database/moderator.php');
include_once($BASE_DIR . 'pages/questions/time.php');



$member = getMember([$_GET['membersid']]);
$questions = getMemberQuestions([$_GET['membersid']]);
$reports = getReportsModerator([$_GET['membersid']]);

foreach ($reports as $key => $report) {
    $reports[$key]['timeago'] = time_elapsed_string_no_ago(strtotime($report['postcreationdate']));   
    $reports[$key]['name'] = getMemberName([$report['postauthorid']])['name'];
    
    unset($title);
    $title = getQuestionTitle([$report['postid']])['title'];
    if(!$title)
    $title = getAnswerTitle([$report['postid']])['title'];

    $reports[$key]['title'] = $title;
}

$moderators = getAllModerator();

$smarty->assign('member', $member);
$smarty->assign('questions', $questions);
$smarty->assign('reports', $reports);
$smarty->assign('moderators', $moderators);



$smarty->display('members/details.tpl');
$smarty->display('common/footer.tpl');
?>