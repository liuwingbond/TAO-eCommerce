<script>
    $(document).ready(function(){
        $("[name='gender']").change(function(){
            var selectedGender = $("input[name=gender]:checked").val();
            if (selectedGender == 2){
                $("#menType").attr("hidden", "true");
                $("#menType").attr("disabled", "true");
                $("#womenType").removeAttr("hidden");
                $("#womenType").removeAttr("disabled");
            } else {
                $("#menType").removeAttr("hidden");
                $("#menType").removeAttr("disabled");
                $("#womenType").attr("hidden", "true");
                $("#womenType").attr("disabled", "true");
            }
        });
    });  
</script>

<div id='tab1'>
    <section id="cart_items">
        <div class="container">
            <div class="table-responsive cart_info">
                <table class="table table-condensed">
                    <form method="post" action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/insertCategoryResult" ?>">
                        <tbody>
                        <tr>
                            <td class="cart_description"><label for="name">Product name:</label><br/>
                                <input type="text" placeholder="e.g. Product name" name="name" required/><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description">
                                <label for="description">Product description:</label><br/>
                                <textarea rows="8" cols="50" placeholder="e.g. Product description"
                                          name="description"></textarea><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description">
                                <label for="gender">Gender:</label><br/>
                                <input type="radio" id="male" name="gender" value="1" required/>&nbsp;Male&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" id="female" name="gender" value="2"  required/>&nbsp;Female<br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description">
                                <label for="type">Clothes type:</label><br/>
                                <select name="type" id="menType" disabled>
                                    <?php foreach ($menType->result() as $row) { ?>
                                        <option value="<?= $row->type_id ?>"><?= $row->type ?></option>
                                    <?php } ?>
                                </select>
                                <select name="type" id="womenType" disabled hidden>
                                    <?php foreach ($womenType->result() as $row) { ?>
                                        <option value="<?= $row->type_id ?>"><?= $row->type ?></option>
                                    <?php } ?>
                                </select><br/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td class="cart_description"><label for="price">Price:</label><br/>
                                <input type="number" placeholder="e.g. Price" name="price"
                                       min="0" max="100000" step="1" required/><br/><br/>
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
