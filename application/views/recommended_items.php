<div class="recommended_items"><!--recommended_items-->
  <h2 class="title text-center">recommended items</h2>

  <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">

      <div class="item active">

        <?php
        foreach ($recInfo1->result() as $row) {

          echo 	"<div class='col-sm-4'>
          <div class='product-image-wrapper'>
          <div class='single-products'>
          <div class='productinfo text-center'>
          <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>
          <img src='". $row->image_url ."' alt='' />
          </a>
          <h2>$". $row->price ."</h2>
          <p>". $row->name ."</p>
          <form method='post' action='/CodeIgniter/index.php/store/addtocart'>

<input type='hidden' name='clothesid' value='". $row->clothes_id ."'>
<input type='hidden' name='quantity' value='1'>
<button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/addtocart' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Add to cart</button>

</form>
          </div>
          </div>
          </div>
          </div>";
        }
        ?>

      </div>

      <div class="item">

        <?php
        foreach ($recInfo2->result() as $row) {

          echo 	"<div class='col-sm-4'>
          <div class='product-image-wrapper'>
          <div class='single-products'>
          <div class='productinfo text-center'>
          <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>
          <img src='". $row->image_url ."' alt='' />
          </a>
          <h2>$". $row->price ."</h2>
          <p>". $row->name ."</p>
          <form method='post' action='/CodeIgniter/index.php/store/addtocart'>

<input type='hidden' name='clothesid' value='". $row->clothes_id ."'>
<input type='hidden' name='quantity' value='1'>
<button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/addtocart' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Add to cart</button>

</form>
          </div>
          </div>
          </div>
          </div>";

        }
        ?>

      </div>

    </div>

    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
      <i class="fa fa-angle-left"></i>
    </a>
    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
      <i class="fa fa-angle-right"></i>
    </a>

  </div>
</div><!--/recommended_items-->
