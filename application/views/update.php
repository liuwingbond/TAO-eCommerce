<div id='tab4'>
    <section id="cart_items">
        <div class="container">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <form method="post" action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/updateresult" ?>">
                        <tbody>
                            <tr>
                                <td class="cart_description">
                                    <p>Clothes name to be updated:</p>
                                    <select name="category_id">
                                        <?php
                                        foreach ($category_model as $cat) {
                                            ?>
                                            <option value="<?= $cat['category_id'] ?>"><?= $cat['name'] ?></option>
                                            <?php
                                        }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="cart_description">
                                    <p><label for="quantity">Quantity:</label></p>
                                    <input type="number" name="quantity" min="0" max="100" step="1" value="10">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" name="Submit" value="submit"/>
                                </td>
                            </tr>
                        </tbody>
                    </form>
                </table>
            </div>
        </div>
    </section>
</div>