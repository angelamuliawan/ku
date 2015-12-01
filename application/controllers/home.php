<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends AB_Controller {

	public function index() {
		$pageContent = $this->load->view('content/home', '',  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}

	public function doLogin() {
		$post = $this->rest->post();
		$res = $this->db->query('CALL CheckLogin(?,?)', array(
			$post->username, 
			sha1($post->password)
		));
		$data = $res->result();
		
		if($data[0]->UserID != -1) {
			$this->session->set_userdata('loggedin', true);
			$this->session->set_userdata('userid', $data[0]->UserID);
			$this->session->set_userdata('username', $data[0]->UserName);
			$this->session->set_userdata('usertype', $data[0]->UserType);
			$this->session->set_userdata('userrole', $data[0]->Role);
		}

		return $this->load->view('json_view', array('json' => $data));
	}
	
	public function doLogout(){
		$this->load->helper('url');
		$this->session->sess_destroy();
		redirect('home');
	}

	public function loadTopTest(){
		$res = $this->db->query('CALL GetTopTest');
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */