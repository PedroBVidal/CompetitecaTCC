
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
        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if(up == null){
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
                
            }else{
                
        %>

        <!-- Navigation -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-success fixed-top">
            <div class="container ">
                <a class="navbar-brand" href="index.jsp">Competiteca</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="services.html"><i class="fas fa-trophy"></i>&nbsp;Competições</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-clipboard-list"></i>&nbsp;Gerenciar
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="competicoes.jsp">Competições</a>
                                <a class="dropdown-item" href="atleta.jsp">Atletas</a>
                                <a class="dropdown-item" href="equipes.jsp">Equipes</a>
                                <a class="dropdown-item" href="local.jsp">Locais</a>
                                <a class="dropdown-item" href="portfolio-item.html"></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Olá,&nbsp;<%=up.getNome()%>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="scripts/ctrlacesso.jsp?c=1">Sair</a>
                                <a class="dropdown-item" href="editarPerfil.jsp?c=<%=up.getIdUsuario()%>">Editar Perfil</a>
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
            <h1 class="my-4">Criar um novo Atleta</h1>


            <form action="scripts/editarAtleta.jsp" method="POST" class="col">
                <input type="hidden" name="op" value="3">
                <input type="hidden" name="id" value="0">

                <label for="" class="col-md-12">
                    Nome:
                    <input type="text" required class="form-control" name="nome" placeholder="Informe o nome do Atleta" >
                </label>
                <label for="" class="col-md-12">
                    Email:
                    <input type="email" required class="form-control" name="email" placeholder="Informe uma email" >
                </label>
                
                <label for="" class="col-md-12">
                    Modalidades disponíveis(Não obrigatório):
                    <div class="form-check">
                        <%
                        ModalidadeSoloControle msc = new ModalidadeSoloControle();
                        int i = 0;
                        for(ModalidadeSolo ms : msc.buscarTodosModalidadeSolo()){
                        %>
   
                        <input class="form-check-input" type="checkbox" value="<%=ms.getIdModalidadeSolo()%>" name="<%=i%>">
                        <label class="form-check-label" for="defaultCheck1">
                            <%=ms.getNome()%>
                        </label><br>
                        <% i++;}%>
                    </div>
                </label>
                    <input type="hidden" name="size" value="<%=msc.buscarTodosModalidadeSolo().size()%>">

                <button type="submit" class="btn btn-success">Salvar</button>


            </form> 
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
        }
        %>
    </body>

</html>

