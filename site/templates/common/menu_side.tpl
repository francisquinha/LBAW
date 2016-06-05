<!-- Blog Sidebar Widgets Column -->
<div class="col-md-4">
    <!-- Blog Search Well -->


    <div class="well">
        <a id="questiontitle">Search</a>
        <form class="input-group" action="{$BASE_URL}pages/questions/list_search.php" method="get">
            <input type="text" name="search" class="form-control">
            <input type="hidden" name="page" value = 1>
            <span class="input-group-btn">
                <button class="btn btn-default" type="submit">
                    <span class="glyphicon glyphicon-search"></span>
                </button>
            </span>
        </form>
        <!-- /.input-group -->
    </div>

