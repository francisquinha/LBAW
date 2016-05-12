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

function getTopTags($n)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  Tag.tagid,
  Tag.tagname,
  count(Tag.tagid) AS countquestions
FROM Tag, Classification
WHERE Tag.tagid = Classification.tagid
GROUP BY Tag.tagid, Tag.tagname
ORDER BY countquestions DESC
LIMIT ?;");
    $stmt->execute($n);
    return $stmt->fetchAll();
}

?>
