<?php
function getAllReports()
{
    global $conn;
    $stmt = $conn->prepare("
SELECT
  report.postid,
  COUNT(*) AS numberreports
FROM report
WHERE report.reportsolution IS NULL
GROUP BY postid
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

?>