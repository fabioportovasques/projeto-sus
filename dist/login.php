<!DOCTYPE html>
<html>
<head>
    <title></title>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>

</body>
</html>


<?php
session_start();
require 'config.php';



if (isset($_POST['cpf_user']) && !empty($_POST['cpf_user'])) {

    $cpf_user = $_POST['cpf_user'];
    $senha = $_POST['senha'];


   

    $sql = "SELECT * FROM usuario WHERE cpf_user = :cpf_user AND senha = MD5(:senha) AND status = 'A' ";
    $sql = $pdo->prepare($sql);
    $sql->bindValue(":cpf_user", $cpf_user);
    $sql->bindValue(":senha", $senha);
     
    $sql->execute();

    if ($sql->rowCount() > 0) {                                   //Se Houve Resultado...

        $sql = $sql->fetch();
        $cod_user = $sql['cod_user'];
        $cpf_user = $sql['cpf_user'];
        $nome_user = $sql['nome_user'];
      


        $_SESSION['lg'] = $cod_user; 
        $_SESSION['nome_user'] = $nome_user;

        

        header("Location: dashboard.php");
        exit;

        

    } else {



                print '<div class="alert alert-warning" role="alert">
                        Usuário ou Senha Incorretos!
                        </div>';
                print '<script>window.setTimeout(function(){window.location=\'index.php\';}, 2000);</script>';


        

     } 
        

    }



?>