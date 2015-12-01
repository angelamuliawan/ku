<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class BackEnd extends AB_Controller {

	public function user_authorize(){
		if( $this->session->userdata('loggedin') == NULL || $this->session->userdata('userrole') != 1 ) {
			redirect('home');
		}
	}
	
	public function index() {
		$this->user_authorize();
		$pageContent = $this->load->view('content/backend', '',  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}

	public function getDegree() {
		$res = $this->db->query("CALL GetDegree");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   	}

   	public function getCategory(){
   		$this->user_authorize();
		$res = $this->db->query("CALL GetCategory");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   	}

   	public function getCategoryByDegreeID(){
		$post = $this->rest->post();
		$res = $this->db->query("CALL GetCategoryByDegreeID(?)", array(
			$post->DegreeID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
   	}

   	public function getLevel(){
   		$this->user_authorize();
		$res = $this->db->query("CALL GetLevel");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
  	}

    public function GetUserAndTest(){
   		$this->user_authorize();
		$res = $this->db->query("CALL GetUserAndTest");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
   	}

	public function GetUserAndAnswer(){
		$this->user_authorize();
		$res = $this->db->query("CALL GetUserAndAnswer");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function GetAllTest(){
		$this->user_authorize();
		$res = $this->db->query("CALL GetAllTest");
		$data = $res -> result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function changeDegree(){
		$this->user_authorize();
		$post = $this->rest->post();
		if( $post->DegreeID == -1 ) {
			$res = $this->db->query("CALL insertDegree(?,?)", array(
				$post->DegreeName,
				$this->session->userdata('username')
			));
		} else {
			$res = $this->db->query("CALL EditDegree(?,?)", array(
				$post->DegreeName,
				$this->session->userdata('username')
			));
		}
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function changeLevel(){
		$this->user_authorize();
		$post = $this->rest->post();

		if( $post->LevelID == -1 ) {
			$res = $this->db->query("CALL InsertLevel(?,?)", array(
				$post->LevelName,
				$this->session->userdata('username')
			));
		} else {
			$res = $this->db->query("CALL EditLevel(?,?,?)", array(
				$post->LevelID,
				$post->LevelName,
				$this->session->userdata('username')
			));
		}
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function changeCategory(){
		$this->user_authorize();
		$post = $this->rest->post();

		if( $post->CategoryID == -1 ) {
			$res = $this->db->query("CALL InsertCategory(?,?,?,?)", array(
				$post->CategoryID,
				$post->CategoryName,
				$post->DegreeID,
				$this->session->userdata('username')
			));
		} else {
			$res = $this->db->query("CALL EditCategory(?,?,?,?)", array(
				$post->CategoryID,
				$post->CategoryName,
				$post->DegreeID,
				$this->session->userdata('username')
			));
		}
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function deleteDegree(){
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query("CALL DeleteDegree(?,?)", array(
			$post->DegreeID,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function deleteLevel(){
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query("CALL DeleteLevel(?,?)", array(
			$post->LevelID,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function deleteCategory(){
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query("CALL DeleteCategory(?,?)", array(
			$post->CategoryID,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function deleteUser(){
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query("CALL DeleteUser(?,?)", array(
			$post->UserID,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function deleteTest(){
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query("CALL DeleteTest(?,?)", array(
			$post->TestID,
			$this->session->userdata('username')
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */