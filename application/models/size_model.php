<?php

/**
 * Created by IntelliJ IDEA.
 * User: Gilgamesh
 * Date: 11/28/2015
 * Time: 4:07 PM
 */
class Size_model extends CI_Model
{



    public function __construct()
    {
        parent::__construct();
    }


    public function get_entity()
    {
        $query = $this->db->get('size');


        return $query->result_array();
    }



}
