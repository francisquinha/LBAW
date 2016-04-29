-- sequences and tables
DROP SCHEMA IF EXISTS public CASCADE;

CREATE SCHEMA public;

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

DROP SEQUENCE IF EXISTS category_categoryid_seq;

DROP SEQUENCE IF EXISTS member_memberid_seq;

DROP SEQUENCE IF EXISTS permission_permissionid_seq;

DROP SEQUENCE IF EXISTS post_postid_seq;

DROP SEQUENCE IF EXISTS postversion_postversionid_seq;

DROP SEQUENCE IF EXISTS report_reportid_seq;

DROP SEQUENCE IF EXISTS tag_tagid_seq;

DROP SEQUENCE IF EXISTS vote_voteid_seq;

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

CREATE TABLE Member(
  memberID INTEGER PRIMARY KEY DEFAULT nextval('member_memberid_seq'),
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL,
  name TEXT NOT NULL,
  picture TEXT,
  birthDate TIMESTAMP NOT NULL,
  registrationDate TIMESTAMP NOT NULL DEFAULT current_timestamp(0),
  memberRating INTEGER NOT NULL DEFAULT 0,
  permissionType permissionEnum NOT NULL DEFAULT 'member',
  CONSTRAINT MemberDates CHECK (registrationDate >= birthDate)
);

CREATE TABLE Permission(
  permissionID INTEGER PRIMARY KEY DEFAULT nextval('permission_permissionid_seq'),
  beginDate TIMESTAMP NOT NULL DEFAULT current_timestamp(0),
  permissionType permissionEnum NOT NULL,
  giverID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  ownerID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT OwnerGiver CHECK (giverID != ownerID OR giverID = 1)
);

CREATE TABLE Post(
  postID INTEGER PRIMARY KEY DEFAULT nextval('post_postid_seq'),
  postAuthorID INTEGER NOT NULL REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  postRating INTEGER NOT NULL DEFAULT 0,
  postCreationDate TIMESTAMP NOT NULL DEFAULT current_timestamp(0),
  postDeletionDate TIMESTAMP,
  deletorID INTEGER REFERENCES Member (memberID) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT PostDates CHECK (postDeletionDate IS NULL OR postDeletionDate >= postCreationDate),
  CONSTRAINT PostNulls CHECK ((deletorID IS NULL AND postDeletionDate IS NULL) OR (deletorID IS NOT NULL AND postDeletionDate IS NOT NULL))
);

CREATE TABLE PostVersion(
  postVersionID INTEGER PRIMARY KEY DEFAULT nextval('postversion_postversionid_seq'),
  versionBody TEXT NOT NULL,
  versionDate TIMESTAMP NOT NULL DEFAULT current_timestamp(0),
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
  reportDate TIMESTAMP NOT NULL DEFAULT current_timestamp(0),
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

-- inserts before triggers
INSERT INTO Member (username, email, password, name, birthDate, registrationDate, permissionType) VALUES
  ('system', 'system@system.com', '', 'system', TIMESTAMP '1984-02-24 16:30:56', TIMESTAMP '1984-02-24 16:30:56', 'system');

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
  registDate TIMESTAMP;
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
  postDate TIMESTAMP;
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
  postDate TIMESTAMP;
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


-- indexes
DROP INDEX IF EXISTS IndexPermissionType;

DROP INDEX IF EXISTS IndexPostAuthor;

DROP INDEX IF EXISTS IndexPostVersionPostID;

DROP INDEX IF EXISTS IndexQuestionCategoryID;

DROP INDEX IF EXISTS IndexReportPostID;

DROP INDEX IF EXISTS IndexClassificationQuestionID;

DROP INDEX IF EXISTS IndexClassificationTagID;

DROP INDEX IF EXISTS IndexAnswerQuestionID;

CREATE INDEX IndexPermissionType ON Member USING HASH (permissionType);

CREATE INDEX IndexPostAuthor ON Post USING HASH (postAuthorID);

CREATE INDEX IndexPostVersionPostID ON PostVersion USING HASH (postID);

CREATE INDEX IndexQuestionCategoryID ON Question USING HASH (categoryID);

CREATE INDEX IndexReportPostID ON Report USING HASH (postID);

CREATE INDEX IndexClassificationQuestionID ON Classification USING HASH (questionID);

CREATE INDEX IndexClassificationTagID ON Classification USING HASH (tagID);

CREATE INDEX IndexAnswerQuestionID ON Answer USING HASH (questionID);


-- materialized view post category - to attribute reports to moderators
DROP MATERIALIZED VIEW IF EXISTS PostCategory;

CREATE MATERIALIZED VIEW PostCategory AS
  SELECT
    postID,
    categoryID
  FROM (SELECT
          questionID AS postID,
          categoryID
        FROM Question) AS A
  UNION ALL
  (SELECT
     answerID AS postID,
     categoryID
   FROM Answer, Question
   WHERE Answer.questionID = Question.questionID);

DROP INDEX IF EXISTS IndexPostCategoryPostID;

DROP INDEX IF EXISTS IndexPostCategoryCategoryID;

CREATE INDEX IndexPostCategoryPostID ON PostCategory USING HASH (postID);

CREATE INDEX IndexPostCategoryCategoryID ON PostCategory USING HASH (categoryID);

CREATE OR REPLACE FUNCTION refreshPostCategory() RETURNS TRIGGER AS $$
BEGIN
  REFRESH MATERIALIZED VIEW PostCategory;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS materializedCategoryAnswer ON Answer;

CREATE TRIGGER MaterializedCategoryAnswer
AFTER INSERT OR UPDATE ON Answer
FOR EACH ROW
EXECUTE PROCEDURE refreshPostCategory();

DROP TRIGGER IF EXISTS materializedCategoryQuestion ON Question;

CREATE TRIGGER MaterializedCategoryQuestion
AFTER INSERT OR UPDATE ON Question
FOR EACH ROW
EXECUTE PROCEDURE refreshPostCategory();


-- Function to select members of a certain type
CREATE OR REPLACE FUNCTION userType(permiType permissionEnum, OUT memberID INTEGER, OUT username TEXT, OUT email TEXT, OUT permissionType permissionEnum)
  RETURNS SETOF RECORD AS $$
SELECT
  memberID,
  username,
  email,
  permissionType
FROM Member
WHERE permissionType = permiType;
$$ LANGUAGE SQL;


-- Full Text Search
DROP MATERIALIZED VIEW IF EXISTS FullTextPost;

CREATE MATERIALIZED VIEW FullTextPost AS
  SELECT
    postID,
    postTitle,
    postBody,
    postCategory,
    postTags,
    setweight(to_tsvector(coalesce(postCategory, '')), 'A') ||
    setweight(to_tsvector(coalesce(postTags, '')), 'B') ||
    setweight(to_tsvector(coalesce(postTitle, '')), 'C') ||
    setweight(to_tsvector(coalesce(postBody, '')), 'D') AS tsvPost
  FROM (SELECT
          A.postID,
          title AS postTitle,
          postBody,
          categoryName AS postCategory,
          string_agg(tagName, ' ') AS postTags
        FROM
          (SELECT DISTINCT ON (postID)
             postID,
             versionBody AS postBody
           FROM PostVersion
           ORDER BY postID, postVersionID DESC) AS A,
          (SELECT
             answerID AS postID,
             questionID
           FROM Answer
           UNION ALL
           SELECT
             questionID AS postID,
             questionID
           FROM Question) AS B, Question, Category,
          (SELECT
             Question.questionID,
             tagName
           FROM Question
             LEFT JOIN Classification ON Question.questionID = Classification.questionID
             LEFT JOIN Tag ON Classification.tagID = Tag.tagID) AS C
        WHERE A.postID = B.postID AND B.questionID = Question.questionID
              AND Question.categoryID = Category.categoryID AND Question.questionID = C.questionID
        GROUP BY A.postID, title, postBody, categoryName) AS D;

DROP INDEX IF EXISTS tsv_idxFullTextPost;

CREATE INDEX tsv_idxFullTextPost ON FullTextPost USING GIN(tsvPost);

CREATE OR REPLACE FUNCTION refreshFullTextPost() RETURNS TRIGGER AS $$
BEGIN
  REFRESH MATERIALIZED VIEW FullTextPost;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS materializedAnswer ON Answer;

CREATE TRIGGER MaterializedAnswer
AFTER INSERT OR UPDATE ON Answer
FOR EACH ROW
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedQuestion ON Question;

CREATE TRIGGER MaterializedQuestion
AFTER INSERT OR UPDATE ON Question
FOR EACH ROW
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedClassification ON Classification;

CREATE TRIGGER MaterializedClassification
AFTER INSERT OR UPDATE OR DELETE ON Classification
FOR EACH ROW
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedPostVersion ON PostVersion;

CREATE TRIGGER MaterializedPostVersion
AFTER INSERT OR UPDATE ON PostVersion
FOR EACH ROW
EXECUTE PROCEDURE refreshFullTextPost();
