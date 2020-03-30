<?php

/**
 * Created by IntelliJ IDEA.
 * User: Gilgamesh
 * Date: 11/28/2015
 * Time: 4:07 PM
 */
class Category_model extends CI_Model
{

    public $record;

    public function __construct()
    {
        parent::__construct();
    }



    public function get_entity()
    {
        $query = $this->db->get('category');


        return $query->result_array();

    }


    public function insert_entry()
    {
        $record['color']=223;
        $record['image_url'] = 22;

        $this->db->insert('color', $record);
    }



}
