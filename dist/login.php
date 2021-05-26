


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


        ?>
        <script>
            {
                alert("Usuário não encontrado");
                window.location="index.php";
            }
        </script>
        <?php 




     } 
        

    }



?>