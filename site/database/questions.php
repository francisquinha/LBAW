<?php

function getMemberQuestions($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  question.questionid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question
WHERE
  post.postauthorid = ?
  AND question.questionid = post.postid
ORDER BY postcreationdate DESC;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getRecentQuestions($n, $m)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  question.questionid,
  post.postauthorid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question
WHERE
  deletorid IS NULL
  AND question.questionid = post.postid
  AND post.deletorid IS NULL
ORDER BY postcreationdate DESC
LIMIT :n
OFFSET :m;");
    $stmt->bindParam(':n', $n);
    $stmt->bindParam(':m', $m);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getSearchPosts($text, $n, $m) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  post.postid,
  post.postauthorid,
  post.postcreationdate,
  post.postrating,
  question.title,
  question.views,
  question.answers,
  question.categoryid
FROM post, question, fulltextpost
WHERE
  post.postid = fulltextpost.postid
  AND post.postid = question.questionid
  AND tsvPost @@ plainto_tsquery(:text)
  AND post.deletorid IS NULL
LIMIT :n
OFFSET :m;");
    $stmt->bindParam(':n', $n);
    $stmt->bindParam(':m', $m);
    $stmt->bindParam(':text', $text);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getTagQuestions($id) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  question.questionid,
  post.postauthorid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question, classification
WHERE question.questionid = classification.questionid 
  AND classification.tagid = ? 
  AND post.postid = question.questionid
  AND post.deletorid IS NULL;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getCategoryQuestions($id) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  question.questionid,
  post.postauthorid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question
WHERE question.categoryid = ? 
  AND post.postid = question.questionid
  AND post.deletorid IS NULL;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function updateViews($id)
{
    global $conn;
    $stmt = $conn->prepare("
UPDATE question
SET views = views + 1
WHERE question.questionid = ?;");
    $stmt->execute($id);
    return true;
}

function getQuestion($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  question.questionid,
  question.title,
  question.views,
  question.answers,
  question.categoryid
FROM question
WHERE question.questionid = ?;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getPost($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  post.postauthorid,
  post.postcreationdate,
  post.postrating
FROM post
WHERE post.postid = ?;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getPostCurrentBody($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT DISTINCT ON (postversion.postid)
  postversion.postversionid,
  postversion.versionbody
FROM postversion
WHERE postid = ?
ORDER BY postversion.postid, postversion.postversionid DESC;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getMemberName($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  member.name
FROM member
WHERE
  member.memberid = ?;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getCategoryName($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  category.categoryname
FROM category
WHERE category.categoryid = ?;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getQuestionTags($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  tag.tagid,
  tagname
FROM classification, tag
WHERE
  questionid = ?
AND classification.tagid = tag.tagid;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getAnswers($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  answer.answerid,
  post.postcreationdate,
  post.postauthorid,
  post.postrating
FROM answer, post, question
WHERE
  answer.questionid = ?
  AND answer.answerid = post.postid
  AND question.questionid = answer.questionid
  AND question.bestanswerid IS NULL;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getAnswer($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  answer.answerid,
  post.postcreationdate,
  post.postauthorid,
  post.postrating
FROM answer, post
WHERE
  answer.answerid = ?
  AND answer.answerid = post.postid;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function getBestAnswer($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  answer.answerid,
  post.postcreationdate,
  post.postauthorid,
  post.postrating
FROM answer, post, question
WHERE
  answer.questionid = ?
  AND answer.answerid = post.postid
  AND question.questionid = answer.questionid
  AND question.bestanswerid = answer.answerid;");
    $stmt->execute($id);
    return $stmt->fetch();
}

function updateVotes($voterid, $postid, $up) {

    global $conn;
    $stmt = $conn->prepare("INSERT INTO vote(voterid, postid, up) VALUES (:voterid, :postid, :up)");
    $stmt->bindValue('voterid', $voterid, PDO::PARAM_INT);
    $stmt->bindValue('postid', $postid, PDO::PARAM_INT);
    $stmt->bindValue('up', $up, PDO::PARAM_BOOL);
    $stmt->execute(array($voterid, $postid, $up));
}

function getQuestionTitle($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
question.title
FROM question
WHERE question.questionid =?;
");
    $stmt->execute($id);
    return $stmt->fetch();
}

?>
