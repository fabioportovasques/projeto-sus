<?php

	include 'modelo/user.class.php';

	$user = new User();


		

	if (!empty($_POST['cpf_user'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		
		
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
		$tipo_user = $_POST['tipo_user'];
		
		/*

		echo $nome_user . "<br/>";
		echo $sobrenome_user. "<br/>";;
		echo $senha. "<br/>";;
		echo $ubs_cod_ubs. "<br/>";;
		echo $cpf_user. "<br/>";;
		echo $rg_user. "<br/>";;
		echo $cartao_sus. "<br/>";;	

		*/
		
		$user ->adicionar($nome_user,$sobrenome_user,$email_user,
						$data_nascimento_user,$sexo_user,$cartao_sus,
						$telefone1_user,$telefone2_user,
						$cep_user,$cidade_user,$rua_user,$bairro_user,						
						$pais_user,$rg_user,$cpf_user,
						$uf_user,$senha,$ubs_cod_ubs,$status,$tipo_user
						);

		
	}else 


	{

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-user.php\';}, 2000);</script>';

	}

	
