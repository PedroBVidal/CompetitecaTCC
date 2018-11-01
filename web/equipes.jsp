
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
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
                                <a class="dropdown-item" href="editaUsuario.jsp?c=<%=up.getIdUsuario()%>">Editar Perfil</a>
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
          if(request.getParameter("msg") != null){
              String mensagem = request.getParameter("msg");
              String cor = request.getParameter("color");
            %>
            <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                <strong><%=mensagem%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
            }
            %>
            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">Gerenciar Equipes

            </h1><br>



            <!-- Content Row -->
            <div class="row">
                <!-- Sidebar Column -->
                <div class="col-lg-3 mb-4">
                    <div class="list-group">
                        <a href="equipes.jsp" class="list-group-item active">Gerenciar Equipes</a>
                        <a href="criarModalidadeC.jsp" class="list-group-item">Adicionar uma Modalidade</a>

                    </div>
                </div>
                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Modalidade</th>
                                <th scope="col">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            EquipeControle ec = new EquipeControle();
                            for(Equipe eq : ec.buscarTodasEquipe()){
                            %>
                            <tr>

                                <td><%=eq.getNome()%></td>
                                <td><%=eq.getModalidade().getNome()%></td>
                                <td><a href="editarEquipe.jsp?id=<%=eq.getIdEquipe()%>" class="btn btn-success">
                                        <!-- Adicionar icone -->
                                        <i class="fas fa-edit"></i>
                                    </a> &nbsp;
                                    <a href="scripts/editarEquipe.jsp?id=<%=eq.getIdEquipe()%>&op=2" class="btn btn-danger">
                                        <!-- Adicionar icone -->
                                        <i class="fas fa-trash-alt"></i>
                                    </a> &nbsp;
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=eq.getIdEquipe()%>">
                                        <!-- Adicionar icone -->
                                        <i class="fas fa-eye"></i>
                                    </button></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <%
                        for(Equipe eq2 : ec.buscarTodasEquipe()){
                    %>
                    <div class="modal fade" id="<%=eq2.getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Detalhes: <%=eq2.getNome()%></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <b>Modalidade:</b><%=eq2.getModalidade().getNome()%><br>
                                    <b>Atletas:</b><br>
                                    <%
                                    for(Atleta atl : eq2.getAtletas()){
                                    out.println(atl.getNome()+"<br>");
                                    }
                                    %>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>

                                </div>
                            </div>
                        </div>
                    </div>        
                    <%}%>
                    <a href="criarEquipe.jsp" class="btn btn-success">
                        <!-- Adicionar icone -->
                        <i class="fas fa-plus"></i>&nbsp;Nova Equipe
                    </a>
                </div>
            </div>
            <!-- /.row -->

        </div>




        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
        }
        %>
    </body>

</html>

