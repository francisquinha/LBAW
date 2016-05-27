{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <h2>User</h2>
            <br>
            {foreach $questions as $question}
                <div id="questionpq">
                    <div id="questiontitlesquare">
                        <a id="qpagequestiontitle"
                           href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                            {$question.title}
                        </a>
                    </div>
                    <div id="questionbodysquare" align="left">
                        {$question.versionbody}
                    </div>
                    <br>
                    <div id="questionusersquare"><a id="questionusers" href="#">{$question.name}</a>
                        <span id="timeago">asked {$question.timeago}</span></div>
                    <div id="questioncategorysquare">
                        <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                            {$question.categoryname}
                        </a>
                    </div>

                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> {$question.postrating}
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>

                    <div id="tagsofquestion">
                        {foreach $question.tagarray as $tag}
                            <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}"
                               style="display:inline-flex;">
                                <span class="glyphicon glyphicon-tag"></span>{$tag.tagname}
                            </a>
                        {/foreach}
                    </div>

                    <div id="questionbuttonsection">
                        <a>
                            <span class="fa fa-pencil"></span>
                            {$question.answers}
                        </a>
                        <a>
                            <span class="glyphicon glyphicon-eye-open"></span>
                            {$question.views}
                        </a>
                    </div>

                </div>

                <hr style="margin-top:0;">
            {/foreach}


            {foreach $bestanswers as $bestanswer}
                <div class="bestanswer">
                    <span class="glyphicon glyphicon-star" style="float:right;color:#4aaf51;"></span>
                    <div id="answerbodysquare" align="left">
                        {$bestanswer.versionbody}
                    </div>
                    <br>
                    <div id="answerusersquare">
                        <a id="answerusers" href="#">{$bestanswer.name}</a>
                        <span id="timeago">answered {$bestanswer.timeago}</span>
                    </div>
                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> {$bestanswer.postrating}
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>


                </div>
                <hr style="margin-top:0;">
            {/foreach}

            {foreach $answers as $answer}
                <div id="answer">
                    <div id="answerbodysquare" align="left">
                        {$answer.versionbody}
                    </div>
                    <br>

                    <div id="answerusersquare">
                        <a id="answerusers" href="#">{$answer.name}</a>
                        <span id="timeago">answered {$answer.timeago}</span>
                    </div>
                    <div id="questionvotesection">
                        <a href="#" class="btn-lg" style="color:black;"><span
                                    class="glyphicon glyphicon-thumbs-up"
                                    style="padding:0; margin:0;color:#4aaf51;"></span> {$answer.postrating}
                            <span
                                    class="glyphicon glyphicon-thumbs-down"
                                    style="padding:0; margin:0;color:#c9302c;"></span></a>
                    </div>

                </div>
                <hr>
            {/foreach}
               <!-- <textarea id="message" class="form-control" rows="5" placeholder="Enter your answer"
                                  required></textarea>-->
           <!-- <button type="submit" id="form-submit" class="btn btn-success btn-lg pull-right ">Answer<span class="glyphicon glyphicon-send"></span></button>
-->
            <div id="summernote"></div>
           </div>
<!--<script> last_question_id={$last_question_id} </script> -->

<!--<script src="{$base_url}javascript/tweets.js"></script>-->
