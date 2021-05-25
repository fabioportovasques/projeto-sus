<?php

<<<<<<< HEAD
	include 'paciente.class.php';

	$paciente = new Paciente();
=======
	include 'medico.class.php';

	$medico = new medico();
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf


		

<<<<<<< HEAD
	if (!empty($_POST['cpf_pac'])) {
=======
	if (!empty($_POST['cpf_medico'])) {
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

<<<<<<< HEAD
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

=======
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
>>>>>>> c59fd953f0599bd0a209dc20f529255460f3b1cf

		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

	}