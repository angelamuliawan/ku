<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ListCategory extends AB_Controller {

	public function index() {
		$pageContent = $this->load->view('content/listcategory', '',  TRUE);
		$this->load->view('master/master', array('pageContent'=>$pageContent));
	}
	public function getCategoryPerDegree(){
		$res = $this->db->query("CALL GetCategoryPerDegree");
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */