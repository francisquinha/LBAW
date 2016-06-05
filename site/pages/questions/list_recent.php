<?php
include_once('../../config/init.php');
include_once($BASE_DIR.'database/questions.php');
include_once('time.php');
include_once($BASE_DIR . 'pages/pagination/pagination.php');

$items = 15;

$questions = getRecentQuestions($items, ($_GET['page'] - 1) * $items);

$questionsH = getHotQuestions($items, ($_GET['page'] - 1) * $items);

foreach ($questions as $key => $question) {
    $questions[$key]['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
    $questions[$key]['name'] = getMemberName([$question['postauthorid']])['name'];
    $questions[$key]['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
    $questions[$key]['tagarray'] = getQuestionTags([$question['questionid']]);
}

foreach ($questionsH as $key => $question) {
    $questionsH[$key]['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
    $questionsH[$key]['name'] = getMemberName([$question['postauthorid']])['name'];
    $questionsH[$key]['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
    $questionsH[$key]['tagarray'] = getQuestionTags([$question['questionid']]);
}

$smarty->assign('questions', $questions);
$smarty->assign('questionsH', $questionsH);
$subtitle = "Top Questions";
$smarty->assign('subtitle', $subtitle);
$tab1 = "Recent";
$smarty->assign('tab1', $tab1);
$tab2 = "Hot";
$smarty->assign('tab2', $tab2);
$class_tab1 = "'glyphicon glyphicon-time'";
$smarty->assign('class_tab1', $class_tab1);
$class_tab2 = "'glyphicon glyphicon-fire'";
$smarty->assign('class_tab2', $class_tab2);
$style_tab = "''";
$smarty->assign('style_tab1', $style_tab);
$smarty->assign('style_tab2', $style_tab);
$smarty->display('questions/list.tpl');

pagination($_GET['page'], getNumberQuestions()['number'], $items, 2, "list_recent.php?page=%d");
echo '</div>';
$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/categories/list_top.php');
include_once($BASE_DIR .'pages/tags/list_top.php');
$smarty->display('common/footer.tpl');
