<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');

if (isset($_GET['questionid'])) {
    $questions = getQuestion([$_GET['questionid']]);
    $answers = getAnswers([$_GET['questionid']]);

    foreach ($questions as $key => $question) {
        unset($timeago);
        $timeago = time_elapsed_string(strtotime($question['postcreationdate']));
        $questions[$key]['timeago'] = $timeago;
        unset($tagarray);
        $tagarray = explode(" ", $question['tagnames']);
        $questions[$key]['tagarray'] = $tagarray;
    }

    foreach ($answers as $key => $answer) {
        unset($timeago);
        $timeago = time_elapsed_string(strtotime($answer['postcreationdate']));
        $answers[$key]['timeago'] = $timeago;
    }

    $smarty->assign('last_answer_id', $answers[0]['answerid']);
    $smarty->assign('answers', $answers);
    $smarty->assign('questions', $questions);
    $subtitle = "";
    $smarty->assign('subtitle', $subtitle);
    $tab = "";
    $smarty->assign('tab1', $tab);
    $smarty->assign('tab2', $tab);
    $class_tab = "";
    $smarty->assign('class_tab1', $class_tab);
    $smarty->assign('class_tab2', $class_tab);
    $style_tab = "'display: none;'";
    $smarty->assign('style_tab1', $style_tab);
    $smarty->assign('style_tab2', $style_tab);
    $smarty->display('questions/details.tpl');

    $smarty->display('common/menu_side.tpl');
    include_once($BASE_DIR .'pages/tags/list_all.php');
    $smarty->display('common/footer.tpl');
}

?>