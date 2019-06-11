<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dash extends CI_Controller {
	private $items;

	function __construct()
    {
		parent::__construct();
		$this->load->model('Dashs');
		$this->load->model('Groups');
		$this->load->model('Customers');
		$this->load->model('Calendar');

	}

	/**
	 * Inicializa el Menú: carga la librería y el modelo e inicializa el menu.
	 *
	 * @return	void
	 */
	private function _init_Menu()
	{
		// Ejecuta la consulta y obtiene el arreglo de datos
		$items = $this->Groups->mnuAll();
		//dump_exit($items);
		//agrego los permisos de ejecucion al menu
		$this->items = $this->addPermisosItemsMenu($items);
		//dump_exit($this->items);
		// Carga la librería y pasa el arreglo de datos
		$this->load->library("multi_menu");
		$this->multi_menu->set_items($this->items);
	}

	/**
	 *
	 *
	 */
	private function _trae_empresas() {
		$empresas = $this->Groups->traeEmpresas();
		if($empresas) {
			$enterprisedata[0]['empresas'] = $empresas;
			$this->session->set_userdata('enterprise_data', $enterprisedata);
		}
	}

	public function index()
	{
		$this->_init_Menu();// Inicializa el menu
		$this->_trae_empresas();// trae las empresas del usuario

		$this->load->view('header');
		$userdata       = $this->session->userdata('user_data');
		$enterprisedata = $this->session->userdata('enterprise_data');
		//dump_exit($enterprisedata);

		if( !$userdata )
		{
			redirect( base_url() );
		}
		else
		{
			//dump_exit($userdata);
			$data['usrimag']      = $userdata[0]['usrimag'];
			$data['userName']     = $userdata[0]['usrNick'];
			$data['grpId']        = $userdata[0]['grpId'];
			$data['descEmpresas'] = $userdata[0]['descripcion'];
			$data['empresas']     = $enterprisedata[0]['empresas'];
			//para el dash x defecto segun grupo de usr
			$data['grpDash']    = $this->Groups->grpDash($userdata[0]['grpId']);
			//$data['permission'] = $this->items['seguridad'];

			$this->load->view('dash', $data);
			$this->load->view('menu');
			$this->load->view('content');
			$this->load->view('footerdash');
			$this->load->view('footer');
		}
	}

	/**
	 *
	 */
	public function cambiarDeEmpresa()
	{
		$idNewEmpresa = $this->input->post('idNewEmpresa');
		$cambioOk     = $this->Dashs->cambiarDeEmpresa($idNewEmpresa);
		if($cambioOk) {
			//cambio grpId, empresaId y descripcion(empresa) en datos de sesion

			echo json_encode(true);
		}
		else {
			echo json_encode(false);
		}
	}

	/**
	 * agrega los permisos de ejecucion a los items del menu.
	 *
	 * @param 	array 	$items 	Todos los elementos del menu sin permisos.
	 * @return 	array 			Todos los elementos del menu con permisos.
	 */
	public function addPermisosItemsMenu($items)
	{
		$this->items = $items;
		//dump_exit($this->items);
		foreach ($this->items as &$value) {
			/*echo '<pre>';
			print_r($value);
			echo '</pre>';*/
			$fn = $this->Groups->mnuPermisos($value['id'], $value['grpId']);
			$n = 0;
			$permissions = "";
			//con foreach da error
			/*foreach ($fn as $item) {
				$permissions .= $item['actDescription']."-";
				$n++;
			}*/
			for($i=0; $i<sizeof($fn); $i++) {
				$permissions .= $fn[$i]['actDescription']."-";
			}
			$value['seguridad'] = $permissions;
		}

		return $this->items;
	}
	
    public function calendar()
    {
        $this->load->model('Preventivos');
        $data['list'] = $this->Preventivos->getPreventivosPorHora();
        $data['permission'] = $permission;
        $this->load->view('calendar/calendar', $data);
    }

}
