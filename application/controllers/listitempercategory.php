<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ListItemPerCategory extends AB_Controller {

	public function index($param = 0) {
		$data = array('CategoryID' => $param);
		$pageContent = $this->load->view('content/listitempercategory', $data,  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}
	
	public function getDegreeWithCategory(){
		$post = $this->rest->post();
		$res = $this->db->query("CALL GetDegreeWithCategory(?)", array(
			$post->categoryID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function getListItemPerCategory(){
		$post = $this->rest->post();
		$res = $this->db->query("CALL GetListItemPerCategory(?)", array(
			$post->categoryID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */