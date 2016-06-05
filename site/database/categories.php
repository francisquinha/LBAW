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

function changecategoryquestion($question, $category)
{
    global $conn;
    $stmt = $conn->prepare("
    
    UPDATE question
SET categoryid = :categoryid
WHERE question.questionid = :questionid;
    ");
    $stmt->bindParam('questionid', $question);
    $stmt->bindParam('categoryid', $category);

    $stmt->execute();

}

?>
