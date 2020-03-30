<script>
    //$(document).ready(function(){
        var count = 1;
        function addImageURLRow() {
            $("#addImageURLRowBtn").remove();
            $("#newImageURLRow").before("<input type='text' form='clothesForm' name='image_url" + count++ + "' placeholder='Ignore if not use'><button type='button' id='addImageURLRowBtn' onclick='addImageURLRow()'><span class='glyphicon glyphicon-plus'></span></button><br/><br/>");
            $("#numOfImageURLS").val(count);
        }
    //});
</script>
<div id='tab2'>
    <section id="cart_items">
        <div class="container">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <form id="clothesForm" method="post" action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/insertClothesResult" ?>">
                        <tbody>
                        <tr>
                            <td class="cart_description"><label for="name">Product name:</label><br/>
                                <!--<input type="text" placeholder="e.g. Product name" name="name" required/><br/><br/>-->
                                <select name="category_id">
                                    <?php
                                    foreach ($category_model as $cat) {
                                        ?>
                                        <option value="<?= $cat['category_id'] ?>" id="<? $cat['name'] ?>" required><?= $cat['name'] ?></option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description"><label for="available_date">Available Date:</label><br/>
                                <input type="date" name="available_date"><br/><br/></td>
                        </tr>
                        <tr>
                            <td class="cart_description" id="color_span">
                                <label for="color">Clothes color:</label><br/>
                                <?php foreach ($color_model as $row) { ?>
                                    <input type="radio" value="<?= $row['color_id'] ?>" name="color" required/>
                                    <?= $row['color'] ?>&nbsp;&nbsp;&nbsp;&nbsp;
                                <?php } ?><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description"><label for="image_url">Image URL(s):</label><br/>
                                <input type="hidden" id="numOfImageURLS" name="numOfImageURLS" value="1">
                                <input type="text" name="image_url0" placeholder="Required at least 1 URL" required><button type="button" id="addImageURLRowBtn" onclick="addImageURLRow()"><span class="glyphicon glyphicon-plus"></span></button><br/><br/>
                                <div id="newImageURLRow"></div>
                            </td>
                        </tr>
                        <tr id="male_clothes_size">
                            <td><label for="size">Size</label><br/>
                                    <?php foreach ($size_model as $row) { ?>
                                        <input type="radio" value="<?= $row['size_id'] ?>" name="size" required/>
                                        <?= $row['size'] ?>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <?php } ?><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description"><label for="quantity">Quantity:</label><br/>
                                <input type="number" name="quantity" placeholder="Required" min="0" max="100" step="1" value="10" required><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" name="Submit" id="submit" value="Insert"/> <input type="reset" value="Reset"/>
                            </td>
                        </tr>
                        </tbody>
                    </form>
                </table>
            </div>
        </div>
    </section>
</div>
