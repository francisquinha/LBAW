<?php
function getReportsModerator($id)
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  report.postid,
  post.postauthorid,
  post.postcreationdate,
  COUNT(*) AS numberreports
FROM report, post, postcategory, responsibility
WHERE report.reportsolution IS NULL 
AND report.postid = post.postid
AND post.postid = postcategory.postid
AND postcategory.categoryid = responsibility.categoryid
AND responsibility.memberid = ?
GROUP BY report.postid,
  post.postauthorid,
  post.postcreationdate
ORDER BY numberreports DESC;");
    $stmt->execute($id);
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

?>