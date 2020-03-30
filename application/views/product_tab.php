<div class="category-tab shop-details-tab"><!--category-tab-->
	<div class="col-sm-12">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#details" data-toggle="tab">Clothes Details</a></li>
			<li><a href="#reviews" data-toggle="tab">Reviews</a></li>
		</ul>
	</div>
	<div class="tab-content">
		<div class="tab-pane fade active in" id="details" >
			<!--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>-->
			<?php
				foreach ($productDetails->result() as $row) {
					echo "<p>" . $row->description . "</p>";
				}
			?>
		</div>
		<div class="tab-pane fade" id="reviews" >
			<div class="col-sm-12">

				<form method="post"
					  action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/blog" ?>">
					<select name="category_name">
						<?php
						foreach ($category_model as $cat) {
							?>
							<option value="<?= $cat['name']?>"><?= $cat['name']?></option>
							<?php
						}
						?>
					</select>
					<br/>
					<br/>
					<input type="text" name="name" placeholder="Your Name"/>

					<textarea name="comment" placeholder="Leave your comment here..." ></textarea>
					<input type="submit" name="submit" value="Submit" class="btn btn-default pull-right" />
				</form>
			</div>
		</div>

	</div>
</div><!--/category-tab-->
