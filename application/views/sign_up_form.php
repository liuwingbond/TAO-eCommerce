<div id='tab2'>
<section id="cart_items">
<div class="container">
<div class="table-responsive cart_info">
    <div class="col-sm-4">
      <div class="signup-form"><!--sign up form-->
        <h2>New User Signup!</h2>
        <form action="<?= "http://".$_SERVER['SERVER_NAME']."/CodeIgniter/index.php/user/register" ?>" method="post">
          <input type="email" placeholder="Email Address" name="email" required/>
          <input type="text" placeholder="Name" name="name" required/>
          <input type="password" placeholder="Password" name="password" required/>
          <button type="submit" class="btn btn-default" value="register">Signup</button><br/>
        </form>
      </div>
      <!--/sign up form--> 
    </div>
  </div>
</div>
</section>
<!--/form-->
</div>
</div>
</section>
</div>
</section>