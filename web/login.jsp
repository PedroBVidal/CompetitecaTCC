<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <script type="text/javascript" src="ajax/ajaxProcess.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Login</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">

        <!-- Navigation -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-success fixed-top">
            <div class="container ">
                <a class="navbar-brand" href="index.jsp"><img src="img/competiteca.png"></a>
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
                            <a class="nav-link" href="contact.html"><i class="fas fa-sign-in-alt"></i>&nbsp;Login</a>
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

        <!-- Page Content -->
        <div class="container">


            <%
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("msg") != null) {
                    String mensagem = request.getParameter("msg");
                    String cor = request.getParameter("color");
            %>
            <br>
            <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                <strong><%=mensagem%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
            <br>
            <h1 class="my-4 titulos">Seja Bem-Vindo a Competiteca</h1>

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col">
                    <div class="card h-100">
                        <h4 class="card-header titulos">Entre</h4>
                        <div class="card-body">
                            <form action="scripts/ctrlacesso.jsp" method="POST" class="col">

                                <label for="" class="col-md-12">
                                    E-mail:
                                    <input type="email" required class="form-control" name="email" placeholder="Informe seu e-mail">
                                </label>
                                <label for="" class="col-md-12">
                                    Senha:
                                    <input type="password" required class="form-control" name="senha" placeholder="Insira sua senha">
                                </label>
                                <label for="" class="col-md-12">
                                    Tipo de Usuário:
                                    <select name="tipo" class="form-control">
                                        <option value="2">Participante</option>
                                        <option value="1">Administrador</option>
                                    </select>
                                </label>

                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-success">Entrar</button>&nbsp;&nbsp;<a href="signup.jsp?p=1">Não possui uma conta ainda? Cadastre-se aqui</a>&nbsp;&nbsp;<a class="stretched-link text-danger" href="#" data-toggle="modal" data-target="#exampleModal">Putz! Esqueci a senha</a>

                        </div>
                        </form> 
                    </div>
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Recuperação de Senha</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div id="mensagem">
                                        
                                    </div>
                                    <label for="" class="col-md-12">
                                        E-mail:
                                        <input id="email" type="email" required class="form-control" name="email" placeholder="Informe seu e-mail">
                                    </label>
                                    <label for="" class="col-md-12">
                                        Tipo de Usuário:
                                        <select id="opt" name="opt" class="form-control">
                                            <option value="2">Participante</option>
                                            <option value="1">Administrador</option>
                                        </select>
                                    </label>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                    <button onclick="recSenha();" type="button" class="btn btn-success">Recuperar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script>

                    function mudarAction() {
                        $("#frm").attr("action", "scripts/ctrlacessoParticipante.jsp");
                    }

                </script>
                </body>

                </html>
