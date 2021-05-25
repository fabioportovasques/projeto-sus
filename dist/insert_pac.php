<?php

	include 'paciente.class.php';

	$paciente = new Paciente();


		

	if (!empty($_POST['cpf_pac'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$nome_pac = $_POST['nome_pac'];
		$sobrenome_pac = $_POST['sobrenome_pac'];
		$data_nascimento_pac = $_POST['data_nascimento_pac'];
		$cpf_pac = $_POST['cpf_pac'];
		$rg_pac = $_POST['rg_pac'];
		$rua_pac = $_POST['rua_pac'];
		$bairro_pac = $_POST['bairro_pac'];
		$cidade_pac = $_POST['cidade_pac'];
		$cep_pac = $_POST['cep_pac'];
		$uf_pac = $_POST['uf_pac'];		
		$pais_pac = $_POST['pais_pac'];
		$email_pac = $_POST['email_pac'];
		$telefone1_pac = $_POST['telefone1_pac'];
		$telefone2_pac= $_POST['telefone2_pac'];
		$cartao_sus = $_POST['cartao_sus'];
		$numero_casa = $_POST['numero_casa'];
		$sexo_pac = $_POST['sexo_pac'];
		$ubs_cod_ubs = $_POST['ubs_cod_ubs'];
		$senha = $_POST['senha'];
	
		
					

		$paciente ->adicionar($nome_pac,$sobrenome_pac,$data_nascimento_pac,
		$cpf_pac,$rg_pac,$rua_pac,$bairro_pac,$cidade_pac,$cep_pac,
		$uf_pac,$pais_pac,$email_pac,$telefone1_pac,$telefone2_pac,$cartao_sus,$numero_casa,
		$sexo_pac,$ubs_cod_ubs,$senha);


		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

	}