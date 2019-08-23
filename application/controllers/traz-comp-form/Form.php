<?php defined('BASEPATH') or exit('No direct script access allowed');

class Form extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();

        $this->load->model(FRM.'Forms');
    }

    public function obtener($info, $modal = false)
    {

        $html = form($this->Forms->obtener($info), $modal);

        if($modal)
        {
            $modal = new StdClass();
            $modal->id = "frm-modal-$info";
            $modal->titulo = 'Formulario Tarea';
            $modal->body = $html;
            $modal->accion = 'Guardar';

            $html = modal($modal);
        }

        $data['html'] = $html;
        
        echo json_encode($data);
    }

    public function guardar($info_id = false)
    {
        $data = $this->input->post();

        foreach ($data as $key => $o) {

            $rsp = strpos($key, 'file');

            if ($rsp > 0) {
                $nom = str_replace("-file-", "", $key);
                $data[$nom] = $this->uploadFile($nom);
                unset($data[$key]);
            }

            if (is_array($o)) {
                $data[$key]  = implode('-', $o);
            } 

        }

        if ($info_id) {

            $res = $this->Forms->actualizar($info_id, $data);

        } else {

            $res = $this->Forms->guardar($form_id, $data);

        }

        echo json_encode(true);
    }

    public function uploadFile($nom)
    {
        $conf = [
            'upload_path' => './files/',
            'allowed_types' => '*',
            'max_size' => '*',
        ];

        $this->load->library("upload", $conf);

        if (!$this->upload->do_upload($nom)) {

            log_message('DEBUG', 'Error al Subir el Archivo ' . $nom);

            return false;

        }

        log_message('DEBUG', 'Archivo Subido con Exito ' . $nom);

        return $this->upload->data()['file_name'];

    }
}
