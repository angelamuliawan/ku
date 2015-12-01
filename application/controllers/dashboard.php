<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends AB_Controller {
	
	public function user_authorize(){
		if( $this->session->userdata('loggedin') == NULL ) {
			redirect('home');
		}
	}

	public function index() {
		$this->user_authorize();
		$pageContent = $this->load->view('content/dashboard', '',  TRUE);

		$this->load->view('master/master', array('pageContent' => $pageContent));
	}

	public function getUserProfile() {
		$this->user_authorize();
		$res = $this->db->query('CALL GetUserProfile(?)',  array(
			$this->session->userdata('userid')
		));
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function changeUserProfile(){
		$this->user_authorize();
		$post = $this->rest->post();
		$res = $this->db->query('CALL ChangeUserProfile(?,?,?,?,?)', array(
			$this->session->userdata('userid'),
			$post->fullname,
			$post->email,
			$post->photo,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function changePassword() {
		$this->user_authorize();
		$post = $this->rest->post();
		$res = $this->db->query('CALL ChangePassword(?,?,?,?)', array(
			$this->session->userdata('userid'),
			sha1($post->password),
			sha1($post->newpassword),
			$this->session->userdata('username')
		));
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */