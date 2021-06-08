<?php

	include 'modelo/consulta.class.php';

	$consulta = new Consulta();


		

	if (!empty($_POST['cartao_sus']) ){

	
		

		$cartao_sus = $_POST['cartao_sus'];
		$nome_user = $_POST['nome_user'];
		$sobrenome_user = $_POST['sobrenome_user'];
		$especialidade_cod_especialidade = $_POST['especialidade_cod_especialidade'];
		$usuario_cod_user = $_POST['usuario_cod_user'];
		

		
		?>
		<pre>
		<?php
		print_r($_POST);
		?>
		</pre>
		<?php	
		

		/*

		$espec ->adicionar($especialidade_cod_especialidade,$medico_cod_medico);


		
	}else {

				print '<div class="alert alert-warning" role="alert">
						Favor preencher o campo CPF 
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'vincular_espec.php\';}, 2000);</script>';

	}

	*/

}