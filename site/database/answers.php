<?php

function createNewAnswer($questionid, $body, $memberid)
{
    global $conn;
    $stmt = $conn->prepare("SELECT insertanswer(?, ?, ?)");
    $stmt->execute(array($questionid, $body, $memberid));
    $stmt->fetch();
}

function getAnswerTitle($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
question.title
FROM question, answer
WHERE question.questionid = answer.questionid
AND answer.answerid = ?;");
    $stmt->execute($id);
    return $stmt->fetch();
}
