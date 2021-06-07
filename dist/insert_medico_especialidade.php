<?php

	include 'modelo/espec.class.php';

	$espec = new Espec();


		

	if (!empty($_POST['cpf_user']) ){

	
		

		$especialidade_cod_especialidade = $_POST['especialidade_cod_especialidade'];
		$medico_cod_medico = $_POST['medico_cod_medico'];
		

		/*
		?>
		<pre>
		<?php
		print_r($_POST);
		?>
		</pre>
		<?php	
		*/



		$espec ->adicionar($especialidade_cod_especialidade,$medico_cod_medico);


		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF 
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'vincular_espec.php\';}, 2000);</script>';

	}

	