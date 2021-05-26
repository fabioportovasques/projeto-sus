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



		public function adicionar ($nome_medico,$sobrenome_medico,$telefone1_medico,$telefone2_medico,
			$cpf_medico,$rg_medico,$rua_medico,$numero_rua_medico,$cidade_medico,$uf_medico,$data_nascimento_medico,$sexo_medico,$bairro_medico,$cep_medico) {
			if($this->verificaCpf($cpf_medico) == false) {
					$sql = $this->pdo->prepare("INSERT INTO medico SET nome_medico = :nome_medico, sobrenome_medico = :sobrenome_medico,
					telefone1_medico =:telefone1_medico,telefone2_medico =:telefone2_medico,cpf_medico =:cpf_medico,rg_medico=:rg_medico,rua_medico=:rua_medico,
					numero_rua_medico=:numero_rua_medico,cidade_medico=:cidade_medico,uf_medico=:uf_medico,data_nascimento_medico=:data_nascimento_medico,
					sexo_medico=:sexo_medico,bairro_medico=:bairro_medico,cep_medico=:cep_medico");
					

					$sql->bindParam(":nome_medico",$nome_medico);
					$sql->bindParam(":sobrenome_medico",$sobrenome_medico);
					$sql->bindParam(":telefone1_medico",$telefone1_medico);
					$sql->bindParam(":telefone2_medico",$telefone2_medico);
					$sql->bindParam(":cpf_medico",$cpf_medico);
					$sql->bindParam(":rg_medico",$rg_medico);
					$sql->bindParam(":rua_medico",$rua_medico);
					$sql->bindParam(":numero_rua_medico",$numero_rua_medico);
					$sql->bindParam(":cidade_medico",$cidade_medico);
					$sql->bindParam(":uf_medico",$uf_medico);
					$sql->bindParam(":data_nascimento_medico",$data_nascimento_medico);
					$sql->bindParam(":sexo_medico",$sexo_medico);
					$sql->bindParam(":bairro_medico",$bairro_medico);
					$sql->bindParam(":cep_medico",$cep_medico);
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						CPF Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';


				}


		
		}
		


						


			
	}