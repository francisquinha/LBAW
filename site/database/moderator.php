<?php

function getAllModerator()
{
  global $conn;
  $stmt = $conn->prepare("
SELECT
  member.memberid,
  member.username,
  member.memberrating
FROM member
WHERE member.permissiontype = 'moderator';");
  $stmt->execute();
  return $stmt->fetchAll();
}

?>
