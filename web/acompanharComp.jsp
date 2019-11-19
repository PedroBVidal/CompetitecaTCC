<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <script type="text/javascript" src="ajax/ajaxProcess.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
        <title>Acompanhando Evento</title>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body onload="getDados(<%=Integer.parseInt(request.getParameter("idCompeticao"))%>)" style='font-family: "Quicksand";'>
        <%
            CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();

            int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));

            CompeticaoModalidadeColetiva competicao = competicaoControle.buscarPorId(idCompeticao);


        %>

        <header>
            <jsp:include page="navbarindex.jsp" flush="true"/>
        </header>
        <input type="hidden" name="idCompeticao" value="<%=idCompeticao%>">

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
            <!-- Page Heading/Breadcrumbs -->
            <br>
            <h1 class="mt-4 mb-3 titulos">Acompanhando competição <span style="text-decoration: underline;"><%=competicao.getNomeCompeticao()%></span>

            </h1><br>



            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <%if (competicao.getSistemaDeCompeticao().getNome().equals("Sistema todos contra todos")) {%>
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#tabela" role="tab">Tabela</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#partidas" role="tab">Jogos</a>
                    <%} else if(competicao.getSistemaDeCompeticao().getNome().equals("Sistema eliminatório")){%>
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#partidas" role="tab">Jogos</a>
                    <%}
                    %>


                </div>
                <%
                    if(competicao.getSistemaDeCompeticao().getNome().equals("Sistema eliminatório")){
                %>
                <!-- Tab panes -->
                <div class="tab-content col-10">
                    <div class="tab-pane dark active" id="jogos" role="tabpanel">
                        <jsp:include page="acompanharSistemaEliminatorio.jsp" flush="true"/>
                    </div>
                </div>
                <%       }
                        else if (competicao.getSistemaDeCompeticao().getNome().equals("Sistema todos contra todos")){
                    %>
                <!-- Tab panes -->
                <div class="tab-content col-10">

                    <div class="tab-pane dark active" id="tabela" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta1" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table class="table table">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col"></th>
                                    <th scope="col">Equipe</th>
                                    <th scope="col">P</th>
                                    <th scope="col">J</th>
                                    <th scope="col">V</th>
                                    <th scope="col">E</th>
                                    <th scope="col">D</th>
                                    <th scope="col">PP</th>
                                    <th scope="col">PC</th>
                                    <th scope="col">SP</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int contador = 0;
                                    for (EquipeCompeticao equipeCompeticao : competicao.getEquipesCompeticao()) {
                                        contador++;

                                        int pontos = (int) equipeCompeticao.getPontos();
                                        int pontosMarcados = (int) equipeCompeticao.getPontosMarcados();
                                        int pontosSofridos = (int) equipeCompeticao.getPontosSofridos();
                                        int saldoPontos = (int) (equipeCompeticao.getPontosMarcados() - equipeCompeticao.getPontosSofridos());
                                        int jogos = equipeCompeticao.getJogos();
                                        int vitorias = equipeCompeticao.getVitorias();
                                        int empates = equipeCompeticao.getEmpates();
                                        int derrotas = equipeCompeticao.getDerrotas();
                                %>
                                <tr>
                                    <th scope="row"><%=contador%>°</th>
                                    <td><%=equipeCompeticao.getEquipe().getNome()%></td>
                                    <td><%=pontos%></td>
                                    <td><%=jogos%></td>
                                    <td><%=vitorias%></td>
                                    <td><%=empates%></td>
                                    <td><%=derrotas%></td>
                                    <td><%=pontosMarcados%></td>
                                    <td><%=pontosSofridos%></td>
                                    <td><%=saldoPontos%></td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    
                    <div class="tab-pane dark" id="partidas" role="tabpanel">
                    
                            <div id='partidas'>

                            </div>
                        
                    </div>
                </div>
                <%}%>
                    <!-- Bootstrap core JavaScript -->

                    <script src="vendor/jquery/jquery.min.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <%

                    %>
                    </body>

                 </html>
                    
