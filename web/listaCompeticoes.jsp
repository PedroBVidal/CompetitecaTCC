<%-- 
    Document   : listaCompeticoes
    Created on : 25/10/2018, 15:53:02
    Author     : Usuário
--%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <script type="text/javascript" src="ajax/ajaxProcess.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-
              fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Modern Business - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-
              MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO
              " crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

        <!-- Estilo CSS-->
        <link href="css/estilo.css" rel="stylesheet">
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

                //sresponse.setIntHeader("Refresh", 100);
                String sIdCompeticao = request.getParameter("idCompeticao");

                List<Competicao> competicoes = new ArrayList();
                CompeticaoControle competicaoControle = new CompeticaoControle();
                UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
                competicoes = competicaoControle.buscarTodasCompeticoes();

                UsuarioParticipante2 usuarioParticipante
                        = usuarioParticipante2Controle.buscarPorId(up.getIdUsuario());
                Atleta atletaVinculadoUp = usuarioParticipante.getAtleta();
        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
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
            <h1 class="my-4 titulos">Competições em andamento</h1>



            <button data-toggle="modal" data-target="#ingressar" class="btn btn-primary"><i class="fas fa-unlock"></i> &nbsp; Ingressar numa competição privada</button><br>
            <div class="modal" id="ingressar" data-toggle="modal"tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Informe a Chave Pública para ingressar na Competição</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="POST" action="scripts/ingressoPvd.jsp">
                                <center>
                                    <input type="hidden" value="<%=up.getIdUsuario()%>" name="idUsuario">    
                                    <input type="text" class="form-control col-7" name="codigo" placeholder="Insira o código aqui">
                                </center>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success">Entrar</button>
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>

                        </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="form-inline col" style="margin-bottom: 10px;">
                <p class="my-4 fontOverpass col-3">Pesquisar competição:</p>
                <input onkeyup="getPesquisa(<%=atletaVinculadoUp.getIdAtleta()%>)" id="nomeComp" class="form-control col-7" type="search" aria-label="Buscar" 
                       name="nomeCompeticao" list="competicoes">
                <datalist id="competicoes">
                    <%
                        Date hoje = new Date();
                        for (Competicao c : competicoes) {
                            if (!c.isInativo() && !c.isPrivado() && !hoje.before(c.getDataInicioInsc()) && !hoje.after(c.getDataTerminoInsc())) {
                    %>
                    <option data-value="<%=c.getIdCompeticao()%>" value="<%=c.getNome()%>"></option><%
                            }
                        }
                    %>
                </datalist>
                <button class="btn btn-outline-success col-2" onclick='getPesquisa(<%=usuarioParticipante.getAtleta().getIdAtleta()%>)'>Buscar 
                </button>


            </div>

            <div class="card-group" id="eventos">
                <%
                    if (sIdCompeticao == null) {

                %>
                <%                    List<Competicao> competicoesASeremRemovidas = new ArrayList();

                    //List<Atleta> atletas = up.getAtletas();
                    for (Competicao competicao : competicoes) {

                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                        String dataInicio = simpleDateFormat.format(competicao.getDataInicio());
                        String dataTermino = simpleDateFormat.format(competicao.getDataTermino());
                        if (!competicao.isInativo() && !competicao.isPrivado() && !hoje.before(competicao.getDataInicioInsc()) && !hoje.after(competicao.getDataTerminoInsc())) {

                %>




                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/competiteca_default.png" 
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <p class="fontOverpass"><a href="#"><%=competicao.getNome()%></a></p>
                            </h4>
                            <p class="card-text fontOverpass"><b>Data de Início:</b><span 
                                    style="margin-left: 5px;"><%=dataInicio%></span></p>
                            <p class="card-text fontOverpass"><b>Data de Termino:</b><span 
                                    style="margin-left: 5px;"><%=dataTermino%></span></p>
                                <%if (competicao.getInterseries() == 1) {%>
                            <span class="badge badge-pill badge-danger">Interséries</span>
                            <%}
                            %>
                            <div class="form-group">

                                <p class="fontOverpass">
                                <form action="forminscricaocompeticao.jsp" method="POST">
                                    <input type="hidden" name="idCompeticao" value="<%=competicao.getIdCompeticao()%>">
                                    <input type="hidden" name="idAtleta" value="<%=atletaVinculadoUp.getIdAtleta()%>">
                                    <%if (competicao.getInterseries() == 1 && up.getAtleta().getSegmento() != null) {%>
                                    <button style="float:right;" class="btn btn-success" type="submit" role="button">Inscreva-se</button><p>        
                                        <%} else if (competicao.getInterseries() == 1 && up.getAtleta().getSegmento() == null) {%>
                                        <button style="float:right;" class="btn btn-danger disabled" type="submit" role="button">Indisponível para si</button><p>
                                        <%} else {
                                        %>
                                        <br>
                                        <br>
                                        <button style="float:right;" class="btn btn-success" type="submit" role="button">Inscreva-se</button><p>
                                        <%}%>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>

                <%}
                    }%>
                <%} else {

                    int idCompeticao = Integer.parseInt(sIdCompeticao);
                    Competicao competicaoBuscada = competicaoControle.buscarCompeticaoPorId(idCompeticao);
                    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String dataInicio = simpleDateFormat.format(competicaoBuscada.getDataInicio());
                    String dataTermino = simpleDateFormat.format(competicaoBuscada.getDataTermino());
                %>

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" 
                                         alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <p class="fontOverpass"><a href="#"><%=competicaoBuscada.getNome()%></a></p>
                            </h4>
                            <p class="card-text fontOverpass"><b>Data de Início:</b><span 
                                    style="margin-left: 5px;"><%=dataInicio%></span></p>
                            <p class="card-text fontOverpass"><b>Data de Termino:</b><span 
                                    style="margin-left: 5px;"><%=dataTermino%></span></p>

                            <div class="form-group">
                                <p class="fontOverpass"><a class="btn btn-info" 
                                                           href="forminscricaocompeticao.jsp?idCompeticao=<%=competicaoBuscada.getIdCompeticao()%>&idAtleta=<%=atletaVinculadoUp.getIdAtleta()%>" 
                                                           role="button">Inscrever-se em competições do evento</a><p>
                                    <%}%>
                            </div>
                        </div>
                    </div>
                </div>        


            </div>  


        </div> 

        <!-- Bootstrap core JavaScript -->
        <script>
            //Código de busca da tabela
            $('input#txt_consulta').quicksearch('table#tabela tbody tr');

        </script>
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>



            $(document).ready(function () {
                $('button').click(function () {
                    //alert("Entrei aqui");
                    var value = $('input').val();
                    console.log($('#competicoes [value="' + value + '"]').data('value'));

                    var idCompeticao = $('#competicoes [value="' + value + '"]').data('value');
                    //alert(idCompeticao);
                    $("#frm").attr("action", "scripts/buscarCompeticoes.jsp?idCompeticao=" +
                            idCompeticao);


                });
            });

        </script>

        <%
            }
        %>
    </body>

</html>
