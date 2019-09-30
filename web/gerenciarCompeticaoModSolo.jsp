<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.AtletaCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeSolo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
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
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if (up == null) {

                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {

                CompeticaoModalidadeSoloControle competicaoControle = new CompeticaoModalidadeSoloControle();

                int idCompeticao = Integer.parseInt(request.getParameter("id"));
                CompeticaoModalidadeSolo competicao = competicaoControle.buscarPorId(idCompeticao);

        %>

        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>


        <!-- Page Content -->
        <div class="container">
            <br>

            <%                request.setCharacterEncoding("UTF-8");
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
                int emAprov = 0;
                for (InscricaoCompeticaoSolo ics : competicao.getInscricoesCompeticaoSolo()) {
                    if (ics.getInscricaoAceita() == 'E') {
                        emAprov++;
                    }
                }
            %>
            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3 titulos">Gerenciando competicao <span style="color: red;"><%=competicao.getNomeCompeticao()%></span>

            </h1>
            <%if (competicao.getNumVagasDisp() > 0) {%>
            <span class="badge badge-pill badge-success" style="width: 1.75in;">Vagas Disp.:&nbsp;<%=competicao.getNumVagasDisp()%>&nbsp;|&nbsp;<%=competicao.getNumVagas()%></span>
            <%} else {
            %>
            <span class="badge badge-pill badge-danger" style="width: 1.75in;">Insc. Fechadas</span>
            <%}%>
            &nbsp;
            <%if (emAprov <= competicao.getNumVagasDisp()) {%>
            <span class="badge badge-pill badge-success" style="width: 1.75in;">Em aprovação:&nbsp;<%=emAprov%></span>
            <%} else {%>
            <span class="badge badge-pill badge-danger" style="width: 1.75in;">Em aprovação:&nbsp;<%=emAprov%></span>
            <%}%>
            <br>
            <br>




            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#messages" role="tab">Mensagens</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Competidores</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#tabeladocampeonato" role="tab">Classificações</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#jogos" role="tab">Jogos</a>



                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">
                    <div class="tab-pane dark" id="inscricao" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta1" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="tabela1" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Atleta</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%

                                    for (InscricaoCompeticaoSolo iMs : competicao.getInscricoesCompeticaoSolo()) {
                                        if (iMs.getInscricaoAceita() == 'E') {
                                            String nomeAtleta = iMs.getAtleta().getUsuarioParticipante().getNome();


                                %>    
                            <td><%=nomeAtleta%></td>
                            <td>
                                <a href="scripts/aprovaInscCompSolo.jsp?opt=1&idInsc=<%=iMs.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-check"></i>
                                </a> &nbsp;
                                <a href="scripts/aprovaInscCompSolo.jsp?opt=2&idInsc=<%=iMs.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>&idAtleta=<%=iMs.getAtleta().getIdAtleta()%>" class="btn btn-danger">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-times"></i>
                                </a> &nbsp;
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMs.getAtleta().getIdAtleta()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=iMs.getAtleta().getIdAtleta()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=nomeAtleta%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            Nome do Atleta:&nbsp; <%=nomeAtleta%> <br>
                                            Email para Contato:&nbsp;<%=iMs.getAtleta().getUsuarioParticipante().getEmail()%>



                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }%>
                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta1').quicksearch('table#tabela1 tbody tr');

                        </script>

                    </div>


                    <div class="tab-pane" id="tabeladocampeonato" role="tabpanel">
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
                                    <th scope="col">PM</th>
                                    <th scope="col">PS</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int contador = 0;
                                    for (AtletaCompeticao atletaCompeticao : competicao.getAtletasCompeticao()) {
                                        contador++;
                                %>
                                <tr>
                                    <th scope="row"><%=contador%>°</th>
                                    <td><%=atletaCompeticao.getAtleta().getUsuarioParticipante().getNome()%></td>
                                    <td><%=atletaCompeticao.getPontosMarcados()%></td>
                                    <td><%=atletaCompeticao.getPontosSofridos()%></td>
                                </tr>
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                    <!--TAB PANE DOS JOGOS DA COMPETIÇÃO!-->

                    <div class="tab-pane" id="jogos" role="tabpanel">

                        <div class="card text-center">
                            <div class="card-header">
                                <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Home</a>

                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="teste-tab" data-toggle="tab" href="#teste" role="tab" aria-controls="teste" aria-selected="false">Profile</a>

                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="card-body">

                                <div class="tab-content" id="myTabContent">
                                    <!--Tab JOGOS-->
                                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <%  if (!competicao.getSistemaDeCompeticao().getNome().equals("Sistema eliminatório")) {
                                                    
                                                
                                                LocalControle lclc = new LocalControle();
                                                if (competicao.isJogosEmAndamento() == true) {

                                                    int numeroJogo = 1;
                                                    for (Confronto confronto : competicao.getConfrontos()) {

                                                        ConfrontoModalidadeSolo confronModSolo = (ConfrontoModalidadeSolo) confronto;
                                                        SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
                                                        SimpleDateFormat sdfHora = new SimpleDateFormat("dd/MM/yyyy");
                                                        String sDataJogo, sHoraInicio, sHoraFinal;
                                                        int idConfronto = confronModSolo.getIdConfronto();

                                                        if (confronModSolo.getDataConfronto() != null) {
                                                            sDataJogo = sdfData.format(confronModSolo.getDataConfronto());
                                                        } else {
                                                            sDataJogo = "";
                                                        }
                                                        if (confronModSolo.getHoraInicio() != null) {
                                                            sHoraInicio = sdfHora.format(confronto.getHoraInicio());
                                                        } else {
                                                            sHoraInicio = "";
                                                        }
                                                        if (confronModSolo.getHoraTermino() != null) {
                                                            sHoraFinal = sdfHora.format(confronto.getHoraTermino());
                                                        } else {
                                                            sHoraFinal = "";
                                                        }
                                            %>

                                            <div class="col-sm-6">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Jogo <%=numeroJogo%></h5>
                                                        <%
                                                            /*
                                                            System.out.println("Confronto: "+ numeroJogo);
                                                            System.out.println("Data jogo: "+ sDataJogo);
                                                            System.out.println("Hora inicio: "+ sHoraInicio);
                                                            System.out.println("Hora final: "+ sHoraFinal);
                                                            System.out.println("ID LOCAL: "+ confronModColetiva.getLocal().getIdLocal());
                                                             */
                                                        %>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" style="width: 8.6rem;"><%=confronModSolo.getAtletas().get(0).getAtleta().getUsuarioParticipante().getNome()%></span>
                                                            </div>

                                                            <input type="text" class="form-control numberMask" id="placarConfronto<%=confronModSolo.getIdConfronto()%><%=confronModSolo.getAtletas().get(0).getAtleta().getIdAtleta()%>">
                                                            <input type="hidden" value="<%=confronModSolo.getAtletas().get(0).getAtleta().getIdAtleta()%>">
                                                            <input type="text" class="form-control numberMask" id="placarConfronto<%=confronModSolo.getIdConfronto()%><%=confronModSolo.getAtletas().get(1).getAtleta().getIdAtleta()%>">
                                                            <input type="hidden" value="<%=confronModSolo.getAtletas().get(1).getAtleta().getIdAtleta()%>">

                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" style="width: 8.6rem;"><%=confronModSolo.getAtletas().get(1).getAtleta().getUsuarioParticipante().getNome()%></span>
                                                            </div>
                                                        </div>
                                                        <p class="text-sm-left" style="margin-top: 10px;">Local:<%if (confronModSolo.getLocal() != null) {%><%=confronModSolo.getLocal().getNome()%><%}%></p>
                                                        <p class="text-sm-left">Data:<%=sDataJogo%></p>
                                                        <p>
                                                            <%if (confronModSolo.isFinalizado()) {%>
                                                            <span class="badge badge-pill badge-success">Realizado</span>
                                                            <%} else {%>
                                                            <span class="badge badge-pill badge-warning">Não realizado</span>
                                                            <%}%>
                                                        </p>

                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalInserirDadosJogo<%=confronModSolo.getIdConfronto()%>">Inserir dados do jogo</button>
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" onclick="abrirModalFinalizarJogo(<%=idConfronto%>, <%=confronModSolo.getAtletas().get(0).getAtleta().getIdAtleta()%>, <%=confronModSolo.getAtletas().get(1).getAtleta().getIdAtleta()%>);">Finalizar jogo</button>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Modal inserir dados do jogo-->
                                            <div class="modal fade" id="modalInserirDadosJogo<%=confronModSolo.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Inserir dados do jogo <%=numeroJogo%></h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="scripts/editarConfrontoColetivo.jsp" name="formDadosJogo<%=confronModSolo.getIdConfronto()%>">
                                                                <input type="hidden" value="1" name="op">
                                                                <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao">
                                                                <input type="hidden" value="<%=confronModSolo.getIdConfronto()%>" name="idConfronto">
                                                                <div class="form-group">
                                                                    <p class="text-left">Data do jogo:</p>
                                                                    <input type="text" class="dateMask form-control" id="dataJogo<%=idConfronto%>" name="dataJogo<%=idConfronto%>">
                                                                    <div id="divErroData<%=idConfronto%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">

                                                                    <p class="text-left">Hora de início:</p>
                                                                    <input type="text" class="timeMask form-control" id="horaInicioJogo<%=idConfronto%>" name="horaInicioJogo<%=idConfronto%>">
                                                                </div>   
                                                                <div class="form-group">    
                                                                    <p class="text-left">Hora de término:</p>
                                                                    <input type="text" class="timeMask form-control" id="horaFinalJogo<%=idConfronto%>" name="horaTerminoJogo<%=idConfronto%>">
                                                                    <div id="divErroHora<%=idConfronto%>">
                                                                    </div>
                                                                </div>
                                                                <div class="form-group">
                                                                    <p class="text-left">Local do jogo:</p>
                                                                    <select required="true" class="form-control" id="selectJogo<%=idConfronto%>" name="localJogo<%=idConfronto%>">
                                                                        <%

                                                                            for (Local local : lclc.buscarTodosLocal()) {
                                                                        %>
                                                                        <option value="<%=local.getIdLocal()%>"><%=local.getNome()%></option>
                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                                <%
                                                                    /*Formata as datas de início e término da competição para criar inputs com seus respectivos valores*/

                                                                    String sDataInicioCpt = sdfData.format(competicao.getCompeticao().getDataInicio());
                                                                    String sDataTerminoCpt = sdfData.format(competicao.getCompeticao().getDataTermino());
                                                                %>
                                                                <input type="hidden" value="<%=sDataInicioCpt%>" id="dataInicioCpt">
                                                                <input type="hidden" value="<%=sDataTerminoCpt%>" id="dataTerminoCpt">

                                                            </form>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                                                            <button type="button" class="btn btn-success" onclick="validarDadosJogo(<%=confronModSolo.getIdConfronto()%>);">Salvar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Modal FINALIZAR DADOS JOGO-->
                                            <div class="modal fade bd-example-modal-lg" id="modalFinalizarJogo<%=confronModSolo.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente finalizar o jogo</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body" onload="inserirDados();">
                                                            <p class="text-bolder">Resultado do jogo:</p>
                                                            <div class="input-group">

                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><%=confronModSolo.getAtletas().get(0).getAtleta().getUsuarioParticipante().getNome()%></span>
                                                                </div>

                                                                <input type="text" readonly="true" class="form-control numberMask" disabled="true">
                                                                <input type="hidden" value="<%=confronModSolo.getAtletas().get(0).getAtleta().getIdAtleta()%>" id="placarConfrontoModal<%=confronModSolo.getIdConfronto()%><%=confronModSolo.getAtletas().get(0).getAtleta().getIdAtleta()%>">
                                                                <input type="text" class="form-control numberMask" disabled="true">
                                                                <input type="hidden" value="<%=confronModSolo.getAtletas().get(1).getAtleta().getIdAtleta()%>" id="placarConfrontoModal<%=confronModSolo.getIdConfronto()%><%=confronModSolo.getAtletas().get(1).getAtleta().getIdAtleta()%>">

                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text"><%=confronModSolo.getAtletas().get(1).getAtleta().getUsuarioParticipante().getNome()%></span>
                                                                </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <p class="text-left" style="margin-top: 10px;">Informações adicionais do jogo:</p>
                                                                <textarea class="form-control" id="message-text"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                            <button type="button" class="btn btn-primary">Salvar</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>            



                                            <%  numeroJogo++;
                                                    }}
                                                }
                                            %>                                                                                                              
                                        </div>
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <li class="page-item">
                                                    <a class="page-link" href="gerenciarCompModColetiva.jsp?id=<%=competicao.getIdCompeticaoModalidade()%>" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                    </a>
                                                </li>
                                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#" aria-label="Next">
                                                        <span aria-hidden="true">&raquo;</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="tab-pane fade" id="teste" role="tabpanel" aria-labelledby="teste-tab">1</div>
                                    <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
                                </div>
                            </div>
                        </div>
                        <script>
                            $('.dateMask').mask('00/00/0000', {reverse: true});
                            $('.timeMask').mask('00:00', {reverse: true});
                            $('.numberMask').mask('000', {reverse: true});
                        </script>
                    </div>


                    <div class="tab-pane active" id="messages" role="tabpanel">

                    </div>
                    <!--Competidores-->
                    <div class="tab-pane" id="settings" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="table" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Atleta</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%

                                    for (InscricaoCompeticaoSolo iMs : competicao.getInscricoesCompeticaoSolo()) {
                                        if (iMs.getInscricaoAceita() == 'A') {
                                            String nomeAtleta = iMs.getAtleta().getUsuarioParticipante().getNome();


                                %>    
                            <td><%=nomeAtleta%></td>
                            <td>

                                <a href="scripts/aprovaInscCompSolo.jsp?opt=3&idInsc=<%=iMs.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>&idAtleta=<%=iMs.getAtleta().getIdAtleta()%>" class="btn btn-danger">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-trash-alt"></i>
                                </a> &nbsp;
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMs.getAtleta().getIdAtleta()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=iMs.getAtleta().getIdAtleta()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=nomeAtleta%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            Nome do Atleta:&nbsp; <%=nomeAtleta%> <br>
                                            Email para Contato:&nbsp;<%=iMs.getAtleta().getUsuarioParticipante().getEmail()%>



                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }%>
                        </table>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalConfirmarGerarJogos">
                            Gerar jogos da competição
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalConfirmarGerarJogos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <%if (competicao.isJogosEmAndamento()) {%>
                                        <h5 class="modal-title" id="exampleModalLabel">Deseja gerar novamente os jogos desta competição? <%=competicao.getNomeCompeticao()%></h5>
                                        <%} else {
                                        %>
                                        <h5 class="modal-title" id="exampleModalLabel">Deseja realmente gerar os jogos da competição <%=competicao.getNomeCompeticao()%></h5>
                                        <%}%>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>

                                    <div class="modal-footer">
                                        <form action="scripts/gerarJogosModalidadeSolo.jsp">
                                            <input type="hidden" value="<%=competicao.getIdCompeticaoModalidade()%>" name="idCompModSolo">
                                            <button type="submit" class="btn btn-primary">Sim</button>
                                        </form>

                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                                            <%System.out.println(competicao.getConfrontos().size());%>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                        </script>
                    </div>
                </div>

            </div>
        </div>




        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
            }
        %>
    </body>

</html>
