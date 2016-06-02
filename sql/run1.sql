-- sequences and tables
DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;

SET SCHEMA 'public';

DROP TABLE IF EXISTS Answer CASCADE;

DROP TABLE IF EXISTS Category CASCADE;

DROP TABLE IF EXISTS Classification CASCADE;

DROP TABLE IF EXISTS Member CASCADE;

DROP TABLE IF EXISTS Permission CASCADE;

DROP TABLE IF EXISTS Post CASCADE;

DROP TABLE IF EXISTS PostVersion CASCADE;

DROP TABLE IF EXISTS Question CASCADE;

DROP TABLE IF EXISTS Report CASCADE;

DROP TABLE IF EXISTS Responsibility CASCADE;

DROP TABLE IF EXISTS Tag CASCADE;

DROP TABLE IF EXISTS Vote CASCADE;

DROP TABLE IF EXISTS Message CASCADE;

DROP SEQUENCE IF EXISTS category_categoryid_seq;

DROP SEQUENCE IF EXISTS member_memberid_seq;

DROP SEQUENCE IF EXISTS permission_permissionid_seq;

DROP SEQUENCE IF EXISTS post_postid_seq;

DROP SEQUENCE IF EXISTS postversion_postversionid_seq;

DROP SEQUENCE IF EXISTS report_reportid_seq;

DROP SEQUENCE IF EXISTS tag_tagid_seq;

DROP SEQUENCE IF EXISTS vote_voteid_seq;

DROP SEQUENCE IF EXISTS message_messageid_seq;

DROP TYPE IF EXISTS permissionEnum;

CREATE TYPE permissionEnum AS ENUM ('banned', 'disabled', 'suspended', 'member', 'moderator', 'administrator', 'system');

CREATE SEQUENCE category_categoryid_seq INCREMENT 1 START 1;

CREATE SEQUENCE member_memberid_seq INCREMENT 1 START 1;

CREATE SEQUENCE permission_permissionid_seq INCREMENT 1 START 1;

CREATE SEQUENCE post_postid_seq INCREMENT 1 START 1;

CREATE SEQUENCE postversion_postversionid_seq INCREMENT 1 START 1;

CREATE SEQUENCE report_reportid_seq INCREMENT 1 START 1;

CREATE SEQUENCE tag_tagid_seq INCREMENT 1 START 1;

CREATE SEQUENCE vote_voteid_seq INCREMENT 1 START 1;

CREATE SEQUENCE message_messageid_seq INCREMENT 1 START 1;

CREATE TABLE Member(
  memberID INTEGER PRIMARY KEY DEFAULT nextval('member_memberid_seq'),
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  picture TEXT,
  registrationDate TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp(0),
  memberRating INTEGER NOT NULL DEFAULT 0,
  permissionType permissionEnum NOT NULL DEFAULT 'member'
);

CREATE TABLE Permission(
  permissionID INTEGER PRIMARY KEY DEFAULT nextval('permission_permissionid_seq'),
  beginDate TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp(0),
  permissionType permissionEnum NOT NULL,
  giverID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  ownerID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT OwnerGiver CHECK (giverID != ownerID OR giverID = 1)
);

CREATE TABLE Post(
  postID INTEGER PRIMARY KEY DEFAULT nextval('post_postid_seq'),
  postAuthorID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  postRating INTEGER NOT NULL DEFAULT 0,
  postCreationDate TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp(0),
  postDeletionDate TIMESTAMP WITH TIME ZONE,
  deletorID INTEGER REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT PostDates CHECK (postDeletionDate IS NULL OR postDeletionDate >= postCreationDate),
  CONSTRAINT PostNulls CHECK ((deletorID IS NULL AND postDeletionDate IS NULL) OR (deletorID IS NOT NULL AND postDeletionDate IS NOT NULL))
);

CREATE TABLE PostVersion(
  postVersionID INTEGER PRIMARY KEY DEFAULT nextval('postversion_postversionid_seq'),
  versionBody TEXT NOT NULL,
  versionDate TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp(0),
  versionAuthorID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  postID INTEGER NOT NULL REFERENCES Post (postID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Category(
  categoryID INTEGER PRIMARY KEY DEFAULT nextval('category_categoryid_seq'),
  categoryName TEXT NOT NULL UNIQUE,
  parentCategoryID INTEGER REFERENCES Category (categoryID) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE Tag(
  tagID INTEGER PRIMARY KEY DEFAULT nextval('tag_tagid_seq'),
  tagName TEXT NOT NULL UNIQUE
);

CREATE TABLE Question(
  questionID INTEGER NOT NULL PRIMARY KEY REFERENCES Post (postID) ON DELETE CASCADE ON UPDATE CASCADE,
  title TEXT NOT NULL,
  views INTEGER NOT NULL DEFAULT 0 CHECK (views >= 0),
  answers INTEGER NOT NULL DEFAULT 0 CHECK (answers >= 0),
  bestAnswerID INTEGER,
  categoryID INTEGER NOT NULL REFERENCES Category (categoryID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Answer(
  answerID INTEGER PRIMARY KEY REFERENCES Post (postID) ON DELETE CASCADE ON UPDATE CASCADE,
  questionID INTEGER NOT NULL REFERENCES Question (questionID) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE Question ADD CONSTRAINT FK_Question_bestAnswerID FOREIGN KEY (bestAnswerID) REFERENCES Answer (answerID) ON DELETE SET NULL ON UPDATE CASCADE;

CREATE TABLE Report(
  reportID INTEGER PRIMARY KEY DEFAULT nextval('report_reportid_seq'),
  reportBody TEXT NOT NULL,
  reportDate TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT current_timestamp(0),
  reportSolution TEXT,
  authorID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  postID INTEGER NOT NULL REFERENCES Post (postID) ON DELETE RESTRICT ON UPDATE CASCADE,
  solverID INTEGER REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Classification(
  tagID INTEGER NOT NULL REFERENCES Tag (tagID) ON DELETE CASCADE ON UPDATE CASCADE,
  questionID INTEGER NOT NULL REFERENCES Question (questionID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT PK_Classification PRIMARY KEY (tagID,questionID)
);

CREATE TABLE Responsibility(
  categoryID INTEGER NOT NULL REFERENCES Category (categoryID) ON DELETE CASCADE ON UPDATE CASCADE,
  memberID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT PK_Responsability PRIMARY KEY (categoryID,memberID)
);

CREATE TABLE Vote(
  voteID INTEGER PRIMARY KEY DEFAULT nextval('vote_voteid_seq'),
  up BOOLEAN NOT NULL,
  voterID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  postID INTEGER NOT NULL REFERENCES Post (postID) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT VoteUnique UNIQUE (voterID, postID)
);

CREATE TABLE Message(
  messageID INTEGER PRIMARY KEY DEFAULT  nextval('message_messageid_seq'),
  senderID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  receiverID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  messageTitle TEXT NOT NULL,
  messageBody TEXT NOT NULL
);


-- inserts before triggers
INSERT INTO Member (username, email, password, name, registrationDate, permissionType) VALUES
  ('system', 'system@system.com', '', 'system', TIMESTAMP '1984-02-24 16:30:56', 'system');

INSERT INTO Permission (beginDate, permissionType, giverID, ownerID) VALUES
  (TIMESTAMP '1984-02-24 16:30:56', 'system', 1, 1);

-- triggers
CREATE OR REPLACE FUNCTION checkPermissionHierarchyProc() RETURNS TRIGGER AS $checkPermissionHierarchyProc$
DECLARE
  permiType permissionEnum;
BEGIN
  SELECT permissionType INTO permiType FROM Member
  WHERE memberID = NEW.giverID;
  IF permiType = 'system' OR permiType = 'administrator'
      OR (permiType = 'moderator' AND (NEW.permissionType = 'banned' OR NEW.permissionType = 'suspended' OR NEW.permissionType = 'member')) THEN
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkPermissionHierarchyProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkPermissionHierarchy ON Permission;

CREATE TRIGGER checkPermissionHierarchy
BEFORE INSERT OR UPDATE ON Permission
FOR EACH ROW
EXECUTE PROCEDURE checkPermissionHierarchyProc();


CREATE OR REPLACE FUNCTION checkPermissionDateProc() RETURNS TRIGGER AS $checkPermissionDateProc$
DECLARE
  registDate TIMESTAMP WITH TIME ZONE;
BEGIN
  SELECT registrationDate INTO registDate FROM Member
  WHERE memberID = NEW.ownerID;
  IF registDate <= NEW.beginDate THEN
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkPermissionDateProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkPermissionDate ON Permission;

CREATE TRIGGER checkPermissionDate
BEFORE INSERT OR UPDATE ON Permission
FOR EACH ROW
EXECUTE PROCEDURE checkPermissionDateProc();


CREATE OR REPLACE FUNCTION checkVersionAuthorProc() RETURNS TRIGGER AS $checkVersionAuthorProc$
DECLARE
  originalAuthorID INTEGER;
  permiType permissionEnum;
BEGIN
  SELECT postAuthorID INTO originalAuthorID FROM Post
  WHERE postID = NEW.postID;
  IF NEW.versionAuthorID = originalAuthorID THEN
    RETURN NEW;
  END IF;
  SELECT permissionType INTO permiType FROM Member
  WHERE memberID = NEW.versionAuthorID;
  IF permiType = 'administrator' OR permiType = 'moderator' THEN
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkVersionAuthorProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkVersionAuthor ON PostVersion;

CREATE TRIGGER checkVersionAuthor
BEFORE INSERT OR UPDATE ON PostVersion
FOR EACH ROW
EXECUTE PROCEDURE checkVersionAuthorProc();


CREATE OR REPLACE FUNCTION checkVersionDateProc() RETURNS TRIGGER AS $checkVersionDateProc$
DECLARE
  postDate TIMESTAMP WITH TIME ZONE;
BEGIN
  SELECT postCreationDate INTO postDate FROM Post
  WHERE postID = NEW.postID;
  IF postDate <= NEW.versionDate THEN
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkVersionDateProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkVersionDate ON PostVersion;

CREATE TRIGGER checkVersionDate
BEFORE INSERT OR UPDATE ON PostVersion
FOR EACH ROW
EXECUTE PROCEDURE checkVersionDateProc();


CREATE OR REPLACE FUNCTION memberSetPermissionProc() RETURNS TRIGGER AS $memberSetPermissionProc$
BEGIN
	INSERT INTO Permission (beginDate, permissionType, giverID, ownerID)
	VALUES (NEW.registrationDate, 'member', 1, NEW.memberID);
	RETURN NEW;
END;
$memberSetPermissionProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS memberSetPermission ON Member;

CREATE TRIGGER memberSetPermission
AFTER INSERT ON Member
FOR EACH ROW
EXECUTE PROCEDURE memberSetPermissionProc();


CREATE OR REPLACE FUNCTION updatePermissionProc() RETURNS TRIGGER AS $updatePermissionProc$
BEGIN
	UPDATE Member
	SET permissionType = NEW.permissionType
	WHERE memberID = NEW.ownerID;
	RETURN NEW;
END;
$updatePermissionProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS updatePermission ON Permission;

CREATE TRIGGER updatePermission
AFTER INSERT OR UPDATE ON Permission
FOR EACH ROW
EXECUTE PROCEDURE updatePermissionProc();


CREATE OR REPLACE FUNCTION addAnswerProc() RETURNS TRIGGER AS $addAnswerProc$
BEGIN
	UPDATE Question
	SET answers = answers + 1
	WHERE questionID = NEW.questionID;
	RETURN NEW;
END;
$addAnswerProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS addAnswer ON Answer;

CREATE TRIGGER addAnswer
AFTER INSERT ON Answer
FOR EACH ROW
EXECUTE PROCEDURE addAnswerProc();


CREATE OR REPLACE FUNCTION removeAnswerProc() RETURNS TRIGGER AS $removeAnswerProc$
DECLARE
  questID INTEGER;
BEGIN
  SELECT questionID INTO questID FROM Answer
  WHERE answerID = NEW.postID;
  IF NEW.deletorID IS NOT NULL AND questID IS NOT NULL THEN
    UPDATE Question
    SET answers = answers - 1
    WHERE questionID = questID;
    RETURN NEW;
  END IF;
	RETURN NULL;
END;
$removeAnswerProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS removeAnswer ON Post;

CREATE TRIGGER removeAnswer
AFTER UPDATE ON Post
FOR EACH ROW
EXECUTE PROCEDURE removeAnswerProc();


CREATE OR REPLACE FUNCTION checkResponsabilityModeratorProc() RETURNS TRIGGER AS $checkResponsabilityModeratorProc$
DECLARE
  permiType permissionEnum;
BEGIN
  SELECT permissionType INTO permiType FROM Member
  WHERE memberID = NEW.memberID;
  IF permiType = 'moderator' THEN
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkResponsabilityModeratorProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkResponsabilityModerator ON Responsibility;

CREATE TRIGGER checkResponsabilityModerator
BEFORE INSERT ON Responsibility
FOR EACH ROW
EXECUTE PROCEDURE checkResponsabilityModeratorProc();


CREATE OR REPLACE FUNCTION dropResponsabilityModeratorProc() RETURNS TRIGGER AS $dropResponsabilityModeratorProc$
DECLARE
  oldPermiType permissionEnum;
BEGIN
  SELECT permissionType INTO oldPermiType
  FROM Member
  WHERE memberID = NEW.ownerID;
  IF oldPermiType = 'moderator' THEN
    DELETE FROM Responsibility
    WHERE Responsibility.memberid = NEW.ownerID;
  END IF;
  RETURN NEW;
END;
$dropResponsabilityModeratorProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS dropResponsabilityModerator ON Member;

CREATE TRIGGER dropResponsabilityModerator
BEFORE INSERT OR UPDATE ON Permission
FOR EACH ROW
WHEN (NEW.permissiontype != 'moderator')
EXECUTE PROCEDURE dropResponsabilityModeratorProc();


CREATE OR REPLACE FUNCTION addVoteRatingsProc() RETURNS TRIGGER AS $addVoteRatingsProc$
DECLARE
  inc INTEGER;
  authorID INTEGER;
BEGIN
  IF NEW.up = TRUE THEN inc = 1;
  ELSE inc = -1;
  END IF;
  SELECT postAuthorID INTO authorID
  FROM Post
  WHERE Post.postID = NEW.postID;
	UPDATE Post
  SET postRating = postRating + inc
	WHERE Post.postID = NEW.postID;
	UPDATE Member
  SET memberRating = memberRating + inc
	WHERE Member.memberID = authorID;
	RETURN NEW;
END;
$addVoteRatingsProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS addVoteRatings ON Vote;

CREATE TRIGGER addVoteRatings
AFTER INSERT ON Vote
FOR EACH ROW
EXECUTE PROCEDURE addVoteRatingsProc();


CREATE OR REPLACE FUNCTION checkReportDateProc() RETURNS TRIGGER AS $checkReportDateProc$
DECLARE
  postDate TIMESTAMP WITH TIME ZONE;
BEGIN
  SELECT postCreationDate INTO postDate FROM Post
  WHERE postID = NEW.postID;
  IF postDate <= NEW.reportDate THEN
      RETURN NEW;
  END IF;
  RETURN NULL;
END;
$checkReportDateProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS checkReportDate ON Report;

CREATE TRIGGER checkReportDate
BEFORE INSERT OR UPDATE ON Report
FOR EACH ROW
EXECUTE PROCEDURE checkReportDateProc();


CREATE OR REPLACE FUNCTION enforce5TagsProc() RETURNS TRIGGER AS $enforce5TagsProc$
DECLARE
  numberTags INTEGER;
BEGIN
  SELECT count(*) INTO numberTags
  FROM Classification
  WHERE questionID = NEW.questionID
  GROUP BY questionid;
  IF numberTags >= 5 THEN
    RETURN NULL;
  END IF;
  RETURN NEW;
END;
$enforce5TagsProc$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS enforce5Tags ON Classification;

CREATE TRIGGER enforce5Tags
BEFORE INSERT OR UPDATE ON Classification
FOR EACH ROW
EXECUTE PROCEDURE enforce5TagsProc();


-- functions for inserts
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
