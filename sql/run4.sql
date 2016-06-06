SELECT insertquestion('Edit an incorrect commit message in Git', 'I wrote
the wrong thing in a commit message. How can I change the message?
The commit has not been pushed yet.', 10, '{2, 4, 6, 7}', 2);

SELECT insertanswer(1001, 'Amending the most recent commit message
git commit --amend will open your editor, allowing you to change the commit
message of the most recent commit. Additionally, you can set the commit message
directly in the command line with: git commit --amend -m "New commit message".
However, this can make multi-line commit messages or small corrections more
cumbersome to enter.', 3);

SELECT insertanswer(1001, 'git commit --amend -m "your new message"', 4);

SELECT insertanswer(1001, 'git rebase --interactive $parent_of_flawed_commit', 5);

SELECT insertanswer(1001, 'I prefer this way.
git commit --amend -c <commit ID>
Otherwise, there will be a new commit with a new commit ID', 6);

SELECT insertanswer(1001, 'If you are using the Git GUI tool, there is a button named amend last commit.
Click on that button and then it will display your last commit files and message. Just edit that message
and you can commit it with new commit message.', 7);

SELECT insertanswer(1001, 'In a word, NOPE! There is no GOOD way to retract something you have pushed.
All retractions are BAD to a greater or lesser degree. You need to adopt the discipline of working in a
branch in your own private repository, doing multiple commits as you add a bit, test a bit, tweak a bit.
Then merge your entire branch into a single commit, write a new commit message describing the overall change,
PROOFREAD it, and push.', 8);

SELECT insertanswer(1001, 'Wow, so there are a lot of ways to do this.', 9);

SELECT insertanswer(1001, 'Procedure:
Make sure you have committed or stashed all current changes
(i.e. so there are no files listed in the "File Status" tab - it won''t work otherwise).
In the "Log / History" tab, right click on the entry with an adjoining line in the graph
one below the commit(s) you wish to edit and select "Rebase children of <commit ref> interactively..."
Select the whole row for the commit message you wish to change (i.e. click on the "Message" column).
Click the "Edit Message" button.
Edit the message as desired in the dialog that comes up and click OK.
Repeat steps 3-4 if there are other messages to change.
Click OK - rebasing will commence - if all is well, the output will end "Completed successfully".', 10);

SELECT insertanswer(1001, 'On this question there are a lot of answers but none of them explains in super
detail how to change older commit messages using VIM. I was stuck trying to do this myself, so here I''ll
write down in detail how I did this especially for people who have no experience in VIM!', 11);

SELECT insertanswer(1001, 'Warning: force pushing your changes will overwrite the remote branch with your local one.
Make sure that you aren''t going to be overwriting anything that you want to keep. Also be cautious about force pushing
an amended (rewritten) commit if anyone else shares the branch with you, because they''ll need to rewrite their own
history if they have the old copy of the commit that you''ve just rewritten.', 12);

UPDATE question
SET bestanswerid = 1005, views = 126977
WHERE questionid = 1001;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1001, TRUE),
  (1837, 1001, FALSE),
  (893, 1001, FALSE),
  (351, 1001, TRUE),
  (523, 1001, TRUE),
  (1817, 1001, TRUE),
  (1226, 1001, TRUE),
  (296, 1001, FALSE),
  (595, 1001, TRUE),
  (850, 1001, TRUE),
  (633, 1001, TRUE),
  (1450, 1001, TRUE),
  (1564, 1001, TRUE),
  (256, 1001, TRUE),
  (1136, 1001, TRUE),
  (322, 1001, TRUE),
  (1502, 1001, TRUE),
  (788, 1001, TRUE),
  (655, 1001, TRUE),
  (440, 1001, TRUE),
  (1315, 1001, TRUE),
  (1998, 1001, TRUE),
  (1030, 1001, TRUE),
  (1199, 1002, TRUE),
  (533, 1002, FALSE),
  (1439, 1002, TRUE),
  (1749, 1003, FALSE),
  (93, 1003, TRUE),
  (1624, 1003, TRUE),
  (1621, 1004, TRUE),
  (1440, 1004, TRUE),
  (446, 1004, FALSE),
  (346, 1004, FALSE),
  (458, 1005, TRUE),
  (10, 1006, FALSE);

SELECT insertquestion('What are the differences between ''git pull'' and ''git fetch''?', 'What are the
differences between git pull and git fetch?', 5, '{23, 56, 10}', 13);

SELECT insertanswer(1012, 'In the simplest terms, git pull does a git fetch followed by a git merge.
You can do a git fetch at any time to update your remote-tracking branches under refs/remotes/<remote>/.
This operation never changes any of your own local branches under refs/heads, and is safe to do without
changing your working copy. I have even heard of people running git fetch periodically in a cron job in
the background (although I wouldn''t recommend doing this). A git pull is what you would do to bring a
local branch up-to-date with its remote version, while also updating your other remote-tracking branches.', 14);

SELECT insertanswer(1012, 'When you use pull, Git tries to automatically do your work for you. It is context
sensitive, so Git will merge any pulled commits into the branch you are currently working in.  pull
automatically merges the commits without letting you review them first. If you don’t closely manage
your branches, you may run into frequent conflicts.', 15);

SELECT insertanswer(1012, 'When you fetch, Git gathers any commits from the target branch that do not exist
in your current branch and stores them in your local repository. However, it does not merge them with your
current branch. This is particularly useful if you need to keep your repository up to date, but are working
on something that might break if you update your files. To integrate the commits into your master branch,
you use merge.', 16);

SELECT insertanswer(1012, 'It is important to contrast the design philosophy of git with the philosophy of a
more traditional source control tool like svn. Subversion was designed and built with a client/server model.
There is a single repository that is the server, and several clients can fetch code from the server, work on it,
then commit it back to the server. The assumption is that the client can always contact the server when it needs
to perform an operation.', 17);

SELECT insertanswer(1012, 'Git was designed to support a more distributed model with no need for a central
repository (though you can certainly use one if you like.) Also git was designed so that the client and the
"server" don''t need to be online at the same time. Git was designed so that people on an unreliable link
could exchange code via email, even. It is possible to work completely disconnected and burn a CD to exchange
code via git.', 18);

SELECT insertanswer(1012, 'In order to support this model git maintains a local repository with your code and
also an additional local repository that mirrors the state of the remote repository. By keeping a copy of the
remote repository locally, git can figure out the changes needed even when the remote repository is not reachable.
Later when you need to send the changes to someone else, git can transfer them as a set of changes from a point in
time known to the remote repository.', 19);

SELECT insertanswer(1012, 'The take away is to keep in mind that there are often at least three copies of a project
on your workstation. One copy is your own repository with your own commit history. The second copy is your working
copy where you are editing and building. The third copy is your local "cached" copy of a remote repository.', 20);

SELECT insertanswer(1012, 'One use case of git fetch is that the following will tell you any changes in the remote
branch since your last pull... so you can check before doing an actual pull, which could change files in your current
branch and working copy.', 21);

UPDATE question
SET bestanswerid = 1019, views = 153968
WHERE questionid = 1012;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1012, TRUE),
  (1837, 1012, FALSE),
  (893, 1012, FALSE),
  (351, 1012, TRUE),
  (523, 1012, TRUE),
  (1817, 1012, TRUE),
  (1226, 1012, TRUE),
  (296, 1012, FALSE),
  (595, 1012, TRUE),
  (850, 1012, TRUE),
  (633, 1012, TRUE),
  (1450, 1012, TRUE),
  (1564, 1012, TRUE),
  (256, 1012, TRUE),
  (1136, 1012, TRUE),
  (322, 1012, TRUE),
  (1502, 1012, TRUE),
  (788, 1012, TRUE),
  (655, 1012, TRUE),
  (440, 1012, TRUE),
  (1315, 1012, TRUE),
  (1998, 1012, TRUE),
  (1030, 1012, TRUE),
  (1199, 1013, TRUE),
  (533, 1013, FALSE),
  (1439, 1013, TRUE),
  (1749, 1014, FALSE),
  (93, 1014, TRUE),
  (1624, 1014, TRUE),
  (1621, 1015, TRUE),
  (1440, 1015, TRUE),
  (446, 1015, FALSE),
  (346, 1015, FALSE),
  (458, 1016, TRUE),
  (10, 1017, FALSE);

SELECT insertquestion('How can I make a page redirect using jQuery?', 'How
can I redirect the user from one page to another using jQuery?', 35, '{100, 56, 8}', 22);

SELECT insertanswer(1021, 'One does not simply redirect using jQuery', 23);

SELECT insertanswer(1021, 'jQuery is not necessary, and window.location.replace(...)
will best simulate an HTTP redirect.', 24);

SELECT insertanswer(1021, 'It is better than using window.location.href =, because replace()
does not keep the originating page in the session history, meaning the user won''t get stuck
in a never-ending back-button fiasco. If you want to simulate someone clicking on a link, use
location.href. If you want to simulate an HTTP redirect, use location.replace.', 25);

SELECT insertanswer(1021, 'WARNING: This answer has merely been provided as a possible solution;
it is obviously not the best solution, as it requires jQuery. Instead, prefer the pure JavaScript solution.', 26);

SELECT insertanswer(1021, 'The following section is for those using HTTP_REFERER as one of many secure measures
(although it isn''t a great protective measure). If you''re using Internet Explorer 8 or lower, these variables
get lost when using any form of JavaScript page redirection (location.href / etc)', 27);

SELECT insertanswer(1021, 'This works for every browser:
window.location.href = ''your_url'';', 28);

SELECT insertanswer(1021, 'It would help if you were a little more descriptive in what you are trying to do. If you
are trying to generate paged data, there are some options in how you do this. You can generate separate links for
each page that you want to be able to get directly to.', 29);

SELECT insertanswer(1021, 'If you want the paged data to be changed via AJAX, this is where jQuery would come in.
What you would do is add a click handler to each of the anchor tags corresponding to a different page. This click
handler would invoke some jQuery code that goes and fetches the next page via AJAX and updates the table with the
new data. The example below assumes that you have a web service that returns the new page data.', 30);

SELECT insertanswer(1021, 'I also think that location.replace(URL) is the best way, but if you want to notify the
search engines about your redirection (they don''t analyze JavaScript code to see the redirection) you should add
the rel="canonical" meta tag to your website.', 31);

UPDATE question
SET bestanswerid = 1028, views = 111108
WHERE questionid = 1021;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1021, TRUE),
  (1837, 1021, FALSE),
  (893, 1021, FALSE),
  (351, 1021, TRUE),
  (523, 1021, TRUE),
  (1817, 1021, TRUE),
  (1226, 1021, TRUE),
  (296, 1021, FALSE),
  (595, 1021, TRUE),
  (850, 1021, TRUE),
  (633, 1021, TRUE),
  (1450, 1021, TRUE),
  (1564, 1021, TRUE),
  (256, 1021, TRUE),
  (1136, 1021, TRUE),
  (322, 1021, TRUE),
  (1502, 1021, TRUE),
  (788, 1021, TRUE),
  (655, 1021, TRUE),
  (440, 1021, TRUE),
  (1315, 1021, TRUE),
  (1998, 1021, TRUE),
  (1030, 1021, TRUE),
  (1199, 1021, TRUE),
  (533, 1021, FALSE),
  (1439, 1021, TRUE),
  (1749, 1022, FALSE),
  (93, 1022, TRUE),
  (1624, 1022, TRUE),
  (1621, 1023, TRUE),
  (1440, 1023, TRUE),
  (446, 1024, FALSE),
  (346, 1025, FALSE),
  (458, 1026, TRUE),
  (10, 1027, FALSE);

SELECT insertquestion('What does the yield keyword do in Python?', 'What is
the use of the yield keyword in Python? What does it do?', 35, '{100, 56, 8}', 33);

SELECT insertanswer(1031, 'To understand what yield does, you must understand what generators are.
And before generators come iterables.', 34);

SELECT insertanswer(1031, 'The itertools module contains special functions to manipulate iterables.
Ever wish to duplicate a generator? Chain two generators? Group values in a nested list with a one
liner? Map / Zip without creating another list?', 35);

SELECT insertanswer(1031, 'This trick may give you an idea of the logic behind the function, but what
actually happens with yield is significantly different that what happens in the list based approach.
In many cases the yield approach will be a lot more memory efficient and faster too. In other cases
this trick will get you stuck in an infinite loop, even though the original function works just fine.
Read on to learn more...', 36);

SELECT insertanswer(1031, 'Usually you can write code that doesn''t use generators but implements the same
logic. One option is to use the temporary list ''trick'' I mentioned before. That will not work in all cases,
for e.g. if you have infinite loops, or it may make inefficient use of memory when you have a really long list.
The other approach is to implement a new iterable class SomethingIter that keeps state in instance members and
performs the next logical step in it''s next() (or __next__() in Python 3) method. Depending on the logic, the
code inside the next() method may end up looking very complex and be prone to bugs. Here generators provide a
clean and easy solution.', 37);

SELECT insertanswer(1031, 'I feel like I post a link to this presentation every day: David M. Beazly''s
Generator Tricks for Systems Programmers. If you''re a Python programmer and you''re not extremely familiar
with generators, you should read this. It''s a very clear explanation of what generators are, how they work,
what the yield statement does, and it answers the question "Do you really want to mess around with this
obscure language feature?" SPOILER ALERT. The answer is: Yes. Yes, you do.', 38);

SELECT insertanswer(1031, 'The idea for generators comes from other languages (see footnote 1) with varying
implementations. In Python''s Generators, the execution of the code is frozen at the point of the yield.
When the generator is called (methods are discussed below) execution resumes and then freezes at the next yield.', 39);

SELECT insertanswer(1031, 'The yield statement in python returns a generator. A generator in python is a function
that returns continuations (and specifically a type of coroutine, but continuations represent the more general
mechanism to understand what is going on).', 40);

SELECT insertanswer(1031, 'Continuations in programming languages theory are a much more fundamental kind of
computation, but they are not often used because they are extremely hard to reason about and also very difficult
to implement. But the idea of what a continuation is, is straightforward: it is the state of a computation that
has not yet finished. In this state are saved the current values of variables and the operations that have yet
to be performed, and so on. Then at some point later in the program the continuation can be invoked, such that
the program''s variables are reset to that state and the operations that were saved are carried out.', 41);

SELECT insertanswer(1031, 'While a lot of answers show why you''d use a yield to create a generator, there are more uses
for yield. It''s quite easy to make a coroutine, which enables the passing of information between two blocks of code.
I won''t repeat any of the fine examples that have already been given about using yield to create a generator.', 42);

SELECT insertanswer(1031, 'Also, note that yield can be used in coroutines as the dual of their use in generator
functions. Although it isn''t the same use as your code snippet, (yield) can be used as an expression in a function.
When a caller sends a value to the method using the send() method, then the coroutine will execute until the next
(yield) statement is encountered.', 43);

UPDATE question
SET bestanswerid = 1039, views = 122108
WHERE questionid = 1031;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1031, TRUE),
  (1837, 1031, FALSE),
  (893, 1031, FALSE),
  (351, 1031, TRUE),
  (523, 1031, TRUE),
  (1817, 1031, TRUE),
  (1226, 1031, TRUE),
  (296, 1031, FALSE),
  (595, 1031, TRUE),
  (850, 1031, TRUE),
  (633, 1031, TRUE),
  (1450, 1031, TRUE),
  (1564, 1031, TRUE),
  (256, 1031, TRUE),
  (1136, 1031, TRUE),
  (322, 1031, TRUE),
  (1502, 1031, TRUE),
  (788, 1031, TRUE),
  (655, 1031, TRUE),
  (440, 1031, TRUE),
  (1315, 1031, TRUE),
  (1998, 1031, TRUE),
  (1030, 1031, TRUE),
  (1199, 1031, TRUE),
  (533, 1031, FALSE),
  (1439, 1032, TRUE),
  (1749, 1032, FALSE),
  (933, 1032, TRUE),
  (1624, 1032, TRUE),
  (1621, 1033, TRUE),
  (1440, 1034, TRUE),
  (446, 1034, FALSE),
  (346, 1035, FALSE),
  (458, 1036, TRUE),
  (10, 1037, FALSE);

SELECT insertquestion('How can I make a page redirect using jQuery?', 'How
can I redirect the user from one page to another using jQuery?', 35, '{100, 56, 8}', 44);

SELECT insertanswer(1042, 'One does not simply redirect using jQuery', 45);

SELECT insertanswer(1042, 'jQuery is not necessary, and window.location.replace(...)
will best simulate an HTTP redirect.', 46);

SELECT insertanswer(1042, 'It is better than using window.location.href =, because replace()
does not keep the originating page in the session history, meaning the user won''t get stuck
in a never-ending back-button fiasco. If you want to simulate someone clicking on a link, use
location.href. If you want to simulate an HTTP redirect, use location.replace.', 47);

SELECT insertanswer(1042, 'WARNING: This answer has merely been provided as a possible solution;
it is obviously not the best solution, as it requires jQuery. Instead, prefer the pure JavaScript solution.', 48);

SELECT insertanswer(1042, 'The following section is for those using HTTP_REFERER as one of many secure measures
(although it isn''t a great protective measure). If you''re using Internet Explorer 8 or lower, these variables
get lost when using any form of JavaScript page redirection (location.href / etc)', 49);

SELECT insertanswer(1042, 'This works for every browser:
window.location.href = ''your_url'';', 50);

SELECT insertanswer(1042, 'It would help if you were a little more descriptive in what you are trying to do. If you
are trying to generate paged data, there are some options in how you do this. You can generate separate links for
each page that you want to be able to get directly to.', 51);

SELECT insertanswer(1042, 'If you want the paged data to be changed via AJAX, this is where jQuery would come in.
What you would do is add a click handler to each of the anchor tags corresponding to a different page. This click
handler would invoke some jQuery code that goes and fetches the next page via AJAX and updates the table with the
new data. The example below assumes that you have a web service that returns the new page data.', 52);

SELECT insertanswer(1042, 'I also think that location.replace(URL) is the best way, but if you want to notify the
search engines about your redirection (they don''t analyze JavaScript code to see the redirection) you should add
the rel="canonical" meta tag to your website.', 53);

SELECT insertanswer(1042, 'JavaScript provides you many methods to retrieve and change the current URL which is
displayed in browser''s address bar. All these methods uses the Location object, which is a property of the
Window object. You can create a new Location object that has the current URL as follows..', 54);

UPDATE question
SET bestanswerid = 1049, views = 123108
WHERE questionid = 1042;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1042, TRUE),
  (1837, 1042, FALSE),
  (893, 1042, FALSE),
  (351, 1042, TRUE),
  (523, 1042, TRUE),
  (1817, 1042, TRUE),
  (1226, 1042, TRUE),
  (296, 1042, FALSE),
  (595, 1042, TRUE),
  (850, 1042, TRUE),
  (633, 1042, TRUE),
  (1450, 1042, TRUE),
  (1564, 1042, TRUE),
  (256, 1042, TRUE),
  (1136, 1042, TRUE),
  (322, 1042, TRUE),
  (1502, 1042, TRUE),
  (788, 1042, TRUE),
  (655, 1042, TRUE),
  (440, 1042, TRUE),
  (1315, 1042, TRUE),
  (1998, 1042, TRUE),
  (1030, 1042, TRUE),
  (1199, 1042, TRUE),
  (533, 1043, FALSE),
  (1439, 1043, TRUE),
  (1749, 1043, FALSE),
  (933, 1043, TRUE),
  (1624, 1044, TRUE),
  (1621, 1044, TRUE),
  (1440, 1044, TRUE),
  (446, 1044, FALSE),
  (346, 1045, FALSE),
  (458, 1046, TRUE),
  (10, 1047, FALSE);

SELECT insertquestion('How can I make a page redirect using jQuery?', 'How
can I redirect the user from one page to another using jQuery?', 33, '{100, 56, 8}', 55);

SELECT insertanswer(1053, 'One does not simply redirect using jQuery', 56);

SELECT insertanswer(1053, 'jQuery is not necessary, and window.location.replace(...)
will best simulate an HTTP redirect.', 57);

SELECT insertanswer(1053, 'It is better than using window.location.href =, because replace()
does not keep the originating page in the session history, meaning the user won''t get stuck
in a never-ending back-button fiasco. If you want to simulate someone clicking on a link, use
location.href. If you want to simulate an HTTP redirect, use location.replace.', 58);

SELECT insertanswer(1053, 'WARNING: This answer has merely been provided as a possible solution;
it is obviously not the best solution, as it requires jQuery. Instead, prefer the pure JavaScript solution.', 59);

SELECT insertanswer(1053, 'The following section is for those using HTTP_REFERER as one of many secure measures
(although it isn''t a great protective measure). If you''re using Internet Explorer 8 or lower, these variables
get lost when using any form of JavaScript page redirection (location.href / etc)', 60);

SELECT insertanswer(1053, 'This works for every browser:
window.location.href = ''your_url'';', 61);

SELECT insertanswer(1053, 'It would help if you were a little more descriptive in what you are trying to do. If you
are trying to generate paged data, there are some options in how you do this. You can generate separate links for
each page that you want to be able to get directly to.', 62);

SELECT insertanswer(1053, 'If you want the paged data to be changed via AJAX, this is where jQuery would come in.
What you would do is add a click handler to each of the anchor tags corresponding to a different page. This click
handler would invoke some jQuery code that goes and fetches the next page via AJAX and updates the table with the
new data. The example below assumes that you have a web service that returns the new page data.', 63);

SELECT insertanswer(1053, 'I also think that location.replace(URL) is the best way, but if you want to notify the
search engines about your redirection (they don''t analyze JavaScript code to see the redirection) you should add
the rel="canonical" meta tag to your website.', 64);

SELECT insertanswer(1053, 'JavaScript provides you many methods to retrieve and change the current URL which is
displayed in browser''s address bar. All these methods uses the Location object, which is a property of the
Window object. You can create a new Location object that has the current URL as follows..', 65);

UPDATE question
SET bestanswerid = 1063, views = 231232
WHERE questionid = 1053;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1053, TRUE),
  (1837, 1053, FALSE),
  (893, 1053, FALSE),
  (351, 1053, TRUE),
  (523, 1053, TRUE),
  (1817, 1053, TRUE),
  (1226, 1053, TRUE),
  (296, 1053, FALSE),
  (595, 1053, TRUE),
  (850, 1053, TRUE),
  (633, 1053, TRUE),
  (1450, 1053, TRUE),
  (1564, 1053, TRUE),
  (256, 1053, TRUE),
  (1136, 1053, TRUE),
  (322, 1054, TRUE),
  (1502, 1054, TRUE),
  (788, 1054, TRUE),
  (655, 1054, TRUE),
  (440, 1054, TRUE),
  (1315, 1055, TRUE),
  (1998, 1055, TRUE),
  (1030, 1056, TRUE),
  (1199, 1056, TRUE),
  (533, 1056, FALSE),
  (1439, 1057, TRUE),
  (1749, 1058, FALSE),
  (933, 1058, TRUE),
  (1624, 1058, TRUE),
  (1621, 1058, TRUE),
  (1440, 1058, TRUE),
  (446, 1058, FALSE),
  (346, 1059, FALSE),
  (458, 1059, TRUE),
  (10, 1060, FALSE);

SELECT insertquestion('Edit an incorrect commit message in Git', 'I wrote
the wrong thing in a commit message. How can I change the message?
The commit has not been pushed yet.', 10, '{2, 4, 6, 7}', 66);

SELECT insertanswer(1064, 'Amending the most recent commit message
git commit --amend will open your editor, allowing you to change the commit
message of the most recent commit. Additionally, you can set the commit message
directly in the command line with: git commit --amend -m "New commit message".
However, this can make multi-line commit messages or small corrections more
cumbersome to enter.', 3);

SELECT insertanswer(1064, 'git commit --amend -m "your new message"', 67);

SELECT insertanswer(1064, 'git rebase --interactive $parent_of_flawed_commit', 68);

SELECT insertanswer(1064, 'I prefer this way.
git commit --amend -c <commit ID>
Otherwise, there will be a new commit with a new commit ID', 69);

SELECT insertanswer(1064, 'If you are using the Git GUI tool, there is a button named amend last commit.
Click on that button and then it will display your last commit files and message. Just edit that message
and you can commit it with new commit message.', 70);

SELECT insertanswer(1064, 'In a word, NOPE! There is no GOOD way to retract something you have pushed.
All retractions are BAD to a greater or lesser degree. You need to adopt the discipline of working in a
branch in your own private repository, doing multiple commits as you add a bit, test a bit, tweak a bit.
Then merge your entire branch into a single commit, write a new commit message describing the overall change,
PROOFREAD it, and push.', 71);

SELECT insertanswer(1064, 'Wow, so there are a lot of ways to do this.', 72);

SELECT insertanswer(1064, 'Procedure:
Make sure you have committed or stashed all current changes
(i.e. so there are no files listed in the "File Status" tab - it won''t work otherwise).
In the "Log / History" tab, right click on the entry with an adjoining line in the graph
one below the commit(s) you wish to edit and select "Rebase children of <commit ref> interactively..."
Select the whole row for the commit message you wish to change (i.e. click on the "Message" column).
Click the "Edit Message" button.
Edit the message as desired in the dialog that comes up and click OK.
Repeat steps 3-4 if there are other messages to change.
Click OK - rebasing will commence - if all is well, the output will end "Completed successfully".', 73);

SELECT insertanswer(1064, 'On this question there are a lot of answers but none of them explains in super
detail how to change older commit messages using VIM. I was stuck trying to do this myself, so here I''ll
write down in detail how I did this especially for people who have no experience in VIM!', 74);

SELECT insertanswer(1064, 'Warning: force pushing your changes will overwrite the remote branch with your local one.
Make sure that you aren''t going to be overwriting anything that you want to keep. Also be cautious about force pushing
an amended (rewritten) commit if anyone else shares the branch with you, because they''ll need to rewrite their own
history if they have the old copy of the commit that you''ve just rewritten.', 75);

SELECT insertanswer(1064, 'Warning: force pushing your changes will overwrite the remote branch with your local one.
Make sure that you aren''t going to be overwriting anything that you want to keep. Also be cautious about force pushing
an amended (rewritten) commit if anyone else shares the branch with you, because they''ll need to rewrite their own
history if they have the old copy of the commit that you''ve just rewritten.', 75);

UPDATE question
SET bestanswerid = 1069, views = 106977
WHERE questionid = 1064;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1064, TRUE),
  (1837, 1064, FALSE),
  (893, 1064, FALSE),
  (351, 1064, TRUE),
  (523, 1064, TRUE),
  (1817, 1064, TRUE),
  (1226, 1064, TRUE),
  (296, 1064, FALSE),
  (595, 1064, TRUE),
  (850, 1064, TRUE),
  (633, 1064, TRUE),
  (1450, 1064, TRUE),
  (1564, 1064, TRUE),
  (256, 1064, TRUE),
  (1136, 1064, TRUE),
  (322, 1064, TRUE),
  (1502, 1064, TRUE),
  (788, 1064, TRUE),
  (655, 1064, TRUE),
  (440, 1064, TRUE),
  (1315, 1064, TRUE),
  (1998, 1064, TRUE),
  (1030, 1064, TRUE),
  (1199, 1064, TRUE),
  (533, 1064, FALSE),
  (1439, 1064, TRUE),
  (1749, 1067, FALSE),
  (93, 1067, TRUE),
  (1624, 1067, TRUE),
  (1621, 1067, TRUE),
  (1440, 1067, TRUE),
  (446, 1067, FALSE),
  (346, 1067, FALSE),
  (458, 1067, TRUE),
  (10, 1069, FALSE);

SELECT insertquestion('What are the differences between ''git pull'' and ''git fetch''?', 'What are the
differences between git pull and git fetch?', 5, '{23, 56, 10}', 76);

SELECT insertanswer(1076, 'In the simplest terms, git pull does a git fetch followed by a git merge.
You can do a git fetch at any time to update your remote-tracking branches under refs/remotes/<remote>/.
This operation never changes any of your own local branches under refs/heads, and is safe to do without
changing your working copy. I have even heard of people running git fetch periodically in a cron job in
the background (although I wouldn''t recommend doing this). A git pull is what you would do to bring a
local branch up-to-date with its remote version, while also updating your other remote-tracking branches.', 77);

SELECT insertanswer(1076, 'When you use pull, Git tries to automatically do your work for you. It is context
sensitive, so Git will merge any pulled commits into the branch you are currently working in.  pull
automatically merges the commits without letting you review them first. If you don’t closely manage
your branches, you may run into frequent conflicts.', 78);

SELECT insertanswer(1076, 'When you fetch, Git gathers any commits from the target branch that do not exist
in your current branch and stores them in your local repository. However, it does not merge them with your
current branch. This is particularly useful if you need to keep your repository up to date, but are working
on something that might break if you update your files. To integrate the commits into your master branch,
you use merge.', 79);

SELECT insertanswer(1076, 'It is important to contrast the design philosophy of git with the philosophy of a
more traditional source control tool like svn. Subversion was designed and built with a client/server model.
There is a single repository that is the server, and several clients can fetch code from the server, work on it,
then commit it back to the server. The assumption is that the client can always contact the server when it needs
to perform an operation.', 80);

SELECT insertanswer(1076, 'Git was designed to support a more distributed model with no need for a central
repository (though you can certainly use one if you like.) Also git was designed so that the client and the
"server" don''t need to be online at the same time. Git was designed so that people on an unreliable link
could exchange code via email, even. It is possible to work completely disconnected and burn a CD to exchange
code via git.', 81);

SELECT insertanswer(1076, 'In order to support this model git maintains a local repository with your code and
also an additional local repository that mirrors the state of the remote repository. By keeping a copy of the
remote repository locally, git can figure out the changes needed even when the remote repository is not reachable.
Later when you need to send the changes to someone else, git can transfer them as a set of changes from a point in
time known to the remote repository.', 82);

SELECT insertanswer(1076, 'The take away is to keep in mind that there are often at least three copies of a project
on your workstation. One copy is your own repository with your own commit history. The second copy is your working
copy where you are editing and building. The third copy is your local "cached" copy of a remote repository.', 83);

SELECT insertanswer(1076, 'One use case of git fetch is that the following will tell you any changes in the remote
branch since your last pull... so you can check before doing an actual pull, which could change files in your current
branch and working copy.', 84);

UPDATE question
SET bestanswerid = 1084, views = 123968
WHERE questionid = 1076;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1076, TRUE),
  (1837, 1076, FALSE),
  (893, 1076, FALSE),
  (351, 1076, TRUE),
  (523, 1076, TRUE),
  (1817, 1076, TRUE),
  (1226, 1076, TRUE),
  (296, 1076, FALSE),
  (595, 1076, TRUE),
  (850, 1076, TRUE),
  (633, 1076, TRUE),
  (1450, 1076, TRUE),
  (1564, 1076, TRUE),
  (256, 1076, TRUE),
  (1136, 1076, TRUE),
  (322, 1076, TRUE),
  (1502, 1076, TRUE),
  (788, 1076, TRUE),
  (655, 1076, TRUE),
  (440, 1079, TRUE),
  (1315, 1079, TRUE),
  (1998, 1079, TRUE),
  (1030, 1079, TRUE),
  (1199, 1079, TRUE),
  (533, 1079, FALSE),
  (1439, 1079, TRUE),
  (1749, 1079, FALSE),
  (93, 1082, TRUE),
  (1624, 1082, TRUE),
  (1621, 1082, TRUE),
  (1440, 1082, TRUE),
  (446, 1082, FALSE),
  (346, 1082, FALSE),
  (458, 1082, TRUE),
  (10, 1082, FALSE);

SELECT insertquestion('How can I make a page redirect using jQuery?', 'How
can I redirect the user from one page to another using jQuery?', 35, '{100, 56, 8}', 22);

SELECT insertanswer(1085, 'One does not simply redirect using jQuery', 23);

SELECT insertanswer(1085, 'jQuery is not necessary, and window.location.replace(...)
will best simulate an HTTP redirect.', 24);

SELECT insertanswer(1085, 'It is better than using window.location.href =, because replace()
does not keep the originating page in the session history, meaning the user won''t get stuck
in a never-ending back-button fiasco. If you want to simulate someone clicking on a link, use
location.href. If you want to simulate an HTTP redirect, use location.replace.', 25);

SELECT insertanswer(1085, 'WARNING: This answer has merely been provided as a possible solution;
it is obviously not the best solution, as it requires jQuery. Instead, prefer the pure JavaScript solution.', 26);

SELECT insertanswer(1085, 'The following section is for those using HTTP_REFERER as one of many secure measures
(although it isn''t a great protective measure). If you''re using Internet Explorer 8 or lower, these variables
get lost when using any form of JavaScript page redirection (location.href / etc)', 27);

SELECT insertanswer(1085, 'This works for every browser:
window.location.href = ''your_url'';', 28);

SELECT insertanswer(1085, 'It would help if you were a little more descriptive in what you are trying to do. If you
are trying to generate paged data, there are some options in how you do this. You can generate separate links for
each page that you want to be able to get directly to.', 29);

SELECT insertanswer(1085, 'If you want the paged data to be changed via AJAX, this is where jQuery would come in.
What you would do is add a click handler to each of the anchor tags corresponding to a different page. This click
handler would invoke some jQuery code that goes and fetches the next page via AJAX and updates the table with the
new data. The example below assumes that you have a web service that returns the new page data.', 30);

SELECT insertanswer(1085, 'I also think that location.replace(URL) is the best way, but if you want to notify the
search engines about your redirection (they don''t analyze JavaScript code to see the redirection) you should add
the rel="canonical" meta tag to your website.', 31);

SELECT insertanswer(1085, 'JavaScript provides you many methods to retrieve and change the current URL which is
displayed in browser''s address bar. All these methods uses the Location object, which is a property of the
Window object. You can create a new Location object that has the current URL as follows..', 32);

UPDATE question
SET bestanswerid = 1089, views = 151108
WHERE questionid = 1105;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1085, TRUE),
  (1837, 1085, FALSE),
  (893, 1085, FALSE),
  (351, 1085, TRUE),
  (523, 1085, TRUE),
  (1817, 1085, TRUE),
  (1226, 1085, TRUE),
  (296, 1085, FALSE),
  (595, 1085, TRUE),
  (850, 1085, TRUE),
  (633, 1085, TRUE),
  (1450, 1085, TRUE),
  (1564, 1085, TRUE),
  (256, 1085, TRUE),
  (1136, 1085, TRUE),
  (322, 1085, TRUE),
  (1502, 1093, TRUE),
  (788, 1093, TRUE),
  (655, 1093, TRUE),
  (440, 1093, TRUE),
  (1315, 1093, TRUE),
  (1998, 1093, TRUE),
  (1030, 1093, TRUE),
  (1199, 1093, TRUE),
  (533, 1094, FALSE),
  (1439, 1094, TRUE),
  (1749, 1094, FALSE),
  (93, 1094, TRUE),
  (1624, 1094, TRUE),
  (1621, 1094, TRUE),
  (1440, 1094, TRUE),
  (446, 1094, FALSE),
  (346, 1094, FALSE),
  (458, 1094, TRUE),
  (10, 1094, FALSE);

SELECT insertquestion('What does the yield keyword do in Python?', 'What is
the use of the yield keyword in Python? What does it do?', 35, '{100, 56, 8}', 33);

SELECT insertanswer(1096, 'To understand what yield does, you must understand what generators are.
And before generators come iterables.', 34);

SELECT insertanswer(1096, 'The itertools module contains special functions to manipulate iterables.
Ever wish to duplicate a generator? Chain two generators? Group values in a nested list with a one
liner? Map / Zip without creating another list?', 35);

SELECT insertanswer(1096, 'This trick may give you an idea of the logic behind the function, but what
actually happens with yield is significantly different that what happens in the list based approach.
In many cases the yield approach will be a lot more memory efficient and faster too. In other cases
this trick will get you stuck in an infinite loop, even though the original function works just fine.
Read on to learn more...', 36);

SELECT insertanswer(1096, 'Usually you can write code that doesn''t use generators but implements the same
logic. One option is to use the temporary list ''trick'' I mentioned before. That will not work in all cases,
for e.g. if you have infinite loops, or it may make inefficient use of memory when you have a really long list.
The other approach is to implement a new iterable class SomethingIter that keeps state in instance members and
performs the next logical step in it''s next() (or __next__() in Python 3) method. Depending on the logic, the
code inside the next() method may end up looking very complex and be prone to bugs. Here generators provide a
clean and easy solution.', 37);

SELECT insertanswer(1096, 'I feel like I post a link to this presentation every day: David M. Beazly''s
Generator Tricks for Systems Programmers. If you''re a Python programmer and you''re not extremely familiar
with generators, you should read this. It''s a very clear explanation of what generators are, how they work,
what the yield statement does, and it answers the question "Do you really want to mess around with this
obscure language feature?" SPOILER ALERT. The answer is: Yes. Yes, you do.', 38);

SELECT insertanswer(1096, 'The idea for generators comes from other languages (see footnote 1) with varying
implementations. In Python''s Generators, the execution of the code is frozen at the point of the yield.
When the generator is called (methods are discussed below) execution resumes and then freezes at the next yield.', 39);

SELECT insertanswer(1096, 'The yield statement in python returns a generator. A generator in python is a function
that returns continuations (and specifically a type of coroutine, but continuations represent the more general
mechanism to understand what is going on).', 40);

SELECT insertanswer(1096, 'Continuations in programming languages theory are a much more fundamental kind of
computation, but they are not often used because they are extremely hard to reason about and also very difficult
to implement. But the idea of what a continuation is, is straightforward: it is the state of a computation that
has not yet finished. In this state are saved the current values of variables and the operations that have yet
to be performed, and so on. Then at some point later in the program the continuation can be invoked, such that
the program''s variables are reset to that state and the operations that were saved are carried out.', 41);

SELECT insertanswer(1096, 'While a lot of answers show why you''d use a yield to create a generator, there are more uses
for yield. It''s quite easy to make a coroutine, which enables the passing of information between two blocks of code.
I won''t repeat any of the fine examples that have already been given about using yield to create a generator.', 42);

SELECT insertanswer(1096, 'Also, note that yield can be used in coroutines as the dual of their use in generator
functions. Although it isn''t the same use as your code snippet, (yield) can be used as an expression in a function.
When a caller sends a value to the method using the send() method, then the coroutine will execute until the next
(yield) statement is encountered.', 43);

UPDATE question
SET bestanswerid = 1102, views = 112108
WHERE questionid = 1096;

INSERT INTO Vote (voterID, postID, up) VALUES
  (742, 1096, TRUE),
  (1837, 1096, FALSE),
  (893, 1096, FALSE),
  (351, 1096, TRUE),
  (523, 1096, TRUE),
  (1817, 1096, TRUE),
  (1226, 1096, TRUE),
  (296, 1096, FALSE),
  (595, 1096, TRUE),
  (850, 1096, TRUE),
  (633, 1096, TRUE),
  (1450, 1096, TRUE),
  (1564, 1096, TRUE),
  (256, 1096, TRUE),
  (1136, 1096, TRUE),
  (322, 1096, TRUE),
  (1502, 1096, TRUE),
  (788, 1096, TRUE),
  (655, 1096, TRUE),
  (440, 1096, TRUE),
  (1315, 1096, TRUE),
  (1998, 1096, TRUE),
  (1030, 1096, TRUE),
  (1199, 1096, TRUE),
  (533, 1098, FALSE),
  (1439, 1098, TRUE),
  (1749, 1098, FALSE),
  (933, 1098, TRUE),
  (1624, 1098, TRUE),
  (1621, 1098, TRUE),
  (1440, 1098, TRUE),
  (446, 1098, FALSE),
  (346, 1098, FALSE),
  (458, 1100, TRUE),
  (10, 1100, FALSE);
