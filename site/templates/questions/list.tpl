{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-7">
            <h3 id="topquestion">{$subtitle}</h3>
            <ul class="nav nav-tabs right-side">
                <li class="active"><a id="tabname" data-toggle="tab" href="#recent" style={$style_tab1}><span
                                class={$class_tab1} style={$style_tab1}> </span>{$tab1}</a></li>
                <li><a id="tabname" data-toggle="tab" href="#hot" style={$style_tab1}><span
                                class={$class_tab2} style={$style_tab2}> </span>{$tab2}</a></li>
            </ul>

            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">

                    {foreach $questions as $question}
                        <div id="question">
                            <div id="questiontitlesquare">
                                <a id="questiontitle" href="{$BASE_URL}pages/questions/details.php?questionid={$question.questionid}">
                                    {$question.title}
                                </a>
                            </div>
                            <div id="questionusersquare"><a id="questionusers" href="#"
                                >{$question.name}</a>
                                <span id="timeago">asked {$question.timeago}</span></div>
                            <div id="questioncategorysquare"><a href="#">{$question.categoryname}</a>
                            </div>


                            <div id="questionbuttonsection">
                                <a href="#" class="btn btn-primary btn-sm btn-success"><span
                                            class="glyphicon glyphicon-thumbs-up"></span> {$question.postrating}</a>
                                <a href="#" class="btn btn-primary btn-sm btn-warning"><span
                                            class="fa fa-pencil"></span> {$question.answers}</a>
                                <a href="#" class="btn btn-sm btn-primary"><span
                                            class="glyphicon glyphicon-eye-open"></span> {$question.views}</a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a id="button_tag" style="display:inline-flex;"><span
                                                class="glyphicon glyphicon-tag"></span>{$tag}</a>
                                {/foreach}
                            </div>
                        </div>
                        <hr>
                    {/foreach}

                </div>
            </div>
        </div>


<!--        <script>last_question_id = {$last_question_id}</script>-->

        <!--<script src="{$base_url}javascript/tweets.js"></script>-->
