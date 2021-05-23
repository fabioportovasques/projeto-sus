<?php 

	session_start();

	

	if (!isset($_SESSION['usuario']) ) {
		header('location:index.php');
		exit();
	}else{
		
		require 'config.php';
		 //buscar o usuario na variavel de sessao
		$select = "
		select * FROM permissao WHERE usuario = '".$_SESSION['usuario']."'
			and 
		recurso = '".$_SERVER['PHP_SELF']."'; 
		";
		$resultado = $conexao->query($select)->fetchAll(); //retorna o vetor
		/*
			Se a contagem de elementos em resultado for zero 
			significa que não há permissao

		*/

		if (count($resultado) == 0  ) {
			header('location:erro_permissao.php');
			exit();
		}	






	}

		
	
	

?>