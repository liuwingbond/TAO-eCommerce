<form method="post" action="">
    <input type="text" name="color" id="color">
    <input type="text" name="image_url" id="image_url">
    <input type="submit" value="on7">
</form>

<form method="post" action="">
    <input type="text" name="color" id="color">
    <input type="text" name="image_url" id="image_url">
    <input type="submit" value="on9">
</form>

<form method="post" action="">
    <input type="text" name="color" id="color">
    <input type="text" name="image_url" id="image_url">
    <input type="submit" value="onj">
</form>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
    $("form").on("submit", function (event) {
            event.preventDefault();
            //alert($("form").serializeArray());
            alert($(this).serialize());
            $temp = $(this).serialize();

        $.post("<?= "http://".$_SERVER['SERVER_NAME']."/CodeIgniter/index.php/test/insert" ?>",
            {
                // color:$("#color").val(),
                // image_url:$("#image_url").val()
                data:$temp
            },

            function (data,status) {
                alert(status);
            });
    });
</script>
