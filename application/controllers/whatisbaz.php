<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class WhatIsBaz extends AB_Controller {

	public function index() {
		$pageContent = $this->load->view('content/whatisbaz', '',  TRUE);
		$this->load->view('master/master', array('pageContent' => $pageContent));
	}
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */