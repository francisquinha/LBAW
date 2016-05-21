/*
    SQL102  Show hot questions list
    Shows the application's frontpage with the list of hot questions.
 */

-- SQL 102.1 - n most recent questions with offset m
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
    - extract(EPOCH FROM now() - postcreationdate)/extract(EPOCH FROM now() - mindate) AS hotness
FROM post, question, questionstats
WHERE
  deletorid IS NULL
  AND question.questionid = post.postid
ORDER BY hotness DESC
LIMIT :n
OFFSET :m;

-- SQL 102.2 - member name
SELECT
  member.name
FROM member
WHERE
  member.memberid = :memberid;

-- SQL 102.3 - category name
SELECT
  category.categoryname
FROM category
WHERE category.categoryid = :categoryid;

-- SQL 102.4 - question tags
SELECT
  tag.tagid,
  tagname
FROM classification, tag
WHERE
  questionid = :questionid
  AND classification.tagid = tag.tagid;


/*
    SQL103  Show recent questions list
    Shows the application's frontpage with the list of recent questions.
 */

-- SQL 103.1 - n most recent questions with offset m
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

-- SQL 102.2 - member name

-- SQL 102.3 - category name

-- SQL 102.4 - question tags


/*
    SQL106  Individual Profile
    Shows the member's individual profile, where the user can view and edit his own personal information.
 */

SELECT *
FROM member
WHERE memberid = :memberid;


/*
    SQL107  Member Area
    Shows the member's asked questions list.
 */

-- SQL 107.1 - member questions
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

-- SQL 102.3 - category name

-- SQL 102.4 - question tags


/*
    SQL108  Login
    This web resource corresponds to an action, i.e. performs changes in the information system and in the end
    there is a redirect to another web resource. In this case, this web resource authenticates the user by
    changing the user's permission based on login credentials and password received and, if successful,
    redirects the user to the user's own question page or, in case of failure, to the authentication page.
 */

SELECT member.memberid
FROM member
WHERE
  member.username = :username
  AND member.password = :password
  AND member.permissiontype NOT IN ('banned', 'disabled', 'suspended');


/*
    SQL109  Register
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource attempts to register the
    user by inserting the user's login credentials, password and personal information received and, if
    successful, redirects the user to the authentication page or, in case of failure e.g. username already
    exists, to the registration page.
 */

SELECT member.memberid
FROM member
WHERE member.username = :username;

SELECT member.memberid
FROM member
WHERE member.email = :email;

INSERT INTO member(name, username, email, password) VALUES (:name, :username, :email, :password);


/*
    SQL110  Profile Edition Form
    Shows the profile edition form along with the existing profile information,
    where registered and authenticated members may edit this data.
 */

SELECT
  password,
  name,
  picture
FROM member
WHERE memberid = :memberid;


/*
    SQL111  Edit Profile
    This web resource corresponds to an action, i.e. performs changes in the information system
    and in the end there is a redirect to another web resource. In this case, this web resource
    attempts to change the user's personal information and, if successful, redirects the user
    to his individual profile page or, in case of failure, to the profile edition page.
*/

UPDATE member
SET
  name = :name,
  password = :password,
  picture = :picture
WHERE memberid = :memberid;


/*
    SQL202  View Question
    Shows a question page, where registered and authenticated members may compose their answers.
 */

-- SQL 202.1 - update views and question details
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

-- SQL 202.2 - post details
SELECT
  post.postauthorid,
  post.postcreationdate,
  post.postrating
FROM post
WHERE post.postid = :postid;

-- SQL 202.3 - post current body version
SELECT DISTINCT ON (postversion.postid)
  postversion.postversionid,
  postversion.versionbody
FROM postversion
WHERE postid = :postid
ORDER BY postversion.postid, postversion.postversionid DESC;

-- SQL 202.4 - question answers
SELECT
  answer.answerid,
  post.postcreationdate,
  post.postauthorid,
  post.postrating
FROM answer, post
WHERE
  answer.answerid = post.postid
  AND answer.questionid = :questionid;

-- SQL 102.2 - member name

-- SQL 102.3 - category name

-- SQL 102.4 - question tags


/*
    SQL203  Ask Question
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource attempts to insert a
    question and, if successful, redirects the user to the view question page or, in case of failure, to the
    question form page.

    Request body	+title: text	title of the question
                  +body: text	  body of the question
                  +categoryID:    integer	category primary key
                  ?tagIDs: integer	tags primary keys
 */

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


/*
    SQL205  Answer Question
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource attempts to insert an
    answer to a question and, if successful, redirects the user to the view question page or, in case of
    failure, to the answer form page.

    Request body	+questionID: integer	Question primary key
                  +body: text	      Answer's text
 */

CREATE OR REPLACE FUNCTION insertanswer(answer_question INTEGER, answer_body TEXT, answer_member INTEGER) RETURNS INTEGER AS $$
DECLARE
  newpostid integer;
BEGIN
  INSERT INTO post (postauthorid) VALUES (answer_member) RETURNING postid INTO newpostid;
  INSERT INTO postversion (versionauthorid, postid, versionbody) VALUES (answer_member, newpostid, answer_body);
  INSERT INTO answer (answerid, questionid) VALUES (newpostid, answer_question);
  RETURN newpostid;
END;
$$ LANGUAGE plpgsql;

SELECT insertanswer(:questionid, :body, :memberid);


/*
    SQL206  Edit Content Form
    Shows a post edition page, where registered and authenticated members may edit their own questions or
    answers, and moderators can edit any post.
 */

-- SQL 202.3 - post current body version


/*
    SQL207  Edit Content
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource attempts to change the
    contents of a post and, if successful, redirects the user to the view post page or, in case of failure,
    to the edit content form page.

    Request body	+postID: integer	Post primary key
                  +postBody: text	  New post contents
 */

INSERT INTO postversion (versionauthorid, versionbody, postid) VALUES (:memberid, :postbody, :postid);


/*
    SQL208  Vote
    This web resource corresponds to an API. In this case, it adds a vote to specific post impacting it's
    rating and the answer is given using HTTP codes.
 */

INSERT INTO vote(voterid, postid, up) VALUES (:memberid, :postid, :up);


/*
    SQL209  Choose Best Answer
    This web resource corresponds to an API. In this case, it chooses a best answer to specific question and
    the answer is given using HTTP codes.

    Request body	+questionID: integer	Question primary key
                  +answerID: integer	  Answer primary key
 */

UPDATE question
SET bestanswerid = :answerid
WHERE questionid = :questionid;


/*
    SQL211  Send Report
    This web resource corresponds to an API. In this case, it submits a new report on a post and the answer
    is given using HTTP codes.

    Request body	+postID: integer	Post primary key
                  +body: text	      Report body
 */

INSERT INTO report(authorid, postid, reportbody) VALUES (:memberid, :postid, :body);


/*
    SQL213 Search
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource attempts to search for
    posts based on prvided keywords and, if successful, redirects the user to the view question page or, in
    case of failure, to the search form page.
 */

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

-- SQL 102.2 - member name

-- SQL 102.3 - category name

-- SQL 102.4 - question tags


/*
    SQL301  List Moderators (Admin area: Moderators Tab)
    Shows a list of moderators, the categories they are responsible for and the reports they have checked and
    have to check
 */

-- SQL 301.1 - moderators list
SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'moderator';

-- SQL 301.2 - moderator categories
-- inner join is used because it is more efficient according to explain
SELECT
  responsibility.categoryid,
  category.categoryname
FROM responsibility, category
WHERE
  responsibility.memberid = :memberid
  AND responsibility.categoryid = category.categoryid;

-- SQL 301.3 - moderator solved reports
SELECT
  count(*) AS reports
FROM report
WHERE report.solverid = :memberid;


/*
    SQL302  Promote Moderator
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. In this case, this web resource promotes a member,
    selected by the user, to moderator, changing the member's permissions and, if successful, redirects the
    user to the moderators list page or, in case of failure, to the members list page.

    Parameters	+promotedMemberID: integer	  Member primary key
                +permissionType: enum	Member type
 */

INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('moderator', :memberid, :promotedmemberid);

-- SQL 401 - members list



/*
    SQL303  Demote Moderator
    Shows a list of moderators so that the administrator can choose one to demote to member.

    Request Body	+demotedModeratorID: integer	  Member primary key
                  +permissionType: enum	Member type
 */

INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('member', :memberid, :demotedmoderatorid);

-- SQL 301.1 - moderators list


/*
    SQL401  Member List (Admin area: Users Tab)
    Shows a list of members that an admin can promote to moderators.
 */

SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'member';


/*
    SQL402  Warn Member
    This web resource corresponds to an action and afterwards there is a redirect to another web resource.
    In this case, this web resource sends a warning message to a member, selected by the user and, if
    successful, redirects the user to the reports page or, in case of failure, to the members profile page.

    Request Body	+warnedMemberID: integer Member primary key of the member being warned
                  +messageBody: text of the warning
                  +messageTitle: subject of the warning
*/

-- SQL 402 - send member warning message
INSERT INTO message(senderid, receiverid, messagetitle, messagebody) VALUES
  (:memberid, :warnedmemberid, :messagetitle, :messagebody);


/*
    SQL402 Add to A9, same sql for warn and punish message
    SQL403  Punish Member
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. !!!!!!!!In this case, this web resource promotes a member,
    selected by the user, to moderator, changing the member's permissions and, if successful, redirects the
    user to the moderators list page or, in case of failure, to the members list page.!!!! isto não faz sentido nenhum


    Request Body	+punishedMemberID: integer Member primary key of the member being punished
                  +messageBody: text justifying the punishment
                  +messageTitle: subject of the punishement message
                  ?ratingDec: rating to be deduced from member's rating
 */

-- SQL 403.1 - bann member
INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('banned', :memberid, :punishedmemberid);

-- SQL 403.2 - suspende member
INSERT INTO permission (permissiontype, giverid, ownerid)
VALUES ('suspended', :memberid, :punishedmemberid);

-- SQL 403.3 - decrease member rating
UPDATE member
SET memberrating = memberrating - :ratingdec
WHERE memberid = :memberid;

-- SQL 402


/*
    SQL404  Penalize Member
    This web resource corresponds to an action, i.e. performs changes in the information system and in the
    end there is a redirect to another web resource. !!!!!!!!In this case, this web resource promotes a member,
    selected by the user, to moderator, changing the member's permissions and, if successful, redirects the
    user to the moderators list page or, in case of failure, to the members list page.!!!! isto não faz sentido nenhum


    Request Body	+warnedMemberID: integer Member primary key of the member being penalized
                  +messageBody: text justifying the punishment
                  +messageTitle: subject of the punishement message
                  +ratingDec: rating to be deduced from member's rating
 */

-- SQL 403.3

-- SQL 402


/*
    SQL501.1  List Tags
    Shows a list of all tags in alphabetical order. When the query parameter (optional) is specified, it
    presents only the tags whose name contains the expression specified in the parameter.
 */

SELECT *
FROM tag
ORDER BY tagname;


/*
    SQL501.2  Questions per Tag (Moderator area: Tags Tab)
    Shows a list of all tags in alphabetical order and how many questions are marked with each tag.
 */

-- inner join is used because explain shows it is faster
SELECT
  tag.tagid,
  tag.tagname,
  count(classification.questionid) AS numberquestions
FROM tag, classification
WHERE tag.tagid = classification.tagid
GROUP BY tag.tagname
ORDER BY tag.tagname;


/*
    SQL501.3  Get top Tags
    Shows a list of the most frequently used tags.
 */

-- inner join is used because explain shows it is faster
SELECT
  tag.tagid,
  tag.tagname,
  count(classification.questionid) AS numberquestions
FROM tag, classification
WHERE tag.tagid = classification.tagid
GROUP BY tag.tagname
ORDER BY numberquestions DESC
LIMIT :n;


/*
    SQL502  Create Tag
    This web resource corresponds to an API. In this case, it creates a tag from the system and the answer is
    given using HTTP codes.

    Request Body	+tagName: text	Name of tag
 */

INSERT INTO tag(tagname) VALUES (:tagname);


/*
    SQL503  Delete Tag
    This web resource corresponds to an API. In this case, it deletes a tag from the system and the answer is
    given using HTTP codes.

    Request Body	+tagID: integer	Tag primary key
 */

DELETE
FROM tag
WHERE tagid = :tagid;


/*
    SQL601  List Categories (Admin area: Categories Tab)
    Shows a list of all categories in alphabetical order.
 */

-- SQL 601.1 - List Root Categories
SELECT *
FROM category
WHERE category.parentcategoryid IS NULL
ORDER BY category.categoryid;

-- SQL 601.2 - List Child Categories
SELECT *
FROM category
WHERE category.parentcategoryid = :categoryid
ORDER BY categoryid;


/*
    SQL602  Create Category
    This web resource corresponds to an API. In this case, it creates a category from the system and the
    answer is given using HTTP codes.

    Parameters	+categoryName: text	Category name
 */

INSERT INTO category (categoryname) VALUES (:categoryname);


/*
    SQL603  Delete Category
    This web resource corresponds to an API. In this case, it deletes a category from the system and the
    answer is given using HTTP codes.

    Parameters	+categoryID: integer Category primary key
 */

DELETE
FROM category
WHERE category.categoryid = :categoryid;


/*
    SQL604  Attribute Category to a Moderator
    This web resource corresponds to an API. In this case, it adds a category from the system to a moderator
    and the answer is given using HTTP codes.

    Request Body	+categoryID: integer Category primary key
                  +memberID: integer	Member primary key
 */

INSERT INTO responsibility (categoryid, memberid) VALUES (:categoryid, :memberid);


/*
    SQL605  Remove Category of a Moderator
    This web resource corresponds to an API. In this case, it removes a category of a moderator and the
    answer is given using HTTP codes.

    Request Body	+categoryID: integer Category primary key
                  +memberID: integer	Member primary key
 */

DELETE FROM responsibility
WHERE
  responsibility.categoryid = :categoryid
  AND responsibility.memberid = :memberid;


/*
    SQL701  List Administrators
    Shows a list of all administrators in alphabetical order.
 */

SELECT
  member.memberid,
  member.name
FROM member
WHERE member.permissiontype = 'administrator'
ORDER BY member.name;

/*
    SQL702  Promote Administrator
    This web resource corresponds to an API. In this case, it promotes a member from the system to a
    administrator and the answer is given using HTTP codes.

    Parameters	+promotedMemberID: integer	Member primary key
 */

-- SQL 702.1 - list members and moderators
SELECT
  member.memberid,
  member.name
FROM member
WHERE
  member.permissiontype = 'member'
  OR member.permissiontype = 'moderator'
ORDER BY member.name;

-- SQL 702.2 - insert permission
INSERT INTO permission (permissiontype, giverid, ownerid) VALUES ('administrator', :memberid, :promotedmemberid);


/*
    SQL703  Demote administrator
    This web resource corresponds to an API. In this case, it promotes a member from the system to a
    administrator and the answer is given using HTTP codes.

    Request Body	+demotedMemberID: integer	  Member primary key
 */

-- SQL 701

-- SQL 303


/*
    SQL801  List Reports  (Moderator area: Reports Tab)
    Shows a list of reported posts and the number of reports per post in the categories the moderator is
    responsible for.

    Parameters	+categoryID: integer	Category primary key
 */

SELECT
  report.postid,
  count(*) as numberreports
FROM report
WHERE report.reportsolution IS NULL
GROUP BY postid
ORDER BY numberreports DESC;

/*
    SQL802  View Reports Details
    Shows the post title and body and a list of reports on that post, with the option to select one or more
    reports and reply to them.

    Parameters	+postID: integer	Post primary keywords
 */

-- SQL 202.3 - post current body version

-- SQL 802.1 - get question title
SELECT
  question.title
WHERE question.questionid = :questionid;

-- SQL 802.2 - get post reports
SELECT *
FROM report
WHERE report.postID = :postID;


/*
    SQL803  Answer Reports
    Acho que se insere um a um usando um for no php
    Shows a form to answer one or more reports, with a text box to fill with the answer

    Request Body	+reportID: integer	Report primary key
                  +reportAnswer: text	Message to be sent to the reporting members
 */

UPDATE report
SET report.reportsolution = :reportanswer
WHERE report.reportid = :reportid;
