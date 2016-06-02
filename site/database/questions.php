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

function getRecentQuestions($n)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname,
  string_agg(text(Tag.tagid), ' ') AS tagids,
  string_agg(tagname, ' ') AS tagnames
FROM Question
INNER JOIN Post ON Post.postid = Question.questionid
INNER JOIN Member ON Post.postAuthorid = Member.memberid
INNER JOIN Category ON Category.categoryid = Question.categoryid
LEFT JOIN Classification ON Classification.questionid = Question.questionid
LEFT JOIN Tag ON Classification.tagid = Tag.tagid
WHERE deletorid IS NULL
GROUP BY Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname
ORDER BY postcreationdate DESC
LIMIT ?;");
    $stmt->execute($n);
    return $stmt->fetchAll();
}

function getSearchPosts($text) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  post.postid AS questionid,
  post.postauthorid,
  member.name,
  post.postcreationdate,
  posttitle AS title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid,
  postcategory AS categoryname,
  posttags AS tagnames
FROM fulltextpost, post, member, question
WHERE fulltextpost.postid = post.postid
      AND post.postauthorid = member.memberid
      AND post.postid = question.questionid
      AND tsvPost @@ plainto_tsquery(?);");
    $stmt->execute($text);
    return $stmt->fetchAll();
}

function getTagQuestions($id) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname,
  string_agg(text(Tag.tagid), ' ') AS tagids,
  string_agg(tagname, ' ') AS tagnames
FROM Question
INNER JOIN (SELECT Question.questionid
            FROM Question, Classification
            WHERE Question.questionid = Classification.questionid AND Classification.tagid = ?) AS A ON A.questionid = Question.questionid
INNER JOIN Post ON Post.postid = Question.questionid
INNER JOIN Member ON Post.postAuthorid = Member.memberid
INNER JOIN Category ON Category.categoryid = Question.categoryid
LEFT JOIN Classification ON Classification.questionid = Question.questionid
LEFT JOIN Tag ON Classification.tagid = Tag.tagid
WHERE deletorid IS NULL
GROUP BY Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getCategoryQuestions($id) {
    global $conn;
    $stmt = $conn->prepare("
SELECT
  Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname,
  string_agg(text(Tag.tagid), ' ') AS tagids,
  string_agg(tagname, ' ') AS tagnames
FROM Question
INNER JOIN Post ON Post.postid = Question.questionid
INNER JOIN Member ON Post.postAuthorid = Member.memberid
INNER JOIN Category ON Category.categoryid = Question.categoryid
LEFT JOIN Classification ON Classification.questionid = Question.questionid
LEFT JOIN Tag ON Classification.tagid = Tag.tagid
WHERE deletorid IS NULL AND Question.categoryid = ?
GROUP BY Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname;");
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

?>
