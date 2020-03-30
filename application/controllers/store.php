<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class store extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model('temp_model');
        $this->load->model('gender_model');
        $this->load->model('type_model');
        $this->load->model('category_model');
        $this->load->model('clothes_model');
        $this->load->model('size_model');
        $this->load->model('color_model');
        $this->load->model('view_clothes_model');

    }

    public function index()
    {
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $data['type_model'] = $this->type_model->get_entity();
        $this->load->view('video');
        $this->load->view('imageSlider');

        $data['type'] = $this->db->query(" SELECT type_id, type FROM type;");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        $this->load->view('product_categories', $data);

        $this->load->database();

        $data["featureInfo"] = $this->db->query('SELECT price, name, clothes.image_url, clothes.clothes_id FROM category JOIN clothes USING(category_id) GROUP BY category_id DESC LIMIT 3');

        $this->load->view('newArival_items', $data);

        //Mens New Arrival
        $data["catMensCJInfo"] = $this->db->query("SELECT price, name, image_url,  clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 1 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catMensSweatsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 2 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catMensTShirtsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 3 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catMensShirtsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 4 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");

        //Womens New Arrival
        $data["catWomensCJInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 5 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catWomensSweatsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 6 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catWomensTShirtsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 7 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");
        $data["catWomensSkirtsInfo"] = $this->db->query("SELECT price, name, image_url, clothes_id FROM category JOIN clothes USING(category_id) WHERE type_id = 8 GROUP BY category_id ORDER BY clothes.clothes_id DESC LIMIT 3");

        $this->load->view('category_tab', $data);


        $data["recInfo1"] = $this->db->query('SELECT price, name, clothes.image_url, clothes_id FROM category JOIN clothes USING(category_id) GROUP BY category_id DESC LIMIT 3');
        $data["recInfo2"] = $this->db->query('SELECT price, name, clothes.image_url, clothes_id FROM category JOIN clothes USING(category_id) GROUP BY category_id ORDER BY price desc LIMIT 3');
        $this->load->view('recommended_items', $data);
        $this->load->view('closing_tag');
        $this->load->view('advance_footer');
        $this->load->view('footer');
    }

    public function product()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);

        $this->load->view('product_categories', $data);


        if ($this->uri->segment(3) == 'all') {
            $data["productInfo"] = $this->db->query("
                SELECT price, category.name, clothes.image_url, clothes_id, type.type, gender.gender_name FROM category
                JOIN clothes USING(category_id)
                JOIN type ON(category.type_id = type.type_id)
                Join gender ON(gender.gender_id = type.gender_id)
                ");

        } else {
            $data["productInfo"] = $this->db->query("
                SELECT price, category.name, clothes.image_url, clothes_id, type.type, gender.gender_name FROM category
                JOIN clothes USING(category_id)
                JOIN type ON(category.type_id = type.type_id)
                Join gender ON(gender.gender_id = type.gender_id)
                WHERE type.type_id = " . $this->uri->segment(3)
                );
        }

        $this->load->view('product_items', $data);
        $this->load->view('closing_tag');
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');
    }

    public function generalproduct()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $this->load->view('product_categories', $data);


        if ($this->uri->segment(3) == 'all') {
            $data["productInfo"] = $this->db->query("
                SELECT price, category.name, clothes.image_url, clothes_id FROM category
                JOIN clothes USING(category_id)
                JOIN type ON(category.type_id = type.type)
                GROUP BY category.name;
                ");

        } else {
            $data["productInfo"] = $this->db->query("
                SELECT price, category.name, clothes.image_url, clothes_id FROM category
                JOIN clothes USING(category_id)
                JOIN type ON(category.type_id = type.type) GROUP BY category.name;
                ");
        }


        $this->load->view('product_items', $data);
        $this->load->view('closing_tag');
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');
    }


    public function product_details()
    {
        $this->load->database();
        $data['type_model'] = $this->type_model->get_entity();
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $data['type'] = $this->db->query(" SELECT type_id, type FROM type;");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        $this->load->view('product_categories', $data);

        $data["productdetails"] = $this->db->query('
            SELECT name, price, clothes_id, category_id, quantity, color_id, size_id, clothes.image_url, description, color, size FROM category
            JOIN clothes USING(category_id)
            JOIN color USING(color_id)
            JOIN size USING(size_id)
            WHERE clothes_id = ' . $this->uri->segment(3) . ' LIMIT 1  '
            );

        $data["productColor"] = $this->db->query('
            SELECT color_id, clothes_id, size_id, image_url FROM clothes 
            WHERE category_id = (SELECT category_id FROM clothes 
            WHERE clothes_id = ' . $this->uri->segment(3) . ')
            ');

        $data["productImage"] = $this->db->query("
            SELECT clothes_id, image_url FROM clothes_image
            WHERE clothes_id = " . $this->uri->segment(3)
            );
        
        $data['category_model'] = $this->category_model->get_entity();

        $this->load->view('product_pic', $data);
        $this->load->view('product_details_info', $data);

        $data["productReview"] = $this->db->query('SELECT * FROM clothes_review');
        $data["productDetails"] = $this->db->query('SELECT description FROM category WHERE category_id = (SELECT category_id FROM clothes WHERE clothes_id = ' . $this->uri->segment(3) . ')');
        $this->load->view('product_tab', $data);


        $data["recInfo1"] = $this->db->query('SELECT price, name, clothes.image_url, clothes_id FROM category JOIN clothes USING(category_id) GROUP BY category_id DESC LIMIT 3');
        $data["recInfo2"] = $this->db->query('SELECT price, name, clothes.image_url, clothes_id FROM category JOIN clothes USING(category_id) GROUP BY category_id ORDER BY price desc LIMIT 3');
        $this->load->view('recommended_items', $data);
        $this->load->view('closing_tag');
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');
    }


    public function contactUs()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $this->load->view('contact_us_map');
        $this->load->view('contact_us_form');
        $this->load->view('contact_us_info');
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');
    }


    public function addtocart()
    {
        $this->load->database();
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $userid = $_SESSION['user']['user_id'];


            $clothesid = $_POST['clothesid'];
            $quantity = $_POST['quantity'];

            $data["cartHistory"] = $this->db->query("SELECT cart.clothes_id, user_id, cart.quantity as cartQuantity, clothes.quantity as clothesQuantity FROM cart JOIN clothes WHERE cart.clothes_id = " . $clothesid . " AND user_id = " . $userid);
            if ($data["cartHistory"]->row()) {
                if ($quantity + $data["cartHistory"]->row()->cartQuantity > $data["cartHistory"]->row()->clothesQuantity) {
                    $quantity = $data["cartHistory"]->row()->clothesQuantity - $data["cartHistory"]->row()->cartQuantity;
                }

                if ($data["cartHistory"]->row()->clothes_id == $clothesid && $data["cartHistory"]->row()->user_id == $userid) {
                    $this->db->query("UPDATE cart SET quantity = quantity +" . $quantity . " WHERE clothes_id = " . $clothesid . " AND user_id = " . $userid);
                }
            } else {
                    $this->db->query("INSERT INTO cart(user_id, clothes_id, quantity) VALUE ('.$userid.', '.$clothesid.', '.$quantity.')");
            }
            echo "<script>history.go(-1);</script>";
        } else {
                $data['type'] = $this->db->query(" SELECT type_id, type FROM type;");
                $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
                $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
                $this->load->view('header', $data);
                $this->load->view('login_tab');
                $this->load->view('user_login_form');
                $this->load->view('sign_up_form');
                //$this->load->view('admin_login_form');
                $this->load->view('advance_footer', $data);
                $this->load->view('footer');
        }
    }

    public function deletecart()
    {
        $this->load->database();
        session_start();
        $userid = $_SESSION['user']['user_id'];

        $cartid = $_POST['cartid'];


        $this->db->query("DELETE FROM cart WHERE cart_id = " . $cartid . "");


        header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/cart");

    }


    public function checkout()
    {
        $this->load->database();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        $data['type_model'] = $this->type_model->get_entity();
        session_start();
        $userid = $_SESSION['user']['user_id'];
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
            $userid = $_SESSION['user']['user_id'];

            $this->load->view('header', $data);
            $this->load->view('breadcrumbs');
            $this->load->view('checkout_option');
            $this->load->view('shopper_info');
            $this->load->view('bill_to');
            $this->load->view('shipping_order');

            $data["cartDetails"] = $this->db->query("SELECT cart_id, clothes.image_url, name, clothes_id, price, cart.quantity, clothes.quantity as maxQuantity FROM clothes JOIN cart USING(clothes_id)
                JOIN category USING(category_id)
                WHERE user_id = " . $userid . "");
            $data["getCoupon50"] = $this->db->query("SELECT coupon50 FROM reward WHERE user_id = " . $userid . "");

            $data["getCoupon100"] = $this->db->query("SELECT coupon100 FROM reward WHERE user_id = " . $userid . "");


            $this->load->view('review_payment', $data);
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        } else 
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login");
    }

    public function cart()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
            $this->load->view('header', $data);

            $userid = $_SESSION['user']['user_id'];


            $data["cartDetails"] = $this->db->query("SELECT cart_id, clothes.image_url, name, clothes_id, price, cart.quantity, clothes.quantity as maxQuantity FROM clothes JOIN cart USING(clothes_id)
                JOIN category USING(category_id)
                WHERE user_id = " . $userid . "");
            $this->load->view('cart_items', $data);


            $this->load->view('do_action', $data);
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        } else {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login");
        }
    }

    public function updateCart()
    {
        for ($i = 0; $i < $_POST['count']; $i++) {
            $sql_query = $this->db->query("
                UPDATE cart SET 
                quantity = " . $_POST['quantity'.$i] . ", 
                update_at = NOW()
                WHERE cart_id = " . $_POST['cart_id'.$i] . ";");
        }
        header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/checkout");
    }


    public function checkoutLast()
    {


        session_start();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        $this->load->database();

        $userid = $_SESSION['user']['user_id'];
        $billing = $_POST['billing'];
        $addr = $_POST['addr'];

        $totalpayment = $_POST['totalpayment'];


        $coupon50 = $_POST['coupon50'];
        //echo $coupon50;

        if ($coupon50 == 'use50') {


            $data["getCoupon50"] = $this->db->query("SELECT coupon50 FROM reward WHERE user_id = " .$userid.";");
            $getCoupon50 = 0;
            foreach ($data['getCoupon50']->result() as $row) {
                $getCoupon50 = $row->coupon50;
                //echo $getCoupon50;
            }

            if ($getCoupon50 >= 1) {

                $totalpayment -= 50;
                $this->db->query("UPDATE reward
                 SET coupon50 = coupon50-1
                 WHERE user_id =".$_SESSION['user']['user_id']);
            } else {
                //echo "You are not enough $50 coupon";
            }
        }


        $coupon100 = $_POST['coupon100'];
        //echo $coupon100;

        if ($coupon100 == 'use100') {


            $data["getCoupon100"] = $this->db->query("SELECT coupon100 FROM reward WHERE user_id = " . $userid . ";");
            $getCoupon100 = 0;
            foreach ($data['getCoupon100']->result() as $row) {
                $getCoupon100 = $row->coupon100;
                //echo $getCoupon100;
            }

            if ($getCoupon100 >= 1) {

                $totalpayment -= 100;
                $this->db->query("UPDATE reward
                 SET coupon100 = coupon100-1
                 WHERE user_id = " . $userid . ";");
            } else {
                //echo "You are not enough $100 coupon";
            }
        }


        $order_status = 'Success';
        //echo $order_status;

        $data["cartDetails"] = $this->db->query("SELECT cart_id, clothes.image_url, name, clothes_id, price, cart.quantity FROM clothes JOIN cart USING(clothes_id)
            JOIN category USING(category_id)
            WHERE user_id = " . $userid . "");


        $this->db->query("INSERT INTO orderlist(user_id, address, billing_name, order_status, deliver_date, total_payment)
           VALUES (" . $userid . ", '" . $addr . "', '" . $billing . "', '" . $order_status . "', CURDATE() + INTERVAL 5 DAY, " . $totalpayment . ")");

        //echo $totalpayment;

        if ($totalpayment >= 1000) {
            $this->db->query("UPDATE reward
                SET coupon50 = coupon50+1
                WHERE user_id = " . $userid . ";
                ");
            //echo "You got a coupon $50! ";
        }
        if ($totalpayment >= 3000) {
            $this->db->query("UPDATE reward
             SET coupon100 = coupon100+1
             WHERE user_id = " . $userid . ";
             ");
            //echo "You got a coupon $100! ";
        }


        $data["getOrder_id"] = $this->db->query("SELECT order_id FROM orderlist WHERE user_id = " . $userid . " ORDER BY order_id DESC LIMIT 1;");
        $getOrderid = 0;
        foreach ($data['getOrder_id']->result() as $row) {
            $getOrderid = $row->order_id;
            //echo $getOrderid;
        }
        foreach ($data['cartDetails']->result() as $row) {
            $this->db->query("INSERT INTO order_clothes(order_id, clothes_id, quantity, clothes_name)
             VALUE
             (" . $getOrderid . ", " . $row->clothes_id . ", " . $row->quantity . ",'" . $row->name . "')");
        }


        $this->db->query("UPDATE clothes SET quantity = quantity - " . $data['cartDetails']->row()->quantity . " WHERE clothes_id = " . $row->clothes_id);

        $this->db->query("DELETE FROM cart WHERE user_id = " . $userid . "");


        header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/order");


    }

    public function order()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";

            $this->load->view('header', $data);

            $userid = $_SESSION['user']['user_id'];

            $this->load->database();

            $data["orderDetails"] = $this->db->query("SELECT clothes.image_url, name, clothes_id,order_status,deliver_date, order_clothes.quantity FROM clothes
                JOIN order_clothes USING(clothes_id)
                JOIN category USING(category_id)
                JOIN orderlist USING(order_id)
                WHERE orderlist.user_id = " . $userid . " ORDER BY order_id DESC");

            $this->load->view('ordered_items', $data);


            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        } else {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login");
        }
    }


    public function login()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
        } else {
            $this->load->view('header', $data);
            $this->load->view('login_tab');
            $this->load->view('user_login_form');
            $this->load->view('sign_up_form');
            //$this->load->view('admin_login_form');
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        }
    }

    public function upload()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['size_model'] = $this->size_model->get_entity();
        $data['color_model'] = $this->color_model->get_entity();
        $data['category_model'] = $this->category_model->get_entity();
        $data['clothes_model'] = $this->clothes_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        // $this->load->database();

        // $sql_string = "INSERT INTO category(name, image_url, description, price)
        // VALUE ('".$_POST['name']."', '".$_POST['image_url']."', '".$_POST['description']."', '".$_POST['price']."')";
        // $this->db->query($sql_string);


        // $sql = "SELECT * FROM category";
        // $sql_query = $this->db->query($sql);
        // $data["query_category"] = $sql_query;
        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }
        if (isset($_SESSION['login']) && $_SESSION['login'] == true && $_SESSION['permission'] == "admin") {
            $this->load->view('header', $data);
            $this->load->view('upload_tab');
            $this->load->view('insert_category', $data);
            $this->load->view('insert_clothes', $data);
            $this->load->view('delete', $data);
            $this->load->view('update', $data);
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        } else if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
        } else {
            $this->load->view('header', $data);
            $this->load->view('login_tab');
            $this->load->view('user_login_form');
            $this->load->view('sign_up_form');
            //$this->load->view('admin_login_form');
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        }
    }

    public function blog()
    {
        $data['clothes_review_model'] = $this->clothes_model->get_entity();
        $data['type_model'] = $this->type_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        $this->load->database();

        if (isset($_POST['category_name'])&&isset($_POST['name'])&&isset($_POST['comment'])) {
            $sql_string = "INSERT INTO clothes_review(category_name, reviewer_name, comment) VALUE ('" . $_POST['category_name'] . "', '" . $_POST['name'] . "', '" . $_POST['comment'] . "')";
            $this->db->query($sql_string);
        }

        $sql = "SELECT * FROM clothes_review ORDER BY review_id DESC LIMIT 1";
        $sql_query = $this->db->query($sql);
        $data["query_comment"] = $sql_query;


        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }


        $this->load->view('header', $data);
        $this->load->view('comment_show', $data);
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');

    }

    public function insertCategoryResult()
    {   
        $sql_string = "INSERT INTO category(name, description, price, gender_id, type_id) VALUE ('" . $_POST['name'] . "', '" . $_POST['description'] . "', '" . $_POST['price'] . "','" . $_POST['gender'] . "','" . $_POST['type'] . "')";
        $this->db->query($sql_string);
        $sql = "SELECT * FROM category";
        $sql_query = $this->db->query($sql);
        $category_id = $sql_query->last_row('array')['category_id'];

        $this->previewCategory();

    }

    public function insertClothesResult()
    {
        $image = $_POST['image_url0'];


        if (isset($_POST['available_data']) && $_POST['available_data'] != '') {
            $available_data = "'" . $_POST['available_data'] . "'";
        } else {
            $available_data = 'NOW()';
        }

        $sql_string = "INSERT INTO clothes(clothes_date_avaliable, quantity, category_id, size_id, color_id, image_url) VALUE (" . $available_data . "," . $_POST['quantity'] . ", " . $_POST['category_id'] . ", " . $_POST['size'] . ",'" . $_POST['color'] . "','".$image."')";
        $this->db->query($sql_string);
        $sql = "SELECT * FROM clothes ORDER BY clothes_id ASC";
        $sql_query = $this->db->query($sql);
        $clothes_id = $sql_query->last_row('array')['clothes_id'];

        for ($i = 0; $i < $_POST['numOfImageURLS']; $i++) {
            $image = $_POST['image_url'.$i];
            if ($image != "") {
                $sql_string = "INSERT INTO clothes_image(clothes_id, image_url) VALUE (" . $clothes_id  . ",'". $image ."')";
                $sql_query = $this->db->query($sql_string);
            }
        }

        $sql = "SELECT * FROM clothes ORDER BY clothes_id ASC";
        $sql_query = $this->db->query($sql);


        $this->previewClothes();

    }

    public function selectdelete()
    {
        $sql_string = "SELECT * FROM category WHERE type_name = ('" . $_POST['type_name'] . "')";
        $this->db->query($sql_string);
    }

    public function previewCategory()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['size_model'] = $this->size_model->get_entity();
        $data['color_model'] = $this->color_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        $sql = "SELECT * FROM category JOIN gender USING(gender_id) JOIN type USING(type_id) ORDER BY category_id";
        $sql_query = $this->db->query($sql);
        $data["query_category"] = $sql_query->last_row('array');

        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $this->load->view('previewCategory', $data);
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');

    }

    public function previewClothes()
    {
        $data['type_model'] = $this->type_model->get_entity();
        $data['size_model'] = $this->size_model->get_entity();
        $data['color_model'] = $this->color_model->get_entity();
        $data['type'] = $this->db->query(" SELECT * FROM type");
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

        $sql = "SELECT * FROM category JOIN gender USING(gender_id) JOIN type USING(type_id) ORDER BY category_id";
        $sql_query = $this->db->query($sql);
        $data["query_category"] = $sql_query->last_row('array');

        $sql = "SELECT * FROM clothes JOIN color USING(color_id) JOIN size USING(size_id) ORDER BY clothes_id";
        $sql_query = $this->db->query($sql);
        $data["query_clothes"] = $sql_query->last_row('array');
        $clothes_id = $sql_query->last_row('array')['clothes_id'];

        $data['query_clothes_image'] = $this->db->query("SELECT * FROM clothes_image WHERE clothes_id=" . $clothes_id);

        session_start();
        $data['login_status'] = "login";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login";
        if (isset($_SESSION['login']) && $_SESSION['login'] == true) {
            $data['login_status'] = "logout";
            $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";
        }

        $this->load->view('header', $data);
        $this->load->view('previewClothes', $data);
        $this->load->view('advance_footer', $data);
        $this->load->view('footer');

    }

    public function deleteresult()
    {
        $sql_query = $this->db->query("SELECT name FROM category WHERE category_id = " . $_POST['category_id']);
        $category_name = $sql_query->row()->name;
        $sql_string = "DELETE FROM clothes_image WHERE clothes_id = ANY(SELECT clothes_id FROM clothes WHERE category_id = " . $_POST['category_id'] . ")";
        $this->db->query($sql_string);
        $sql_string = "DELETE FROM category WHERE category_id = ('" . $_POST['category_id'] . "')";
        $this->db->query($sql_string);
        $sql_string = "DELETE FROM clothes WHERE category_id = ('" . $_POST['category_id'] . "')";
        $this->db->query($sql_string);

        echo "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'></script>";
        echo "
            <script>
                alert('Delete successfully sent!\\n\\nCategory ID: " .  $_POST['category_id'] . "\\nCategory Name: " . $category_name . "');

                setTimeout(
                    function() {
                        window.location.href ='/CodeIgniter/index.php/store/upload#tab3';
                    } ,0
                );
            </script>";
    }

    public function updateresult()
    {
        $this->db->query("UPDATE clothes SET quantity=" . $_POST['quantity'] ." WHERE category_id=" . $_POST['category_id']);

        $sql_query = $this->db->query("SELECT name FROM category WHERE category_id = " . $_POST['category_id']);
        $category_name = $sql_query->row()->name;

        echo "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'></script>";
        echo "
            <script>
                alert('Update successfully sent!\\n\\nCategory ID: " .  $_POST['category_id'] . "\\nCategory Name: " . $category_name . "');

                setTimeout(
                    function() {
                        window.location.href ='/CodeIgniter/index.php/store/upload#tab4' ;
                    }, 0
                );
            </script>";

        //echo "<script>history.go(-1);</script>";

    }


    /********************Newly added********************************/


    public function categoryListWithJSON($keyword)
    {

        if (isset($keyword) && $keyword != "") {
           // $sql = "SELECT DISTINCT category_id,name,category_image_url,price,clothes_id FROM view_clothes WHERE name LIKE '%$keyword%' GROUP BY category_id LIMIT 0,10";
            $sql = "SELECT DISTINCT category_id, name FROM category WHERE name LIKE '%$keyword%' GROUP BY category_id LIMIT 0,10";
            $result = $this->db->query($sql);
            return json_encode($result->result_array());
        } else {
            $result['error'] = ture;
            return json_encode($result);
        }

    }

    public function categoryWithJSON()
    {

        if (isset($_POST['category_id']) && $_POST['category_id'] != "") {
            $category_id = $_POST['category_id'];
            $sql = "SELECT * FROM view_clothes WHERE category_id=$category_id";
            $result['data'] = $this->db->query($sql);
            $result['error'] = false;
            echo json_encode($result);
        } else {
            $result['error'] = ture;
            echo json_encode($result);
        }

    }


    public function search()
    {
//        $xmlDoc = new DOMDocument();
//        $xmlDoc->load("links.xml");

//        $x = $xmlDoc->getElementsByTagName('link');

        //get the q parameter from URL
        $q = $_GET["q"];

        $result = json_decode(($this->categoryListWithJSON($q)));

//        echo var_dump($result);

        $num_of_row = sizeof($result);
//        echo $num_of_row;

        $htmlResult = "<style>.liveResult {position:fixed;z-index:999;padding:0px 0px;font-size: 13px; }</style>";


        for ($i = 0; $i < $num_of_row; ++$i) {
            $htmlResult = $htmlResult . "<a href='http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/product_details/" . $result[$i]->category_id . "' target='_blank' class='liveResult'>" . $result[$i]->name . "</a><br/>";
        }

        echo $htmlResult;

    }


    public function userinfo()
    {
        $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
        $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");
        $data['type_model'] = $this->type_model->get_entity();

        session_start();
        $data['login_status'] = "logout";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";


        if (!isset($_SESSION['login']) && $_SESSION['login'] == false) {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login");
        } else {
            $this->load->model('user_model');
            $data['userinfo'] = json_decode($this->user_model->getUserInfo());
            $data['type_model'] = $this->type_model->get_entity();
            $data['type'] = $this->db->query(" SELECT type_id, type FROM type;");
            $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
            $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

            $this->load->view('header', $data);
            $this->load->view('userinfo', $data);
            $this->load->view('advance_footer');
            $this->load->view('footer');
        }

    }

    public function userinfoEdit()
    {

        $data['type_model'] = $this->type_model->get_entity();

        session_start();
        $data['login_status'] = "logout";
        if (isset($_SESSION["permission"]) && $_SESSION["permission"] != '')
            $data['permission'] = $_SESSION["permission"];
        else
            $data['permission'] = 'visitor';
        $data['login_status_link'] = "http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/user/logout";


        if (isset($_SESSION['login']) && $_SESSION['login'] == false) {
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
        } else {
            $this->load->model('user_model');
            $data['userinfo'] = json_decode($this->user_model->getUserInfo());
            
            $data['type_model'] = $this->type_model->get_entity();
            $data['type'] = $this->db->query(" SELECT type_id, type FROM type;");
            $data['menType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 1");
            $data['womenType'] = $this->db->query("SELECT * FROM type WHERE gender_id = 2");

            $this->load->view('header', $data);
            $this->load->view('userinfoedit', $data);
            $this->load->view('advance_footer', $data);
            $this->load->view('footer');
        }

    }

    public function editUserInfo()
    {

        session_start();
        if (isset($_POST['nick_name']) && isset($_POST['gender']) && isset($_POST['phone']) && isset($_POST['dob'])) {

            $sql_string = "UPDATE user SET nick_name='" . $_POST['nick_name'] . "' , gender='" . $_POST['gender'] . "', dob='" . $_POST['dob'] . "', phone=" . $_POST['phone'] . "  WHERE user_id=" . $_SESSION['user']['user_id'];
            $sql_query = $this->db->query($sql_string);
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/userinfo");
        }

    }


}
