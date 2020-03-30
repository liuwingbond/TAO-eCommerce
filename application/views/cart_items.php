<script>
    function addQuantity(id) {
        var element = $("#quantity"+id);
        if (!isNaN(element.val())) {
            var originalQuantity = parseInt(element.val());

            if (element.val() != ""){
                element.val(parseInt(element.val())+1);
            }

            if(element.val() > parseInt(element.attr("max"))) {
                element.val(element.attr("max"));
                alert("SORRY\nClothes ID:<?= $cartDetails->row()->clothes_id ?> only have " + element.attr("max") + " stocks left");
            } else if(element.val() == ""){
                element.val("1");
                originalQuantity = 1;
            }

            updateProductTotal(id, originalQuantity);
        } else {
            element.val("1");
        }
    }

    function minusQuantity(id){
        var element = $("#quantity"+id);
        if (!isNaN(element.val())) {
            var originalQuantity = parseInt(element.val());

            if (element.val() != ""){
                element.val(parseInt(element.val())-1);
            }

            if(element.val() < 1 || element.val() == ""){
                element.val("1");
                originalQuantity = 1;
                alert("To remove an item from cart, please click the delete button(cross-sign) of the corresponding row.\n\nThank You : )");
            }

            updateProductTotal(id, originalQuantity);
        } else {
            element.val("1");
        }
    }

    function changeQuantity(id) {
        var element = $("#quantity"+id);
        if (element.val() != "") {
            if(!isNaN(element.val())) {
                if (element.val() != "") {

                    if(element.val() > parseInt(element.attr("max"))){
                        element.val(element.attr("max"));
                        alert("SORRY\nClothes ID:<?= $cartDetails->row()->clothes_id ?> only have " + element.attr("max") + " pieces left");
                    } else if(element.val() < 1){
                        element.val("1");
                        alert("To remove an item from cart, please click the delete button(cross-sign) of the corresponding row.\n\nThank You : )");
                    }

                    originalProductTotal = parseInt($("#productSubtotal"+id).attr("name"));
                    var quantity = parseInt(element.val());
                    var productPrice = parseInt($("#productPrice"+id).attr("name"));
                    var productTotal = productPrice*parseInt(quantity);
                    $("#productSubtotal"+id).text("$"+productTotal);
                    $("#productSubtotal"+id).attr("name", productTotal);
                    updateCartTotal(id, originalProductTotal, productTotal);
                }
            }
        }
    }

    function updateProductTotal(id, originalQuantity) {
        var element = $("#quantity"+id);
        var productPrice = parseInt($("#productPrice"+id).attr("name"));
        var quantity = parseInt(element.val());
        var productTotal = productPrice*quantity;
        $("#productSubtotal"+id).text("$"+productTotal);
        $("#productSubtotal"+id).attr("name", productTotal);
        updateCartTotal(id, originalQuantity * productPrice, productTotal);
    }

    function updateCartTotal(id, originalProductTotal, productTotal) {
        var element = $("#quantity"+id);
        var originalCartTotal = parseInt($("#totalpayment").val());
        var productPrice = parseInt($("#productPrice"+id).attr("name"))
        var newCartTotal = originalCartTotal - originalProductTotal + productTotal;

        $("#cartTotal").text("$ "+newCartTotal);
        $("#totalpayment").val(newCartTotal);

        if ($('#totalpayment').val()>=3000) {
            $('#coupon_promotion').html('Pay now to get a $150 Coupon');
        } else if ($('#totalpayment').val()>=1000){
            $('#coupon_promotion').html('Pay now to get a $50 Coupon<br/>');
        } else if ($('#totalpayment').val()<1000)
            $('#coupon_promotion').html("");
    }
</script>

<section id='cart_items'>
    <div class='container'>
        <div class='breadcrumbs'>
            <ol class='breadcrumb'>
                <li><a href=''>Home</a></li>
                <li class='active'>Shopping Cart</li>
            </ol>
        </div>
        <div class='table-responsive cart_info'>
            <table class='table table-condensed'>
                <thead>
                    <tr class='cart_menu'>
                        <td class='image'>Item</td>
                        <td class='description'></td>
                        <td class='price' style="text-align: center;">Price</td>
                        <td class='quantity' style="text-align: center;">Quantity</td>
                        <td class='total'>Total</td>
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
                                <a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."
                                    '><img src='". $row->image_url ."
                                    ' alt='' width='150px'></a>
                            </td>
                            <td class='cart_description'>
                                <h4><a href='/CodeIgniter/index.php/store/product_details/". $row->clothes_id ."'>" . $row->name . "</a></h4>
                                <p>Clothes ID: ". $row->clothes_id ."
                                </p>
                            </td>
                            <td class='cart_price' id='productPrice" . $count . "' name='". $row->price ."'>
                                <p>$". $row->price ."</p>
                            </td>
                            <td class='cart_quantity'>
                                <div class='cart_quantity_button'>
                                    <a class='cart_quantity_up' id='addQuantity' onclick='addQuantity(" . $count . ")'> + </a>
                                    <input class='cart_quantity_input' type='text' form='form1' id='quantity" . $count . "' name='quantity" . $count . "' value='". $row->quantity ."' autocomplete='off' size='2' max='" . $row->maxQuantity . "' onkeyup='changeQuantity(" . $count . ")' required/>
                                    <input type='hidden' form='form1' name='cart_id" . $count . "' value='" . $row->cart_id . "'/>
                                    <a class='cart_quantity_down' id='minusQuantity' onclick='minusQuantity(" . $count . ")'> - </a>
                                </div>
                            </td>
                            <td class='cart_total'>
                                <p class='cart_total_price' id='productSubtotal" . $count . "' name='" . $row->price * $row->quantity . "'>$". $row->price * $row->quantity."</p>
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
                            echo "<input type='hidden' form='form1' id='count' name='count' value='" . $count . "'/>";
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</section> <!--/#cart_items-->
