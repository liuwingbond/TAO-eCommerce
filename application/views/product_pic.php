<link src='/CodeIgniter/css/magnify.css' rel='stylesheet' type='text/css'>
<script src="/CodeIgniter/js/jac_jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>

<div class="col-sm-9 padding-right">
    <div class="product-details"><!--product-details-->
        <div class="col-sm-8">
            <div class="view-product">
                <?php
                    $count = 0;
                    foreach ($productImage->result() as $row) {
                        $count++;
                        if($count == 1){
                        echo "
                        <div class='product'>
                            <img class='magniflier' id='pic' src='". $row->image_url ."'>
                        </div>
                        ";
                        }

                    }

                    foreach ($productImage->result() as $row) {
                        echo"
                        <a class='image' style='cursor:pointer' onclick=document.getElementById('pic').src='" . $row->image_url . "'>
                        <img src='". $row->image_url . "' style='width:60px!important;height:70px!important;'
                        />
                        </a>
                        ";
                    }
                ?>
            </div>
            <!-- Wrapper for slides -->
        </div>