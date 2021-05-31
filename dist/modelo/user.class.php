

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

		

		public function adicionar ($nome_user,$sobrenome_user,$email_user,$data_nascimento_user,$sexo_user,
			$cartao_sus,$telefone1_user,$telefone2_user,$cep_user,$cidade_user,$rua_user,$bairro_user,
			$pais_user,$rg_user,$cpf_user,$uf_user,$senha,$ubs_cod_ubs,$status ) {
			if($this->verificaCpf($cpf_user) == false) {
					$sql = $this->pdo->prepare("INSERT INTO usuario SET nome_user=:nome_user, sobrenome_user=:sobrenome_user,
					 email_user=:email_user,data_nascimento_user=:data_nascimento_user,sexo_user=:sexo_user,cartao_sus=:cartao_sus,
					 telefone1_user=:telefone1_user,telefone2_user=:telefone2_user,
					 cep_user=:cep_user,cidade_user=:cidade_user,rua_user=:rua_user,bairro_user=:bairro_user,uf_user=:uf_user,
					  pais_user=:pais_user,rg_user=:rg_user,cpf_user=:cpf_user,senha = MD5(:senha), ubs_cod_ubs =:ubs_cod_ubs,status=:status
					");
					
					$sql->bindParam(":nome_user",$nome_user);
					$sql->bindParam(":sobrenome_user",$sobrenome_user);
					$sql->bindParam(":email_user",$email_user);
					$sql->bindParam(":data_nascimento_user",$data_nascimento_user);
					$sql->bindParam(":sexo_user",$sexo_user);
					$sql->bindParam(":telefone1_user",$telefone1_user);
					$sql->bindParam(":telefone2_user",$telefone2_user);
					$sql->bindParam(":cartao_sus",$cartao_sus);
					$sql->bindParam(":cep_user",$cpf_user);
					$sql->bindParam(":cidade_user",$cidade_user);
					$sql->bindParam(":rua_user",$rua_user);
					$sql->bindParam(":bairro_user",$bairro_user);
					$sql->bindParam(":uf_user",$uf_user);
					$sql->bindParam(":pais_user",$pais_user);
					$sql->bindParam(":rg_user",$rg_user);
					$sql->bindParam(":cpf_user",$cpf_user);
					$sql->bindParam(":senha",$senha);
					$sql->bindParam(":ubs_cod_ubs",$ubs_cod_ubs);								
					$sql->bindParam(":status",$status);
					$sql->execute();
			
				print '<div class="alert alert-success" role="alert">
						  Usuário Inserido Com Sucesso!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-user.php\';}, 2000);</script>';

				} else {
					
				print '<div class="alert alert-warning" role="alert">
						Usuario Já Existe!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-user.php\';}, 2000);</script>';


				}

			

				
			}	
				

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
 								
 								$sql= "SELECT * FROM usuario WHERE cpf_user like  '".$_POST['cpf_user']."' ";

 							}


 		 					$sql = $this->pdo->query($sql);

							if ($sql->rowCount() > 0) {

								//retorna todos os clientes
								return $sql ->fetchAll();

							}else {
								return array();
							}
				
					}		

			}


			public function editar ( ) {


					if (empty($_POST['cpf_user'])) {
						//Se for vázio

						print '<div class="alert alert-danger" role="alert">
						  Favor preencher o CPF!
						</div>';
						print '<script>window.setTimeout(function(){window.location=\'pesq-user.php\';}, 2000);</script>';
						
					} else {

		$nome_user = $_POST['nome_user'];
		$sobrenome_user = $_POST['sobrenome_user'];
		$email_user = $_POST['email_user'];
		$data_nascimento_user = $_POST['data_nascimento_user'];
		$sexo_user = $_POST['sexo_user'];
		$cartao_sus = $_POST['cartao_sus'];
		$telefone1_user = $_POST['telefone1_user'];		
		$telefone2_user = $_POST['telefone2_user'];
		$cep_user = $_POST['cep_user'];
		$cidade_user = $_POST['cidade_user'];
		$rua_user = $_POST['rua_user'];
		$bairro_user = $_POST['bairro_user'];
		$uf_user = $_POST['uf_user'];
		$pais_user = $_POST['pais_user'];
		$rg_user = $_POST['rg_user'];
		$cpf_user = $_POST['cpf_user'];
		$senha = $_POST['senha'];
		$ubs_cod_ubs = $_POST['ubs_cod_ubs'];
		$status = $_POST['status'];


				    // 
				        //defino os parâmetros de conexão com o banco de dados
				        //$pdo = new PDO('mysql:host=localhost;dbname=bd-gbi', $username, $password);
				        //$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				        //preparo minha query
				    	$sql = "UPDATE usuario SET nome_user=:nome_user, sobrenome_user=:sobrenome_user,
							 email_user=:email_user,data_nascimento_user=:data_nascimento_user,sexo_user=:sexo_user,cartao_sus=:cartao_sus,
							 telefone1_user=:telefone1_user,telefone2_user=:telefone2_user,
							 cep_user=:cep_user,cidade_user=:cidade_user,rua_user=:rua_user,bairro_user=:bairro_user,uf_user=:uf_user,
							  pais_user=:pais_user,rg_user=:rg_user,cpf_user=:cpf_user,senha = MD5(:senha), ubs_cod_ubs =:ubs_cod_ubs,status=:status
					   	WHERE cpf_user = :cpf_user";
						$sql = $this->pdo->prepare($sql);
					$sql->bindParam(":nome_user",$nome_user);
					$sql->bindParam(":sobrenome_user",$sobrenome_user);
					$sql->bindParam(":email_user",$email_user);
					$sql->bindParam(":data_nascimento_user",$data_nascimento_user);
					$sql->bindParam(":sexo_user",$sexo_user);
					$sql->bindParam(":telefone1_user",$telefone1_user);
					$sql->bindParam(":telefone2_user",$telefone2_user);
					$sql->bindParam(":cartao_sus",$cartao_sus);
					$sql->bindParam(":cep_user",$cpf_user);
					$sql->bindParam(":cidade_user",$cidade_user);
					$sql->bindParam(":rua_user",$rua_user);
					$sql->bindParam(":bairro_user",$bairro_user);
					$sql->bindParam(":uf_user",$uf_user);
					$sql->bindParam(":pais_user",$pais_user);
					$sql->bindParam(":rg_user",$rg_user);
					$sql->bindParam(":cpf_user",$cpf_user);
					$sql->bindParam(":senha",$senha);
					$sql->bindParam(":ubs_cod_ubs",$ubs_cod_ubs);								
					$sql->bindParam(":status",$status);		
					$sql->execute();

				        

						print '<div class="alert alert-success" role="alert">
							Usuario  Atualizado com Sucesso!
							</div>';
						print '<script>window.setTimeout(function(){window.location=\'pesq-user.php\';}, 2000);</script>';

					}
			}		



			
	}