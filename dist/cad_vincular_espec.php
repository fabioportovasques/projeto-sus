<?php
session_start();
require 'config.php';
if(empty($_SESSION['lg'])) {
    header("Location: index.php");
    exit;
}
   require 'modelo/medico.class.php';
   require 'modelo/espec.class.php';

          $espec = new Espec();

         $lista = $espec->pesquisar();
            foreach ($lista as $item):


  ?>
  <?php endforeach; 
?>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tec Sus</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link href="css/style.css" rel="stylesheet"/>
        <link href="css/styles.css" rel="stylesheet"/>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--link para ajax-->
         <script type="text/javascript" src="./js/jquery-3.6.0.min.js"></script> 
         <script type="text/javascript" src="./js/script2.js"></script>   

         <!--javascript para API IBGE Valida cep-->
        <script type="text/javascript" src="./js/validaCep.js"></script>
            <!--javascript para validar CPF/CNPJ-->
         <script type="text/javascript" src="./js/validaCpfCnpj.js"></script>
           <!--javascript para mascara  CPF/CNPJ-->
         <script src="https://unpkg.com/imask"></script>


     
     <script>

     
              $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
        });

        /*
            Fun????o do bot??o que navega entre as paginas (tab)
          
        */

        /*

        $('button').click(function(){
        $('a[href="#dados-acesso"]').tab('show');
        })

      */

    </script>


         <!--multiplos submit-->
              <script type="text/javascript">
                function selecionaAction(script){
                    document.actionJava.action = script + '.php';
                    document.actionJava.submit();
                }

           </script>
   

        <!--Link para icones-->
       <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" />
       <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-glyphicons.css" rel="stylesheet">

       <style type="text/css">
        
         /*Aumenta o tamanho dos icones*/
            i.glyphicon.icones {
          font-size: 20px
          }

         


        
      </style>

    </head>
<body class="sb-nav-fixed">
 
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #55d6be">
            <a class="navbar-brand" href="#" style="color: #ffffff">TEC SUS</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            </form>
        <div class="menu" style = "color: #ffffff "><?php include 'listar.php';  ?></div>


    <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                      
                       <!--icones -->
                        <a class="dropdown-item font"  href="#">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-people-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1H7zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5.784 6A2.238 2.238 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.325 6.325 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1h4.216zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5z"/>
                                </svg>
                       &nbsp Trocar Usu??rio</a>

                        <a class="dropdown-item"   href="/tcc/segware-epi/sobre.php">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bell-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                        </svg>
                       &nbsp Sobre</a>

                        <a class="dropdown-item" href="#">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-question-octagon-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M11.46.146A.5.5 0 0 0 11.107 0H4.893a.5.5 0 0 0-.353.146L.146 4.54A.5.5 0 0 0 0 4.893v6.214a.5.5 0 0 0 .146.353l4.394 4.394a.5.5 0 0 0 .353.146h6.214a.5.5 0 0 0 .353-.146l4.394-4.394a.5.5 0 0 0 .146-.353V4.893a.5.5 0 0 0-.146-.353L11.46.146zM6.57 6.033H5.25C5.22 4.147 6.68 3.5 8.006 3.5c1.397 0 2.673.73 2.673 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.355H7.117l-.007-.463c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.901 0-1.358.603-1.358 1.384zm1.251 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z"/>
                        </svg>
                        &nbsp Ajuda</a>

                        
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="sair.php">
                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-in-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                              <path fill-rule="evenodd" d="M8.146 11.354a.5.5 0 0 1 0-.708L10.793 8 8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0z"/>
                              <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 1 8z"/>
                              <path fill-rule="evenodd" d="M13.5 14.5A1.5 1.5 0 0 0 15 13V3a1.5 1.5 0 0 0-1.5-1.5h-8A1.5 1.5 0 0 0 4 3v1.5a.5.5 0 0 0 1 0V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v10a.5.5 0 0 1-.5.5h-8A.5.5 0 0 1 5 13v-1.5a.5.5 0 0 0-1 0V13a1.5 1.5 0 0 0 1.5 1.5h8z"/>
                        </svg>
                    &nbsp Logout</a>
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" style="background-color: #2e5eaa" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            
                            <a class="nav-link" style="color: #F6FAEF" href="dashboard.php">
                                <div style="color: #F6FAEF" class="sb-nav-link-icon" style="color: #F6FAEF"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            
                            <a class="nav-link  collapsed" style="color: #F6FAEF" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"></div>
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-file-text-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                         <path fill-rule="evenodd" d="M12 1H4a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2zM5 4a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm-.5 2.5A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zM5 8a.5.5 0 0 0 0 1h6a.5.5 0 0 0 0-1H5zm0 2a.5.5 0 0 0 0 1h3a.5.5 0 0 0 0-1H5z"/>
                                </svg>&nbsp&nbsp&nbsp CADASTROS 
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse"  id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                   <a class="nav-link" href="cad-user.php">Usu??rios</a>
                                    <a class="nav-link" href="cad-medico.php" id="medico">M??dicos</a>
                                     <a class="nav-link" href="cad-pac.php">Pacientes</a>
                                      <a class="nav-link" href="cad-agendamento.php">Agendamentos</a>
                                      <a class="nav-link" href="cad-especialidade.php">Especialidades</a>

                                </nav>
                            </div>


                           
                            
                            <a class="nav-link collapsed" style="color: #F6FAEF" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                

                                <!--icone-->
                                 <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                      <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                      <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                </svg>&nbsp&nbsp&nbsp CONSULTAS  
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>



                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" style="color: #F6FAEF" href="pesq-pac.php">
                                        Pacientes
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     <a class="nav-link collapsed" style="color: #F6FAEF" href="cons-consulta.php">
                                        Agendamentos
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <a class="nav-link collapsed" style="color: #F6FAEF" href="pesq-medico.php">
                                        M??dicos
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <a class="nav-link collapsed" style="color: #F6FAEF" href="#">
                                        Especialidades
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     
                                     

                                </nav>
                           </div>
                        
                     </nav>
      
                </div>
                <br />
       
  <div id="pagina">            

    <!--CONTEUDO DO MEIO -->
      <div class="container ">

                <br />
                <br />
                <br />
                <br />
                 
    
          <h3 align="center">Vincular Especialidades</h3>
          <br />
       
    

               <!--inicio da linha-->
               <div class="row">           
          
                        <!--In??cio da coluna-->         
                   <div class="col-md-2 ">
                                                                           
                              <form action=""  method="POST" name="actionJava">

                                <div class="form-group">
                                    <div class="col">
                                        <label > CPF </label>
                                       <span class="campo-obrigatorio">*</span>
                                         <input type="text" name="cpf_user" id=""
                                           class="form-control" target="_blank" data-toggle="tooltip"  
                                             title="Insira um CPF/CNPJ V??lido no formato(00000000000000) 
                                            sem espa??o ou pontos" placeholder="CPF" 
                                           onblur="validar(getElementById('cpf_cnpj').value)"  
                                        autocomplete="off" value="<?php echo $item['cpf_user']; ?>" >
                                        <!--funcao valida usa a mascara para cpf/cnpj-->
                                    <input type="hidden" name="medico_cod_medico" id="medico_cod_medico" class="form-control" autocomplete="off" 
                                   value="<?php  echo $item ['cod_medico']; ?>" >
                                </div>
                            </div>

                   <!--Fim da coluna-->            
                 </div>  


                 <!--In??cio da coluna-->         
                     <div class="col-md-2 ">
                          
                                <div class="form-group">
                                    <div class="col">                                        
                                       <span class="campo-obrigatorio"></span>
                                          <button type="submit" name="pesquisar" value="pesquisar" class="btn btn-success" data-toggle="tooltip"   title="Pesquise Aqui"
                                              style="position: absolute;left: 40px;top: 30px;width: 100px">
                                                <i class="glyphicon glyphicon-search" style="color:#ffffff;"></i></button>
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                   <!--In??cio da coluna-->         
                   <div class="col-md-4 ">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Nome </label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_pac" id="nome_pac" class="form-control" autocomplete="off"
                                        value="<?php echo $item ['nome_user']; ?>"  placeholder="Nome">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                  <!--In??cio da coluna-->         
                   <div class="col-md-3 ">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Sobrenome</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="email" name="sobrenome_user" id="sobrenome_user" class="form-control" data-toggle="tooltip"  title="Insira seu CPF" autocomplete="off"
                                        value="<?php echo $item ['sobrenome_user']; ?>"  placeholder="Sobrenome">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

              
              <!-- Fim da linha -->
            </div>


                <!-- inicio da linha -->
                <div class="row">

                   <!--In??cio da coluna-->         
                     <div class="col-md-11 ">
                              
                                    <div class="form-group">
                                        <div class="col">
                                            <label > Escolha uma especialidade</label>
                                           <span class="campo-obrigatorio"></span>
                                               <?php                                      
                                                          $medico = new Medico();
                                                         $lista = $medico->pesquisarEspecialidade();   
                                                  ?>

                                              <select class="form-control" name="especialidade_cod_especialidade">                                      
                                                <option>Selecionar</option>
                                                <?php 
                                                foreach ($lista as $item):

                                                ?>

                                               
                                               
                                                <option value="<?php echo $item['cod_especialidade'] ?>">

                                                  <?php echo $item['nome_especialidade'] ?></option>                                                     

                                                  <?php endforeach;  ?>

                         
                                             
                                              </select>    
                                              
                                               <?php 
                                                foreach ($lista as $item):

                                                ?>

                                                <input type="hidden" name="" value="<?php echo $item['cod_especialidade']  ?>">
                                              <?php endforeach;  ?>

                                        </div>
                                    </div>

               <!--Fim da coluna-->            
             </div> 

      <!-- fim da linha -->
    </div>
           

       <!-- inicio da linha-->                
        <div class="row">

             
                  
               <!-- inicio da coluna-->
                 <div class="col-md-6">


                          <br />
                          <br />
                              
                           <!--Bot??o para navegar at?? a pr??xima p??gina-->
                           <button   class="btn btn-success" value="reset">Cancelar </button>             

                              
                           <!--Bot??o para cadastrar-->
                           <button type="submit" class="btn btn-success" onclick="selecionaAction('insert_medico_especialidade');">Cadastrar</button>

                          
                          </form>
                         
                   <!--Fim da coluna-->            
                 </div> 

          <!-- Fim da linha -->                              
           </div> 
       

    


      
  <!-- fim da pagina -->
  </div>

<!-- fim do container-->
</div>



                            
 

        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>



    </body>
 </body>

     <!--javascript para mascara  CPF/CNPJ-->
     <script type="text/javascript">
        var maskCpfOuCnpj = IMask(document.getElementById('cpf_cnpj'), {
    mask:[
        {
            mask: '000.000.000-00',
            maxLength: 11
        },
        {
            mask: '00.000.000/0000-00'
        }
    ]
});
</script>


</html>
