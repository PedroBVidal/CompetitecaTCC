
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
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
            Object usuario = session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else if (usuario instanceof UsuarioParticipante) {

                UsuarioParticipante usuarioADM = (UsuarioParticipante) usuario;
        %>



        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <br>
            <h1 class="my-4 titulos">Meus Eventos em andamento <a href="competicoes.jsp" class="btn btn-primary">Ver todos os eventos</a></h1>
            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col">
                    <%
                        SimpleDateFormat formate = new SimpleDateFormat("dd/MM/yyyy");
                        //UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
                        //UsuarioParticipante upp = upc.buscarPorId(up.getIdUsuario());

                        int flag = 0;
                        UsuarioParticipanteControle upControle = new UsuarioParticipanteControle();
                        //CompeticaoControle competicaoControle = new CompeticaoControle();
                        upControle.abrirSessaoDAOGeneric();
                        upControle.flush();
                        Date dataHj = new Date();
                        UsuarioParticipante usuarioParticipante = upControle.buscarPorId(usuarioADM.getIdUsuario());
                        try {
                            usuarioParticipante.getCompeticoes();
                        } catch (Exception e) {
                            flag = 1;
                        }

                        if (flag == 0) {
                            int f = 0;
                            for (Competicao cptc : upControle.buscarCompeticoesVinculadasAoUsuarioParticipante(usuarioADM.getIdUsuario())) {
                                upControle.flush();
                                System.out.println("IS DIRTY: " + upControle.isDirty());
                                System.out.println("Nome:" + cptc.getNome() + "\n Id:" + cptc.getIdCompeticao() + "\n Inativo:" + cptc.isInativo());
                                if (cptc.isInativo() == false) {
                                    if ((cptc.getDataInicio().equals(dataHj) || cptc.getDataInicio().before(dataHj)) && (cptc.getDataTermino().equals(dataHj) || cptc.getDataTermino().after(dataHj))) {
                                        f++;

                    %>

                    <div class="col-lg-4 col-sm-6 portfolio-item">
                        <div class="card h-100">
                            <a href="#"><img class="card-img-top" src="img/competiteca_default.png" alt=""></a>
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="#"><%=cptc.getNome()%></a>
                                </h4>
                                <p class="card-text"><b>Data de Início:</b><%=formate.format(cptc.getDataInicio())%></p>
                                <p class="card-text"><b>Data de Encerramento:</b><%=formate.format(cptc.getDataTermino())%></p>
                                <%if (cptc.getInterseries() == 1) {%>
                                <span class="badge badge-pill badge-danger">Interséries</span><br><br>
                                <%} else {%>
                                <br><br>
                                <%}
                                %>
                                <!-- Button trigger modal -->

                                <a><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#<%=cptc.getIdCompeticao()%>"><i class="fas fa-trash-alt"></i></button></a>&nbsp;



                                <!-- Modal -->
                                <div class="modal fade" id="<%=cptc.getIdCompeticao()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir <%=cptc.getNome()%>?</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-footer">
                                                <a href="scripts/cadastrarcompeticao.jsp?op=1&idCompeticao=<%=cptc.getIdCompeticao()%>"><button class="btn btn-secondary">Sim</button></a>
                                                <button type="button" class="btn btn-primary">Cancelar</button>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="gerenciamentoDeCompeticao.jsp?idCompeticao=<%=cptc.getIdCompeticao()%>"><button class="btn btn-success">Gerenciar evento</button></a>
                            </div>
                        </div>
                    </div>
                    <%}
                            }
                        }
                        if (f == 0) {%>
                    <center>
                        <div class="">
                        <div class="card h-100">
                            <h4 class="card-header">Não há nada para hoje</h4>
                            <div class="card-body">
                                <p class="card-text">Relaxe! não há nenhuma competição ocorrendo hoje; volte outro dia e veja as competições que estarão ocorrendo!</p>
                            </div>
                           
                        </div>
                    </div>
                        </center>
                    <%}
        }%>
                </div>


                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <%
                    } else {
                        response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
                    }
                %>
                </body>

                </html>

