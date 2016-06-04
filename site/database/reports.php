<?php
function getAllReports()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  report.postid,
  post.postauthorid,
  post.postcreationdate,
  COUNT(*) AS numberreports
FROM report,post 
WHERE report.reportsolution IS NULL AND
report.postid = post.postid
GROUP BY report.postid,
  post.postauthorid,
  post.postcreationdate
ORDER BY numberreports DESC;");
    $stmt->execute();
    return $stmt->fetchAll();
}

function getReport($n)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  *
FROM report,member
WHERE report.reportsolution IS NULL
AND report.authorid = member.memberid
AND report.postid = ?;");
    $stmt->execute($n);
    return $stmt->fetchAll();
}

function newReport($authorid, $postid, $reportbody) {
    global $conn;
    $stmt = $conn->prepare("INSERT INTO report(authorid, postid, reportbody) VALUES (?,?,?)");
    $stmt->execute(array($authorid, $postid, $reportbody));
}
?>