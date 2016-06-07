<a href="#" class="btn btn-link btn-lg" role="button" data-toggle="modal" data-target="#login-modal" style="focus:blur;">Login</a>

</ul>
</div>
<!-- /.navbar-collapse -->
</div>
<!-- /.container -->
</nav>



<!-- BEGIN # MODAL LOGIN -->
<div class="modal fade" id="login-modal"  tabindex="-1" role="dialog" aria-hidden="true"
     style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content" style="background-color:#eee">
            <!-- Begin # DIV Form -->
            <div id="div-forms">
                <!-- Begin # Login Form -->
                <div class="col-sm-12 col-sm-offset-1 form-box">
                    <div class="form-bottom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#login" data-toggle="tab">Login</a></li>
                            <li><a href="#create" data-toggle="tab">Register</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <div class="tab-pane active in" id="login">
                                <fieldset>
                                    <form class="login-form">
                                        <div class="form-group">
                                            <label class="sr-only" for="form-username">Username</label>
                                            <input type="text" name="username" placeholder="Username..."
                                                   class="form-username form-control" id="form-username">
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="form-password">Password</label>
                                            <input type="password" name="password" placeholder="Password..."
                                                   class="form-password form-control" id="form-password">
                                        </div>
                                        <button id="buttonlog" type="submit"
                                                onclick="return validateLogin(this.form, this.form.username, this.form.password);"
                                                class="btn">Login!</button>

                                        <div class="col-sm-11 col-sm-offset-1 form-box">
                                            <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                                                <i class="fa fa-facebook"></i> Facebook
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                                <i class="fa fa-google-plus"></i> Google +
                                            </a>
                                            <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                                <i class="fa fa-twitter"></i> Twitter
                                            </a>
                                        </div>
                                        <div id='response-login'></div>
                                    </form>
                                </fieldset>
                            </div>
                            <div class="tab-pane fade" id="create">
                                <form class="register-form">
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Username</label>
                                        <input type="text" name="username" placeholder="Username..."
                                               class="form-username form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Email</label>
                                        <input type="text" name="email" placeholder="Email..."
                                               class="form-email form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Password</label>
                                        <input type="password" name="password" placeholder="Password..."
                                               class="form-password form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="sr-only" for="form-username">Last Name</label>
                                        <input type="text" name="name" placeholder="Name..."
                                               class="form-name form-control">
                                    </div>
                                    <button id="buttonreg" type="submit"
                                            onclick="return validateRegister(this.form, this.form.username, this.form.email, this.form.password, this.form.name);"
                                            class="btn">Register!
                                    </button>
                                    <div id='response-register'></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End # Login Form -->
            <!-- End # DIV Form -->
        </div>
    </div>
</div>
<!-- END # MODAL2 LOGIN -->
