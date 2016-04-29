
-- full text select
SELECT *
FROM FullTextPost
WHERE tsvPost @@ to_tsquery('java');

-- questions from a certain category
SELECT DISTINCT ON (questionID)
  questionID,
  title,
  versionBody AS postBody,
  postCreationDate,
  views,
  answers,
  postRating
FROM Post, Question, PostVersion
WHERE Post.postID = PostVersion.postID AND Question.questionID = Post.postID AND Question.categoryID = 1
ORDER BY questionID, postVersionID DESC;

-- questions classified with a certain tag
SELECT DISTINCT ON (Question.questionID)
  Question.questionID,
  categoryName,
  title,
  versionBody AS postBody,
  postCreationDate,
  views,
  answers,
  postRating
FROM Post, Question, PostVersion, Category, Classification, Tag
WHERE Post.postID = PostVersion.postID AND Question.questionID = Post.postID
      AND Question.categoryID = Category.categoryid
      AND Question.questionID = Classification.questionid
      AND Classification.tagID = 10
ORDER BY Question.questionID, postVersionID DESC;

-- login query - password matching given username
SELECT username, password
FROM Member
WHERE username ='Matthew';

-- current post version
SELECT DISTINCT ON (Post.postID)
  Post.postID,
  postAuthorID,
  postCreationDate,
  versionDate,
  versionBody AS postBody
FROM Post, PostVersion
WHERE Post.postID = PostVersion.postID AND Post.postID = 724
ORDER BY postID, postVersionID DESC;

-- posts from member with id 27
SELECT *
FROM Post
WHERE postAuthorID = 27;

-- questions from member with id 27
SELECT Question.*
FROM Question, Post
WHERE Question.questionID = Post.postID AND postAuthorID = 27;

-- reports from a certain moderator
SELECT
  reportID,
  authorID,
  Report.postID,
  postAuthorID,
  reportBody,
  reportDate
FROM Report, Post, PostCategory, Responsibility
WHERE Report.postID = Post.postID
      AND Post.postID = PostCategory.postID
      AND Responsibility.categoryID = PostCategory.categoryID
      AND reportSolution IS NULL
      AND Responsibility.memberID = 8;

-- all question answers
SELECT DISTINCT ON (Question.questionID, answerID)
  Question.questionID,
  P1.postCreationDate AS questionDate,
  title AS questionTitle,
  V1.versionBody AS questionBody,
  P1.postAuthorID AS questionAuthorID,
  M1.name AS questionAuthorName,
  P1.postRating AS questionRating,
  views,
  answers,
  categoryName AS postCategory,
  string_agg(tagName, ' ') AS postTags,
  answerID,
  P2.postCreationDate AS answerDate,
  V2.versionBody AS answerBody,
  P2.postAuthorID AS answerAuthorID,
  M2.name AS answerAuthorName,
  P2.postRating AS answerRating
FROM Question
  INNER JOIN Post AS P1 ON Question.questionID = P1.postID
  INNER JOIN PostVersion AS V1 ON Question.questionID = V1.postID
  INNER JOIN Member AS M1 ON P1.postAuthorID = M1.memberID
  INNER JOIN Category ON Question.categoryID = Category.categoryID
  LEFT JOIN Classification ON Question.questionID = Classification.questionID
  LEFT JOIN Tag ON Classification.tagID = Tag.tagID
  INNER JOIN Answer ON Answer.questionID = Question.questionID
  INNER JOIN Post AS P2 ON Answer.answerID = P2.postID
  INNER JOIN PostVersion AS V2 ON P2.postID = V2.postID
  INNER JOIN Member AS M2 ON P2.postAuthorID = M2.memberID
WHERE Question.questionID = 152
GROUP BY Question.questionID, P1.postCreationDate, title, V1.postVersionID, V1.versionBody,
  P1.postAuthorID, M1.name, P1.postRating, views, answers, categoryName, answerID,
  P2.postCreationDate, V2.postVersionID, V2.versionBody, P2.postAuthorID, M2.name, P2.postRating
ORDER BY Question.questionID, Answerid, V1.postVersionID DESC, V2.postVersionID DESC;

-- all question info
SELECT
  Question.questionID AS postID,
  postAuthorID,
  M1.name AS postAuthorName,
  postCreationDate,
  postDeletionDate,
  deletorID,
  M2.name AS deletorName,
  title,
  postRating,
  views,
  answers,
  categoryName AS postCategory,
  string_agg(tagName, ' ') AS postTags,
  versionBody,
  versionAuthorID,
  M3.name AS versionAuthorName,
  versionDate
FROM Post
  INNER JOIN Member AS M1 ON Post.postauthorID = M1.memberID
  INNER JOIN Question ON Post.postID = Question.questionID
  INNER JOIN postVersion ON Post.postID = PostVersion.postID
  INNER JOIN Member AS M3 ON PostVersion.versionAuthorId = M3.memberID
  INNER JOIN Category ON Question.categoryID = Category.categoryid
  LEFT JOIN Classification ON Question.questionID = Classification.questionID
  LEFT JOIN Tag ON Classification.tagID = Tag.tagID
  LEFT JOIN Member AS M2 ON Post.deletorID = M2.memberID
WHERE Post.postID = 50
GROUP BY Question.questionID, postAuthorID, M1.name, postCreationDate, postDeletionDate,
  deletorID, M2.name, title, postRating, views, answers, categoryName, versionBody,
  versionAuthorID, M3.name, versionDate;

-- all answer info
SELECT
  Answer.answerID AS postID,
  postAuthorID,
  M1.name AS postAuthorName,
  postCreationDate,
  postDeletionDate,
  deletorID,
  M2.name AS deletorName,
  Answer.questionID,
  title AS questionTitle,
  postRating,
  views,
  categoryName AS postCategory,
  string_agg(tagName, ' ') AS postTags,
  versionBody,
  versionAuthorID,
  M3.name AS versionAuthorName,
  versionDate
FROM Post
  INNER JOIN Member AS M1 ON Post.postauthorID = M1.memberID
  INNER JOIN Answer ON Post.postID = Answer.answerID
  INNER JOIN Question ON Answer.questionID = Question.questionID
  INNER JOIN postVersion ON Post.postID = PostVersion.postID
  INNER JOIN Member AS M3 ON PostVersion.versionAuthorId = M3.memberID
  INNER JOIN Category ON Question.categoryID = Category.categoryid
  LEFT JOIN Classification ON Question.questionID = Classification.questionID
  LEFT JOIN Tag ON Classification.tagID = Tag.tagID
  LEFT JOIN Member AS M2 ON Post.deletorID = M2.memberID
WHERE Post.postID = 550
GROUP BY Answer.answerID, postAuthorID, M1.name, postCreationDate, postDeletionDate,
  deletorID, M2.name, title, postRating, views, answers, categoryName, versionBody,
  versionAuthorID, M3.name, versionDate;

-- all administrators
SELECT * FROM userType('administrator');

-- all moderators
SELECT * FROM userType('moderator');

-- all members
SELECT * FROM userType('member');

