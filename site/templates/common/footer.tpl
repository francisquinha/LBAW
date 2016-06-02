
<!-- Footer -->
<footer class="footer-distributed" style="margin-bottom: 0;">

    <div class="footer-left">
        <a href="#">Question</a>
        <a href="#">Admin</a>
        <a href="#">Moderator</a>
        <a href="#">Member</a>
        <h2>OutOfBounds</h2>

        <p class="footer-links">
            <a href="{$BASE_URL}index.php">Home</a>
            ·
            <a href="{$BASE_URL}pages/about/about.php">About</a>
            ·
            <a href="#">Faq</a>
            ·
            <a href="{$BASE_URL}pages/contact/contact.php">Contact</a>
        </p>

        <p class="footer-company-name">OutOfBounds &copy; 2016</p>
    </div>

    <div class="footer-center">

        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>21 Revolution Street</span> Paris, France</p>
        </div>

        <div>
            <i class="fa fa-phone"></i>
            <p>+1 555 123456</p>
        </div>

        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="mailto:support@outofbounds.com">support@company.com</a></p>
        </div>

    </div>

    <div class="footer-right">

        <p class="footer-company-about">
            <span>About the company</span>
            Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
        </p>

        <div class="footer-icons">

            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>

        </div>

    </div>

</footer>
<!-- /.container -->
<!-- jQuery -->

<script src="{$BASE_URL}javascript/main.js"></script>

<script src="{$BASE_URL}javascript/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="{$BASE_URL}javascript/bootstrap.min.js"></script>
<!-- Validate Login JavaScript -->
<script src="{$BASE_URL}javascript/login.js"></script>
<script>
    $( document ).ready(function() {


        $('.tree-toggle').on('click', function(e) {
            $(this).parent().children('ul.tree').toggle(200);
            e.stopPropagation();
        });

        $(function(){
            $('.tree-toggle').parent().children('ul.tree').toggle(200);

        });

        $('.tree-toggle').click( function(){
            $(this).find('span').toggleClass('glyphicon-menu-right').toggleClass('glyphicon-menu-left');
        });
    });
</script>

<script src="{$BASE_URL}javascript/text_editor.js"></script>
<script src="{$BASE_URL}text_editor/dist/summernote.js"></script>
<script src="{$BASE_URL}codemirror/lib/codemirror.js"></script>

</body>
</html>