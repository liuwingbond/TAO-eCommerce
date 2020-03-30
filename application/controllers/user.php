<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
    }


    public function register()
    {
        // Request type is Register new user
        $name = $_POST['name'];
        $email = $_POST['email'];
        $password = $_POST['password'];

        // check if user is already existed
        if ($this->user_model->isUserExisted($email)) {
            // user is already existed - error response
            $response["error"] = TRUE;
            $response["error_msg"] = "This email already existed. Please use another email";
            echo "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'></script>";
            echo "
                <script>
                    alert('Register Unsuccessful\\n\\nThis email is already existed. Please use another email');
                    window.location.href ='/CodeIgniter/index.php/store';
                </script>";
            echo "<script>setTimeout(function() { window.location.href ='http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login' ;}, 1000);</script>";


        } else {
            // store user
            $user = $this->user_model->storeUser($name, $email, $password);
            if ($user) {
                // user stored successfully
                $row = $user;
                $response["error"] = FALSE;
                $response["user_id"] = $row['user_id'];
                $response["user"]["name"] = $row["nick_name"];
                $response["user"]["email"] = $row["email"];
                $response["user"]["created_at"] = $row["created_at"];
                $response["user"]["updated_at"] = $row["update_at"];
                echo json_encode($response);
                $this->login($email, $password);
                header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
            } else {
                // user failed to store
                $response["error"] = TRUE;
                $response["error_msg"] = "Error occured in Registration";
                echo json_encode($response);
                header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
            }
        }
    }

    public function login()
    {
        // Request type is check Login
        if (isset($_POST['email']))
            $email = $_POST['email'];
        if (isset($_POST['password']))
            $password = $_POST['password'];

        // check for user
        $user = $this->user_model->getUserByEmailAndPassword($email, $password);
        if ($user != false) {
            // user found
            $response["error"] = FALSE;

            $response["user_id"] = $user["user_id"];
            $response["name"] = $user["nick_name"];
            $response["email"] = $user["email"];
            $response["token"] = $user["token"];
            $response["permission"]=$user["permission"];
            echo json_encode($response);
            session_start();
            $_SESSION['user'] = $response;
            $_SESSION['login'] = true;
            $_SESSION["permission"]=$response["permission"];

            echo $_SESSION['login'];
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");

        } else {
            // user not found
            // echo json with error = 1
            $response["error"] = TRUE;
            $response["error_msg"] = "Incorrect email or password!";
            echo "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'></script>";
            echo "
                <script>
                    alert('Login Unsuccessful\\n\\nIncorrect email or password');
                    window.location.href ='/CodeIgniter/index.php/store/login';
                </script>";
            //header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login");
            echo json_encode($response);
        }
    }

    public function loginAsAdmin()
    {
        // Request type is check Login
        if (isset($_POST['email']))
            $email = $_POST['email'];
        if (isset($_POST['password']))
            $password = $_POST['password'];

        // check for user
        $user = $this->user_model->getUserByEmailAndPasswordAsAdmin($email, $password);
        if ($user != false) {
            // user found
            $response["error"] = FALSE;

            $response["user_id"] = $user["user_id"];
            $response["name"] = $user["nick_name"];
            $response["email"] = $user["email"];
            $response["token"] = $user["token"];
            $response["permission"]=$user["permission"];
            echo json_encode($response);
            session_start();
            $_SESSION['user'] = $response;
            $_SESSION['login'] = true;
            $_SESSION["permission"]=$response["permission"];

            echo $_SESSION['login'];
            header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");

        } else {
            // user not found
            // echo json with error = 1
            $response["error"] = TRUE;
            $response["error_msg"] = "Incorrect user_type or email or password!";
            echo "<h1>" . $response['error_msg'] . "</h1>";
            echo "<a id='link' href='http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login'>Come back</a>";
            echo "<script src='http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js'>

                        alert('Login unsuccessful!\\n\\nIncorrect email or password');</script>";

            echo "<script>setTimeout(function() { window.location.href ='http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store/login' ;},1000);</script>";
        }
    }

    public function logout()
    {
        session_start();
        session_destroy();
        header("Location: http://" . $_SERVER['SERVER_NAME'] . "/CodeIgniter/index.php/store");
    }
}
