
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>


<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body>
        <script>
            

            function validatePassword() {
                var password = document.getElementById("password")
                    , confirm_password = document.getElementById("confirm_password");
                if (password.value != confirm_password.value) {
                    confirm_password.setCustomValidity("As senhas não coincidem!");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }

           // password.onchange = validatePassword;
            // confirm_password.onkeyup = validatePassword;
        </script>
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-success fixed-top">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">Competiteca</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="about.html"><i class="fas fa-info-circle"></i>&nbsp;Sobre</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="services.html"><i class="fas fa-trophy"></i>&nbsp;Competições</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i>&nbsp;Login</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-clipboard-list"></i>&nbsp;Gerenciar
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="portfolio-1-col.html">Competições</a>
                                <a class="dropdown-item" href="portfolio-2-col.html">Atletas</a>
                                <a class="dropdown-item" href="portfolio-3-col.html">Equipes</a>
                                <a class="dropdown-item" href="portfolio-4-col.html"></a>
                                <a class="dropdown-item" href="portfolio-item.html">Single Portfolio Item</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Blog
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="blog-home-1.html">Blog Home 1</a>
                                <a class="dropdown-item" href="blog-home-2.html">Blog Home 2</a>
                                <a class="dropdown-item" href="blog-post.html">Blog Post</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Other Pages
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="full-width.html">Full Width Page</a>
                                <a class="dropdown-item" href="sidebar.html">Sidebar Page</a>
                                <a class="dropdown-item" href="faq.html">FAQ</a>
                                <a class="dropdown-item" href="404.html">404</a>
                                <a class="dropdown-item" href="pricing.html">Pricing Table</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <header>

        </header>
        <% if(request.getParameter("p").equals("1")){%>
        <!-- Page Content -->
        <div class="container">
            <div class="col-12">
                <br><h1 class="text-center">Qual é a sua intenção em nosso site?</h1><br>

                <a href="signup.jsp?p=2"><button class="col-12 btn-lg btn-primary">Quero encontrar competições para eu ou minha equipe participar</button></a><br><br>
                <a href="signup.jsp?p=3"><button  class="col-12 btn-lg btn-success">Quero ofertar competições</button></a>

            </div>
        </div>
        <%}
        if(request.getParameter("p").equals("2")){
        %>
        <div class="container">
            <h1 class="my-4">Cadastro para Participantes</h1>
            <div class="card">
                <h5 class="card-header">Cadastro</h5>
                <div class="card-body">



            <form action="scripts/scriptuserParticipante.jsp" method="POST" class="col">
                <input type="hidden" name="op" value="1">


                 <input type="hidden" name="c" value="1">
                <input type="hidden" name="id" value="0">

                <label for="" class="col-md-12">
                    Nome:
                    <input type="text" required class="form-control" name="nome" placeholder="Informe o seu nome" >
                </label>
                <label for="" class="col-md-12">
                    Email:
                    <input type="text" required class="form-control" name="email" placeholder="Insira o seu email" >
                </label>
                <label for="" class="col-md-12">
                    Data de nascimento:
                    <input type="text" required class="form-control" name="email" placeholder="Insira o seu email" >
                </label>
                <label for="" class="col-md-12">
                    CPF:
                    <input type="text" required class="form-control" name="email" placeholder="Insira o seu email" >
                </label>
              
                <label for="" class="col-md-12">
                    Senha:
                    <input type="password" required class="form-control" id="password" name="senha" placeholder="Insira a sua senha">
                    Confirme a Senha:
                    <input onkeyup="validatePassword()" type="password" required class="form-control" id="confirm_password" placeholder="Confirme a sua senha">
                    <div class="invalid-feedback">

                    </div>
                </label>
                
                <label for="" class="col-md-12">
                    <input type="checkbox" value="1" onclick="adicionarInputTurma();">
                    Estudo/trabalho no IFPR - Campus Irati
                </label>


                <button type="submit" class="btn btn-success">Enviar</button>


            </form>
            </div>
            </div>
        </div>
        <%}
        if(request.getParameter("p").equals("3")){
        %>
        <div class="container">
            <h1 class="my-4">Cadastro para Administradores</h1>


            <form action="scripts/scriptuserAdministrador.jsp" method="POST" class="col" validate>
                <input type="hidden" name="c" value="1">
                <input type="hidden" name="id" value="0">

                <label for="" class="col-md-12">
                    Nome:
                    <input type="text" required class="form-control" name="nome" placeholder="Informe o seu nome" >
                </label>
                <label for="" class="col-md-12">
                    Email:
                    <input type="text" required class="form-control" name="email" placeholder="Insira o seu email" >
                </label>
                <label for="" class="col-md-12">
                    Senha:
                    <input type="password" required class="form-control" id="password" name="senha" placeholder="Insira a sua senha">
                    Confirme a Senha:
                    <input onkeyup="validatePassword()" type="password" required class="form-control" id="confirm_password" placeholder="Confirme a sua senha">
                    <div class="invalid-feedback">

                    </div>
                </label>


                <button type="submit" class="btn btn-success">Enviar</button>


            </form> 
        </div>
        <%}%>
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
            
            function adicionarInputTurma(){
                alert("Estou aqui");
            }
            
        </script>
        
    </body>

</html>

