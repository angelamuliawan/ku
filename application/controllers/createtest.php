<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class CreateTest extends AB_Controller {

	public function do_alert($message){
		echo '<script type="text/javascript">alert('+$message+')</script>';
	}

	public function user_authorize(){
		if( $this->session->userdata('loggedin') == NULL ) {
			redirect('home');
		}
	}

	public function index() {
		$this->user_authorize();
		$pageContent = $this->load->view('content/createtest', '',  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}

	public function insertTest() {
		$post = $this->rest->post();
		$res = $this->db->query("CALL InsertTest(?,?,?,?,?,?,?,?,?,?)", array(
			$post->TestName,
			$post->TestDescription,
			$post->CategoryID,
			$post->LevelID,
			$post->AccessType, 
			$this->session->userdata('userid'),
			$post->PublishStartDate,
			$post->PublishEndDate, 
			$post->UploadTutorial,
			$this->session->userdata('username')
		));
		$TestID = $res->result()[0]->ID;
		$this->load->view('json_view', array('json' => $TestID));
	}
	
	public function insertTestDetail(){
		$post = $this->rest->post();
		
		$TestID = $post->TestID;
		$listTestDetail = $post->listTestDetail;
		$listTestDetailAnswer = $post->listTestDetailAnswer;
		
		for($i = 0; $i < count($listTestDetail); $i++){
			
			$res = $this->db->query("CALL InsertTestDetail(?,?,?,?)", array(
				$listTestDetail[$i]->TestQuestion, 
				$listTestDetail[$i]->TestURL,
				$TestID,
				$this->session->userdata('username')
			));
			$TestDetailID = $res->result()[0]->ID;
			
			for($j = 0; $j < count($listTestDetailAnswer[$i]); $j++){
				$this->db->query('CALL InsertTestDetailAnswer(?,?,?,?,?)', array(
					$listTestDetailAnswer[$i][$j]->TestDetailAnswerName, 
					$listTestDetailAnswer[$i][$j]->TestDetailURL,
					$listTestDetailAnswer[$i][$j]->isAnswer,
					$TestDetailID,
					$this->session->userdata('username')
				))->result();
			}
		}
		$this->load->view('json_view', array('json' => 1));
	}
	
	public function uploadfile() {
		$config['upload_path'] = 'packaged';
		$config['allowed_types'] = 'doc|docx|zip|rar|pdf|xls';
	
		$this->load->library('upload', $config);
	
		if (!$this->upload->do_upload('qqfile')) {
			$error = array('error' => $this->upload->display_errors());
			echo json_encode(array('status' => "-1", 'msg' => $error));
		}
		else {
			$data = array('upload_data' => $this->upload->data());
			$ext = $data['upload_data']['file_ext'];
			$name = $data['upload_data']['file_name'];		
			echo json_encode(array('status' => "1", 'name' => $name,'ext' => $ext));
		}
	}
	
	public function getDegree(){
		$this->user_authorize();
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
		$this->user_authorize();
		$post = $this->rest->post();

		$res = $this->db->query('CALL GetCategoryByDegreeID(?)', array(
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */