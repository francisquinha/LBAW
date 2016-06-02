<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/reports.php');
include_once($BASE_DIR . 'pages/questions/time.php');


if (isset($_GET['postid'])) {
    $question = getQuestion([$_GET['postid']]);
    if (!$question) {
        $answer = getAnswer([$_GET['postid']]);
        $answer['timeago'] = time_elapsed_string(strtotime($answer['postcreationdate']));
        $answer['name'] = getMemberName([$answer['postauthorid']])['name'];
        unset($answer_body);
        $answer_body = getPostCurrentBody([$_GET['postid']]);
        $answer['postversionid'] = $answer_body['postversionid'];
        $answer['versionbody'] = $answer_body['versionbody'];
        $smarty->assign('answer', $answer);
    }
    else {
        unset($question_post);
        $question_post = getPost([$_GET['postid']]);
        $question['postauthorid'] = $question_post['postauthorid'];
        $question['postcreationdate'] = $question_post['postcreationdate'];
        $question['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
        $question['postrating'] = $question_post['postrating'];
        unset($question_body);
        $question_body = getPostCurrentBody([$_GET['postid']]);
        $question['postversionid'] = $question_body['postversionid'];
        $question['versionbody'] = $question_body['versionbody'];
        $question['name'] = getMemberName([$question_post['postauthorid']])['name'];
        $question['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
        $question['tagarray'] = getQuestionTags([$_GET['questionid']]);
        $smarty->assign('question', $question);
    }
    $reports = getReport([$_GET['postid']]);
    foreach ($reports as $key => $report) {
        $reports[$key]['timeago'] = time_elapsed_string(strtotime($report['reportdate']));
    }

    $smarty->assign('reports', $reports);
}

$smarty->display('report/details.tpl');

$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');

?>