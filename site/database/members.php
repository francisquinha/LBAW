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
WHERE username LIKE '$n' OR username LIKE '$t'
ORDER BY username;");
  $stmt->execute();
  return $stmt->fetchAll();
}
function getAllMembers()
{
  global $conn;
  $stmt = $conn->prepare("
SELECT
  username,
  email,
  memberrating,
  memberid
FROM Member
ORDER BY username;");
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
}
?>