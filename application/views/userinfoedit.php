<?php

$info = $userinfo;

?>
<style>.userForm {
        padding:: 10px !important;
        margin: 5px !important;
    }</style>
<section id="cart_items">
    <div class="container">
        <form action="<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/editUserInfo"?>" method="post">
            <table class="table table-condensed userForm">
                <tbody>
                <tr>
                    <td>
                        Nick Name

                    </td>
                    <td>
                       <input type="text" name='nick_name' value=<?= $info->nick_name ?> required/>

                    </td>
                </tr>


                <tr>

                    <td>
                        gender

                    </td>
                    <td>
                        <select name="gender" required>
                            <option value="Male">
                                Male
                            </option>
                            <option>
                                Female
                            </option value='Female'>
                        </select>

                    </td>

                </tr>

                <tr>

                    <td>
                        phone

                    </td>
                    <td>
                        <input type="number" name='phone' min='10000000' max='99999999' value=<?= $info->phone ?> required/>

                    </td>

                </tr>

                <tr>

                    <td>
                        Date of birth

                    </td>
                    <td>
                        <input type="date" name='dob' value=<?= $info->dob ?> required/>

                    </td>
                </tr>
                <tr>
                    <td>


                    </td>
                    <td>
                        <input type="submit" value="submit">
                    </td>
                </tr>


                </tbody>
            </table>
            </form>
    </div>


</section>
