<?php

/**
 * Created by IntelliJ IDEA.
 * User: Gilgamesh
 * Date: 11/28/2015
 * Time: 4:07 PM
 */
class User_model extends CI_Model
{


    public function storeUser($name, $email, $password) {
        $uuser_id = uniqid('', true);
        $hash = $this->hashSSHA($password);
        $encrypted_password = $hash["encrypted"]; // encrypted password
        $salt = $hash["salt"]; // salt
        $result = $this->db->query("INSERT INTO User( nick_name, email, encrypted_password, salt, created_at) VALUES( '$name', '$email', '$encrypted_password', '$salt', NOW())");
        // check for successful store
        if ($result) {
            $this->insertRewardSystem($email);
            // get user details
//            $result = $this->db->query("SELECT * FROM user WHERE email = '$email'");
            $this->db->from('user');
            $condition['email']=$email;
            $this->db->where($condition);

            $result=$this->db->get();
            // return user details
            return $result->result_array();
        } else {
            return false;
        }
    }

    public function insertRewardSystem($email){
        $this->db->from('user');
        $condition['email']=$email;
        $this->db->where($condition);
        $result=$this->db->get();
        $result = $result->row_array();

        $sql_insertReward="INSERT INTO reward(user_id) VALUES(".$result['user_id'].")";

        $this->db->query($sql_insertReward);
    }

    /**
     * Get user by email and password
     */
    public function getUserByEmailAndPassword($email, $password) {
        $this->db->from('user');
        $condition['email']=$email;
        $this->db->where($condition);
        $result=$this->db->get();
        // check for result
        $no_of_rows = $result->num_rows();
        if ($no_of_rows > 0) {
            $result = $result->row_array();
            $salt = $result['salt'];
            $encrypted_password = $result['encrypted_password'];
            $hash = $this->checkhashSSHA($salt, $password);
            // check for password equality
            if ($encrypted_password == $hash) {
                // user authentication details are correct
                //Update token
                $currentToken=$this->getToken($email);
                $this->db->query("UPDATE User SET token='$currentToken' WHERE email = '$email'") or die(mysql_error());
                $result = $this->db->query("SELECT * FROM User WHERE email = '$email'") or die(mysql_error());
                return $result->result_array()[0];
            }
        } else {
            // user not found
            return false;
        }
    }


    public function getUserByEmailAndPasswordAsAdmin($email, $password) {
        $this->db->from('user');
        $condition['email']=$email;
        $condition['permission']='admin';
        $this->db->where($condition);
        $result=$this->db->get();
        // check for result
        $no_of_rows = $result->num_rows();
        if ($no_of_rows > 0) {
            $result = $result->row_array();
            $salt = $result['salt'];
            $encrypted_password = $result['encrypted_password'];
            $hash = $this->checkhashSSHA($salt, $password);
            // check for password equality
            if ($encrypted_password == $hash) {
                // user authentication details are correct
                //Update token
                $currentToken=$this->getToken($email);
                $this->db->query("UPDATE User SET token='$currentToken' WHERE email = '$email'") or die(mysql_error());
                $result = $this->db->query("SELECT * FROM User WHERE email = '$email'") or die(mysql_error());
                return $result->result_array()[0];
            }
        } else {
            // user not found
            return false;
        }
    }


    public function getUserByToken() {
        if(isset($_SESSION['user']['token'])&&$_SESSION['user']['token']!="")
            $token=$_SESSION['user']['token'];
        else
            $token="";

        $this->db->from('user');
        $condition['token']=$token;
        $this->db->where($condition);
        $result=$this->db->get();
        // check for result
        $no_of_rows = $result->num_rows();
        if ($no_of_rows > 0) {
            $result = $result->row_array();
            return $result;
        } else {
            // user not found
            return false;
        }
    }

    /**
     * Check user is existed or not
     */
    public function isUserExisted($email) {
        $result = $this->db->query("SELECT email from user WHERE email = '$email'");
        $no_of_rows = $result->num_rows();
        if ($no_of_rows > 0) {
            // user existed
            return true;
        } else {
            // user not existed
            return false;
        }
    }

    /**
     * Encrypting password
     * @param password
     * returns salt and encrypted password
     */
    public function hashSSHA($password) {

        $salt = sha1(rand());
        $salt = substr($salt, 0, 10);
        $encrypted = base64_encode(sha1($password . $salt, true) . $salt);
        $hash = array("salt" => $salt, "encrypted" => $encrypted);
        return $hash;
    }

    /**
     * Decrypting password
     * @param salt, password
     * returns hash string
     */
    public function checkhashSSHA($salt, $password) {

        $hash = base64_encode(sha1($password . $salt, true) . $salt);

        return $hash;
    }

    public function getToken($email){
        do{
            $token = bin2hex(openssl_random_pseudo_bytes(10));
            $temp = $this->db->query("SELECT * FROM User WHERE token = '$email'") or die(mysql_error());
            $no_of_rows = $temp->num_rows();
        }while($no_of_rows>0);
        return $token;
    }


    public function getUserInfo()
    {
//        session_start();
        if (isset($_SESSION['user']['token']))
            $userInfo=$this->user_model->getUserByToken();


        return json_encode($userInfo);

    }


}
