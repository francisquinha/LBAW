
-- SQL101: Show hot questions list
-- R102
-- n most recent questions with offset m
-- inner joins are necessary because hotness index uses info from all tables
SELECT
  question.questionid,
  post.postauthorid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid,
  postrating/maxrating + views/maxviews + answers/maxanswers
    - EXTRACT(EPOCH FROM now() - postcreationdate)/EXTRACT(EPOCH FROM now() - mindate) AS hotness
FROM post, question, questionstats
WHERE
  deletorid IS NULL
  AND question.questionid = post.postid
ORDER BY hotness DESC
LIMIT :n
OFFSET :m;

-- SQL102: Show recent questions list
-- R103
-- n most recent questions with offset m
-- inner join is necessary because date is only available in post table and we only want questions
SELECT
  question.questionid,
  post.postauthorid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question
WHERE
  deletorid IS NULL
  AND question.questionid = post.postid
ORDER BY postcreationdate DESC
LIMIT :n
OFFSET :m;

-- SQL103: Individual Profile
-- R106
SELECT *
FROM member
WHERE memberid = :memberid;

-- SQL104: Member Questions
-- R107
-- inner join is necessary because date is only available in post table and we only want questions
SELECT
  question.questionid,
  post.postcreationdate,
  question.title,
  post.postrating,
  question.views,
  question.answers,
  question.categoryid
FROM post, question
WHERE
  post.postauthorid = :memberid
  AND question.questionid = post.postid
ORDER BY postcreationdate DESC;

-- SQL105: Login
-- R108
SELECT *
FROM member
WHERE username = :username 
  AND password = :password 
  AND permissiontype NOT IN ('banned', 'disabled', 'suspended');

-- SQL106: Register
-- R109
SELECT member.memberid
FROM member
WHERE member.username = :username;
SELECT member.memberid
FROM member
WHERE member.email = :email;
INSERT INTO member(name, username, email, password) 
           VALUES (:name, :username, :email, :password);

-- SQL107: Profile Edition Form
-- R110
SELECT
  password,
  name,
  picture
FROM member
WHERE memberid = :memberid;

-- SQL108: Edit Profile
-- R111
UPDATE member
SET
  name     = :name,
  password = :password,
  picture  = :picture
WHERE memberid = :memberid;

-- SQL201: Question Details
-- R202
-- read commited makes sure the user sees the view count before his viewing which has not happened yet
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE question
SET views = views + 1
WHERE question.questionid = :postid;
SELECT
  question.questionid,
  question.title,
  question.views,
  question.answers,
  question.categoryid
FROM question
WHERE question.questionid = :postid;
COMMIT;
END;

-- SQL202: Post Details
-- R202
SELECT
  post.postauthorid,
  post.postcreationdate,
  post.postrating
FROM post
WHERE post.postid = :postid;

-- SQL203: Post Current Body Version
-- R202, R206
SELECT DISTINCT ON (postversion.postid)
  postversion.postversionid,
  postversion.versionbody
FROM postversion
WHERE postid = :postid
ORDER BY postversion.postid, postversion.postversionid DESC;

-- SQL204: Question Answers
-- R202
SELECT
  answer.answerid,
  post.postcreationdate,
  post.postauthorid,
  post.postrating
FROM answer, post
WHERE
  answer.answerid = post.postid
  AND answer.questionid = :questionid;

-- SQL205: Ask Question
-- R203
CREATE OR REPLACE FUNCTION insertquestion(question_title TEXT, question_body TEXT, question_category INTEGER,
  question_tags INTEGER[], question_member INTEGER) RETURNS INTEGER AS $$
DECLARE
  newpostid INTEGER;
  tagid INTEGER;
BEGIN
  INSERT INTO post (postauthorid) VALUES (question_member) RETURNING postid INTO newpostid;
  INSERT INTO postversion (versionauthorid, postid, versionbody) VALUES (question_member, newpostid, question_body);
  INSERT INTO question (title, categoryid, questionid) VALUES (question_title, question_category, newpostid);
  FOREACH tagid IN ARRAY question_tags LOOP
    INSERT INTO classification (questionid, tagid) VALUES (newpostid, tagid);
  END LOOP;
  RETURN newpostid;
END;
$$ LANGUAGE plpgsql;
SELECT insertquestion(:title, :body, :categorid, :tags, :memberid);
-- Example: SELECT insertquestion('The God Of Small Things', 'As Estha stirred the thick jam he thought Two Thoughts...', 1 , ARRAY[1,2,3], 2);

-- SQL206: Answer Question
-- R205
CREATE OR REPLACE FUNCTION insertanswer(answer_question INTEGER, answer_body TEXT, answer_member INTEGER) RETURNS INTEGER AS $$
DECLARE
  newpostid INTEGER;
BEGIN
  INSERT INTO post (postauthorid) VALUES (answer_member) RETURNING postid INTO newpostid;
  INSERT INTO postversion (versionauthorid, postid, versionbody) VALUES (answer_member, newpostid, answer_body);
  INSERT INTO answer (answerid, questionid) VALUES (newpostid, answer_question);
  RETURN newpostid;
END;
$$ LANGUAGE plpgsql;
SELECT insertanswer(:questionid, :body, :memberid);

-- SQL207: Edit Content
-- R207
INSERT INTO postversion (versionauthorid, versionbody, postid)
VALUES (:memberid, :postbody, :postid);

-- SQL208: Vote
-- R208
INSERT INTO vote(voterid, postid, up) VALUES (:memberid, :postid, :up);

-- SQL209: Choose Best Answer
-- R209
UPDATE Question
SET bestanswerid = :answerid
WHERE questionid = :questionid;

-- SQL210: Send Report
-- R211
INSERT INTO report(authorid, postid, reportbody)
VALUES (:memberid, :postid, :body);

-- SQL211: Search
-- R213
-- inner joins are necessary because date is in post and we only want questions and the search info is in fulltextpost
SELECT
  post.postid,
  post.postauthorid,
  post.postcreationdate,
  post.postrating,
  question.title,
  question.views,
  question.answers,
  question.categoryid
FROM post, question, fulltextpost
WHERE
  post.postid = fulltextpost.postid
  AND post.postid = question.questionid
  AND tsvPost @@ plainto_tsquery(:searchbody)
ORDER BY post.postcreationdate DESC
LIMIT :n
OFFSET :m;

-- SQL301: List Moderators
-- R301
SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'moderator';

-- SQL302: Promote Moderator
-- R302
INSERT INTO Permission (permissiontype, giverid, ownerid)
VALUES  ('moderator', :memberid, :promotedmemberid);

-- SQL303: Demote Moderator
-- R303, R703
INSERT INTO Permission (permissiontype, giverid, ownerid)
VALUES ('member', :memberid, :demotedmoderatorid);

-- SQL304: Moderator Categories
-- R301
-- inner join is used because it is more efficient according to explain
SELECT
  responsibility.categoryid,
  category.categoryname
FROM responsibility, category
WHERE
  responsibility.memberid = :memberid
  AND responsibility.categoryid = category.categoryid;

-- SQL305: Moderator Solved Reports
-- R301
SELECT COUNT(*) AS reports
FROM report
WHERE report.solverid = :memberid;

-- SQL401: Member List
-- R401
SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'member';

-- SQL402: Warn Member
-- R402
INSERT INTO message(senderid, receiverid, messagetitle, messagebody)
VALUES (:memberid, :warnedmemberid, :messagetitle, :messagebody);

-- SQL403: Punish Member
-- R403
INSERT INTO permission(permissiontype, giverid, ownerid)
VALUES ('banned', :memberid, :punishedmemberid);

-- SQL404: Penalize Member
-- R404
UPDATE member
SET memberrating = memberrating - :ratingdec
WHERE memberid = :memberid;

-- SQL405: Member Name
-- R102, R103, R202, R213
SELECT member.name
FROM member
WHERE member.memberid = :memberid;

-- SQL406: Suspend Member
-- R404
INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('suspended', :memberid, :punishedmemberid);

-- SQL501: List Tags
-- R501
SELECT *
FROM Tag
ORDER BY tagname;

-- SQL502: Get top Tags
-- R501
-- inner join is used because explain shows it is faster
SELECT
  tag.tagid,
  tag.tagname,
  COUNT(classification.questionid) AS numberquestions
FROM tag, classification
WHERE tag.tagid = classification.tagid
GROUP BY tag.tagname
ORDER BY numberquestions DESC
LIMIT :n;

-- SQL503: Create Tag
-- R502
INSERT INTO tag(tagname) VALUES (:tagname);

-- SQL504: Delete Tag
-- R503
DELETE
FROM tag
WHERE tagid = :tagid;

-- SQL505: Show question tags
-- R102, R103, R107, R202, R213
SELECT
  tag.tagid,
  tagname
FROM classification, tag
WHERE
  questionid = :questionid
  AND classification.tagid = tag.tagid;

-- SQL506: Questions per tag
-- R501
-- inner join is used because explain shows it is faster
SELECT
  tag.tagid,
  tag.tagname,
  COUNT(classification.questionid) AS numberquestions
FROM tag, classification
WHERE tag.tagid = classification.tagid
GROUP BY tag.tagname
ORDER BY tag.tagname;

-- SQL601: List Root Categories
-- R601
SELECT *
FROM category
WHERE category.parentcategoryid IS NULL
ORDER BY category.categoryid;

-- SQL602: List Child Categories
-- R601
SELECT *
FROM category
WHERE category.parentcategoryid = :categoryid
ORDER BY categoryid;

-- SQL603: Create Category
-- R602
INSERT INTO category(categoryname) VALUES(:categoryname);

-- SQL604: Delete Category
-- R603
DELETE
FROM Category
WHERE categoryID = :categoryID;

-- SQL605: Attribute Category to a Moderator
-- R604
INSERT INTO responsibility(categoryid, memberid)
VALUES (:categoryid, :memberid);

-- SQL606: Remove Category of a Moderator
-- R605
DELETE FROM responsibility
WHERE
  responsibility.categoryid = :categoryid
  AND responsibility.memberid = :memberid;

-- SQL607: Category Name
-- R102, R103, R107, R202, R213
SELECT category.categoryname
FROM category
WHERE category.categoryid = :categoryid;

-- SQL701: List Administrators

-- R701, R703
SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'administrator'
ORDER BY member.name;

-- SQL702: Promote Administrator
-- R702
INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('administrator', :memberID, :promotedMemberID);

-- SQL703: List members and moderators
-- R702
SELECT
  member.memberid,
  member.name
FROM member
WHERE
  member.permissiontype = 'member'
  OR member.permissiontype = 'moderator'
ORDER BY member.name;

-- SQL801: List Reports
-- R801
SELECT
  report.postid,
  COUNT(*) AS numberreports
FROM report
WHERE report.reportsolution IS NULL
GROUP BY postid
ORDER BY numberreports DESC;

-- SQL802: Get Question Title
-- R802
SELECT
  question.title
WHERE question.questionid = :questionid;

-- SQL803: Answer Reports
-- R803
UPDATE report
SET report.reportsolution = :reportanswer
WHERE report.reportid = :reportid;

-- SQL804: Get Post Reports
-- R802
SELECT *
FROM report
WHERE report.postID = :postID;