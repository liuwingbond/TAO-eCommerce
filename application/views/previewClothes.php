<section id="cart_items">
    <div class="container">
        <div class="cart_info">
            <table class="table table-condensed">
                <!-- <form method="post" action="http://localhost/CodeIgniter/index.php/store/insertresult"> -->
                <tbody>
                <tr>
                    <td>
                        <button onclick="window.location='/CodeIgniter/index.php/store/upload#tab2';">Upload Another Clothes</button>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Product name:</label><br/>
                        <?php echo $query_category['name']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Category id:</label><br/>
                        <?php echo $query_category['category_id']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Clothes id:</label><br/>
                        <a href="/CodeIgniter/index.php/store/product_details/<?= $query_clothes['clothes_id'] ?>" target="_blank"><?php echo $query_clothes['clothes_id']; ?></a>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Clothes type:</label><br/>
                        <?php echo $query_category['type']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Available Date:</label><br/>
                        <?php echo $query_clothes['clothes_date_avaliable']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Clothes color:</label><br/>
                        <?php echo $query_clothes['color']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Uploaded Image:</label><br/>

                        <?php
                        //if (isset($_POST['Submit'])) {
                        foreach ($query_clothes_image->result() as $row) {
                            echo "<a href='" . $row->image_url . "' target='_blank'><img src='" . $row->image_url . "' style='height: 300px'/></a><br/><br/>";
                        }
                        ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Gender:</label><br/>
                        <?php echo $query_category['gender']; ?>
                    </td>
                </tr>
                <tr class="cart_description">
                    <td><span>
                    <label>Size(US)</label><br/>
                    <?php echo $query_clothes['size']; ?>
                </span></td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Quantity:</label><br/>
                        <?php echo $query_clothes['quantity']; ?>
                    </td>
                </tr>

                <tr>
                    <td>
                        <button onclick="window.location='/CodeIgniter/index.php/store/upload#tab2';">Upload Another Clothes</button>
                    </td>
                </tr>
                </tbody>
                </form>
            </table>
        </div>
    </div>
</section>
