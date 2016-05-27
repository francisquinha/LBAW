{include file='common/header.tpl'}

<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-7">


            <a style=" font-size:150%; padding:0; padding-bottom:4rem;" id="questiontitle">
                Users
            </a>

            <br>
            <br>
            <ul class="pagination" style="font-size: 80%; padding:0;margin:0;">
                <li class="active"><a data-toggle="tab" href="#ALL">ALL</a></li>
                <li><a data-toggle="tab" href="#A">A</a></li>
                <li><a data-toggle="tab" href="#B">B</a></li>
                <li><a data-toggle="tab" href="#C">C</a></li>
                <li><a data-toggle="tab" href="#D">D</a></li>
                <li><a data-toggle="tab" href="#E">E</a></li>
                <li><a data-toggle="tab" href="#F">F</a></li>
                <li><a data-toggle="tab" href="#G">G</a></li>
                <li><a data-toggle="tab" href="#H">H</a></li>
                <li><a data-toggle="tab" href="#I">I</a></li>
                <li><a data-toggle="tab" href="#J">J</a></li>
                <li><a data-toggle="tab" href="#K">K</a></li>
                <li><a data-toggle="tab" href="#L">L</a></li>
                <li><a data-toggle="tab" href="#M">M</a></li>
                <li><a data-toggle="tab" href="#N">N</a></li>
                <li><a data-toggle="tab" href="#O">O</a></li>
                <li><a data-toggle="tab" href="#P">P</a></li>
                <li><a data-toggle="tab" href="#Q">Q</a></li>
                <li><a data-toggle="tab" href="#R">R</a></li>
                <li><a data-toggle="tab" href="#S" style="margin-left: 45px;">S</a></li>
                <li><a data-toggle="tab" href="#T">T</a></li>
                <li><a data-toggle="tab" href="#U">U</a></li>
                <li><a data-toggle="tab" href="#V">V</a></li>
                <li><a data-toggle="tab" href="#W">W</a></li>
                <li><a data-toggle="tab" href="#X">X</a></li>
                <li><a data-toggle="tab" href="#Y">Y</a></li>
                <li><a data-toggle="tab" href="#Z">Z</a></li>
            </ul>


            <div class="tab-content">
                <div id="ALL" class="tab-pane fade in active">
                    <br>
                    <br>

                    {foreach $members as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a href="{$BASE_URL}pages/members/details.php?membersid={$members.memberid}">{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}

                </div>
                <div id="A" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersa as $member}
                        <ul class="userlist">

                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="B" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersb as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="C" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersc as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="D" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersd as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="E" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $memberse as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="F" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersf as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="G" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersg as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="H" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersh as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="I" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersi as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="J" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersj as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="K" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersk as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="L" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersl as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="M" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersm as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="N" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersn as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="O" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $memberso as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="P" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersp as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="Q" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersq as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="R" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersr as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="S" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $memberss as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="T" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $memberst as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="U" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersu as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="V" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersv as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="W" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersw as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="X" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersx as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="Y" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersy as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>
                <div id="Z" class="tab-pane fade">
                    <br>
                    <br>

                    {foreach $membersz as $member}
                        <ul class="userlist">
                            <img src="http://www.gravatar.com/avatar/{$member.emailhash}?s=80&d=retro">
                            <li class="userlistusername"><a>{$member.username}</a></li>
                            <li class="userlistmemberrating">{$member.memberrating}</li>
                        </ul>
                    {/foreach}
                </div>


            </div>
        </div>



