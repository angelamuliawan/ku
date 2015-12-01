<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class General extends AB_Controller {

	public function douploadimage(){
		
		//Load Uploader Library
		$config['upload_path'] = 'packaged/images/registereduser';
		$config['allowed_types'] = 'gif|jpg|png';

		$this->load->library('upload', $config);

		if (!$this->upload->do_upload('qqfile')) {
			$error = array('error' => $this->upload->display_errors());
			echo json_encode(array('status' => "-1", 'msg' => $error));

		} else {
			$data = array('upload_data' => $this->upload->data());

			//crop image
			$config['image_library'] = 'gd2';
			$config['source_image'] ='packaged/images/registereduser/'.$data['upload_data']['file_name'];

			//Get file extention
			$info = pathinfo($data['upload_data']['file_name']);
			$extention = $info['extension'];

			$name = uniqid("image_",true).'.'.$extention;

			$config['new_image'] = 'packaged/images/registereduser/'.$name;

			$this->load->library('my_image');
			$this->my_image->resize_crop($config);

			//Delete temporary file
			unlink('packaged/images/registereduser/'.$data['upload_data']['file_name']);

			echo json_encode(array('status' => "1", 'name' => $name));
		}
	}

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */