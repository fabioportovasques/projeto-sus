<?php

	include 'modelo/agendamento.class.php';

	$agendamento = new Agendamento();


		

	if (!empty($_POST['cpf_user'])) {

		/*remove a mascara do campo cpf/cnpj para inserir no banco*/
		
		$ubs_cod_ubs = $_POST['ubs_cod_ubs'];
		$usuario_cod_user=$_POST['usuario_cod_user'];
		$medico_cod_medico =$_POST['medico_cod_medico'];
		$especialidade_cod_especialidade = $_POST['especialidade_cod_especialidade'];
		$data_agendamento = $_POST['data_agendamento'];
		$hora_agendamento = $_POST['hora_agendamento'];
		$num_fichas = $_POST['num_fichas'];
		$status_agenda = $_POST['status_agenda'];

		/*

		?>
		<pre>
		<?php 	
		print_r($_POST);
		?>
		</pre>
		
		*/

		

	

		
		
		$agendamento ->adicionar($ubs_cod_ubs,$usuario_cod_user,$medico_cod_medico,
								$especialidade_cod_especialidade,$data_agendamento,$hora_agendamento,
								$num_fichas,$status_agenda);
		
		
		
	}else {

				print '<div class="alert alert-danger" role="alert">
						Favor preencher o campo CPF!
						</div>';
				print '<script>window.setTimeout(function(){window.location=\'cad-agendamento.php\';}, 2000);</script>';

	}