 <!--

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

		links bootstrap
        <link rel="stylesheet" href="css/style.css">
        <link href="css/styles.css" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>

</body>
</html>

-->

  <?php 

  class Agendamento {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=bd-sus;host=localhost","root","F@bio102030");
	
		}

		


							public function select (){

					$sql = "
				
						select m.cod_medico, m.nome_medico,sobrenome_medico,a.hora_agendamento,a.num_fichas,
							a.data_agendamento,m.cidade_medico, u.cod_ubs, u.bairro_ubs,e.nome_especialidade,
							u.nome_ubs AS 'lOCAL DE ATENDIMENTO'
						from
							medico m 
						inner join medico_atende_ubs me on m.cod_medico = me.medico_cod_medico
						inner join ubs u on u.cod_ubs = me.ubs_cod_ubs
						inner join especialidade_compoe_medico espec on m.cod_medico = espec.medico_cod_medico
						inner join especialidade e on e.cod_especialidade = espec.especialidade_cod_especialidade
						inner join agenda_ubs a on a.cod_agenda = espec.especialidade_cod_especialidade
						where 
							cod_ubs='1' AND status_agenda ='a'

						;

						";
						

 		 					$sql = $this->pdo->query($sql);

							if ($sql->rowCount() > 0) {

								//retorna todos os clientes
								return $sql ->fetchAll();

							}else {
								return array();
							}
					
					

							


				}


			
	}