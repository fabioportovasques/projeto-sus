<?php

	include 'paciente.class.php';

	$paciente = new Paciente();


		

	if (!empty($_POST['cpf_user'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$usuario_ubs_cod_ubs = $_POST['usuario_ubs_cod_ubs'];
		$usuario_cod_user = $_POST['usuario_cod_user'];
		
		echo $usuario_ubs_cod_ubs;
		echo $usuario_cod_user;
					

		$usuario ->adicionar($usuario_ubs_cod_ubs,$usuario_cod_user);


		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

	}