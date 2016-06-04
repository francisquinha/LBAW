SET SCHEMA 'public';

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
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshPostCategory();

DROP TRIGGER IF EXISTS materializedCategoryQuestion ON Question;

CREATE TRIGGER MaterializedCategoryQuestion
AFTER INSERT OR UPDATE ON Question
FOR EACH STATEMENT
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


-- Current Post Version
DROP MATERIALIZED VIEW IF EXISTS FullTextPost;

DROP MATERIALIZED VIEW IF EXISTS CurrentPostVersion;

CREATE MATERIALIZED VIEW CurrentPostVersion AS
  SELECT DISTINCT ON (postID)
    postID,
    postVersionID,
    versionBody
    FROM PostVersion
    ORDER BY postID, postVersionID DESC;


-- Full Text Search

CREATE MATERIALIZED VIEW FullTextPost AS
  SELECT
    postID,
    postTitle,
    postBody,
    postAnswers,
    postCategory,
    postTags,
    setweight(to_tsvector(coalesce(postCategory, '')), 'A') ||
    setweight(to_tsvector(coalesce(postTags, '')), 'B') ||
    setweight(to_tsvector(coalesce(postTitle, '')), 'C') ||
    setweight(to_tsvector(coalesce(postBody, '')), 'D') ||
    setweight(to_tsvector(coalesce(postAnswers, '')), 'D') AS tsvPost
  FROM (SELECT
          Question.questionid AS postID,
          title AS postTitle,
          versionBody AS postBody,
          string_agg(answerBody, ' ') AS postAnswers,
          categoryName AS postCategory,
          string_agg(tagName, ' ') AS postTags
        FROM CurrentPostVersion, Question, Category,
          (SELECT
             questionID,
             versionBody AS answerBody
           FROM Answer, CurrentPostVersion
           WHERE Answer.answerID = CurrentPostVersion.postID) AS A,
          (SELECT
             Question.questionID,
             tagName
           FROM Question
             LEFT JOIN Classification ON Question.questionID = Classification.questionID
             LEFT JOIN Tag ON Classification.tagID = Tag.tagID) AS B
        WHERE
          CurrentPostVersion.postID = Question.questionID
          AND Question.questionID = A.questionID
          AND Question.categoryID = Category.categoryID
          AND Question.questionID = B.questionID
        GROUP BY Question.questionid, title, versionBody, categoryName) AS C;

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
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedQuestion ON Question;

CREATE TRIGGER MaterializedQuestion
AFTER INSERT OR UPDATE ON Question
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedClassification ON Classification;

CREATE TRIGGER MaterializedClassification
AFTER INSERT OR UPDATE OR DELETE ON Classification
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshFullTextPost();

DROP TRIGGER IF EXISTS materializedPostVersion ON PostVersion;

CREATE TRIGGER MaterializedPostVersion
AFTER INSERT OR UPDATE ON PostVersion
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshFullTextPost();


-- Post Stats
DROP MATERIALIZED VIEW IF EXISTS QuestionStats;

CREATE MATERIALIZED VIEW QuestionStats AS
  SELECT
    max(views) AS maxViews,
    max(postRating) AS maxRating,
    max(answers) AS maxAnswers,
    min(post.postcreationdate) as minDate
  FROM Question, Post
  WHERE Question.questionid = Post.postid;

CREATE OR REPLACE FUNCTION refreshQuestionStats() RETURNS TRIGGER AS $$
BEGIN
  REFRESH MATERIALIZED VIEW QuestionStats;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS QuestionStatsPost ON Post;

CREATE TRIGGER QuestionStatsPost
AFTER INSERT OR UPDATE ON Post
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshQuestionStats();

DROP TRIGGER IF EXISTS QuestionStatsQuestion ON Question;

CREATE TRIGGER QuestionStatsQuestion
AFTER INSERT OR UPDATE ON Question
FOR EACH STATEMENT
EXECUTE PROCEDURE refreshQuestionStats();

