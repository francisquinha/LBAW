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

function createnewcategory($newcategory, $parentcategory)
{
    global $conn;
    $stmt = $conn->prepare("    
    INSERT INTO Category (categoryName, parentcategoryid) 
    VALUES (:categoryname, :parentcategoryid);
    ");
    $stmt->bindParam('categoryname', $newcategory);
    $stmt->bindParam('parentcategoryid', $parentcategory);

    $stmt->execute();
}

function createnewparentcategory($newcategory)
{
    global $conn;
    $stmt = $conn->prepare("    
    INSERT INTO Category (categoryName) 
    VALUES (:categoryname);
    ");
    $stmt->bindParam('categoryname', $newcategory);

    $stmt->execute();
}

function deletecategory($categoryid)
{
    global $conn;
    $stmt = $conn->prepare("    
    DELETE
    FROM Category
    WHERE categoryID = :categoryID;
    ");
    $stmt->bindParam('categoryID', $categoryid);

    $stmt->execute();
}
?>
