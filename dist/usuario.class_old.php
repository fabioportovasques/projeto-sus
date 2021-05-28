

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

  class User {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=sus;host=localhost","root","F@bio102030");
	
		}


						//create

		

		public function add ($ubs_cod_ubs) {
			//if($this->verificaCpf($cpf_user) == false) {
					$sql = $this->pdo->prepare("INSERT INTO usuario SET ubs_cod_ubss=:ubs_cod_ubs
											 ");
					
					$sql->bindParam(":ubs_cod_ubs",$ubs_cod_ubs);
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Usuario Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-user.php\';}, 2000);</script>';

				} 

				/*

				else {
					
				print '<div class="alert alert-warning" role="alert">
					Usuário Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-user.php\';}, 2000);</script>';


				}

			

				
			}	
				/*

			private function verificaCpf ($cpf_user) {

			$sql = "select * FROM usuario WHERE cpf_user = :cpf_user";
			$sql = $this->pdo->prepare($sql);
			$sql->bindValue(':cpf_user', $cpf_user);
			$sql->execute();

			if($sql->rowCount() > 0) {
				return true;
			} else {
				return false;
			}


		}	

		*/


			
	}