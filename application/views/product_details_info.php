<div class="col-sm-4">
				<div class="product-information"><!--/product-information-->
								<img src="/CodeIgniter/images/product-details/new.jpg" class="newarrival"	alt=""/>
								<?php
												$count = 0;
												foreach ($productdetails->result() as $row) {
																echo "
																				<h2>". $row->name ."</h2>
																				<h5>Color: ". $row->color ."</h5>
																				<h5>Size: ". $row->size ."</h5>
																				<p>ID: ". $row->clothes_id ."</p>

																				<span>
																								<span>$". $row->price ."</span>

																								<label>Inventory:</label>
																								". $row->quantity ."<br/>

																								<form method='post' action='/CodeIgniter/index.php/store/addtocart'>
																												<input type='hidden' name='clothesid' value='". $row->clothes_id ."'>

																												<label>Quantity:</label>
																												<input type='number' name='quantity' value='1' max='" . $row->quantity . "' min='1'/>
																												<button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/addtocart' class='btn btn-default add-to-cart'>
																																<i class='fa fa-shopping-cart'></i>Add to cart
																												</button>
																								</form>
																				</span>
																				<p><b>Availability:</b>";

																if ($row->quantity > 0) echo " In Stock</p>";
																				else echo " Sold Out</p>";
																	  
																echo "<p><b>Condition:</b> New</p>";
																echo "<br/><br/><p>Other Colors:</p>";
												}

																				foreach ($productColor->result() as $row) {
																									echo"
																									<a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>
																										<img src='". $row->image_url ."' alt='". $row->color_id ." with ". $row->size_id ."'
																										style='width:60px!important;height:70px!important;'
																										/>
																									</a>
																					";
																				}
							 ?>
				</div><!--/product-information-->
</div>
</div><!--/product-details-->