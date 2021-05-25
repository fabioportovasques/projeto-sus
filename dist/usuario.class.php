

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

		$this -> pdo = new PDO("mysql:dbname=bd-sus;host=localhost","root","F@bio102030");
	
		}


						//create

		

		public function adicionar ($usuario,$senha) {
			if($this->verificaUser($usuario) == false) {
					$sql = $this->pdo->prepare("INSERT INTO usuario SET usuario = :usuario,senha = MD5(:senha)");
					

					$sql->bindParam(":usuario",$usuario);
					$sql->bindParam(":senha",$senha);
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Usuario Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
					Usuário Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';


				}

			

				
			}	
				

			private function verificaUser ($usuario) {

			$sql = "select * FROM usuario WHERE usuario = :usuario";
			$sql = $this->pdo->prepare($sql);
			$sql->bindValue(':usuario', $usuario);
			$sql->execute();

			if($sql->rowCount() > 0) {
				return true;
			} else {
				return false;
			}


		}	


			
	}