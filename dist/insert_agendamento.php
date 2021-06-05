<?php

	include 'modelo/agendamento.class.php';

	$agendamento = new Agendamento();


		

	if (!empty($_POST['cpf_user'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$usuario_ubs_cod_ubs = $_POST['usuario_ubs_cod_ubs'];
		$usuario_cod_user = $_POST['usuario_cod_user'];
		$crm_medico = $_POST['crm_medico'];
		
		
					

		$agendamento ->adicionar($usuario_ubs_cod_ubs,$usuario_cod_user,$crm_medico);


		
	}else {

				print '<div class="alert alert-danger" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-agendamento.php\';}, 2000);</script>';

	}