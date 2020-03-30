<?php foreach ($test as $table) { ?>
    <div>
        <?= json_encode($table['title']) ?>
        <br>
        <?= json_encode($table['data']) ?>
    </div>
    <hr>
    <br>
<?php } ?>

<?php


if (isset($_POST['tag']) && $_SESSION['login'] == true)
    header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");

?>
