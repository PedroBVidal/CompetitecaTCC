<%-- 
    Document   : interfaceSistemaTodosContraTodos
    Created on : 27/09/2019, 08:51:28
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();
    LocalControle localControle = new LocalControle();
    int idCompeticao = Integer.parseInt(request.getParameter("id"));
    CompeticaoModalidadeColetiva competicao = competicaoControle.buscarPorId(idCompeticao);

    SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
%>

<!-- List group -->
<div class="row">
    <div class="list-group col-2" id="myList" role="tablist">
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Mensagens</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#competidores" role="tab">Competidores</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#tabeladocampeonato" role="tab">Tabela do campeonato</a>
        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#jogos" role="tab">Jogos</a>


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
                        <th scope="col">Equipe</th>
                        <th scope="col">Ação</th>
                    </tr>
                </thead>

                <tbody>
                    <%
                        for (InscricaoCompeticaoColetiva iMc : competicao.getInscricoesCompeticoesColetivas()) {
                            if (iMc.getInscricaoAceita() == 'E') {
                                String nomeEquipe = iMc.getEquipe().getNome();


                    %>    
                <td><%=nomeEquipe%></td>
                <td>
                    <a href="scripts/aprovaInscCompColetiva.jsp?opt=1&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-success">
                        <!-- Adicionar icone -->
                        <i class="fas fa-check"></i>
                    </a> &nbsp;
                    <a href="scripts/aprovaInscCompColetiva.jsp?opt=2&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-danger">
                        <!-- Adicionar icone -->
                        <i class="fas fa-times"></i>
                    </a> &nbsp;
                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMc.getEquipe().getIdEquipe()%>">
                        <!-- Adicionar icone -->
                        <i class="fas fa-eye"></i>
                    </button></td>

                </tbody>

                <div class="modal fade" id="<%=iMc.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                                <b>Email para Contato:</b>&nbsp;<%=iMc.getEquipe().getAdministrador().getEmail()%><br>
                                <b>Atletas Inscritos:</b><br>
                                <ul>
                                    <%for (Atleta atl : iMc.getAtletas()) {%>
                                    <li><%=atl.getUsuarioParticipante().getNome()%></li>   
                                        <%    }
                                        %>
                                </ul>

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






        <div class="tab-pane" id="messages" role="tabpanel">

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
                SistemaTodosContraTodos sistemaTodosContraTodos = (SistemaTodosContraTodos) competicao.getSistemaDeCompeticao();
                String desempate1 = sistemaTodosContraTodos.getSistemaDeDesempate().getTipoDesempate();
                String desempate2 = sistemaTodosContraTodos.getSistemaDeDesempate().getTipoDesempateSecundario();
                List<EquipeCompeticao> equipesOrdenadas = competicaoControle.ordenarEquipesCompeticao(desempate1, desempate2, competicao.getIdCompeticaoModalidade());

                for (EquipeCompeticao equipeCompeticao : equipesOrdenadas) {
                    contador++;

                    int pontos = (int) equipeCompeticao.getPontos();
                    int pontosMarcados = (int) equipeCompeticao.getPontosMarcados();
                    int pontosSofridos = (int) equipeCompeticao.getPontosSofridos();
                    int saldoPontos = (int) equipeCompeticao.getSaldoDePontos();
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
<!--TAB PANE DOS JOGOS DA COMPETIÇÃO!-->

<div class="tab-pane active" id="jogos" role="tabpanel">

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
            <!--Botão acionar MODAL NOVO JOGO-->
            <p class="text-sm-left"><button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalNovoJogo"><i class="fas fa-plus"></i>&nbsp;Novo jogo</button></p>
            <div class="tab-content" id="myTabContent">

                <!--Tab JOGOS-->
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                    <div class="row">
                        <%
                            if (competicao.isJogosEmAndamento() == true) {

                                int numeroJogo = 1;
                                for (Confronto confronto : competicao.getConfrontos()) {

                                    ConfrontoModalidadeColetiva confronModColetiva = (ConfrontoModalidadeColetiva) confronto;

                                    String sDataJogo, sHoraInicio, sHoraFinal;
                                    int idConfronto = confronModColetiva.getIdConfronto();

                                    if (confronModColetiva.getDataConfronto() != null) {
                                        sDataJogo = sdfData.format(confronModColetiva.getDataConfronto());
                                    } else {
                                        sDataJogo = "";
                                    }
                                    if (confronModColetiva.getHoraInicio() != null) {
                                        sHoraInicio = sdfHora.format(confronto.getHoraInicio());
                                    } else {
                                        sHoraInicio = "";
                                    }
                                    if (confronModColetiva.getHoraTermino() != null) {
                                        sHoraFinal = sdfHora.format(confronto.getHoraTermino());
                                    } else {
                                        sHoraFinal = "";
                                    }
                        %>

                        <div class="col-sm-6" style="margin-bottom: 15px;">
                            <div class="card" style="height: 19rem;">
                                <div class="card-body">
                                    <%
                                        boolean dadosConfrontoPreenchidos = false;
                                        if (confronModColetiva.isFinalizado() == false) {

                                            if (confronModColetiva.getDataConfronto() != null) {
                                                if (confronModColetiva.getHoraInicio() != null) {
                                                    if (confronModColetiva.getHoraTermino() != null) {
                                                        if (confronModColetiva.getLocal() != null) {
                                                            dadosConfrontoPreenchidos = true;
                                                        }
                                                    }
                                                }
                                            }
                                    %>

                                    <p class="text-center" style="font-size: 20px;">Jogo <%=numeroJogo%>
                                        <%
                                            if (confronModColetiva.isFinalizado() == false) {
                                        %>
                                        <button type="button" class="btn btn-light" style="float: right;" data-toggle="modal" data-target="#modalExcluirJogo<%=confronModColetiva.getIdConfronto()%>"><i class="fas fa-trash-alt"></i></button>

                                        <%}%>
                                    </p>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width: 8.6rem;"><%=confronModColetiva.getEquipes().get(0).getEquipe().getNome()%></span>
                                        </div>

                                        <input type="text" class="form-control numberMask" id="placarConfronto<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>">
                                        <input type="hidden" value="<%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>">
                                        <input type="text" class="form-control numberMask" id="placarConfronto<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>">
                                        <input type="hidden" value="<%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>">

                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width: 8.6rem;"><%=confronModColetiva.getEquipes().get(1).getEquipe().getNome()%></span>
                                        </div>
                                    </div>
                                    <%
                                        if (dadosConfrontoPreenchidos) {
                                    %>
                                    <p class="text-sm-left" style="margin-top: 10px;">Local:<%=confronModColetiva.getLocal().getNome()%></p>
                                    <p class="text-sm-left">Data: <%=sDataJogo%> - Horário (<%=sHoraInicio%> às <%=sHoraFinal%>)</p>
                                    <%} else {%>                                                                                                        
                                    <p class="text-sm-left" style="margin-top: 10px;">Local: Não cadastrado</p>
                                    <p class="text-sm-left">Data/Horário - Não possui data e horário cadastrados</p>
                                    <%}%>
                                    <p>



                                        <span class="badge badge-pill badge-warning">Não realizado</span>

                                    </p>

                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalInserirDadosJogo<%=confronModColetiva.getIdConfronto()%>">Inserir dados do jogo</button>
                                    <%
                                        if (dadosConfrontoPreenchidos) {
                                    %>
                                    <button type="button" class="btn btn-success" data-toggle="modal" onclick="abrirModalFinalizarJogo(<%=idConfronto%>, <%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>, <%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>);">Finalizar jogo</button>
                                    <%} else {%>
                                    <!--Botão finalizar jogo desabilitado-->
                                    <button type="button" disabled class="btn btn-success" data-toggle="modal" onclick="abrirModalFinalizarJogo(<%=idConfronto%>, <%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>, <%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>);">Finalizar jogo</button>
                                    <%}%>
                                    <%} else {
                                        // CASO O CONFRONTO ESTIVER FINALIZADO CRIA UMA INTERFACE DIFERENTE    
                                    %>
                                    <h5 class="card-title">Jogo <%=numeroJogo%></h5>

                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width: 8.6rem;"><%=confronModColetiva.getEquipes().get(0).getEquipe().getNome()%></span>
                                        </div>

                                        <input type="text" readonly class="form-control numberMask" id="placarConfronto<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>" value="<%=confronModColetiva.getPlacarEquipe1()%>">
                                        <input type="hidden" value="<%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>">
                                        <input type="text" readonly class="form-control numberMask" id="placarConfronto<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>" value="<%=confronModColetiva.getPlacarEquipe2()%>">
                                        <input type="hidden" value="<%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>">

                                        <div class="input-group-prepend">
                                            <span class="input-group-text" style="width: 8.6rem;"><%=confronModColetiva.getEquipes().get(1).getEquipe().getNome()%></span>
                                        </div>
                                    </div>
                                    <p class="text-sm-left" style="margin-top: 10px;">Local: <%if (confronModColetiva.getLocal() != null) {%><%=confronModColetiva.getLocal().getNome()%><%}%></p>
                                    <p class="text-sm-left">Data: <%=sDataJogo%> - Horário (<%=sHoraInicio%> às <%=sHoraFinal%>)</p>
                                    <p>
                                        <span class="badge badge-pill badge-success">Realizado</span>
                                    </p>



                                    <%}%>
                                </div>
                            </div>
                        </div>

                        <!-- Modal inserir dados do jogo-->
                        <div class="modal fade" id="modalInserirDadosJogo<%=confronModColetiva.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Inserir dados do jogo <%=numeroJogo%></h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="scripts/editarConfrontoColetivo.jsp" name="formDadosJogo<%=confronModColetiva.getIdConfronto()%>">
                                            <input type="hidden" value="2" name="op" id="op<%=confronModColetiva.getIdConfronto()%>">
                                            <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao">
                                            <input type="hidden" value="<%=confronModColetiva.getIdConfronto()%>" name="idConfronto">
                                            <div class="form-group">
                                                <p class="text-left">Data do jogo:</p>
                                                <input type="text" class="dateMask form-control" id="dataJogo<%=idConfronto%>" name="dataJogo<%=idConfronto%>" value="<%=sDataJogo%>">
                                                <div id="divErroData<%=idConfronto%>">
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="form-group col">

                                                    <p class="text-left">Hora de início:</p>
                                                    <input type="text" class="timeMask form-control" id="horaInicioJogo<%=idConfronto%>" name="horaInicioJogo<%=idConfronto%>" value="<%=sHoraInicio%>">
                                                </div>   
                                                <div class="form-group col">    
                                                    <p class="text-left">Hora de término:</p>
                                                    <input type="text" class="timeMask form-control" id="horaFinalJogo<%=idConfronto%>" name="horaTerminoJogo<%=idConfronto%>" value="<%=sHoraFinal%>">
                                                    <div id="divErroHora<%=idConfronto%>">
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="divErroHora<%=idConfronto%>">
                                            </div>
                                            <div class="form-group">
                                                <p class="text-left">Local do jogo:</p>
                                                <select required="true" class="form-control" id="selectJogo<%=idConfronto%>" name="localJogo<%=idConfronto%>">
                                                    <%
                                                        boolean confrontoPossuiLocal = false;

                                                        if (confronModColetiva.getLocal() == null) {
                                                            confrontoPossuiLocal = false;
                                                        } else {
                                                            confrontoPossuiLocal = true;
                                                        }

                                                        for (Local local : localControle.buscarTodosLocal()) {
                                                            if (confrontoPossuiLocal == true) {
                                                                if (local.getIdLocal() == confronModColetiva.getLocal().getIdLocal()) {


                                                    %>

                                                    <option selected="true" value="<%=local.getIdLocal()%>"><%=local.getNome()%></option>
                                                    <%} else {%>
                                                    <option value="<%=local.getIdLocal()%>"><%=local.getNome()%></option>
                                                    <%}
                                                        }%>
                                                    <%
                                                        if (confrontoPossuiLocal == false) {
                                                    %>
                                                    <option value="<%=local.getIdLocal()%>"><%=local.getNome()%></option>
                                                    <%}
                                                        }%>
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

                                        <button type="button" class="btn btn-success" onclick="validarDadosJogo(<%=confronModColetiva.getIdConfronto()%>);">Salvar</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal excluir dados jogo-->
                        <div class="modal fade" id="modalExcluirJogo<%=confronModColetiva.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir o jogo <%=numeroJogo%>?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                        <form action="scripts/editarConfrontoColetivo.jsp" method="POST">
                                            <input type="hidden" name="op" value="3">
                                            <input type="hidden" name="idCompeticao" value="<%=competicao.getIdCompeticaoModalidade()%>">
                                            <input type="hidden" name="idConfronto" value="<%=confronModColetiva.getIdConfronto()%>">
                                            <button type="submit" class="btn btn-primary">Sim</button>
                                        </form>


                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal FINALIZAR DADOS JOGO-->
                        <div class="modal fade bd-example-modal-lg" id="modalFinalizarJogo<%=confronModColetiva.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <form action="scripts/finalizarJogo.jsp" method="POST">
                                        <input type="hidden" name="idCompeticao" value="<%=idCompeticao%>">
                                        <input type="hidden" name="idConfronto" value="<%=idConfronto%>">
                                        <input type="hidden" name="idEquipe1" value="<%=confronModColetiva.getEquipes().get(0).getIdEquipeCompeticao()%>">
                                        <input type="hidden" name="idEquipe2" value="<%=confronModColetiva.getEquipes().get(1).getIdEquipeCompeticao()%>">
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
                                                    <span class="input-group-text"><%=confronModColetiva.getEquipes().get(0).getEquipe().getNome()%></span>
                                                </div>

                                                <input type="text" readonly class="form-control" id="placarConfrontoModal<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>" name="placarConfrontoModal<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(0).getIdEquipeCompeticao()%>" style="text-align:center;">
                                                <input type="hidden" value="<%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>" name="confrontoEquipe<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(0).getEquipe().getIdEquipe()%>">
                                                <input type="text" readonly class="form-control" id="placarConfrontoModal<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>" name="placarConfrontoModal<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(1).getIdEquipeCompeticao()%>" style="text-align:center;">
                                                <input type="hidden" value="<%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>" name="confrontoEquipe<%=confronModColetiva.getIdConfronto()%><%=confronModColetiva.getEquipes().get(1).getEquipe().getIdEquipe()%>">

                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"><%=confronModColetiva.getEquipes().get(1).getEquipe().getNome()%></span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <p class="text-left" style="margin-top: 10px;">Informações adicionais do jogo:</p>
                                                <textarea class="form-control" id="message-text"></textarea>
                                            </div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                            <button type="submit" class="btn btn-success">Finalizar jogo</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>            



                        <%  numeroJogo++;
                                }
                            }
                        %>                                                                                                              
                    </div>
                    <!--
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
                    -->

                    <!-- Modal novo jogo-->
                    <div class="modal fade" id="modalNovoJogo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Cadastrar novo jogo</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="scripts/editarConfrontoColetivo.jsp" name="formDadosJogoNovoJogo">
                                        <input type="hidden" value="1" name="op" id="opNovoJogo">
                                        <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao">

                                        <div class="form-group">
                                            <p class="text-left">Equipes confrontantes:</p>
                                            <div class="form-row">
                                                <select required="true" class="form-control col" id="selectEquipe1" name="selectEquipe1" style="margin-right: 6px;">
                                                    <option selected value="0">Selecione a equipe</option>
                                                    <%
                                                        List<EquipeCompeticao> equipesCompeticao = competicao.getEquipesCompeticao();
                                                        for (EquipeCompeticao equipe1 : equipesCompeticao) {

                                                    %>
                                                    <option value="<%=equipe1.getIdEquipeCompeticao()%>"><%=equipe1.getEquipe().getNome()%></option>
                                                    <%}%>
                                                </select>
                                                <select required="true" class="form-control col" id="selectEquipe2" name="selectEquipe2">
                                                    <option selected>Selecione a equipe</option>
                                                    <%

                                                        for (EquipeCompeticao equipe2 : equipesCompeticao) {

                                                    %>
                                                    <option value="<%=equipe2.getIdEquipeCompeticao()%>"><%=equipe2.getEquipe().getNome()%></option>
                                                    <%}%>
                                                </select>
                                            </div>

                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col">
                                                <p class="text-left">Data do jogo:</p>
                                                <input type="text" class="dateMask form-control" id="dataJogoNovoJogo" name="dataJogoNovoJogo">
                                            </div>
                                        </div>
                                        <div id="divErroDataNovoJogo">
                                        </div>

                                        <div class="form-row">
                                            <div class="form-group col">

                                                <p class="text-left">Hora de início:</p>
                                                <input type="text" class="timeMask form-control" id="horaInicioJogoNovoJogo" name="horaInicioJogoNovoJogo">
                                            </div>   
                                            <div class="form-group col">    
                                                <p class="text-left">Hora de término:</p>
                                                <input type="text" class="timeMask form-control" id="horaFinalJogoNovoJogo" name="horaTerminoJogoNovoJogo">
                                            </div>
                                        </div>
                                        <div id="divErroHoraNovoJogo">
                                        </div>

                                        <div class="form-group">
                                            <p class="text-left">Local do jogo:</p>
                                            <select required="true" class="form-control" id="selectJogoNovoJogo" name="localJogoNovoJogo">
                                                <%
                                                    for (Local local : localControle.buscarTodosLocal()) {
                                                %>

                                                <option value="<%=local.getIdLocal()%>"><%=local.getNome()%></option>
                                                <%
                                                    }%>
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

                                    <button type="button" class="btn btn-success" onclick="validarDadosJogo('NovoJogo');">Salvar</button>
                                </div>
                            </div>
                        </div>
                    </div>
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

<!--Tab pane competidores-->
<div class="tab-pane" id="competidores" role="tabpanel">
    <div class="form-group input-group">
        <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
            </a></span>
        <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
    </div>
    <table id="table" class="table table-striped">
        <thead class="table-dark">
            <tr>
                <th scope="col">Equipe</th>
                <th scope="col">Ação</th>
            </tr>
        </thead>

        <tbody>
            <%

                for (EquipeCompeticao equipeCompeticao : competicao.getEquipesCompeticao()) {

                    String nomeEquipe = equipeCompeticao.getEquipe().getNome();


            %>    
        <td><%=nomeEquipe%></td>
        <td>

            <a href="#" class="btn btn-danger">
                <!-- Adicionar icone -->
                <i class="fas fa-trash-alt"></i>
            </a> &nbsp;
            <button class="btn btn-primary" data-toggle="modal" data-target="#<%=equipeCompeticao.getEquipe().getIdEquipe()%>">
                <!-- Adicionar icone -->
                <i class="fas fa-eye"></i>
            </button></td>

        </tbody>

        <div class="modal fade" id="<%=equipeCompeticao.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                        <b>Email para Contato:</b>&nbsp;<%=equipeCompeticao.getEquipe().getAdministrador().getEmail()%><br>
                        <b>Atletas Inscritos:</b><br>
                        <ul>
                            <%for (Atleta atl : equipeCompeticao.getAtletasEquipe()) {%>
                            <li><%=atl.getUsuarioParticipante().getNome()%></li>       
                                <% }
                                %>
                        </ul>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                    </div>
                </div>
            </div>
        </div>
        <%}%>
    </table>



    <!-- Button trigger modal -->
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
                    <form action="scripts/gerarJogosCompeticaoModalidadeColetiva.jsp">
                        <input type="hidden" value="<%=competicao.getIdCompeticaoModalidade()%>" name="idCompModColetiva">
                        <button type="submit" class="btn btn-primary">Sim</button>
                    </form>

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                </div>
            </div>
        </div>
    </div>
</div>
                        
    </div>
</div>
<!--Copiar DAQUIII!!!!-->


<script>
        $('input#txt_consulta').quicksearch('table#tabela tbody tr');

        function abrirModalFinalizarJogo(idConfronto, idEquipe1, idEquipe2) {
            alert("Entrei aquie!");
            valorPlacarEquipe1 = document.getElementById('placarConfronto' + idConfronto + idEquipe1).value;
            valorPlacarEquipe2 = document.getElementById('placarConfronto' + idConfronto + idEquipe2).value;
            alert(valorPlacarEquipe1);
            alert(valorPlacarEquipe2);

            placarEquipeModal1 = document.getElementById('placarConfrontoModal' + idConfronto + idEquipe1);
            placarEquipeModal2 = document.getElementById('placarConfrontoModal' + idConfronto + idEquipe2);

            placarEquipeModal1.value = valorPlacarEquipe1;
            placarEquipeModal2.value = valorPlacarEquipe2;

            alert("VALOR PLACAR EQUIPE 1: " + placarEquipeModal1.value);
            alert("VALOR PLACAR EQUIPE 2:" + placarEquipeModal2.value);


            $('#modalFinalizarJogo' + idConfronto).modal('show');
        }
        function validarDadosJogo(idConfronto) {

            alert("idConfronto: " + idConfronto);

            var divErroData = document.getElementById('divErroData' + idConfronto);

            var divErroHora = document.getElementById('divErroHora' + idConfronto);

            var sDataInicioCpt = document.getElementById('dataInicioCpt').value;

            var sDataTerminoCpt = document.getElementById('dataTerminoCpt').value;

            var op = document.getElementById('op' + idConfronto).value;

            alert(op);



            alert('YEAH');
            var dataValida, horaValida;

            dataValida = dataJogoEstaEntreDataInicioETerminoCompeticao(sDataInicioCpt, sDataTerminoCpt, idConfronto);
            alert("DATA VÁLIDA: " + dataValida);
            horaValida = isHoraInicialMenorHoraFinal(idConfronto);

            alert(horaValida);


            if (horaValida === true) {
                divErroHora.innerHTML = '';
            } else {
                divErroHora.innerHTML = '<p class="text-danger text-left">Horas de início e término inválidas.</p>';
            }
            if (dataValida === true) {
                divErroData.innerHTML = '';
            } else {
                divErroData.innerHTML = '<p class="text-danger text-left">A data do jogo está fora do período do evento.</p>';
            }
            if (horaValida === true && dataValida === true) {
                if (op === '1') {

                    var equipe1 = document.getElementById('selectEquipe1').value;
                    var equipe2 = document.getElementById('selectEquipe2').value;
                    alert("Equipe 1: " + equipe1);
                    alert("Equipe 2: " + equipe2);

                    if (equipe1 !== '0' && equipe2 !== 0) {
                        if (equipe1 !== equipe2) {

                            document.forms["formDadosJogo" + idConfronto].submit();
                        }
                    }
                }

                if (op === '2') {
                    document.forms["formDadosJogo" + idConfronto].submit();

                }

            }

        }

        function isHoraInicialMenorHoraFinal(idConfronto)
        {


            var horaInicial = document.getElementById('horaInicioJogo' + idConfronto).value;

            var horaFinal = document.getElementById('horaFinalJogo' + idConfronto).value;



            horaIni = horaInicial.split(':');
            horaFim = horaFinal.split(':');

            // Verifica as horas. Se forem diferentes, é só ver se a inicial 
            // é menor que a final. 
            hIni = parseInt(horaIni[0], 10);
            hFim = parseInt(horaFim[0], 10);
            if (hIni !== hFim) {

                if (hIni < hFim) {
                    return true;
                } else {
                    return false;
                }
            } else {
                mIni = parseInt(horaIni[1], 10);
                mFim = parseInt(horaFim[1], 10);
                if (mIni !== mFim) {
                    if (mIni < mFim) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        }

        function dataJogoEstaEntreDataInicioETerminoCompeticao(sDataInicioCompeticao, sDataTerminoCompeticao, idConfronto) {
            alert("idConfronto: " + idConfronto);
            var sDataJogo = document.getElementById('dataJogo' + idConfronto).value;


            var partsDataJogo = sDataJogo.split('/');
            var partsDataInicioCpt = sDataInicioCompeticao.split('/');
            var partsDataTerminoCpt = sDataTerminoCompeticao.split('/');

            var dataJogo = new Date(partsDataJogo[2], partsDataJogo[1] - 1, partsDataJogo[0]);
            var dataInicioCompeticao = new Date(partsDataInicioCpt[2], partsDataInicioCpt[1] - 1, partsDataInicioCpt[0]);
            var dataTerminoCompeticao = new Date(partsDataTerminoCpt[2], partsDataTerminoCpt[1] - 1, partsDataTerminoCpt[0]);

            if (dataJogo >= dataInicioCompeticao && dataJogo <= dataTerminoCompeticao) {

                return true;
            } else {

                return false;
            }
        }




</script>