<section id="cart_items">
    <div class="container">
        <div class="cart_info">
            <table class="table table-condensed">
                <!-- <form method="post" action="http://localhost/CodeIgniter/index.php/store/insertresult"> -->
                <tbody>
                <tr>
                    <td>
                        <button onclick="window.location='/CodeIgniter/index.php/store/upload#tab2';">Upload Clothes</button>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Product id:</label><br/>
                        <?php echo $query_category['category_id']; ?>
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
                        <label>Product description:</label><br/>
                        <?php echo $query_category['description']; ?>
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
                        <label>Price:</label><br/>
                        <?php echo $query_category['price']; ?>
                    </td>
                </tr>
                <tr>
                    <td class="cart_description">
                        <label>Gender:</label><br/>
                        <?php echo $query_category['gender']; ?>
                    </td>
                </tr>

                <tr>
                    <td>
                        <button onclick="window.location='/CodeIgniter/index.php/store/upload#tab2';">Upload Clothes</button>
                    </td>
                </tr>
                </tbody>
                </form>
            </table>
        </div>
    </div>
</section>
