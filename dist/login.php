


<?php
session_start();
require 'config.php';



if (isset($_POST['usuario']) && !empty($_POST['usuario'])) {

    $usuario = $_POST['usuario'];
    $senha = $_POST['senha'];

    $sql = "SELECT * FROM usuario WHERE usuario = :usuario AND senha = MD5(:senha) AND status = 'A' ";
    $sql = $pdo->prepare($sql);
    $sql->bindValue(":usuario", $usuario);
    $sql->bindValue(":senha", $senha);
    $sql->execute();

    if ($sql->rowCount() > 0) {                                   //Se Houve Resultado...

        $sql = $sql->fetch();
        $cod_user = $sql['cod_user'];
        $usuario = $sql['usuario'];
      


        $_SESSION['lg'] = $cod_user; 
        $_SESSION['usuario'] = $usuario;

        

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