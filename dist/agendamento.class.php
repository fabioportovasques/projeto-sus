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
					select 
						nome_especialidade,m.nome_medico, u.nome_ubs,u.bairro_ubs,
						a.data_agendamento,a.hora_agendamento,a.num_fichas
					from 
						agenda_ubs a 
					inner join ubs u on u.cod_ubs = a.ubs_cod_ubs
					inner join especialidade e on e.cod_especialidade = a.especialidade_cod_especialidade
					inner join medico m on m.cod_medico = a.medico_cod_medico
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