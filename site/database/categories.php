<?php

function getRootCategories()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM Category
WHERE parentcategoryid IS NULL
ORDER BY categoryid;");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getChildCategories($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM Category
WHERE parentcategoryid = ?
ORDER BY categoryid;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

?>
