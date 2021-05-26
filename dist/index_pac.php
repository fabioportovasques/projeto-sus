

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <!--<link rel="stylesheet" href="css/bootstrap.min.css">-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style-login.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <title>TEC SUS</title>
  </head>
  <body>

    <div id="central-login">
      <div class="content" align="center">
        <label class="label-control label">TEC SUS LOGIN PACIENTE</label>
        <form method="POST" action="login_pac.php" class="col-sm-4">
          <div class="input-container">            
            <i class="fa fa-user icon"></i>
              <input type="text" name="cpf_pac" class="form-control" autocomplete="off" placeholder="CPF" required=""><br>
          </div>

          <div class="input-container">
            <i class="fa fa-key icon"></i>
              <input type="password" name="senha" class="form-control" placeholder="***********" required=""><br>
          </div>

          <input type="submit" name="Entrar" value="Entrar" class="btn btn-outline-success btn-lg btn-block">
        </form>
      </div>
    </div>
    

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  </body>
</html>