<?php

	include 'cliente.class.php';

	$cliente = new Cliente();


		

	if (!empty($_POST['cpf_cliente'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$nome_cliente = $_POST['nome_cliente'];
		$sobrenome_cliente = $_POST['sobrenome_cliente'];
		$telefone1_cliente = $_POST['telefone1_cliente'];
		$telefone2_cliente= $_POST['telefone2_cliente'];
		$cpf_cliente = $_POST['cpf_cliente'];
		$rg_cliente = $_POST['rg_cliente'];
		$rua_cliente = $_POST['rua_cliente'];
		$numero_rua_cliente = $_POST['numero_rua_cliente'];
		$cidade_cliente = $_POST['cidade_cliente'];
		$uf_cliente = $_POST['uf_cliente'];
		$data_nascimento_cliente = $_POST['data_nascimento_cliente'];
		$sexo_cliente = $_POST['sexo_cliente'];
		$bairro_cliente = $_POST['bairro_cliente'];
		$cep_cliente = $_POST['cep_cliente'];

		//$cliente ->verificaCpf($cpf_cliente);

		$cliente ->adicionar($nome_cliente,$sobrenome_cliente,$telefone1_cliente,
		$telefone2_cliente,$cpf_cliente,$rg_cliente,$rua_cliente,$numero_rua_cliente,
		$cidade_cliente,$uf_cliente,$data_nascimento_cliente,$sexo_cliente,$bairro_cliente,$cep_cliente);

		
	}