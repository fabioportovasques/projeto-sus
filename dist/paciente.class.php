

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
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Paciente Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						CPF Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';


				}

			

				
			}	
				

			private function verificaCpf ($cpf_pac) {

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