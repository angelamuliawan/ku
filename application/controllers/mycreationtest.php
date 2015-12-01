<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MyCreationTest extends AB_Controller {

	public function user_authorize(){
		if( $this->session->userdata('loggedin') == NULL ) {
			redirect('home');
		}
	}

	public function index() {
		$this->user_authorize();
		$pageContent = $this->load->view('content/mycreationtest', '',  TRUE);

		$this->load->view('master/master', array('pageContent' => $pageContent));
	}

	public function getCreationTest(){
    	$this->user_authorize();
		$res = $this->db->query('CALL GetCreationTest(?)', array(
			$this->session->userdata('userid')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   	}

   	public function getNumberOfPeople(){
    	$this->user_authorize();
    	$post = $this->rest->post();
		$res = $this->db->query('CALL GetNumberOfPeople', array(
			$post->testid
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */