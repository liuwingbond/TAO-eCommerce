<script>
				$(document).ready(function(){
								$("#form1").submit(function(e){
												var count = parseInt($("#count").val());
												for (var i = 0; i<count; i++) {
																if (isNaN($("#quantity"+i).val())) {
																				alert("Input error!!!\nUser input quantity: " + $("#quantity"+i).val() + " for Clothes ID: <?= $cartDetails->row()->clothes_id ?>\nPlease input integers only");
				            				$("#quantity"+i).val("1");
				            				e.preventDefault();
																}
												}
								});
				});
</script>
<section id="do_action">
				<div class="container">
								<div class="row">
												<div class="col-sm-6"></div>
												<div class="col-sm-6">
																<div class="total_area">
																				<ul>
																								<?php
																												$carttotal = 0;
																												echo "<li>Cart Sub Total <span id='cartTotal'>";
																												foreach ($cartDetails->result() as $row) {
																																$carttotal += $row->price * $row->quantity;
																												}
																												echo "$";
																												echo $carttotal;
																												echo "</span></li>";
																								?>
								                <input type="hidden" name="totalpayment" id="totalpayment" value="
								                    <?php
								                        $carttotal = 0;

								                        foreach ($cartDetails->result() as $row) {
								                          $carttotal += $row->price * $row->quantity;
								                        }
								                        echo $carttotal;
								                    ?>
								                ">
																				<p><div id="coupon_promotion" style="font-size: 20px; color: #FE980F; font-weight: 600; font-size: 23px;"></div></p>
				                <?php echo "
				                    <script>
				                        $(document).ready(function(){
				                            if (" . $carttotal . ">3000) {
				                                $('#coupon_promotion').append('Pay now to get a $150 Coupon');
				                            } else if (" . $carttotal . ">1000){
				                                $('#coupon_promotion').append('Pay now to get a $50 Coupon<br/>');
				                            }
				                        });
				                    </script>"
				                ?>
				                <form id="form1" method='post' action='/CodeIgniter/index.php/store/updateCart'>
				                <button id="btn" type="submit" formmethod='post' form="form1" formaction='/CodeIgniter/index.php/store/updateCart' class='btn btn-default check_out'>Check Out</button>
				                </form>
																</div>
												</div>
								</div>
				</div>
</section><!--/#do_action-->