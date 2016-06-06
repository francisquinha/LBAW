<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');
include_once($BASE_DIR . 'database/categories.php');

function recursiveChildren($children_category) {
    global $smarty;
    foreach ($children_category as $child_category) {
        $name_subcategory = 'child_categories_'.$child_category['categoryid'];
        $$name_subcategory = getChildCategories([$child_category['categoryid']]);
        $smarty->assign($name_subcategory, $$name_subcategory);
        recursiveChildren($$name_subcategory);
    }
}

$root_categories = getRootCategories();
foreach ($root_categories as $category) {
    $name_category = 'child_categories_'.$category['categoryid'];
    $$name_category = getChildCategories([$category['categoryid']]);
    $smarty->assign($name_category, $$name_category);
    recursiveChildren($$name_category);
}

$smarty->assign('root_categories', $root_categories);

if (isset($_GET['questionid'])) {
    updateViews([$_GET['questionid']]);
    $question = getQuestion([$_GET['questionid']]);
    unset($question_post);
    $question_post = getPost([$_GET['questionid']]);
    $question['postauthorid'] = $question_post['postauthorid'];
    $question['postcreationdate'] = $question_post['postcreationdate'];
    $question['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
    $question['postrating'] = $question_post['postrating'];
    unset($question_body);
    $question_body = getPostCurrentBody([$_GET['questionid']]);
    $question['postversionid'] = $question_body['postversionid'];
    $question['versionbody'] = $question_body['versionbody'];
    $question['name'] = getMemberName([$question_post['postauthorid']])['name'];
    $question['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
    $question['tagarray'] = getQuestionTags([$_GET['questionid']]);

    $bestanswer = getBestAnswer([$_GET['questionid']]);
    if ($bestanswer) {
        $bestanswer['timeago'] = time_elapsed_string(strtotime($bestanswer['postcreationdate']));
        $bestanswer['name'] = getMemberName([$bestanswer['postauthorid']])['name'];
        unset($bestanswer_body);
        $bestanswer_body = getPostCurrentBody([$bestanswer['answerid']]);
        $bestanswer['postversionid'] = $bestanswer_body['postversionid'];
        $bestanswer['versionbody'] = $bestanswer_body['versionbody'];
    }

    $answers = getAnswers([$_GET['questionid']]);

    foreach ($answers as $key => $answer) {
        $answers[$key]['timeago'] = time_elapsed_string(strtotime($answer['postcreationdate']));
        $answers[$key]['name'] = getMemberName([$answer['postauthorid']])['name'];
        unset($answer_body);
        $answer_body = getPostCurrentBody([$answer['answerid']]);
        $answers[$key]['postversionid'] = $answer_body['postversionid'];
        $answers[$key]['versionbody'] = $answer_body['versionbody'];
    }

    $smarty->assign('bestanswer', $bestanswer);
    $smarty->assign('answers', $answers);
    $smarty->assign('question', $question);
    $smarty->display('questions/details.tpl');

    $smarty->display('common/menu_side.tpl');
    $smarty->display('categories/list_side.tpl');
    include_once($BASE_DIR . 'pages/tags/list_top.php');
    $smarty->display('common/footer.tpl');
}

