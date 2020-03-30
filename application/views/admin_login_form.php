<section id="form">
    <div id='tab3'>
        <section id="cart_items">
            <div class="container">
                <div class="table-responsive cart_info">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-4 col-sm-offset-1">
                                <div class="login-form">
                                    <h2>Admin Login</h2>

                                    <form
                                        action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/loginAsAdmin" ?>"
                                        method="post">
                                        <input type="email" placeholder="Email Address" name="email"/>
                                        <input type="password" placeholder="Password" name="password"/>
                                        <span><input type="checkbox" class="checkbox">Keep me signed in</span>
                                        <button type="submit" class="btn btn-default">Login</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
