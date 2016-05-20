<?php

function getAllUsers($n , $t)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM Member
WHERE username LIKE '$n' OR username LIKE '$t'
ORDER BY username;");
    $stmt->execute();
    return $stmt->fetchAll();
}

function All()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM Member
ORDER BY username;");
    $stmt->execute();
    return $stmt->fetchAll();
}



?>
