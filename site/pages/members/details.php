<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/members.php');
include_once($BASE_DIR . 'database/questions.php');
include_once($BASE_DIR . 'database/reports.php');
include_once($BASE_DIR . 'database/answers.php');
include_once($BASE_DIR . 'database/moderator.php');
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
foreach ($root_categories as $category ) {
    $name_category = 'child_categories_'.$category['categoryid'];
    $$name_category = getChildCategories([$category['categoryid']]);
    $smarty->assign($name_category, $$name_category);
    recursiveChildren($$name_category);
}
$categorymod = getModCategories([$_GET['membersid']]);
$smarty->assign('categorymod', $categorymod);

$smarty->assign('root_categories', $root_categories);


$member = getMember([$_GET['membersid']]);

foreach ($member as $key => $membern) {
    $member[$key]['timeago'] = time_elapsed_string_no_ago(strtotime($membern['registrationdate']));
}

$questions = getMemberQuestions([$_GET['membersid']]);
$reports = getReportsModerator([$_GET['membersid']]);

foreach ($questions as $key => $question) {
    $questions[$key]['timeago'] = time_elapsed_string_no_ago(strtotime($question['postcreationdate']));
}

foreach ($reports as $key => $report) {
    $reports[$key]['timeago'] = time_elapsed_string_no_ago(strtotime($report['postcreationdate']));   
    $reports[$key]['name'] = getMemberName([$report['postauthorid']])['name'];
    
    unset($title);
    $title = getQuestionTitle([$report['postid']])['title'];
    if(!$title)
    $title = getAnswerTitle([$report['postid']])['title'];

    $reports[$key]['title'] = $title;
}

$moderators = getAllModerator();

$smarty->assign('member', $member);
$smarty->assign('questions', $questions);
$smarty->assign('reports', $reports);
$smarty->assign('moderators', $moderators);



$smarty->display('members/details.tpl');
$smarty->display('common/footer.tpl');
?>