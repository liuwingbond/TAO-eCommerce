<!DOCTYPE html>
<html lang="en">
<head>

    <script src="/CodeIgniter/js/jquery.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Home | Tao</title>

    <link href="/CodeIgniter/css/magnify.css" rel="stylesheet">
    <link href="/CodeIgniter/css/bootstrap.min.css" rel="stylesheet">
    <link href="/CodeIgniter/css/font-awesome.min.css" rel="stylesheet">
    <link href="/CodeIgniter/css/prettyPhoto.css" rel="stylesheet">
    <link href="/CodeIgniter/css/price-range.css" rel="stylesheet">
    <link href="/CodeIgniter/css/animate.css" rel="stylesheet">
    <link href="/CodeIgniter/css/main.css" rel="stylesheet">
    <link href="/CodeIgniter/css/responsive.css" rel="stylesheet">
    <link href="/CodeIgniter/css/tab.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="/CodeIgniter/images/favicon.ico">
    <link rel="apple-touch-icon" href="/CodeIgniter/images/touch-icons/touch-icon-iphone-60x60.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/CodeIgniter/images/touch-icons/touch-icon-ipad-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/CodeIgniter/images/touch-icons/touch-icon-iphone-retina-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/CodeIgniter/images/touch-icons/touch-icon-ipad-retina-152x152.png">
</head>
<!--/head-->

<body>
<header id="header"><!--header-->
    <div class="header-middle"><!--header-middle-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="logo pull-left">
                        <a href="/CodeIgniter/index.php/store"><img src="/CodeIgniter/images/tao-red.png" alt="" height= "100px"/></a>
                    </div>
                </div>
                <br><br>
                <div class="col-sm-8">
                    <div class="shop-menu pull-right">
                        <ul class="nav navbar-nav usermenu">
                            <?php
                                if ($login_status != 'login') {
                                    echo "
                                    <li><a href='/CodeIgniter/index.php/store/cart'><i class='fa fa-shopping-cart'></i>Cart</a></li>
                                    <li><a href='/CodeIgniter/index.php/store/checkout'><i class='fa fa-crosshairs'></i>Checkout</a></li>
                                    <li><a href='/CodeIgniter/index.php/store/order'><i class='fa fa fa-book'></i>Past Orders</a></li>
                                ";}

                                if ($permission == 'admin')
                                    echo "<li><a href='/CodeIgniter/index.php/store/userInfo'><i class='fa fa-user-secret'></i>Account</a></li>";
                                else if ($login_status != 'login')
                                    echo "<li><a href='/CodeIgniter/index.php/store/userInfo'><i class='fa fa-user'></i>Account</a></li>";

                                if ($login_status == 'login')
                                    echo "
                                        <li><a href='" . $login_status_link . "'><i class='fa fa-sign-in'></i>" . $login_status . "</a></li>
                                        <li><a href='" . $login_status_link . "#tab2'><i class='fa fa-pencil'></i>Register</a></li>
                                    ";
                                else 
                                    echo "<li><a href='" . $login_status_link . "'><i class='fa fa-sign-out'></i>" . $login_status . "</a></li>";
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div><!--/header-middle-->

    <div class="header-bottom"><!--header-bottom-->
        <div class="container">
            <div class="row">
                <div class="col-sm-9">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="mainmenu pull-left">
                        <ul class="nav navbar-nav collapse navbar-collapse">
                            <li><a href="/CodeIgniter/index.php/store" class="active"><span class="glyphicon glyphicon-home"></span> Home</a></li>
                            <li class="dropdown"><a href="#">Shop<i class="fa fa-angle-down"></i></a>
                                <ul role="menu" class="sub-menu">
                                    <li><a href="/CodeIgniter/index.php/store/product/all">Products</a></li>
                                    <li><a href="/CodeIgniter/index.php/store/cart">Cart</a></li>
                                    <li><a href="/CodeIgniter/index.php/store/login">Login <i class="fa fa-sign-in"></i></a></li>
                                </ul>
                            </li>
                            <li><a href="/CodeIgniter/index.php/store/blog">Blog</a></li>
                            <li><a href="/CodeIgniter/index.php/store/contactUs">Contact</a></li>
                            <?php if ($permission == 'admin') { ?>
                                <li><a href="/CodeIgniter/index.php/store/upload"><i
                                            class="fa fa-upload"></i>
                                        Upload</a></li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="search_box pull-center" >
                        <form style="position:relative";>
                            <input type="text" size="30" onkeyup="showResult(this.value)">

                            <div id="livesearch" style="position:fixed;z-index:999;border:1px;background-color: blue !important;opacity:1;"></div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div><!--/header-bottom-->
</header><!--/header-->
