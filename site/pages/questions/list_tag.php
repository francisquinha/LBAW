<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');

if (isset($_GET['tagid'])) {

    $questions = getTagQuestions([$_GET['tagid']]);

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

    $smarty->assign('last_question_id', $questions[0]['questionid']);
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
    $smarty->display('questions/list.tpl');

    $smarty->display('common/menu_side.tpl');
    include_once($BASE_DIR .'pages/categories/list_top.php');
    include_once($BASE_DIR .'pages/tags/list_top.php');
    $smarty->display('common/footer.tpl');
}
?>