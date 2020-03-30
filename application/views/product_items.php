<div class="col-sm-9 padding-right">
    <div class="features_items"><!--features_items-->
        <h2 class="title text-center">
            <?php 
                if ($this->uri->segment(3) != 'all') {
                    echo $productInfo->row()->gender_name . " - " . $productInfo->row()->type;
                } else 
                    echo "All Products";
            ?>
        </h2>
        <?php
            $count = 0;
            foreach ($productInfo->result() as $row) {
                if ($count % 3 == 0) echo "<div class='row'>";
                echo "
                <div class='col-md-4'>
                    <div class='product-image-wrapper'>
                        <div>
                            <div class='productinfo text-center'>
                                <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>
                                <!--img link have to be modified!!!-->
                                <img src='". $row->image_url ."' alt='' /></a>
                                <!--use sql statement to get the price and clothes info-->
                                <h2>$". $row->price ."</h2>
                                <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'><p>". $row->name ."</p></a>
                                <form method='post' action='/CodeIgniter/index.php/store/addtocart'>
                                    <input type='hidden' name='clothesid' value='". $row->clothes_id ."'>
                                    <input type='hidden' name='quantity' value='1'>
                                    <button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/addtocart' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Add to cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                ";
                if ($count % 3 == 2) echo "</div>";
				$count++;
            }
        ?>
    </div><!--features_items-->