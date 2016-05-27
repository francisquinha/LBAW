<?php
  
  function createUser($realname, $username, $password, $email) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO Member(name, username, email, password) VALUES (?, ?, ?, ?)");
    $stmt->execute(array($realname, $username, $email, sha1($password)));
  }

  function isLoginCorrect($username, $password) {
    global $conn;
    $stmt = $conn->prepare("
SELECT *
FROM member
WHERE username = ? AND password = ? AND permissiontype NOT IN ('banned', 'disabled', 'suspended');");
    $stmt->execute(array($username, sha1($password)));
    return $stmt->fetch() == true;
  }

function getMembersStartingWith($n , $t)
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

?>
