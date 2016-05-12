{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-12">
            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">
                    {foreach $questions as $question}
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="qpagequestiontitle" href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                    {$question.title}
                                </a>
                            </div>
                            <div id="questionbodysquare">
                                {$question.versionbody}
                            </div>
                            <br>
                            <a href="#" class="btn-lg" style="color:#008CBA;"><span
                                        class="glyphicon glyphicon-thumbs-up"></span></a>
                            <a href="#" class="btn-lg" style="color:#c9302c;" ><span
                                        class="glyphicon glyphicon-thumbs-down"></span></a>
                            <br>
                            <div id="questionusersquare"><a id="questionusers" href="#">{$question.name}</a>
                                <span id="timeago">asked {$question.timeago}</span></div>
                            <div id="questioncategorysquare">
                                <a href="{$BASE_URL}pages/questions/list_category.php?categoryid={$question.categoryid}">
                                    {$question.categoryname}
                                </a>
                            </div>


                            <div id="questionbuttonsection" >
                                <a class="-success" ><span
                                            class="glyphicon glyphicon-thumbs-up"></span> {$question.postrating}</a>
                                <a class="-warning"><span
                                            class="fa fa-pencil"></span> {$question.answers}</a>
                                <a class="-primary"><span
                                            class="glyphicon glyphicon-eye-open"></span> {$question.views}</a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" href="{$BASE_URL}pages/questions/list_tag.php?tagid={$tag.tagid}" style="display:inline-flex;">
                                        <span class="glyphicon glyphicon-tag"></span>
                                        {$tag.tagname}
                                    </a>
                                {/foreach}
                            </div>
                        </div>
                        <br>
                        <hr>
                    {/foreach}

                    {foreach $answers as $answer}
                        <div id="answer">
                            <div id="answerbodysquare">
                                {$answer.versionbody}
                            </div>
                            <div id="answerusersquare">
                                <a id="answerusers" href="#">{$answer.name}</a>
                                <span id="timeago">answered {$answer.timeago}</span>
                            </div>
                            <div id="questionbuttonsection">
                                <a class="-success">
                                    <span class="glyphicon glyphicon-thumbs-up"></span>
                                    {$answer.postrating}
                                </a>
                            </div>
                        </div>
                        <br>
                        <hr>
                    {/foreach}

                        <div class="form-group">
                            <textarea id="message" class="form-control" rows="5" placeholder="Enter your message" required></textarea>
                        </div>
                        <button type="submit" id="form-submit" class="btn btn-success btn-lg pull-right ">Answer</button>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
</div>

        <script>last_question_id = {$last_question_id}</script>

        <!--<script src="{$base_url}javascript/tweets.js"></script>-->
