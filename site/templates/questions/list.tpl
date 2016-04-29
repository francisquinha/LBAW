{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <!-- Blog Entries Column -->
        <div class="col-md-8">
            <h3 id="topquestion">Search Results</h3>
            <ul class="nav nav-tabs right-side">
            </ul>

            <div class="tab-content">
                <div id="recent" class=" tab-pane fade in active">

                    {foreach $questions as $question}
                        <div id="question">
                            <table class="question-table" style="width:100%;">
                                <tr style="padding:1rem;">
                                    <td style="width:100%; align:center;padding:1rem;"><a href="#"
                                                                                          style="font-weight: 900; align:center;font-family: 'QuanticoRegular'; padding-left:1rem; padding-right:1rem; ">{$question.title}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="padding:1rem; max-width: 100px;"><a href="#"
                                                                  style=" font-weight: 900;font-size:80%;  float:left; color:#00529B;">{$question.name}</a>
                                        <p style="padding-left:1rem; font-size:60%; float:left;">
                                            asked {$question.timeago}</p></td>
                                    <td style="min-width:200px; padding-left:1rem; padding-right:1rem; align:right;"><a
                                                href="#"
                                                style=" font-weight: 400;font-size:70%; color: #9F6000;">{$question.categoryname}</a>
                                    </td>
                                </tr>
                            </table>

                            <div id="questionbuttonsection" style="padding-bottom: 0;">
                                <a href="#" class="btn btn-primary btn-sm btn-success"><span
                                            class="glyphicon glyphicon-thumbs-up"></span> {$question.postrating}</a>
                                <a href="#" class="btn btn-primary btn-sm btn-warning"><span
                                            class="fa fa-pencil"></span> {$question.answers}</a>
                                <a href="#" class="btn btn-sm btn-primary"><span
                                            class="glyphicon glyphicon-eye-open"></span> {$question.views}</a>
                            </div>
                            <div id="tagsofquestion">
                                {foreach $question.tagarray as $tag}
                                    <a class="Taag btn btn-danger" role="button"><span
                                                class="glyphicon glyphicon-tag"></span>{$tag}</a>
                                {/foreach}
                            </div>
                        </div>
                        <hr>
                    {/foreach}
                </div>
            </div>
        </div>


        <script>last_question_id = {$last_question_id}</script>

        <!--<script src="{$BASE_URL}javascript/tweets.js"></script>-->
        {include file='right-side/right-side.tpl'}
        {include file='common/footer.tpl'}
