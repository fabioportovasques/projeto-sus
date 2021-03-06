<?php
session_start();
require 'config.php';
if(empty($_SESSION['lg'])) {
    header("Location: index.php");
    exit;
}
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
            Função do botão que navega entre as paginas (tab)
          
        */

        $('button').click(function(){
        $('a[href="#dados-acesso"]').tab('show');
      })

      $('button').click(function(){
      $('a[href="#dados-pessoais"]').tab('show');
      })

      
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
                       &nbsp Trocar Usuário</a>

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
                                   <a class="nav-link" href="cad-user.php">Usuários</a>
                                    <a class="nav-link" href="cad-medico.php" id="medico">Cadastro Médicos</a>
                                     <a class="nav-link" href="cad-pac.php">Cadastro Pacientes</a>
                                      <a class="nav-link" href="cad-agente-saude.php">Cadastro Agentes de Saúde</a>

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
                                        Médicos
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
  <div class="container">

                <br />
                <br />
                <br />
                <br />
                 
    
            <h2>Agendar Consulta</h2><br />
            <ul class="nav nav-pills flex-column flex-sm-row">
                  <li class="active"><a data-toggle="tab" href="#dados-pessoais">Dados Pessoais</a></li>
                  <li><a data-toggle="tab" href="#especialidade">Especialidade</a></li>
            </ul>
             <div class="tab-content">
               <div id="dados-pessoais" class="tab-pane fade in active">

          <h3>Dados Pessoais</h3>
          <br />
          
              <!--Início da coluna-->         
                   <div class="col-md-4">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > CPF do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="CPF">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>

                    <!--Início da coluna-->         
                   <div class="col-md-4">
                                                                           
                            <form action="#"  method="POST"> 

                                <div class="form-group">
                                    <div class="   col">
                                        <label > Nome do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Nome" required="" >    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>  

                   <!--Início da coluna-->         
                   <div class="col-md-3">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Sobrenome do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Sobrenome">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                     

                    <!--Início da coluna-->         
                   <div class="col-md-4">
                           
                                <div class="form-group">
                                    <div class="   col">
                                        <label > Data de Nascimento do Paciente</label>
                                       <span class="campo-obrigatorio"></span>
                                        <input type="date" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Nome">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>  

                   <!--Início da coluna-->         
                   <div class="col-md-4">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > RG do Paciente</label>
                                       <span class="campo-obrigatorio"></span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="RG">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                  <!--Início da coluna-->         
                   <div class="col-md-3">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Nº Cartão SUS</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Cartão SUS">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                    <!--Início da coluna-->         
                   <div class="col-md-4">
                                                                           
                            <form action="#"  method="POST"> 

                                <div class="form-group">
                                    <div class="   col">
                                        <label > Rua do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Rua">    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>  

                   <!--Início da coluna-->         
                   <div class="col-md-4">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Bairro do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Bairro" >    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                  <!--Início da coluna-->         
                   <div class="col-md-3">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Nº Casa do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Nº casa" >    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     


                    <!--Início da coluna-->         
                   <div class="col-md-4">
                                                                           
                            <form action="#"  method="POST"> 

                                <div class="form-group">
                                    <div class="   col">
                                        <label > Cidade do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Cidade"  >    
                                    </div>
                                </div>

                  
                   <!--Fim da coluna-->            
                 </div>  

                   <!--Início da coluna-->         
                   <div class="col-md-4">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > UF do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="UF" >    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>     

                  <!--Início da coluna-->         
                   <div class="col-md-3">
                          
                                <div class="form-group">
                                    <div class="col">
                                        <label > Pais do Paciente</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="pais">    
                                    </div>
                                </div>

                                <br />
                                <br />
                                <br />
                                <br />
                                <!-- Espaço no final da tab dados "pessoais" -->

                   <!--Fim da coluna-->            
                 </div>  

             

              <!-- Fim da TAB-->    
             </div>



             
        

        <div id="especialidade" class="tab-pane fade">
          <h3>Especialidade</h3>

                  <br />

                    <!--Início da coluna-->         
                   <div class="col-md-6">
                                                                           
                            <form action="#"  method="POST"> 

                                <div class="form-group">
                                    <div class="   col">
                                        <label > Escolher Especialidades</label>
                                       <span class="campo-obrigatorio">*</span>
                                       <select class="form-control">
                                         <option>Selecionar</option>
                                          <option>Clinico Geral</option>
                                           <option>Ginecologista</option>
                                       </select>
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div>  


                 <div class="col-md-5">
                          

                                <div class="form-group">
                                    <div class="   col">
                                        <label > Nome do Médico</label>
                                       <span class="campo-obrigatorio">*</span>
                                        <input type="text" name="nome_medico" id="nome_medico" class="form-control" autocomplete="off"  placeholder="Nome Médico" readonly  required="" >    
                                    </div>
                                </div>

                   <!--Fim da coluna-->            
                 </div> 


                <!-- inicio da coluna-->
               <div class="col-md-6">


                  <br />
                  <br />
                          
                       <!--Botão para navegar até a próxima página-->
                       <button class="btn btn-success">Cancelar </button>             

                          
                       <!--Botão para navegar até a próxima página-->
                       <button class="btn btn-success">Cadastrar</button>             

                      

                     </form>
                   <!--Fim da coluna-->            
                 </div> 

                              
         </div> 



        <!-- fim da tab-->
        </div>
      

</div>





</div>
</div>
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

     
</script> 

</html>
