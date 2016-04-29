<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once('time.php');

$questions = getRecentQuestions([10]);

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
$smarty->display('questions/listheader.tpl');
?>