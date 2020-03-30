<div id='tab3'>
    <section id="cart_items">
        <div class="container">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <form id="deleteCategoryForm"
                        method="post"
                        action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/deleteresult" ?>"/>
                        <tbody>
                        <tr>
                            <td class="cart_description">
                                <p>Clothes name to be deleted:</p>
                                <select name="category_id" id="category_id">
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
                            <td>
                                <button type="button" onclick="confirmDel()" value="Submit">Submit</button>
                            </td>
                        </tr>
                        </tbody>
                    </form>
                </table>
                <script>
                    function confirmDel() {
                        var selectedId = document.getElementById("category_id").selectedIndex;
                        var selectedValue = document.getElementById("category_id")[selectedId].value;
                        var selectedText = document.getElementById("category_id")[selectedId].innerHTML;
                        if (confirm("Selected Category Info:\n" + 
                            "ID: " + selectedValue + "\n" + 
                            "Name: " + selectedText + "\n\n" + 
                            "Once confirmed, CANNOT UNDO!!!\nConfirm delete?")) {
                            document.getElementById("deleteCategoryForm").submit();
                        }
                    }
                </script>
            </div>
        </div>
    </section>
</div>
