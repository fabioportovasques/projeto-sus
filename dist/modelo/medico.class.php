	

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

  class Medico {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=sus;host=localhost","root","F@bio102030");
	
		}


						//create

		

		public function adicionar ($usuario_ubs_cod_ubs,$usuario_cod_user) {
			if($this->verificaCod($usuario_cod_user) == false) {
					$sql = $this->pdo->prepare("INSERT INTO medico SET usuario_ubs_cod_ubs = :usuario_ubs_cod_ubs,usuario_cod_user =:usuario_cod_user
					");
					

					$sql->bindParam(":usuario_ubs_cod_ubs",$usuario_ubs_cod_ubs);
					$sql->bindParam(":usuario_cod_user",$usuario_cod_user);
					
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						 Medico Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						O Usuário já é um medico!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';


				}

			

				
			}	
				

			private function verificaCod ($usuario_cod_user) {

			$sql = "select * FROM medico WHERE usuario_cod_user = :usuario_cod_user";
			$sql = $this->pdo->prepare($sql);
			$sql->bindValue(':usuario_cod_user', $usuario_cod_user);
			$sql->execute();

			if($sql->rowCount() > 0) {
				return true;
			} else {
				return false;
			}


		}	


			public function pesquisar ( ) {

							if($_POST['pesquisar'] ) {

							//$pesquisar= $_POST['cpf_cliente'];
							// preg_replace('/[^0-9]/', '', $pesquisar);
			
 							if (empty($_POST['cpf_user'])) {
 								//Se for vázio
 								$cpf_user = $_POST['cpf_user'];
 								echo $cpf_user;

 								print '<div class="alert alert-danger" role="alert">
									  Favor preencher o campo CPF!
									</div>';
								print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';
 								
 							} else {
 								
 								$sql= "

								select 
									*
								from 
									usuario u 
								

 								WHERE cpf_user like  '".$_POST['cpf_user']."' ";

 							}


 		 					$sql = $this->pdo->query($sql);

							if ($sql->rowCount() > 0) {

								//retorna todos os clientes
								return $sql ->fetchAll();

							}else {
								return 


								print '<div class="alert alert-danger" role="alert">
									  Médico Não Encontrado!
									</div>';
								print '<script>window.setTimeout(function(){window.location=\'pesq-medico.php\';}, 4000);</script>';

							}
				
					}		

			}


			
	}