<!--LIMIT 3 items-->
<div class="col-sm-9 padding-right">
				<div class="features_items"><!--features_items-->
								<h2 class="title text-center">New Arrivals</h2>
								<?php
												echo "<!--";
												/*foreach ($featureInfo->result() as $row) {
																echo "
																<div class='col-md-4'>
																				<div class='product-image-wrapper'>
																								<div>
																												<div class='productinfo text-center'>
																																<!--img link have to be modified!!!-->
																																<a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>
																																				<img src='". $row->image_url ."' width='100px' alt='' />
																																</a>
																																<!--use sql statement to get the price and clothes info-->
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
																</div>
																";
												}*/
												echo "-->";
								?>
				</div>
<!--features_items-->