
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Aluno 
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");

            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
                UsuarioParticipante2Controle upControle = new UsuarioParticipante2Controle();
        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true"/>
        </header>

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
            <h1 class="my-4 titulos">Minhas Equipes</h1>
            <div class="row">
                <%
                    UsuarioParticipante2 usuarioParticipante = upControle.buscarPorId(up.getIdUsuario());

                    for (Equipe equipe : usuarioParticipante.getEquipe()) {

                        System.out.println("Nome equipe: " + equipe.getNome());
                        System.out.println("Integrantes: " + equipe.getAtletas());
                        System.out.println("ADM: " + equipe.getAdministrador());
                %>

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/competiteca_default.png" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="javascript:enviarFormGerenciarEquipe()"><%=equipe.getNome()%></a>
                            </h4><%if (equipe.getSegmento() != null) {%>
                                    <span class="badge badge-pill badge-success"><%=equipe.getSegmento().getNome() %></span>
                                <%}
                            %>
                            <p class="card-text"><b>Modalidade:</b><%=equipe.getModalidade().getNome()%></p>

                            <div class="row" style="margin-left: 1px;">
                                <form action="gerenciarEquipe.jsp" method="POST" name="formGerenciarEquipe">
                                    <!-- Button trigger modal -->
                                    <input type="hidden" name="idEquipe" value="<%=equipe.getIdEquipe()%>">
                                    <a href="javascript:enviarFormGerenciarEquipe()"><button class="btn btn-success">Gerenciar equipe</button></a>
                                    <a><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#<%=equipe.getIdEquipe()%>"><i class="fas fa-trash-alt"></i></button></a>&nbsp;
                                </form>
                            </div>


                            <!-- Modal -->
                            <div class="modal fade" id="<%=equipe.getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir a equipe <%=equipe.getNome()%>?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-footer">
                                            <a href="scripts/editarEquipe.jsp?op=2&idEquipe=<%=equipe.getIdEquipe()%>&idUsuario=<%=usuarioParticipante.getIdUsuario()%>"><button class="btn btn-secondary">Sim</button></a>
                                            <button type="button" data-dismiss="modal" class="btn btn-primary">Cancelar</button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <span class="badge badge-info"><i class="fas fa-user-cog"></i>&nbsp;Administrador</span>
                        </div>
                    </div>
                </div>
                <%}%>
                <%

                    for (Equipe equipe : usuarioParticipante.getAtleta().getEquipes()) {

                        System.out.println("Nome equipe: " + equipe.getNome());
                        System.out.println("Integrantes: " + equipe.getAtletas());
                        System.out.println("ADM: " + equipe.getAdministrador());
                %>

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="javascript:enviarFormVisualizarEquipe()"><%=equipe.getNome()%></a>
                            </h4>
                            <p class="card-text"><b>Modalidade:</b><%=equipe.getModalidade().getNome()%></p>

                            <div class="row" style="margin-left: 1px;">
                                <!-- Button trigger modal -->
                                <a><button type="hidden" class="btn btn-danger" data-toggle="modal" data-target="#<%=equipe.getIdEquipe()%>"><i class="fas fa-sign-out-alt"></i></button></a>&nbsp;
                                <form name="formVisualizarEquipe" method="POST" action="gerenciarEquipe.jsp">
                                    <input type="hidden" name="idEquipe" value="<%=equipe.getIdEquipe()%>">
                                    <input type="hidden" name="op" value="2">
                                    <a href="javascript:enviarFormVisualizarEquipe()"><button class="btn btn-success">Visualizar equipe</button></a>
                                </form>
                            </div>

                            <!-- Modal -->
                            <div class="modal fade" id="<%=equipe.getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente sair da equipe <%=equipe.getNome()%>?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-footer">
                                            <a href="scripts/excluirAtletaEquipe.jsp?idAtleta=<%=usuarioParticipante.getAtleta().getIdAtleta()%>&idEquipe=<%=equipe.getIdEquipe()%>&idUsuario=<%=usuarioParticipante.getIdUsuario()%>"><button class="btn btn-secondary">Sim</button></a>
                                            <button type="button" data-dismiss="modal" class="btn btn-primary">Cancelar</button>

                                        </div>
                                    </div>
                                </div>
                            </div>



                            <span class="badge badge-info"><i class="fas fa-user"></i>&nbsp;Participante</span>
                        </div>
                    </div>
                </div>

                <%}%>
            </div>
            <a href="criarEquipe.jsp" class="btn btn-success">
                <!-- Adicionar icone -->
                <i class="fas fa-plus"></i>&nbsp;Nova Equipe
            </a>

        </div>

        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>

            function enviarFormVisualizarEquipe() {
                document.forms["formVisualizarEquipe"].submit();
            }

            function enviarFormGerenciarEquipe() {
                document.forms["formGerenciarEquipe"].submit();
            }

        </script>
        <%

            }
        %>
    </body>

</html>

