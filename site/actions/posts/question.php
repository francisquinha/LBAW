<?php
include_once('../../config/init.php');
include_once($BASE_DIR . 'database/questions.php');

if (!$_POST['category']) {
    $_SESSION['error_messages'][] = 'Category is mandatory';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}
if (!$_POST['title'] || !$_POST['body']) {
    $_SESSION['error_messages'][] = 'Question subject and body are mandatory';
    header('Location: ' . $_SERVER['HTTP_REFERER']);
    exit;
}

$memberid = $_SESSION['userid'];

$categoryid = $_POST['category'];

$tagids = $_POST['tags'];
$tags = "{";
for ($i = 0; $i < sizeof($tagids) - 1; $i++) {
    $tags.=$tagids[$i].",";
}
if (!empty($tagids)) $tags .= $tagids[sizeof($tagids) - 1];
$tags.="}";

$title = $_POST['title'];

$body = $_POST['body'];

$questionid = createNewQuestion($title, $body, $categoryid, $tags, $memberid)['insertquestion'];

$_SESSION['success_messages'][] = 'New question registered successfully';
header('Location: '.$BASE_URL. 'pages/questions/details.php?questionid='.$questionid);
echo 'something get wrong';
exit;
