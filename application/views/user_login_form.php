<section id="form">
  <div id='tab1'>
    <section id="cart_items">
      <div class="container">
        <div class="table-responsive cart_info">
              <div class="col-sm-4">
                <div class="login-form">
                  <h2>User Login</h2>
                  <form action="<?= "http://".$_SERVER['SERVER_NAME']."/CodeIgniter/index.php/user/login" ?>" method="post">
                    <input type="email" placeholder="Email Address" name="email" required />
                    <input type="password" placeholder="Password" name="password" required/>
                    <span><input type="checkbox" class="checkbox">Keep me signed in</span>
                    <button type="submit" class="btn btn-default">Login</button><br/>
                  </form>
                </div>
              </div>
        </div>
      </div>
    </section>
  </div>
