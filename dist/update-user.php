<?php

	include 'modelo/user.class.php';

	$user = new User();

		$user ->editar($nome_user,$sobrenome_user,$data_nascimento_user,$sexo_user,
			$email_user,$cartao_sus,$telefone1_user,$telefone2_user,$cep_user,
			$cidade_user,$rua_user,$bairro_user,$uf_user,$pais_user,$rg_user,$numero_casa,
			$cpf_user

			);
