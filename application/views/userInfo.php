<?php

$info = $userinfo;

?>
<style>.userForm {
        padding:: 10px !important;
        margin: 5px !important;
    }</style>
<section id="cart_items">
    <div class="container">
        <table class="table table-condensed userForm">
            <tbody>
            <tr>
                <td>
                    Nick Name

                </td>
                <td>
                    <?= $info->nick_name ?>

                </td>
            </tr>

            <tr>
                <td>
                    gender

                </td>
                <td>
                    <?= $info->gender ?>

                </td>
            </tr>

            <tr>
                <td>
                    phone

                </td>
                <td>
                    <?= $info->phone ?>

                </td>
            </tr>

            <tr>
                <td>
                    Date of birth

                </td>
                <td>
                    <?= $info->dob ?>

                </td>
            </tr>

            <tr>
                <td>

                </td>
                <td>
                    <button>
                        <a
                            href=<?= "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/userinfoEdit" ?>>edit
                            profile</a></button>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</section>
