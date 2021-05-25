<?php

	include 'usuario.class.php';

	$user = new User();


		

	if (!empty($_POST['usuario'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		

		$usuario = $_POST['usuario'];
		$senha = $_POST['senha'];
	
					

		$user ->adicionar($usuario,$senha);


		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo Usuario!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-pac.php\';}, 2000);</script>';

	}