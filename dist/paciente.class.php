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


						//create



		public function adicionar ($nome_cliente,$sobrenome_cliente,$telefone1_cliente,$telefone2_cliente,
			$cpf_cliente,$rg_cliente,$rua_cliente,$numero_rua_cliente,$cidade_cliente,$uf_cliente,$data_nascimento_cliente,$sexo_cliente,$bairro_cliente,$cep_cliente) {
			if($this->verificaCpf($cpf_cliente) == false) {
					$sql = $this->pdo->prepare("INSERT INTO cliente SET nome_cliente = :nome_cliente, sobrenome_cliente = :sobrenome_cliente,
					telefone1_cliente =:telefone1_cliente,telefone2_cliente =:telefone2_cliente,cpf_cliente =:cpf_cliente,rg_cliente=:rg_cliente,rua_cliente=:rua_cliente,
					numero_rua_cliente=:numero_rua_cliente,cidade_cliente=:cidade_cliente,uf_cliente=:uf_cliente,data_nascimento_cliente=:data_nascimento_cliente,
					sexo_cliente=:sexo_cliente,bairro_cliente=:bairro_cliente,cep_cliente=:cep_cliente");
					

					$sql->bindParam(":nome_cliente",$nome_cliente);
					$sql->bindParam(":sobrenome_cliente",$sobrenome_cliente);
					$sql->bindParam(":telefone1_cliente",$telefone1_cliente);
					$sql->bindParam(":telefone2_cliente",$telefone2_cliente);
					$sql->bindParam(":cpf_cliente",$cpf_cliente);
					$sql->bindParam(":rg_cliente",$rg_cliente);
					$sql->bindParam(":rua_cliente",$rua_cliente);
					$sql->bindParam(":numero_rua_cliente",$numero_rua_cliente);
					$sql->bindParam(":cidade_cliente",$cidade_cliente);
					$sql->bindParam(":uf_cliente",$uf_cliente);
					$sql->bindParam(":data_nascimento_cliente",$data_nascimento_cliente);
					$sql->bindParam(":sexo_cliente",$sexo_cliente);
					$sql->bindParam(":bairro_cliente",$bairro_cliente);
					$sql->bindParam(":cep_cliente",$cep_cliente);
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-cliente.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						CPF Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-cliente.php\';}, 2000);</script>';


				}


		
		}
		


						


			
	}