<?php

/**
 * Created by IntelliJ IDEA.
 * User: Gilgamesh
 * Date: 11/28/2015
 * Time: 4:07 PM
 */
class Gender_model extends CI_Model
{



    public function __construct()
    {
        parent::__construct();
    }



    public function get_entity()
    {
        $query = $this->db->get('gender');


        return $query->result_array();
    }


    public function insert_drupal($arg)
    {

        $this->db->insert('color', $arg);
    }

}
