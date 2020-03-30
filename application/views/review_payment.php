<div class="review-payment">
    <h2>Review &amp; Payment</h2>
</div>

<div class="table-responsive cart_info">
    <table class="table table-condensed">
        <thead>
            <tr class="cart_menu">
                <td class="image">Item</td>
                <td class="description"></td>
                <td class="price" style="text-align: center;">Price</td>
                <td class="quantity" style="text-align: center;">Quantity</td>
                <td class="total">Total</td>
                <td></td>
            </tr>
        </thead>

        <tbody>
            <?php
            $count = 0;
            foreach ($cartDetails->result() as $row) {
                echo "
                    <tr>
                        <td class='cart_product'>
                            <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'><img src='". $row->image_url ."' alt='' width='150px'></a>
                        </td>
                        <td class='cart_description'>
                            <h4><a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>" . $row->name . "</a></h4>
                            <p>Clothes ID: ". $row->clothes_id ."</p>
                        </td>
                        <td class='cart_price' id='productPrice" . $count . "' name='". $row->price ."'>
                            <p>$". $row->price ."</p>
                        </td>
                        <td class='cart_quantity'>
                            <p>". $row->quantity ."</p>
                        </td>
                        <td class='cart_total'>
                            <p class='cart_total_price' id='productSubtotal" . $count . "' name='" . $row->price * $row->quantity . "'>$" . $row->price * $row->quantity . "</p>
                        </td>
                        <td class='cart_delete'>
                            <form method='post' action='/CodeIgniter/index.php/store/deletecart'>
                                <input type='hidden' name='cartid' value='". $row->cart_id ."'>

                                <button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/deletecart' class='cart_quantity_delete'><i class='fa fa-times'></i></button>
                            </form>
                        </td>
                    </tr>
                ";
                $count++;
            }
            echo "<input type='hidden' form='form1' name='count' value='" . $count . "'/>"
            ?>

            <tr>
                <td colspan="4">&nbsp;</td>
                <td colspan="2">
                    <table class="table table-condensed total-result">
                        <tr class="shipping-cost">
                            <td>Shipping Cost</td>
                            <td>Free</td>
                        </tr>
                        <tr>
                            <td>Total</td>
                            <td><span name='totalpayment' id='cartTotal'>&#x00024;
                                <?php
                                    $carttotal = 0;

                                    foreach ($cartDetails->result() as $row) {
                                        $carttotal += $row->price * $row->quantity;
                                    }
                                    echo $carttotal;
                                ?>
                            </span></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<div class="payment-options">
    <div class="bill-to">
        <p>Bill To</p>
        <div class="form-one">
            <form id="form1" method='post' action='/CodeIgniter/index.php/store/checkoutLast'>
                <input type="text" placeholder="Billing Name" name="billing">
                <input type="hidden" name="totalpayment" id="totalpayment" value="
                    <?php
                        $carttotal = 0;

                        foreach ($cartDetails->result() as $row) {
                          $carttotal += $row->price * $row->quantity;
                        }
                        echo $carttotal;
                    ?>
                ">
                <input type="text" placeholder="Address" name="addr">

                <li>
                    <input type="hidden" name="coupon50" value="false" />
                    <label><input type="checkbox" name="coupon50" value="use50"> Use $50 Coupon (You have
                        <?php
                            foreach ($getCoupon50->result() as $row) {
                              echo $row->coupon50;
                            }
                        ?>
                    coupon left)
                    </label>
                </li>

                <li>
                    <input type="hidden" name="coupon100" value="false" />
                    <label><input type="checkbox" name="coupon100" value="use100"> Use $100 Coupon (You have
                        <?php
                            foreach ($getCoupon100->result() as $row) {
                              echo $row->coupon100;
                            }
                        ?>
                    coupon left)
                    </label>
                </li>

                <div id="coupon_promotion" style="font-size: 20px; color: #FE980F; font-weight: 600; font-size: 30px;"></div>
                <?php echo "
                    <script>
                        $(document).ready(function(){
                            if (" . $carttotal . ">3000) {
                                $('#coupon_promotion').append('Pay now to get a $150 Coupon');
                            } else if (" . $carttotal . ">1000){
                                $('#coupon_promotion').append('Pay now to get a $50 Coupon');
                            }
                        });
                    </script>"
                ?>
                
                <button type='submit' formmethod='post' formaction='/CodeIgniter/index.php/store/checkoutLast' class='btn btn-default add-to-cart'><i class='fa fa-shopping-cart'></i>Pay</button>
            </form>
        </div>
    </div>
</div>
    </div>
</section> <!--/#cart_items-->