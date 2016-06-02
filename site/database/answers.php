<?php

function createNewAnswer($questionid, $body, $memberid) {

    global $conn;
    $stmt = $conn->prepare("SELECT insertanswer(?, ?, ?)");
    $stmt->execute(array($questionid, $body, $memberid));
}
?>