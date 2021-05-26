<?php

	include 'medico.class.php';

	$medico = new medico();


		

	if (!empty($_POST['cpf_medico'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$nome_medico = $_POST['nome_medico'];
		$sobrenome_medico = $_POST['sobrenome_medico'];
		$telefone1_medico = $_POST['telefone1_medico'];
		$telefone2_medico= $_POST['telefone2_medico'];
		$cpf_medico = $_POST['cpf_medico'];
		$rg_medico = $_POST['rg_medico'];
		$rua_medico = $_POST['rua_medico'];
		$numero_rua_medico = $_POST['numero_rua_medico'];
		$cidade_medico = $_POST['cidade_medico'];
		$uf_medico = $_POST['uf_medico'];
		$data_nascimento_medico = $_POST['data_nascimento_medico'];
		$sexo_medico = $_POST['sexo_medico'];
		$bairro_medico = $_POST['bairro_medico'];
		$cep_medico = $_POST['cep_medico'];

		//$medico ->verificaCpf($cpf_medico);

		$medico ->adicionar($nome_medico,$sobrenome_medico,$telefone1_medico,
		$telefone2_medico,$cpf_medico,$rg_medico,$rua_medico,$numero_rua_medico,
		$cidade_medico,$uf_medico,$data_nascimento_medico,$sexo_medico,$bairro_medico,$cep_medico);

		
	}