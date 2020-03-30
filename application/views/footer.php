<div class="footer-bottom">
    <div class="container">
        <div class="row">
            <p class="pull-left">Copyright&nbsp;©&nbsp;2017&nbsp;A+ Developer</p>
        </div>
    </div>
</div>
</footer><!--/Footer-->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/CodeIgniter/js/multiple_upload.js"></script>
<script src="/CodeIgniter/js/tab.js"></script>
<script src="/CodeIgniter/js/jquery.js"></script>
<script src="/CodeIgniter/js/bootstrap.min.js"></script>
<script src="/CodeIgniter/js/jquery.scrollUp.min.js"></script>
<script src="/CodeIgniter/js/price-range.js"></script>
<script src="/CodeIgniter/js/jquery.prettyPhoto.js"></script>
<script src="/CodeIgniter/js/main.js"></script>
<script src="/CodeIgniter/js/magnify.js"></script>
<script>
    $(document).ready(function () {
        // Initiate magnification powers
        $('img').magnify({
            onload: function () {
                console.log('Magnification powers activated!');
            }
        });
    });


    //live search
    function showResult(str) {
        if (str.length == 0) {
            document.getElementById("livesearch").innerHTML = "";
            document.getElementById("livesearch").style.border = "10px";
            return;
        }
        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        } else {  // code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                document.getElementById("livesearch").innerHTML = xmlhttp.responseText;
                document.getElementById("livesearch").style.border = "1px solid #A5ACB2";
            }
        }
        xmlhttp.open("GET", "http://<?=$_SERVER['SERVER_NAME']?>/CodeIgniter/index.php/store/search?q=" + str, true);
        xmlhttp.send();
    }

</script>


</body>
</html>
