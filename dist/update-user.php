<?php

	include 'modelo/user.class.php';

	$user = new User();

		$user ->editar($nome_user,$sobrenome_user,$email_user,
						$data_nascimento_user,$sexo_user,$cartao_sus,
						$telefone1_user,$telefone2_user,
						$cep_user,$cidade_user,$rua_user,$bairro_user,					
						$pais_user,$rg_user,$cpf_user,
						$uf_user,$senha,$ubs_cod_ubs,$status);
