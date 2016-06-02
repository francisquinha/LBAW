<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');


if (isset($_GET['questionid'])) {
    updateViews([$_GET['questionid']]);
    $question = getQuestion([$_GET['questionid']]);
    $question_post = getPost([$_GET['questionid']]);
    $question['postauthorid'] = $question_post['postauthorid'];
    $question['postcreationdate'] = $question_post['postcreationdate'];
    $question['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
    $question['postrating'] = $question_post['postrating'];
    $question_body = getPostCurrentBody([$_GET['questionid']]);
    $question['postversionid'] = $question_body['postversionid'];
    $question['versionbody'] = $question_body['versionbody'];
    $question['name'] = getMemberName([$question_post['postauthorid']])['name'];
    $question['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
    $question['tagarray'] = getQuestionTags([$_GET['questionid']]);

    $bestanswers = getBestAnswer([$_GET['questionid']]);
    $answers = getAnswers([$_GET['questionid']]);

    foreach ($bestanswers as $key => $bestanswer) {
        unset($timeago);
        $timeago = time_elapsed_string(strtotime($bestanswer['postcreationdate']));
        $bestanswers[$key]['timeago'] = $timeago;
    }

    foreach ($answers as $key => $answer) {
        unset($timeago);
        $timeago = time_elapsed_string(strtotime($answer['postcreationdate']));
        $answers[$key]['timeago'] = $timeago;
    }

    $smarty->assign('question_id', $_GET['questionid']);
    $smarty->assign('bestanswers', $bestanswers);
    $smarty->assign('answers', $answers);
    $smarty->assign('question', $question);
    $smarty->display('questions/details.tpl');

    $smarty->display('common/menu_side.tpl');
    include_once($BASE_DIR . 'pages/categories/list_top.php');
    include_once($BASE_DIR . 'pages/tags/list_top.php');
    $smarty->display('common/footer.tpl');
}

?>