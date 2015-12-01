<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class TakeTest extends AB_Controller {

	public function index($param = 0) {
		$data = array('TestID' => $param);
		$pageContent = $this->load->view('content/taketest', $data,  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}
	
	public function getQuestionList(){
		$post = $this->rest->post();
		$res = $this->db->query('CALL GetQuestionList(?)', array(
			$post->TestID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function getOptionList(){
		$post = $this->rest->post();
		$res = $this->db->query('CALL GetTestDetailByTestID(?)', array(
			$post->TestID
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}
	
	public function insertUserAnswer(){
		$post = $this->rest->post();
		$listUserAnswerDetail = $post->listUserAnswerDetail;

		$res = $this->db->query('CALL InsertUserAnswer(?,?,?,?,?)', array(
			$post->TestID, 
			$post->isInvited,
			$this->session->userdata('userid'),
			$post->email,
			$this->session->userdata('username')
		));

		$UserAnswerID = $res->result()[0]->ID;
		
		for($i = 0; $i < count($listUserAnswerDetail); $i++){
			$this->db->query('CALL InsertUserAnswerDetail(?,?,?,?)', array(
				$UserAnswerID,
				$listUserAnswerDetail[$i]->TestDetailID,
				$listUserAnswerDetail[$i]->TestDetailAnswerID,
				$this->session->userdata('username')
			))->result();
		}

		$this->load->view('json_view', array('json' => 1));
	}
	
	public function checkUserAnswer(){
		$post = $this->rest->post();
		$res = $this->db->query('CALL CheckUserAnswer(?,?,?)', array(
			$post->TestID,
			$this->session->userdata('userid'),
			$post->email
		));
		$data = $res->result();
		$this->load->view('json_view', array('json' => $data));
	}

	public function insertTestDetail(){
		$post = $this->rest->post();
		
		$TestID = $post->TestID;
		$listTestDetail = $post->listTestDetail;
		$listTestDetailAnswer = $post->listTestDetailAnswer;
		
		for($i = 0; $i < count($listTestDetail); $i++){
			
			$res = $this->db->query('CALL InsertTestDetail(?,?,?,?)', array(
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */