<footer id="footer"><!--Footer-->
	<div class="footer-widget">
		<div class="container">
			<div class="row">
				<div class="single-widget">
					<h2>Quick Shop</h2>
					<table>
						<tr>
							<td>
								<div class="col-sm-2">
									<table style="width: 110px;">
										<tr>
											<th>Mens</th>
										</tr>
										<?php
										foreach($menType->result() as $row) {
											echo "<tr><td><a href='/CodeIgniter/index.php/store/product/" . $row->type_id . "'>" . $row->type . "</a></td></tr>";
										}
										?>
									</table>
								</div>
							</td>

							<td>
								<div class="col-sm-2">
									<table style="width: 110px;">
										<tr>
											<th>Womens</th>
										</tr>
										<?php
										foreach($womenType->result() as $row) {
											echo "<tr><td><a href='/CodeIgniter/index.php/store/product/" . $row->type_id . "'>" . $row->type . "</a></td></tr>";
										}
										?>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
