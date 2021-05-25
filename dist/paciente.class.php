

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

  class Paciente {

	private $pdo;

	public function __construct( ) {

		//conexão banco de dados

		$this -> pdo = new PDO("mysql:dbname=bd-sus;host=localhost","root","F@bio102030");
	
		}


						//create

		

<<<<<<< HEAD
		public function adicionar ($nome_pac,$sobrenome_pac,$data_nascimento_pac,
		$cpf_pac,$rg_pac,$rua_pac,$bairro_pac,$cidade_pac,$cep_pac,
		$uf_pac,$pais_pac,$email_pac,$telefone1_pac,$telefone2_pac,$cartao_sus,$numero_casa,
		$sexo_pac,$ubs_cod_ubs,$senha) {
			if($this->verificaCpf($cpf_pac) == false) {
					$sql = $this->pdo->prepare("INSERT INTO paciente SET nome_pac = :nome_pac,sobrenome_pac =:sobrenome_pac,
					data_nascimento_pac=:data_nascimento_pac,cpf_pac=:cpf_pac,rg_pac=:rg_pac,rua_pac=:rua_pac,bairro_pac=:bairro_pac,
					cidade_pac=:cidade_pac,cep_pac=:cep_pac,uf_pac=:uf_pac,pais_pac=:pais_pac,email_pac=:email_pac,telefone1_pac=:telefone1_pac,
					telefone2_pac=:telefone2_pac,cartao_sus=:cartao_sus,numero_casa=:numero_casa,sexo_pac=:sexo_pac,ubs_cod_ubs=:ubs_cod_ubs,
					senha = MD5(:senha)");
					

					$sql->bindParam(":nome_pac",$nome_pac);
					$sql->bindParam(":sobrenome_pac",$sobrenome_pac);
					$sql->bindParam(":data_nascimento_pac",$data_nascimento_pac);
					$sql->bindParam(":cpf_pac",$cpf_pac);
					$sql->bindParam(":rg_pac",$rg_pac);
					$sql->bindParam(":rua_pac",$rua_pac);
					$sql->bindParam(":bairro_pac",$bairro_pac);
					$sql->bindParam(":cidade_pac",$cidade_pac);
					$sql->bindParam(":cep_pac",$cep_pac);
					$sql->bindParam(":uf_pac",$uf_pac);
					$sql->bindParam(":pais_pac",$pais_pac);
					$sql->bindParam(":email_pac",$email_pac);
					$sql->bindParam(":telefone1_pac",$telefone1_pac);
					$sql->bindParam(":telefone2_pac",$telefone2_pac);
					$sql->bindParam(":cartao_sus",$cartao_sus);
					$sql->bindParam(":numero_casa",$numero_casa);
					$sql->bindParam(":sexo_pac",$sexo_pac);
					$sql->bindParam(":ubs_cod_ubs",$ubs_cod_ubs);
					$sql->bindParam(":senha",$senha);
=======

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
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Paciente Inserido Com Sucesso!
						</div>';
<<<<<<< HEAD
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';
=======
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						CPF Já Existe!
						</div>';
<<<<<<< HEAD
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';
=======
				print '<script>window.setTimeout(function(){window.location=\'cad-medico.php\';}, 2000);</script>';
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf


				}

			

				
			}	
				

			private function verificaCpf ($cpf_cliente) {

			$sql = "select * FROM paciente WHERE cpf_pac = :cpf_pac";
			$sql = $this->pdo->prepare($sql);
			$sql->bindValue(':cpf_pac', $cpf_pac);
			$sql->execute();

			if($sql->rowCount() > 0) {
				return true;
			} else {
				return false;
			}


		}	


			
	}