<%-- 
    Document   : interfaceSistemaEliminatorio
    Created on : 30/09/2019, 14:56:18
    Author     : Usuário
--%>


<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
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
<style>
    div.ex1 {
        background-color: lightblue;
        width: 1700px;
        overflow-x: scroll;
    }
</style>
<!-- List group -->
<div class="row">
    <div class="list-group col-2" id="myList" role="tablist">
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Mensagens</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
        <a class="list-group-item list-group-item-action" data-toggle="list" href="#competidores" role="tab">Competidores</a>
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

        <!--TAB PANE DOS JOGOS DA COMPETIÇÃO!-->

        <div class="tab-pane active" id="jogos" role="tabpanel">

            <div class="card text-center">
                <div class="card-header">
                    <%

                        int numeroPaginas = (int) Math.rint(competicao.getBlocosEliminatorios().size() / 3);
                        // Em casos que o numero de etapas é menor que 3
                        if(numeroPaginas == 0){
                            numeroPaginas = 1;
                        }
                        if (numeroPaginas != 1) {
                    %>
                    <nav aria-label="Page navigation example" style="margin-bottom: -12px;">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Voltar</a>
                            </li>
                            <%
                                for (int i = 1; i <= numeroPaginas; i++) {
                            %>
                            <li class="page-item"><a class="page-link" href="#"><%=i%></a></li>
                                <%}%>
                            <li class="page-item">
                                <a class="page-link" href="#">Próximo</a>
                            </li>
                        </ul>
                    </nav>
                    <%}%>
                </div>
                <div class="card-body">
                    <%
                        if (numeroPaginas == 1) {
                    %>
                    <div class="row">
                        <%
                            int numeroConfrontosBlocoAnterior = 0;
                            int numeroConfrontosBlocoAtual = 0;
                            for (BlocoEliminatorio bE : competicao.getBlocosEliminatorios()) {
                                
                            List<EquipeCompeticao> equipesCompeticao = competicao.getEquipesCompeticao();

                            // Verifica se já faz parte do bloco eliminatorio
                            for (Confronto confronto : bE.getConfrontos()) {
                                
                            System.out.println("CCC");
                            ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                            if(confColetivo.getEquipes().isEmpty() == false){
                                for(EquipeCompeticao eq: confColetivo.getEquipes()){
                                    for(EquipeCompeticao equipeCompeticao: equipesCompeticao){
                                        if(eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()){
                                            
                                            System.out.println("CCC: "+equipeCompeticao.getEquipe().getNome());
                                            equipesCompeticao.remove(equipeCompeticao);
                                            break;
                                        }
                                    }
                                }
                            }
                            }
                                
                                numeroConfrontosBlocoAtual = bE.getConfrontos().size();
                        %>   
                        <div class="card" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title">Rodada <%=bE.getEtapa()%></h5>
                                <%
                                    int contadorCardsInvisiveis = 0;
                                    int contador = 1;
                                    int cardsInvisiveis = 0;

                                    if (bE.getEtapa() != 1) {
                                        cardsInvisiveis = numeroConfrontosBlocoAnterior - numeroConfrontosBlocoAtual;
                                        if (cardsInvisiveis == 0) {
                                            cardsInvisiveis = 2;
                                        }
                                        for (int i = 0; i < (cardsInvisiveis / 2); i++) {

                                %>
                                <div style="margin-bottom: 15px; height: 6.5rem;"></div>                        
                                <%}
                            }%>
                                <%
                                    for (Confronto c : bE.getConfrontos()) {

                                        ConfrontoModalidadeColetiva confmc = (ConfrontoModalidadeColetiva) c;
                                        String nomeEquipe1 = "", nomeEquipe2 = "";
                                        if (confmc.getEquipes().size() == 0) {

                                        } else {
                                            if (confmc.getEquipes().get(0) != null) {
                                                nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                            }
                                            if (confmc.getEquipes().get(1) != null) {
                                                nomeEquipe2 = confmc.getEquipes().get(1).getEquipe().getNome();
                                            }
                                        }
                                %>
                                <div class="card" style="margin-bottom: 15px; height: 9rem;" id="cardConfrontoColetivo<%=confmc.getIdConfronto()%>">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">  
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe1%></div>
                                                </div>

                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">

                                            </div>
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                </div>
                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">
                                            </div>

                                            <a href="#" class="badge badge-info"><i class="fas fa-eye"></i></a>
                                            <a href="javascript:acionarModalInserirDadosConfronto(<%=confmc.getIdConfronto()%>);" class="badge badge-primary">Inserir dados do jogo</a>
                                            <a href="#" class="badge badge-success"><i class="fas fa-greater-than"></i></a>

                                        </li>
                                    </ul>
                                </div>

                                <!-- Modal inserir dados do jogo-->
                                <div class="modal fade" id="modalInserirDadosConfronto<%=confmc.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Inserir dados jogo</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form method="POST" action="scripts/editarConfrontoColetivo.jsp" name="formDadosJogo<%=confmc.getIdConfronto()%>">
                                                    <input type="hidden" value="3" name="op" id="op<%=confmc.getIdConfronto()%>">
                                                    <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao">
                                                    <input type="hidden" value="<%=confmc.getIdConfronto()%>" name="idConfronto">
                                                    
                                                    
                                                    <div class="form-group" >
                                                        <p class="text-left">Equipes confrontantes:</p>
                                                        <div class="form-row">
                                                            <select required="true" class="form-control col" id="selectEquipe1<%=confmc.getIdConfronto()%>" name="selectEquipe1" style="margin-right: 6px;">
                                                                <option selected value="0"></option>
                                                                <%

                                                                    
                                                                    for (EquipeCompeticao equipe1 : equipesCompeticao) {
                                                                        
                                                                %>
                                                                <option value="<%=equipe1.getIdEquipeCompeticao()%>"><%=equipe1.getEquipe().getNome()%></option>
                                                                <%}%>
                                                            </select>
                                                            <select required="true" class="form-control col" id="selectEquipe2<%=confmc.getIdConfronto()%>" name="selectEquipe2">
                                                                <option selected value="0"></option>
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
                                                            <input type="text" class="dateMask form-control" id="dataJogo<%=confmc.getIdConfronto()%>" name="dataJogo<%=confmc.getIdConfronto()%>">
                                                        </div>
                                                    </div>
                                                    <div id="divErroData<%=confmc.getIdConfronto()%>">
                                                        
                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group col">

                                                            <p class="text-left">Hora de início:</p>
                                                            <input type="text" class="timeMask form-control" id="horaInicioJogo<%=confmc.getIdConfronto()%>" name="horaInicioJogo<%=confmc.getIdConfronto()%>">
                                                        </div>   
                                                        <div class="form-group col">    
                                                            <p class="text-left">Hora de término:</p>
                                                            <input type="text" class="timeMask form-control" id="horaFinalJogo<%=confmc.getIdConfronto()%>" name="horaTerminoJogo<%=confmc.getIdConfronto()%>">
                                                        </div>
                                                    </div>
                                                    <div id="divErroHora<%=confmc.getIdConfronto()%>">
                                                    </div>

                                                    <div class="form-group">
                                                        <p class="text-left">Local do jogo:</p>
                                                        <select required="true" class="form-control" id="selectLocalJogo<%=confmc.getIdConfronto()%>" name="localJogo<%=confmc.getIdConfronto()%>">
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

                                                <button type="button" class="btn btn-success" onclick="validarDadosJogo(<%=confmc.getIdConfronto()%>);">Salvar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%
                                    contador++;
                                    if (contador == bE.getConfrontos().size()) {
                                        numeroConfrontosBlocoAnterior = bE.getConfrontos().size();

                                    }%>
                                <%}%>


                            </div>
                        </div>
                        <%
                            for (int i = 0; i < (cardsInvisiveis / 2); i++) {
                        %>
                        <div style="margin-bottom: 15px; height: 6.5rem;"></div>                        
                        <%}%> 

                        <%}
                        }%>
                    </div>
                </div>
            </div>
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
                            <form action="scripts/gerarJogosCompeticaoModalidadeColetivaSistemaEliminatorio.jsp">
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

<script>
        $('.dateMask').mask('00/00/0000', {reverse: true});
        $('.timeMask').mask('00:00', {reverse: true});
        $('.numberMask').mask('000', {reverse: true});
        
    function acionarModalInserirDadosConfronto(idConfronto) {
        $('#modalInserirDadosConfronto' + idConfronto).modal('show');
    }


    function validarDadosJogo(idConfronto) {


        var divErroData = document.getElementById('divErroData' + idConfronto);
        
        var divErroHora = document.getElementById('divErroHora' + idConfronto);

        var sDataInicioCpt = document.getElementById('dataInicioCpt').value;

        var sDataTerminoCpt = document.getElementById('dataTerminoCpt').value;

        var op = document.getElementById('op' + idConfronto).value;



        var dataValida, horaValida;

        dataValida = dataJogoEstaEntreDataInicioETerminoCompeticao(sDataInicioCpt, sDataTerminoCpt, idConfronto);

        horaValida = isHoraInicialMenorHoraFinal(idConfronto);




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


                if (equipe1 !== '0' && equipe2 !== 0) {
                    if (equipe1 !== equipe2) {

                        document.forms["formDadosJogo" + idConfronto].submit();
                    }
                }
            }

            if (op === '2') {
                document.forms["formDadosJogo" + idConfronto].submit();

            }
            
            if(op === '3'){
                alert("Entrei aqui!");
                $('#modalInserirDadosConfronto' + idConfronto).modal('hide');
                getDados(idConfronto);
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