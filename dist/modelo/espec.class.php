	

<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>

		
        <link rel="stylesheet" href="css/style.css">
        <link href="css/styles.css" rel="stylesheet"/>
        <link href="css/style.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body>

</body>
</html>


  <?php 

  class Espec  {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=sus;host=localhost","root","F@bio102030");
	
		}


						//create

		

		public function adicionar ($especialidade_cod_especialidade,$medico_cod_medico) {
			if($this->verificaCod($medico_cod_medico) == false) {
					$sql = $this->pdo->prepare("INSERT INTO especialidade_compoe_medico SET especialidade_cod_especialidade = :especialidade_cod_especialidade,medico_cod_medico=:medico_cod_medico
					");
					

					$sql->bindParam(":especialidade_cod_especialidade",$especialidade_cod_especialidade);
					$sql->bindParam(":medico_cod_medico",$medico_cod_medico);
					
					
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						 Especialidade Vinculada com sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad_vincular_espec.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						o Medico já possui essa especialidade!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';


				}

			

				
			}	
				

			private function verificaCod ($medico_cod_medico) {

			$sql = "select * FROM especialidade_compoe_medico WHERE medico_cod_medico = :medico_cod_medico";
			$sql = $this->pdo->prepare($sql);
			$sql->bindValue(':medico_cod_medico', $medico_cod_medico);
			$sql->execute();

			if($sql->rowCount() > 0) {
				return true;
			} else {
				return false;
			}


		}	

public function pesquisar ( ) {

 								$sql= "
										select
										*
										from 
										usuario u 
										inner join medico m on m.usuario_cod_user = u.cod_user

 										WHERE cpf_user like  '".$_POST['cpf_user']."'
										;

 								";

 							

 		 					$sql = $this->pdo->query($sql);

							if ($sql->rowCount() > 0) {

								//retorna todos os clientes
								return $sql ->fetchAll();

							
					}	

			}



			
	}