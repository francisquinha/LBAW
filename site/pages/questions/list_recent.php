<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once('time.php');

$questions = getRecentQuestions([15]);

/*
foreach ($questions as $key => $question) {
    unset($photo);
    if (file_exists($BASE_DIR . 'images/users/' . $tweet['username'] . '.png'))
        $photo = 'images/users/' . $tweet['username'] . '.png';
    if (file_exists($BASE_DIR . 'images/users/' . $tweet['username'] . '.jpg'))
        $photo = 'images/users/' . $tweet['username'] . '.jpg';
    if (!$photo) $photo = 'images/assets/default.png';
    $tweets[$key]['photo'] = $photo;
}
*/

foreach ($questions as $key => $question) {
    unset($timeago);
    $timeago = time_elapsed_string(strtotime($question['postcreationdate']));
    $questions[$key]['timeago'] = $timeago;
    unset($tagarray);
    $tagarray = explode(" ", $question['tagnames']);
    $questions[$key]['tagarray'] = $tagarray;
}

$smarty->assign('last_question_id', $questions[0]['questionID']);
$smarty->assign('questions', $questions);
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

$smarty->display('common/menu_side.tpl');
include_once($BASE_DIR .'pages/tags/list_all.php');
$smarty->display('common/footer.tpl');
?>