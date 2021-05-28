<?php 

try {

	$pdo = new PDO("mysql:dbname=sus;host=localhost","root","");

} catch(PDOException $e) {
	echo "ERRO: ".$e->getMessage();
	exit;



}


