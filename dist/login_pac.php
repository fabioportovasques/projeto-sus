


<?php
session_start();
require 'config.php';



if (isset($_POST['cpf_pac']) && !empty($_POST['cpf_pac'])) {

    $cpf_pac = $_POST['cpf_pac'];
    $senha = $_POST['senha'];



    $sql = "SELECT * FROM paciente WHERE cpf_pac = :cpf_pac AND senha = MD5(:senha)";
    $sql = $pdo->prepare($sql);
    $sql->bindValue(":cpf_pac", $cpf_pac);
    $sql->bindValue(":senha", $senha);
    $sql->execute();

    if ($sql->rowCount() > 0) {                                   //Se Houve Resultado...

        $sql = $sql->fetch();
        $cod_pac = $sql['cod_pac'];
        $cpf_pac = $sql['cpf_pac'];
      


        $_SESSION['lg'] = $cod_pac; 
        $_SESSION['nome_pac'] = $nome_pac;

        

        header("Location: dashboard.php");
        exit;

        

    } else {


        ?>
        <script>
            {
                alert("Usuário não encontrado");
                window.location="index_pac.php";
            }
        </script>
        <?php 




     } 
        

    }



?>