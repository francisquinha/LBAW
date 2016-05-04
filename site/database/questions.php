<?php

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

function getQuestion($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT DISTINCT ON (Question.questionid)
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
  string_agg(tagname, ' ') AS tagnames,
  PostVersion.postversionid,
  PostVersion.versionbody
FROM Post
  INNER JOIN Member ON Post.postauthorID = Member.memberID
  INNER JOIN Question ON Post.postID = Question.questionID
  INNER JOIN postVersion ON Post.postID = PostVersion.postID
  INNER JOIN Category ON Question.categoryID = Category.categoryid
  LEFT JOIN Classification ON Question.questionID = Classification.questionID
  LEFT JOIN Tag ON Classification.tagID = Tag.tagID
WHERE Question.questionid = ?
GROUP BY Question.questionid,
  Post.postauthorid,
  Member.name,
  Post.postcreationdate,
  Question.title,
  Post.postrating,
  Question.views,
  Question.answers,
  Question.categoryid,
  Category.categoryname,
  PostVersion.postversionid,
  PostVersion.versionbody
ORDER BY questionid, postversionid DESC;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getAnswers($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT DISTINCT ON (Answer.answerid)
  Answer.answerid,
  Answer.questionid,
  Post.postcreationdate,
  Post.postauthorid,
  Member.name,
  Post.postrating,
  PostVersion.postversionid,
  PostVersion.versionbody
FROM Answer, Post, PostVersion, Member
WHERE Answer.answerid = Post.postid
      AND Post.postid = PostVersion.postid
      AND Post.postauthorid = Member.memberid
      AND Answer.questionID = ?
ORDER BY answerid, postversionid DESC;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function getUserTweets($username)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE username = ? 
                            ORDER BY time DESC");
    $stmt->execute(array($username));
    return $stmt->fetchAll();
}

function createTweet($username, $tweet)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO tweets 
                            VALUES (DEFAULT, ?, ?, ?)");
    $stmt->execute(array(date('Y-m-d H:i:s'), $username, $tweet));
}

function getTweetCountAfter($id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT COUNT(*) AS count
                            FROM tweets 
                            WHERE id > ?");
    $stmt->execute(array($id));
    $result = $stmt->fetch();
    return $result['count'];
}

function getTweetsAfter($id)
{
    global $conn;
    $stmt = $conn->prepare("SELECT * 
                            FROM tweets JOIN 
                                 users USING(username) 
                            WHERE id > ?
                            ORDER BY time");
    $stmt->execute(array($id));
    return $stmt->fetchAll();
}

?>
