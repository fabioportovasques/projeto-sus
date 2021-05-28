<?php 

try {

	$pdo = new PDO("mysql:dbname=sus;host=localhost","root","F@bio102030");

} catch(PDOException $e) {
	echo "ERRO: ".$e->getMessage();
	exit;



}


