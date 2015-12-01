<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Register extends AB_Controller {

	public function index() {
		
		$pageContent = $this->load->view('content/register', '',  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}
	
	public function insertuser() {
		$post = $this->rest->post();
		$res = $this->db->query('CALL InsertUser(?,?,?,?,?,?,?)', array(
			$post->username, 
			$post->fullname,
			$post->photo ,
			sha1($post->password),
			$post->email, 
			$post->usertype, 
			'Guest' 
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */