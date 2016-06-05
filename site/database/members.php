<?php

function createUser($realname, $username, $password, $email)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Member(name, username, email, password) VALUES (?, ?, ?, ?)");
    $stmt->execute(array($realname, $username, $email, sha1($password)));
}

function isLoginCorrect($username, $password)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM member
WHERE username = ? AND password = ? AND permissiontype NOT IN ('banned', 'disabled', 'suspended');");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
}

function getLogin($username, $password)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT memberid, permissiontype
FROM member
WHERE username = ? AND password = ? AND permissiontype NOT IN ('banned', 'disabled', 'suspended');");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch();
}

function getMembersStartingWith($n, $t)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT 
  *
FROM Member
WHERE memberid != 1
AND (username LIKE '$n' OR username LIKE '$t')
ORDER BY username;");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getAllMembers($n, $m)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  username,
  email,
  memberrating,
  memberid
FROM Member
WHERE memberid != 1
ORDER BY username
LIMIT :n
OFFSET :m;");
    $stmt->bindParam(':n', $n);
    $stmt->bindParam(':m', $m);
    $stmt->execute();
    return $stmt->fetchAll();
}

function getMember($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM member
WHERE memberid =?;");
    $stmt->execute($id);
    return $stmt->fetchAll();
}

function Demote_Moderator($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('member', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
}

function Promote_Moderator($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('moderator', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
}

function Promote_Admin($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('administrator', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
}

function Ban($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('banned', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
}

function Suspended($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('suspended', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
}

function Disabled($giverID, $ownerID)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Permission (permissionType, giverID, ownerID) VALUES
  ('disabled', ?, ?);");
    $stmt->execute(array($giverID, $ownerID));
    $stmt->execute(array($giverID, $ownerID));
}

function getNumberMembers()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT reltuples::bigint AS number
FROM   pg_class
WHERE  relname = 'member';");
    $stmt->execute();
    return $stmt->fetch();
}

function updatename($newname,$user)
{
    global $conn;
    $stmt = $conn->prepare("UPDATE member
SET
  name     = :name
WHERE memberid = :memberid;");
    $stmt->bindParam('name', $newname);
    $stmt->bindParam('memberid', $user);

    $stmt->execute();

}

function updatepass($newpass,$user)
{
    global $conn;
    $stmt = $conn->prepare("UPDATE member
SET
  password     = :pass
WHERE memberid = :memberid;");
    $stmt->bindParam('pass', sha1($newpass));
    $stmt->bindParam('memberid', $user);

    $stmt->execute();

}

function checkpass($memberid, $password)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM member
WHERE memberid = ? AND password = ?;");
    $stmt->execute(array($memberid, sha1($password)));
    return $stmt->fetch() == true;
}
function addcategorymod($user, $category)
{
    global $conn;
    $stmt = $conn->prepare("INSERT INTO responsibility
(categoryid, memberid) VALUES (:category, :memberid);");
    $stmt->bindParam('category', $category);
    $stmt->bindParam('memberid', $user);

    $stmt->execute();

}

function getModCategories($id)
{

    global $conn;
    $stmt = $conn->prepare("
SELECT 
category.categoryname
FROM responsibility, category
WHERE memberid =? AND category.categoryid = responsibility.categoryid;");
    $stmt->execute($id);
    return $stmt->fetchAll();

}

function removecategorymod($user, $category)
{
    global $conn;
    $stmt = $conn->prepare("
DELETE
FROM responsibility
WHERE categoryid = :category AND memberid = :memberid;");
    $stmt->bindParam('category', $category);
    $stmt->bindParam('memberid', $user);

    $stmt->execute();

}


?>