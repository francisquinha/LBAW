<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');


if (isset($_GET['questionid'])) {
    $questions = getQuestion([$_GET['questionid']]);
    $bestanswers = getBestAnswer([$_GET['questionid']]);
    $answers = getAnswers([$_GET['questionid']]);

    foreach ($questions as $key => $question) {
        unset($timeago);
        $timeago = time_elapsed_string(strtotime($question['postcreationdate']));
        $questions[$key]['timeago'] = $timeago;
        unset($tagarray);
        $tagarray = array();
        if ($question['tagnames'] != "") {
            unset($tagnamearray);
            $tagnamearray = explode(" ", $question['tagnames']);
            unset($tagidarray);
            $tagidarray = explode(" ", $question['tagids']);
            for ($i = 0; $i < sizeof($tagnamearray); $i++) {
                unset($tag);
                $tag['tagid'] = $tagidarray[$i];
                $tag['tagname'] = $tagnamearray[$i];
                array_push($tagarray, $tag);
            }
        }
        $questions[$key]['tagarray'] = $tagarray;
    }

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

    $smarty->assign('last_answer_id', $answers[0]['answerid']);
    $smarty->assign('bestanswers', $bestanswers);
    $smarty->assign('answers', $answers);
    $smarty->assign('questions', $questions);
    $smarty->display('questions/details.tpl');

    $smarty->display('common/menu_side.tpl');
    include_once($BASE_DIR .'pages/categories/list_top.php');
    include_once($BASE_DIR .'pages/tags/list_top.php');
    $smarty->display('common/footer.tpl');
}

?>