<?php

function getAllTags()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM Tag
ORDER BY tagname;");
    $stmt->execute();
    return $stmt->fetchAll();
}

?>
