<div class="category-tab"><!--category-tab-->
				<div class="col-sm-12">
				<h3 class="title text-left">Men</h3><!--Mens-->
								<ul class="nav nav-tabs">
												<li class="active"><a href="#mcj" data-toggle="tab">Coats & Jackets</a></li>
												<li><a href="#msweats" data-toggle="tab">Sweats</a></li>
												<li><a href="#mtee" data-toggle="tab">T-Shirts</a></li>
												<li><a href="#mshirts" data-toggle="tab">Shirts</a></li>
								</ul>
				</div>

				<div class="tab-content">
								<?php
												$menCatsIdArr = array("mcj", "msweats", "mtee", "mshirts");
												$menCatsDB = array($catMensCJInfo, $catMensSweatsInfo, $catMensTShirtsInfo, $catMensShirtsInfo);
												$womenCatsIdArr = array("wcj", "wsweats", "wtee", "wshirts");
												for ($i = 0; $i < sizeof($menCatsIdArr); $i++) {
																if ($i == 0) {
																				echo "<div class='tab-pane fade active in' id='" . $menCatsIdArr[$i] . "'>";
																} else if ($i > 0) {
																				echo "<div class='tab-pane fade' id='" . $menCatsIdArr[$i] . "'>";
																}

																foreach ($menCatsDB[$i]->result() as $row) {
																				echo "
																				<div class='tab-pane fade active in' id='" . $menCatsIdArr[$i] . "'>
																								<div class='col-sm-4'>
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
																								</div>
																				</div>
																";}
																if ($i >= 0) {
																				echo "</div>";
																}
													}
									?>
				</div>
</div>

<div class="category-tab"><!--category-tab-->
				<div class="col-sm-12">
				<h3 class="title text-left">Women</h3><!--Woens-->
								<ul class="nav nav-tabs">
												<li class="active"><a href="#wcj" data-toggle="tab">Coats & Jackets</a></li>
												<li><a href="#wsweats" data-toggle="tab">Sweats</a></li>
												<li><a href="#wtee" data-toggle="tab">T-Shirts</a></li>
												<li><a href="#wskirts" data-toggle="tab">Skirts</a></li>
								</ul>
				</div>

				<div class="tab-content">
								<?php
												$womenCatsDB = array($catWomensCJInfo, $catWomensSweatsInfo, $catWomensTShirtsInfo, $catWomensSkirtsInfo);
												$womenCatsIdArr = array("wcj", "wsweats", "wtee", "wskirts");
												for ($i = 0; $i < sizeof($womenCatsIdArr); $i++) {
																if ($i == 0) {
																				echo "<div class='tab-pane fade active in' id='" . $womenCatsIdArr[$i] . "'>";
																} else if ($i > 0) {
																				echo "<div class='tab-pane fade' id='" . $womenCatsIdArr[$i] . "'>";
																}

																foreach ($womenCatsDB[$i]->result() as $row) {
																				echo "
																				<div class='tab-pane fade active in' id='" . $womenCatsIdArr[$i] . "'>
																								<div class='col-sm-4'>
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
																								</div>
																				</div>
																";}
																if ($i >= 0) {
																				echo "</div>";
																}
													}
									?>
				</div>
</div>