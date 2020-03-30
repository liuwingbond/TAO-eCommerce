<?php
if(!defined('BASEPATH')) exit('No direct script access allowed');

class test extends CI_Controller {

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

        $data['test']['temp_model']['title']='temp_model';
        $data['test']['temp_model']['data']=$this->temp_model->get_entity();

        $data['test']['gender_model']['title']='gender_model';
        $data['test']['gender_model']['data']=$this->gender_model->get_entity();


        $data['test']['type_model']['title']="type_model";
        $data['test']['type_model']['data']=$this->type_model->get_entity();


        $data['test']['category_model']['title']='category_model';
        $data['test']['category_model']['data']=$this->category_model->get_entity();


        $data['test']['clothes_model']['title']='clothes_model';
        $data['test']['clothes_model']['data']=$this->clothes_model->get_entity();


        $data['test']['size_model']['title']='size_model';
        $data['test']['size_model']['data']=$this->size_model->get_entity();


        $data['test']['color_model']['title']='color_model';
        $data['test']['color_model']['data']=$this->color_model->get_entity();


        $this->load->view('test',$data);
    }

    public function insert()
    {
        $arg['data'] = $_POST['data'];
        // $arg['color'] = $_POST['color'];
        // $arg['image_url'] = $_POST['image_url'];


        $data['test']=$this->temp_model->insert_drupal($arg);

        $this->index();
    }

    public function form()
    {
        $this->load->view('form');

    }

    public function view()
    {
        $data['test']=$this->view_clothes_model->get_entity();

        $this->load->view('view',$data);
    }
}
