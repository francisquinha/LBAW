<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'pages/questions/time.php');
include_once($BASE_DIR . 'pages/pagination/pagination.php');

if (isset($_GET['tagid'])) {

    $items = 10;

    $questions = getTagQuestions($_GET['tagid'], $items, ($_GET['page'] - 1) * $items);

    foreach ($questions as $key => $question) {
        $questions[$key]['timeago'] = time_elapsed_string(strtotime($question['postcreationdate']));
        $questions[$key]['name'] = getMemberName([$question['postauthorid']])['name'];
        $questions[$key]['categoryname'] = getCategoryName([$question['categoryid']])['categoryname'];
        $questions[$key]['tagarray'] = getQuestionTags([$question['questionid']]);
    }

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

    pagination($_GET['page'], getNumberTagQuestions($_GET['tagid'])['number'], $items, 2, "list_tag.php?tagid=".$_GET['tagid']."&page=%d");
    echo '</div>';

    $smarty->display('common/menu_side.tpl');
    include_once($BASE_DIR .'pages/categories/list_top.php');
    include_once($BASE_DIR .'pages/tags/list_top.php');
    $smarty->display('common/footer.tpl');
}
