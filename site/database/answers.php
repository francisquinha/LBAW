<?php

function createNewAnswer($questionid, $body, $memberid) {

    global $conn;
    $stmt = $conn->prepare("SELECT insertanswer(questionid, body, memberid) VALUES (?, ?, ?)");
    $stmt->execute(array($questionid, $body, $memberid));
}

?>