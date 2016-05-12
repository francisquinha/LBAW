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
        unset($tagnamearray);
        $tagnamearray = explode(" ", $question['tagnames']);
        unset($tagidarray);
        $tagidarray = explode(" ", $question['tagids']);
        unset($tagarray);
        $tagarray = array();
        for ($i = 0; $i < sizeof($tagnamearray); $i++) {
            unset($tag);
            $tag['tagid'] = $tagidarray[$i];
            $tag['tagname'] = $tagnamearray[$i];
            array_push($tagarray, $tag);
        }
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
    $smarty->display('questions/details.tpl');

    
    $smarty->display('common/footer.tpl');
}

?>