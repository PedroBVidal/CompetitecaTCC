<%-- 
    Document   : interfaceSistemaEliminatorio
    Created on : 30/09/2019, 14:56:18
    Author     : Usuário
--%>


<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="java.util.ArrayList"%>
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
<!DOCTYPE html>
<html lang="pt-br">
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
                        </button>
                    </td>

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
                <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#compor" role="tab" aria-controls="nav-home" aria-selected="true">Compor</a>
                        <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#enviar" role="tab" aria-controls="nav-profile" aria-selected="false">Enviadas</a>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="compor" role="tabpanel" aria-labelledby="nav-home-tab">
                        <form method="post" action="scripts/enviarMensagemColetivo.jsp">
                            <div class="form-group">
                                <label for="titulo">Título</label>
                                <input type="text" class="form-control" id="titulo">
                            </div>
                            <div class="form-group">
                                <label for="mensagem">Mensagem</label>
                                <textarea class="form-control" id="mensagem" rows="3"></textarea>
                            </div>
                            <input type='submit' class='btn btn-success' value='Enviar'>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="enviar" role="tabpanel" aria-labelledby="nav-profile-tab">...</div>
                </div>
            </div>

            <!--TAB PANE DOS JOGOS DA COMPETIÇÃO!-->

            <div class="tab-pane active" id="jogos" role="tabpanel">
                <input type="hidden" value="1" id="paginaAtualBloco">
                <input type="hidden" value="1" id="paginaAtualBlocoRepescagem">
                <div class="card text-center">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" >
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Chaveamento</a>

                            </li>
                            <%
                                SistemaEliminatorio sE = (SistemaEliminatorio) competicao.getSistemaDeCompeticao();
                                if (sE.isRepescagem()) {
                            %>
                            <li class="nav-item">
                                <a class="nav-link" id="teste-tab" data-toggle="tab" href="#teste" role="tab" aria-controls="teste" aria-selected="false">Chaveamento respescagem</a>

                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <div class="card-body">



                        <div class="tab-content" id="myTabContent">


                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                <div class="container">
                                    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                    <div class="row">
                                        <div class="col-6 col-md-4"><button type="button" class="btn btn-success" style="margin-bottom: 10px;">Jogos em andamento</button></div>
                                        <div class="col-6 col-md-4">
                                            <%

                                                int numeroPaginas = competicao.buscarBlocosEliminatorios().size() - 2;
                                                System.out.println("Numero páginas: " + numeroPaginas);
                                                // Em casos que o numero de etapas é menor que 3
                                                if (numeroPaginas == 0) {
                                                    numeroPaginas = 1;
                                                }
                                                if (numeroPaginas != 1) {
                                            %>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item disabled" id="liVoltarPagChaveamento">
                                                        <a class="page-link" href="javascript:paginaAnterior(3, false, <%=idCompeticao%>);" tabindex="-1" aria-disabled="true" id="pagAnteriorChaveamento">Voltar</a>
                                                    </li>
                                                    <%
                                                        for (int i = 1; i <= numeroPaginas; i++) {
                                                    %>
                                                    <li class="page-item"><a class="page-link" href="javascript:mudarPagina(<%=i%>,3,false,<%=idCompeticao%>)"><%=i%></a></li>

                                                    <%}%>
                                                    <li class="page-item" id="liProximaPagChaveamento">
                                                        <a class="page-link" href="javascript:proximaPagina(3, false, <%=idCompeticao%>);" id="proximaPagChaveamento">Próximo</a>
                                                    </li>
                                                </ul>
                                                <input type="hidden" value="<%=numeroPaginas%>" id="numeroPaginas">
                                            </nav>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" id="blocosEliminatorios">
                                    <%
                                        int numeroConfrontosBlocoAnterior = 0;
                                        int numeroConfrontosBlocoAtual = 0;
                                        int etapaBlocoIncio = 1;
                                        int extensao = 3;
                                        if (request.getParameter("etapaParam") != null) {
                                            etapaBlocoIncio = Integer.parseInt(request.getParameter("etapaBlocoInicio"));
                                        }
                                        if (request.getParameter("extensao") != null) {
                                            extensao = Integer.parseInt(request.getParameter("extensao"));
                                        }
                                        int cont = etapaBlocoIncio;
                                        List<BlocoEliminatorio> filtroBlocos = competicao.filtrarBlocoEliminatorioPorEtapa(etapaBlocoIncio, extensao, false);
                                        List<BlocoEliminatorio> blocosEliminatorios = competicao.buscarBlocosEliminatorios();

                                        for (BlocoEliminatorio bE : filtroBlocos) {

                                            int etapaBloco = bE.getEtapa();
                                            int param = 0;

                                            int blocosInvisiveisA = 0, blocosInvisiveisP = 0;
                                            param = blocosEliminatorios.get(etapaBlocoIncio - 1).getConfrontos().size() - blocosEliminatorios.get(cont - 1).getConfrontos().size();

                                            System.out.println("PARAM: " + param);
                                            if (param % 2 == 0) {
                                                blocosInvisiveisA = param / 2;
                                                blocosInvisiveisP = param / 2;
                                            } else {
                                                blocosInvisiveisA = (param - 1) / 2;
                                                blocosInvisiveisP = (param + 1) / 2;
                                            }
                                            System.out.println("Etapa bloco: " + etapaBloco);
                                            System.out.println("Blocos invisíveis anterior: " + blocosInvisiveisA);

                                            List<EquipeCompeticao> equipesCompeticao = competicao.getEquipesCompeticao();
                                            List<EquipeCompeticao> equipesJaSelecionadas = new ArrayList();

                                            System.out.println("ANTES PUB: " + bE.getEtapa() + "-" + equipesCompeticao);
                                            // Verifica se já faz parte do bloco eliminatorio
                                            for (Confronto confronto : bE.getConfrontos()) {

                                                System.out.println("CCC");
                                                ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                                                if (confColetivo.getEquipes().isEmpty() == false) {
                                                    for (EquipeCompeticao eq : confColetivo.getEquipes()) {
                                                        for (EquipeCompeticao equipeCompeticao : equipesCompeticao) {
                                                            if (eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()) {

                                                                equipesJaSelecionadas.add(equipeCompeticao);
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            System.out.println("DEPOIS PUB: " + bE.getEtapa() + "-" + equipesCompeticao);

                                            numeroConfrontosBlocoAtual = bE.getConfrontos().size();
                                    %>
                                    <input type="hidden" value="<%=bE.getConfrontos().size()%>" id="numeroConfrontosBlocoEliminatorio<%=bE.getIdBloco()%>">
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
                                                    for (int i = 0; i < blocosInvisiveisA; i++) {

                                            %>
                                            <div style="margin-bottom: 15px; height: 9rem;"></div>                        
                                            <%}
                                                }%>
                                            <%
                                                for (Confronto c : bE.getConfrontos()) {

                                                    ConfrontoModalidadeColetiva confmc = (ConfrontoModalidadeColetiva) c;
                                                    String nomeEquipe1 = "", nomeEquipe2 = "";
                                                    String dataJogo = "", horaInicioJogo = "", horaFinalJogo = "";
                                                    int idEquipe1 = 0, idEquipe2 = 0;

                                                    if (confmc.getDataConfronto() != null) {
                                                        dataJogo = sdfData.format(confmc.getDataConfronto());
                                                    }
                                                    if (confmc.getHoraInicio() != null) {
                                                        horaInicioJogo = sdfHora.format(confmc.getHoraInicio());
                                                    }
                                                    if (confmc.getHoraTermino() != null) {
                                                        horaFinalJogo = sdfHora.format(confmc.getHoraTermino());
                                                    }

                                                    if (confmc.getEquipes().size() == 0) {

                                                    } else {

                                                        if (confmc.getEquipes().size() == 2) {
                                                            nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                            nomeEquipe2 = confmc.getEquipes().get(1).getEquipe().getNome();
                                                            idEquipe1 = confmc.getEquipes().get(0).getIdEquipeCompeticao();
                                                            idEquipe2 = confmc.getEquipes().get(1).getIdEquipeCompeticao();
                                                        } else if (confmc.getEquipes().size() == 1) {
                                                            if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                                idEquipe1 = confmc.getEquipes().get(0).getIdEquipeCompeticao();
                                                            }
                                                            if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                nomeEquipe2 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                                idEquipe2 = confmc.getEquipes().get(0).getIdEquipeCompeticao();
                                                            }
                                                        }
                                                    }
                                            %>
                                            <div class="card" style="margin-bottom: 15px; height: 9rem;" id="cardConfrontoColetivo<%=confmc.getIdConfronto()%>">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item disabled">  
                                                        <div class="input-group mb-2 mr-sm-2">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe1%></div>
                                                            </div>

                                                            <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=confmc.getIdConfronto()%><%=idEquipe1%>">

                                                        </div>
                                                        <div class="input-group mb-2 mr-sm-2">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                            </div>
                                                            <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=confmc.getIdConfronto()%><%=idEquipe2%>">
                                                        </div>

                                                        <a href="#" class="badge badge-info"><i class="fas fa-eye"></i></a>
                                                        <a href="javascript:acionarModalInserirDadosConfronto(<%=confmc.getIdConfronto()%>);" class="badge badge-primary">Inserir dados do jogo</a>
                                                        <!--ícone progredir-->
                                                        <a href="javascript:acionarModalprogredirEquipe(<%=confmc.getIdConfronto()%>,<%=idEquipe1%>,<%=idEquipe2%>);" class="badge badge-success"><i class="fas fa-greater-than"></i></a>

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
                                                                <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao" id="idCompeticao<%=confmc.getIdConfronto()%>">
                                                                <input type="hidden" value="<%=confmc.getIdConfronto()%>" name="idConfronto">
                                                                <input type="hidden" value="<%=bE.getIdBloco()%>" name="idBlocoEliminatorio" id="idBlocoEliminatorio<%=confmc.getIdConfronto()%>">

                                                                <div class="form-group" >
                                                                    <p class="text-left">Equipes confrontantes:</p>
                                                                    <div class="form-row">

                                                                        <select required="true" class="form-control col" id="selectEquipe1<%=confmc.getIdConfronto()%>" name="selectEquipe1" style="margin-right: 6px;">
                                                                            <option selected value="0"></option>
                                                                            <%
                                                                                boolean adicionarOption = true;
                                                                                for (EquipeCompeticao equipe1 : equipesCompeticao) {
                                                                                    adicionarOption = true;
                                                                                    for (EquipeCompeticao equipeSelecionada : equipesJaSelecionadas) {

                                                                                        if (equipeSelecionada.getIdEquipeCompeticao() == equipe1.getIdEquipeCompeticao()) {
                                                                                            adicionarOption = false;
                                                                                            break;
                                                                                        }
                                                                                    }
                                                                                    if (adicionarOption == true) {
                                                                            %>

                                                                            <option value="<%=equipe1.getIdEquipeCompeticao()%>"><%=equipe1.getEquipe().getNome()%></option>
                                                                            <%}
                                                                                }%>
                                                                            <%
                                                                                EquipeCompeticao equipe1Conf = new EquipeCompeticao();
                                                                                EquipeCompeticao equipe2Conf = new EquipeCompeticao();
                                                                                if (confmc.getEquipes().size() == 2) {

                                                                                    equipe1Conf = confmc.getEquipes().get(0);
                                                                                    equipe2Conf = confmc.getEquipes().get(1);
                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                            <%} else if (confmc.getEquipes().size() == 1) {
                                                                                if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                                    equipe1Conf = confmc.getEquipes().get(0);

                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                            <%} else if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                                equipe2Conf = confmc.getEquipes().get(0);

                                                                            %> 
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>

                                                                            <%}
                                                                                }%>

                                                                        </select>

                                                                        <select required="true" class="form-control col" id="selectEquipe2<%=confmc.getIdConfronto()%>" name="selectEquipe2">
                                                                            <option selected value="0"></option>
                                                                            <%

                                                                                for (EquipeCompeticao equipe2 : equipesCompeticao) {
                                                                                    adicionarOption = true;
                                                                                    for (EquipeCompeticao equipeSelecionada : equipesJaSelecionadas) {

                                                                                        if (equipeSelecionada.getIdEquipeCompeticao() == equipe2.getIdEquipeCompeticao()) {
                                                                                            adicionarOption = false;
                                                                                            break;
                                                                                        }
                                                                                    }
                                                                                    if (adicionarOption == true) {
                                                                            %>
                                                                            <option value="<%=equipe2.getIdEquipeCompeticao()%>"><%=equipe2.getEquipe().getNome()%></option>
                                                                            <%}
                                                                                }%>


                                                                            <%
                                                                                if (confmc.getEquipes().size() == 2) {

                                                                                    equipe1Conf = confmc.getEquipes().get(0);
                                                                                    equipe2Conf = confmc.getEquipes().get(1);

                                                                            %>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>

                                                                            <%
                                                                            } else if (confmc.getEquipes().size() == 1) {
                                                                                if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                                    equipe1Conf = confmc.getEquipes().get(0);


                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>

                                                                            <%
                                                                            } else if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                                equipe2Conf = confmc.getEquipes().get(0);

                                                                            %>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>

                                                                            <%}
                                                                                }%>
                                                                        </select>

                                                                    </div>

                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group col">
                                                                        <p class="text-left">Data do jogo:</p>
                                                                        <input type="text" class="dateMask form-control" id="dataJogo<%=confmc.getIdConfronto()%>" name="dataJogo<%=confmc.getIdConfronto()%>" value="<%=dataJogo%>">
                                                                    </div>
                                                                </div>
                                                                <div id="divErroData<%=confmc.getIdConfronto()%>">

                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group col">

                                                                        <p class="text-left">Hora de início:</p>
                                                                        <input type="text" class="timeMask form-control" id="horaInicioJogo<%=confmc.getIdConfronto()%>" name="horaInicioJogo<%=confmc.getIdConfronto()%>" value="<%=horaInicioJogo%>">
                                                                    </div>   
                                                                    <div class="form-group col">    
                                                                        <p class="text-left">Hora de término:</p>
                                                                        <input type="text" class="timeMask form-control" id="horaFinalJogo<%=confmc.getIdConfronto()%>" name="horaTerminoJogo<%=confmc.getIdConfronto()%>" value="<%=horaFinalJogo%>">
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
                                                if (confmc.getEquipes().size() == 2) {
                                            %>          
                                            <!-- Modal FINALIZAR DADOS JOGO/Progredir equipe-->
                                            <div class="modal fade bd-example-modal-lg" id="modalFinalizarJogo<%=confmc.getIdConfronto()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <%
                                                            idEquipe1 = confmc.getEquipes().get(0).getIdEquipeCompeticao();
                                                            idEquipe2 = confmc.getEquipes().get(1).getIdEquipeCompeticao();
                                                        %>
                                                        <input type="hidden" name="idCompeticao" value="<%=idCompeticao%>">
                                                        <input type="hidden" name="idConfronto" value="<%=confmc.getIdConfronto()%>">
                                                        <input type="hidden" name="idEquipe1" value="<%=confmc.getEquipes().get(0).getIdEquipeCompeticao()%>">
                                                        <input type="hidden" name="idEquipe2" value="<%=confmc.getEquipes().get(1).getIdEquipeCompeticao()%>">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente finalizar o jogo?</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <input type="hidden" id="contadorSets<%=confmc.getIdConfronto()%>" value="0">
                                                            <p class="text-bolder">Sets jogo:</p>
                                                            <table class="table table-sm" id="tableSetsConfronto<%=confmc.getIdConfronto()%>">
                                                                <thead>
                                                                    <tr class="col-4">
                                                                        <th scope="col" style="margin-left: auto;">
                                                                            <a href="javascript:novoSet(<%=confmc.getIdConfronto()%>,<%=idEquipe1%>,<%=idEquipe2%>);" class="badge badge-success"><i class="fas fa-plus"></i>&nbsp;Novo set</a>
                                                                            <a href="javascript:excluirSet(<%=confmc.getIdConfronto()%>);" class="badge badge-danger"><i class="fas fa-minus"></i>&nbsp;Excluir set</a>
                                                                        </th>
                                                                        <th scope="col"><%=confmc.getEquipes().get(0).getEquipe().getNome()%></th>
                                                                        <th scope="col"><%=confmc.getEquipes().get(1).getEquipe().getNome()%></th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody id="tbodySets<%=confmc.getIdConfronto()%>">


                                                                </tbody>
                                                            </table>
                                                            <p class="font-weight-bold">Resultado do jogo:</p>
                                                            <table class="table table-sm">
                                                                <thead>
                                                                    <tr>

                                                                        <th scope="col"><%=confmc.getEquipes().get(0).getEquipe().getNome()%></th>
                                                                        <th scope="col"><%=confmc.getEquipes().get(1).getEquipe().getNome()%></th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <tr>

                                                                        <td>
                                                                            <div class="form-row">
                                                                                <div class="form-group col-md-5"></div>                                                                              
                                                                                <div class="form-group col-md-2">
                                                                                    <input type="text" class="form-control" id="resultadoConfrontoEquipe<%=confmc.getIdConfronto()%><%=idEquipe1%>" style="text-align: center;">
                                                                                </div>
                                                                                <div class="form-group col-md-5"></div>
                                                                            </div>                                                                       
                                                                        </td>
                                                                        <td>
                                                                            <div class="form-row">
                                                                                <div class="form-group col-md-5"></div>                                                                              
                                                                                <div class="form-group col-md-2">
                                                                                    <input type="text" class="form-control" id="resultadoConfrontoEquipe<%=confmc.getIdConfronto()%><%=idEquipe2%>" style="text-align: center;">
                                                                                </div>
                                                                                <div class="form-group col-md-5"></div>
                                                                            </div>                                                                        
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>

                                                            <div class="form-group">
                                                                <p class="text-left" style="margin-top: 10px;">Informações adicionais do jogo:</p>
                                                                <textarea class="form-control" id="informacoesConfronto<%=confmc.getIdConfronto()%>"></textarea>
                                                            </div>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                            <button type="submit" class="btn btn-success" onclick="progredirEquipe(<%=confmc.getIdConfronto()%>,<%=idEquipe1%>,<%=idEquipe2%>,<%=idCompeticao%>, 'false',<%=bE.getIdBloco()%>);">Finalizar jogo</button>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <%} else {
                                            %>
                                            <!--DIV em que o modal finalizar jogo pode ser inserido dinamicamente-->
                                            <div id="divModalFinalizarJogo<%=confmc.getIdConfronto()%>">

                                            </div>
                                            <%}%>

                                            <%
                                                contador++;
                                                if (contador == bE.getConfrontos().size()) {
                                                    numeroConfrontosBlocoAnterior = bE.getConfrontos().size();

                                                }%>
                                            <%}%>


                                        </div>
                                    </div>
                                    <%
                                        for (int i = 0; i < blocosInvisiveisP; i++) {
                                    %>
                                    <div style="margin-bottom: 15px; height: 9rem;"></div>                        
                                    <%}%> 

                                    <%cont++;
                                        }
                                    %>

                                </div>
                            </div>
                            <!--tab pane repescagem-->
                            <div class="tab-pane fade" id="teste" role="tabpanel" aria-labelledby="teste-tab">

                                <div class="container">
                                    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                    <div class="row">
                                        <div class="col-6 col-md-4"><button type="button" class="btn btn-success" style="margin-bottom: 10px;">Jogos em andamento</button></div>
                                        <div class="col-6 col-md-4">
                                            <%
                                                List<BlocoEliminatorio> blocosEliminatoriosRepescagem = competicao.buscarBlocosEliminatoriosRepescagem();

                                                int numeroPaginasChaveamentoRepescagem = blocosEliminatoriosRepescagem.size() - 2;
                                                // Em casos que o numero de etapas é menor que 3
                                                if (numeroPaginasChaveamentoRepescagem == 0) {
                                                    numeroPaginasChaveamentoRepescagem = 1;
                                                }
                                                if (numeroPaginasChaveamentoRepescagem != 1) {
                                            %>
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination justify-content-center">
                                                    <li class="page-item disabled" id="liVoltarPagChaveamento">
                                                        <a class="page-link" href="javascript:paginaAnterior(3, true, <%=idCompeticao%>);" tabindex="-1" aria-disabled="true" id="pagAnteriorChaveamento">Voltar</a>
                                                    </li>
                                                    <%
                                                        for (int i = 1; i <= numeroPaginasChaveamentoRepescagem; i++) {
                                                    %>
                                                    <li class="page-item"><a class="page-link" href="javascript:mudarPagina(<%=i%>,3,true,<%=idCompeticao%>)"><%=i%></a></li>

                                                    <%}%>
                                                    <li class="page-item" id="liProximaPagChaveamento">
                                                        <a class="page-link" href="javascript:proximaPagina(3, true, <%=idCompeticao%>);" id="proximaPagChaveamento">Próximo</a>
                                                    </li>
                                                </ul>
                                                <input type="hidden" value="<%=numeroPaginasChaveamentoRepescagem%>" id="numeroPaginas">
                                            </nav>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" id="blocosEliminatorios">
                                    <%
                                        numeroConfrontosBlocoAnterior = 0;
                                        numeroConfrontosBlocoAtual = 0;
                                        etapaBlocoIncio = 1;
                                        extensao = 3;

                                        if (request.getParameter("etapaRepescagemParam") != null) {
                                            etapaBlocoIncio = Integer.parseInt(request.getParameter("etapaBlocoRepescagemInicio"));
                                        }
                                        if (request.getParameter("extensao") != null) {
                                            extensao = Integer.parseInt(request.getParameter("extensao"));
                                        }
                                        cont = etapaBlocoIncio;
                                        filtroBlocos = competicao.filtrarBlocoEliminatorioRepescagemPorEtapa(etapaBlocoIncio, extensao, true);
                                        blocosEliminatorios = competicao.buscarBlocosEliminatoriosRepescagem();
                                        for (BlocoEliminatorio bE : filtroBlocos) {

                                            int etapaBloco = bE.getEtapa();
                                            int param = 0;

                                            int blocosInvisiveisA = 0, blocosInvisiveisP = 0;
                                            param = blocosEliminatorios.get(etapaBlocoIncio - 1).getConfrontos().size() - blocosEliminatorios.get(cont - 1).getConfrontos().size();

                                            System.out.println("PARAM: " + param);
                                            if (param % 2 == 0) {
                                                blocosInvisiveisA = param / 2;
                                                blocosInvisiveisP = param / 2;
                                            } else {
                                                blocosInvisiveisA = (param - 1) / 2;
                                                blocosInvisiveisP = (param + 1) / 2;
                                            }
                                            System.out.println("Etapa bloco: " + etapaBloco);
                                            System.out.println("Blocos invisíveis anterior: " + blocosInvisiveisA);

                                            List<EquipeCompeticao> equipesCompeticao = competicao.getEquipesCompeticao();
                                            List<EquipeCompeticao> equipesJaSelecionadas = new ArrayList();

                                            System.out.println("ANTES PUB: " + bE.getEtapa() + "-" + equipesCompeticao);
                                            // Verifica se já faz parte do bloco eliminatorio
                                            for (Confronto confronto : bE.getConfrontos()) {

                                                System.out.println("CCC");
                                                ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                                                if (confColetivo.getEquipes().isEmpty() == false) {
                                                    for (EquipeCompeticao eq : confColetivo.getEquipes()) {
                                                        for (EquipeCompeticao equipeCompeticao : equipesCompeticao) {
                                                            if (eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()) {

                                                                equipesJaSelecionadas.add(equipeCompeticao);
                                                                break;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            System.out.println("DEPOIS PUB: " + bE.getEtapa() + "-" + equipesCompeticao);

                                            numeroConfrontosBlocoAtual = bE.getConfrontos().size();
                                    %>
                                    <input type="hidden" value="<%=bE.getConfrontos().size()%>" id="numeroConfrontosBlocoEliminatorio<%=bE.getIdBloco()%>">
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
                                                    for (int i = 0; i < blocosInvisiveisA; i++) {

                                            %>
                                            <div style="margin-bottom: 15px; height: 9rem;"></div>                        
                                            <%}
                                                }%>
                                            <%
                                                for (Confronto c : bE.getConfrontos()) {

                                                    ConfrontoModalidadeColetiva confmc = (ConfrontoModalidadeColetiva) c;
                                                    String nomeEquipe1 = "", nomeEquipe2 = "";
                                                    String dataJogo = "", horaInicioJogo = "", horaFinalJogo = "";

                                                    if (confmc.getDataConfronto() != null) {
                                                        dataJogo = sdfData.format(confmc.getDataConfronto());
                                                    }
                                                    if (confmc.getHoraInicio() != null) {
                                                        horaInicioJogo = sdfHora.format(confmc.getHoraInicio());
                                                    }
                                                    if (confmc.getHoraTermino() != null) {
                                                        horaFinalJogo = sdfHora.format(confmc.getHoraTermino());
                                                    }

                                                    if (confmc.getEquipes().size() == 0) {

                                                    } else {

                                                        if (confmc.getEquipes().size() == 2) {
                                                            nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                            nomeEquipe2 = confmc.getEquipes().get(1).getEquipe().getNome();
                                                        } else if (confmc.getEquipes().size() == 1) {
                                                            if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                            }
                                                            if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                nomeEquipe2 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                            }
                                                        }
                                                    }
                                            %>
                                            <div class="card" style="margin-bottom: 15px; height: 9rem;" id="cardConfrontoColetivo<%=confmc.getIdConfronto()%>">
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item disabled">  
                                                        <div class="input-group mb-2 mr-sm-2">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe1%></div>
                                                            </div>

                                                            <input type="text" class="form-control numberMask" id="inlineFormInputGroupUsername2">

                                                        </div>
                                                        <div class="input-group mb-2 mr-sm-2">
                                                            <div class="input-group-prepend">
                                                                <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                            </div>
                                                            <input type="text" class="form-control numberMask" id="inlineFormInputGroupUsername2">
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
                                                                <input type="hidden" value="<%=idCompeticao%>" name="idCompeticao" id="idCompeticao<%=confmc.getIdConfronto()%>">
                                                                <input type="hidden" value="<%=confmc.getIdConfronto()%>" name="idConfronto">
                                                                <input type="hidden" value="<%=bE.getIdBloco()%>" name="idBlocoEliminatorio" id="idBlocoEliminatorio<%=confmc.getIdConfronto()%>">

                                                                <div class="form-group" >
                                                                    <p class="text-left">Equipes confrontantes:</p>
                                                                    <div class="form-row">

                                                                        <select required="true" class="form-control col" id="selectEquipe1<%=confmc.getIdConfronto()%>" name="selectEquipe1" style="margin-right: 6px;">
                                                                            <option selected value="0"></option>
                                                                            <%
                                                                                boolean adicionarOption = true;
                                                                                for (EquipeCompeticao equipe1 : equipesCompeticao) {
                                                                                    adicionarOption = true;
                                                                                    for (EquipeCompeticao equipeSelecionada : equipesJaSelecionadas) {

                                                                                        if (equipeSelecionada.getIdEquipeCompeticao() == equipe1.getIdEquipeCompeticao()) {
                                                                                            adicionarOption = false;
                                                                                            break;
                                                                                        }
                                                                                    }
                                                                                    if (adicionarOption == true) {
                                                                            %>

                                                                            <option value="<%=equipe1.getIdEquipeCompeticao()%>"><%=equipe1.getEquipe().getNome()%></option>
                                                                            <%}
                                                                                }%>
                                                                            <%
                                                                                EquipeCompeticao equipe1Conf = new EquipeCompeticao();
                                                                                EquipeCompeticao equipe2Conf = new EquipeCompeticao();
                                                                                if (confmc.getEquipes().size() == 2) {

                                                                                    equipe1Conf = confmc.getEquipes().get(0);
                                                                                    equipe2Conf = confmc.getEquipes().get(1);
                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                            <%} else if (confmc.getEquipes().size() == 1) {
                                                                                if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                                    equipe1Conf = confmc.getEquipes().get(0);

                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                            <%} else if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                                equipe2Conf = confmc.getEquipes().get(0);

                                                                            %> 
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>

                                                                            <%}
                                                                                }%>

                                                                        </select>

                                                                        <select required="true" class="form-control col" id="selectEquipe2<%=confmc.getIdConfronto()%>" name="selectEquipe2">
                                                                            <option selected value="0"></option>
                                                                            <%

                                                                                for (EquipeCompeticao equipe2 : equipesCompeticao) {
                                                                                    adicionarOption = true;
                                                                                    for (EquipeCompeticao equipeSelecionada : equipesJaSelecionadas) {

                                                                                        if (equipeSelecionada.getIdEquipeCompeticao() == equipe2.getIdEquipeCompeticao()) {
                                                                                            adicionarOption = false;
                                                                                            break;
                                                                                        }
                                                                                    }
                                                                                    if (adicionarOption == true) {
                                                                            %>
                                                                            <option value="<%=equipe2.getIdEquipeCompeticao()%>"><%=equipe2.getEquipe().getNome()%></option>
                                                                            <%}
                                                                                }%>


                                                                            <%
                                                                                if (confmc.getEquipes().size() == 2) {

                                                                                    equipe1Conf = confmc.getEquipes().get(0);
                                                                                    equipe2Conf = confmc.getEquipes().get(1);

                                                                            %>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>

                                                                            <%
                                                                            } else if (confmc.getEquipes().size() == 1) {
                                                                                if (confmc.getEquipes().get(0).getPosicaoChave() == 1) {
                                                                                    equipe1Conf = confmc.getEquipes().get(0);


                                                                            %>
                                                                            <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>

                                                                            <%
                                                                            } else if (confmc.getEquipes().get(0).getPosicaoChave() == 2) {
                                                                                equipe2Conf = confmc.getEquipes().get(0);

                                                                            %>
                                                                            <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>

                                                                            <%}
                                                                                }%>
                                                                        </select>

                                                                    </div>

                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group col">
                                                                        <p class="text-left">Data do jogo:</p>
                                                                        <input type="text" class="dateMask form-control" id="dataJogo<%=confmc.getIdConfronto()%>" name="dataJogo<%=confmc.getIdConfronto()%>" value="<%=dataJogo%>">
                                                                    </div>
                                                                </div>
                                                                <div id="divErroData<%=confmc.getIdConfronto()%>">

                                                                </div>

                                                                <div class="form-row">
                                                                    <div class="form-group col">

                                                                        <p class="text-left">Hora de início:</p>
                                                                        <input type="text" class="timeMask form-control" id="horaInicioJogo<%=confmc.getIdConfronto()%>" name="horaInicioJogo<%=confmc.getIdConfronto()%>" value="<%=horaInicioJogo%>">
                                                                    </div>   
                                                                    <div class="form-group col">    
                                                                        <p class="text-left">Hora de término:</p>
                                                                        <input type="text" class="timeMask form-control" id="horaFinalJogo<%=confmc.getIdConfronto()%>" name="horaTerminoJogo<%=confmc.getIdConfronto()%>" value="<%=horaFinalJogo%>">
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
                                        for (int i = 0; i < blocosInvisiveisP; i++) {
                                    %>
                                    <div style="margin-bottom: 15px; height: 9rem;"></div>                        
                                    <%}%> 

                                    <%cont++;
                                        }
                                    %>

                                </div>   





                            </div>
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
</html>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script> 
<script>


                                                                var paginaAtualChaveamento = 1;
                                                                var paginaAtualChaveamentoRepescagem = 1;
                                                                var contadorSets = 0;


                                                                // all mask's definition goes inside of this method below.
                                                                var handleMasks = function () {
                                                                    $('.dateMask').mask('00/00/0000', {reverse: true});
                                                                    $('.timeMask').mask('00:00', {reverse: true});
                                                                    $('.numberMask').mask('000', {reverse: true});

                                                                };


                                                                // this event should be triggered everythime you want to redefine masks
                                                                // and search for new HTML elements.
                                                                $(document).on('mask-it', function () {
                                                                    handleMasks();
                                                                }).trigger('mask-it');


                                                                function acionarModalInserirDadosConfronto(idConfronto) {
                                                                    $('#modalInserirDadosConfronto' + idConfronto).modal('show');
                                                                }

                                                                function acionarModalprogredirEquipe(idConfronto, idEquipe1, idEquipe2) {
                                                                    alert("MODAL PROGREDIR!");
                                                                    // Pré insere dados referente ao resultado final do jogo
                                                                    /*var placarConfrontoEquipe1 = document.getElementById("placarConfrontoEquipe"+idConfronto+idEquipe1).value;
                                                                     var placarConfrontoEquipe2 = document.getElementById("placarConfrontoEquipe"+idConfronto+idEquipe2).value;
                                                                     
                                                                     var resultadoJogoEquipe1 = document.getElementById("resultadoConfrontoEquipe"+idConfronto+idEquipe1);
                                                                     var resultadoJogoEquipe2 = document.getElementById("resultadoConfrontoEquipe"+idConfronto+idEquipe2);
                                                                     
                                                                     resultadoJogoEquipe1.value = placarConfrontoEquipe1;
                                                                     resultadoJogoEquipe2.value = placarConfrontoEquipe2;
                                                                     alert("passei por aqui!");*/
                                                                    $('#modalFinalizarJogo' + idConfronto).modal('show');

                                                                }


                                                                function novoSet(idConfronto, idEquipe1, idEquipe2) {

                                                                    var tbodySets = document.getElementById("tbodySets" + idConfronto);
                                                                    var inputContadorSets = document.getElementById("contadorSets" + idConfronto);
                                                                    var htmlAnterior = tbodySets.innerHTML;

                                                                    var contadorSets = parseInt(inputContadorSets.value);

                                                                    inputContadorSets.value = contadorSets + 1;

                                                                    contadorSets++;

                                                                    var result = '';

                                                                    result += '<tr id="tr' + idConfronto + contadorSets + '" style="col-4">';
                                                                    result += '<th scope="row">SET' + contadorSets + '</th>';
                                                                    result += '<td>';
                                                                    result += '<div class="form-row">';
                                                                    result += '<div class="form-group col-md-4"></div>';
                                                                    result += '<div class="form-group col-md-4">';
                                                                    result += '<input type="text" class="form-control" id="numSetEquipeConfronto' + contadorSets + idEquipe1 + idConfronto + '" style="text-align: center;">';
                                                                    result += '</div>';
                                                                    result += '<div class="form-group col-md-4"></div>';
                                                                    result += '</div>';
                                                                    result += '</td>';
                                                                    result += '<td>';
                                                                    result += '<div class="form-row">';
                                                                    result += '<div class="form-group col-md-4"></div>';
                                                                    result += '<div class="form-group col-md-4">';
                                                                    result += '<input type="text" class="form-control" id="numSetEquipeConfronto' + contadorSets + idEquipe2 + idConfronto + '" style="text-align: center;">';
                                                                    result += '</div>';
                                                                    result += '<div class="form-group col-md-4"></div>';
                                                                    result += '</div>';
                                                                    result += '</td>';
                                                                    result += '</tr>';

                                                                    tbodySets.innerHTML = htmlAnterior + result;
                                                                }

                                                                function excluirSet(idConfronto) {

                                                                    var inputContadorSets = document.getElementById("contadorSets" + idConfronto);

                                                                    var contadorSets = parseInt(inputContadorSets.value);
                                                                    if (contadorSets >= 1) {
                                                                        inputContadorSets.value = contadorSets - 1;

                                                                        var trSetAtualConfronto = document.getElementById("tr" + idConfronto + contadorSets).remove();
                                                                    }
                                                                }

                                                                function progredirEquipe(idConfronto, idEquipe1, idEquipe2, idCompeticao, repescagem, idBlocoEliminatorio) {
                                                                    var numSets = document.getElementById("contadorSets" + idConfronto).value;
                                                                    var informacoesAdicionaisConfronto = document.getElementById("informacoesConfronto" + idConfronto).value;
                                                                    alert(informacoesAdicionaisConfronto);
                                                                    var resultadoJogoEquipe1 = document.getElementById("resultadoConfrontoEquipe" + idConfronto + idEquipe1).value;
                                                                    alert(resultadoJogoEquipe1);
                                                                    var resultadoJogoEquipe2 = document.getElementById("resultadoConfrontoEquipe" + idConfronto + idEquipe2).value;
                                                                    alert(resultadoJogoEquipe2);
                                                                    var placaresSetsEquipe1 = "";
                                                                    var placaresSetsEquipe2 = "";

                                                                    for (var i = 1; i <= numSets; i++) {
                                                                        var setEquipe1 = document.getElementById("numSetEquipeConfronto" + i + idEquipe1 + idConfronto).value;
                                                                        placaresSetsEquipe1 += '&placarSet' + i + 'Equipe1=' + setEquipe1;
                                                                        var setEquipe2 = document.getElementById("numSetEquipeConfronto" + i + idEquipe2 + idConfronto).value;
                                                                        placaresSetsEquipe2 += '&placarSet' + i + 'Equipe2=' + setEquipe2;
                                                                    }



                                                                    var xmlreq = CriaRequest();

                                                                    // Atribui uma função para ser executada sempre que houver uma mudança de ado
                                                                    xmlreq.onreadystatechange = function () {

                                                                        // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                                                                        if (xmlreq.readyState === 4) {

                                                                            // Verifica se o arquivo foi encontrado com sucesso
                                                                            if (xmlreq.status === 200) {
                                                                                var partsHtmlString = xmlreq.responseText.split('$');
                                                                                //alert("SPLIT:"+ partsHtmlString[0]);
                                                                                //var idNovoConfronto = partsHtmlString[0];
                                                                                alert(partsHtmlString[0]);
                                                                                alert(partsHtmlString[1]);
                                                                                alert(partsHtmlString[2]);
                                                                                var result = document.getElementById("cardConfrontoColetivo" + partsHtmlString[1]);

                                                                                result.innerHTML = "";
                                                                                result.innerHTML = partsHtmlString[2];
                                                                                handleMasks();


                                                                            } else {

                                                                            }
                                                                        }
                                                                    };
                                                                    xmlreq.open("GET", "ajax/progredirEquipe.jsp?idCompeticao=" + idCompeticao + "&idConfronto=" + idConfronto + "&repescagem=" + repescagem + "&idEquipe1=" + idEquipe1
                                                                            + "&idEquipe2=" + idEquipe2 + "&informacoesExtra=" + informacoesAdicionaisConfronto + "&resultadoJogoEquipe1=" + resultadoJogoEquipe1 + "&idBlocoEliminatorio=" + idBlocoEliminatorio
                                                                            + "&resultadoJogoEquipe2=" + resultadoJogoEquipe2 + "&numSets=" + numSets + placaresSetsEquipe1 + placaresSetsEquipe2, true);
                                                                    xmlreq.send();
                                                                }


                                                                function proximaPagina(extensao, respescagem, idCompeticao) {
                                                                    var numeroPaginas = parseInt(document.getElementById("numeroPaginas").value);

                                                                    if ((paginaAtualChaveamento + 1) <= numeroPaginas) {
                                                                        paginaAtualChaveamento++;
                                                                        if (respescagem) {

                                                                        } else {
                                                                            // Ajustes interface NAV de paginação
                                                                            var liProximaPag = document.getElementById("liProximaPagChaveamento");
                                                                            var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                                                                            var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");

                                                                            if (paginaAtualChaveamento === numeroPaginas) {
                                                                                liVoltarPag.className = 'page-item';
                                                                                liProximaPag.className = 'page-item disabled';
                                                                            } else {
                                                                                liVoltarPag.className = 'page-item';
                                                                                liProximaPag.className = 'page-item';
                                                                            }

                                                                            var xmlreq = CriaRequest();

                                                                            //Atribui uma função para ser executada sempre que houver uma mudança de ado
                                                                            xmlreq.onreadystatechange = function () {

                                                                                // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                                                                                if (xmlreq.readyState === 4) {

                                                                                    // Verifica se o arquivo foi encontrado com sucesso
                                                                                    if (xmlreq.status === 200) {

                                                                                        divBlocosEliminatorios.innerHTML = "";
                                                                                        divBlocosEliminatorios.innerHTML = this.responseText;
                                                                                        handleMasks();


                                                                                    } else {
                                                                                        divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                                                                                    }
                                                                                }
                                                                            };
                                                                            xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao + "&repescagem=" + respescagem
                                                                                    + "&extensao=" + extensao + "&pag=" + paginaAtualChaveamento, true);
                                                                            xmlreq.send();

                                                                        }
                                                                    }
                                                                }

                                                                function paginaAnterior(extensao, respescagem, idCompeticao) {
                                                                    var numeroPaginas = document.getElementById("numeroPaginas").value;
                                                                    if ((paginaAtualChaveamento - 1) >= 1) {
                                                                        paginaAtualChaveamento--;
                                                                        if (respescagem) {

                                                                        } else {
                                                                            var liProximaPag = document.getElementById("liProximaPagChaveamento");
                                                                            var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                                                                            var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");

                                                                            if (paginaAtualChaveamento === 1) {
                                                                                liProximaPag.className = 'page-item';
                                                                                liVoltarPag.className = 'page-item disabled';
                                                                            } else {
                                                                                liVoltarPag.className = 'page-item';
                                                                                liProximaPag.className = 'page-item';
                                                                            }

                                                                            var xmlreq = CriaRequest();

                                                                            // Atribui uma função para ser executada sempre que houver uma mudança de ado
                                                                            xmlreq.onreadystatechange = function () {

                                                                                // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                                                                                if (xmlreq.readyState === 4) {

                                                                                    // Verifica se o arquivo foi encontrado com sucesso
                                                                                    if (xmlreq.status === 200) {
                                                                                        divBlocosEliminatorios.innerHTML = "";
                                                                                        divBlocosEliminatorios.innerHTML = this.responseText;
                                                                                        handleMasks();

                                                                                    } else {
                                                                                        divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                                                                                    }
                                                                                }
                                                                            };
                                                                            xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao + "&repescagem=" + respescagem
                                                                                    + "&extensao=" + extensao + "&pag=" + paginaAtualChaveamento, true);
                                                                            xmlreq.send();



                                                                        }
                                                                    }
                                                                }

                                                                function mudarPagina(valorPagina, extensao, respescagem, idCompeticao) {
                                                                    var numeroPaginas = document.getElementById("numeroPaginas").value;
                                                                    paginaAtualChaveamento = valorPagina;
                                                                    if (respescagem) {

                                                                    } else {
                                                                        var liProximaPag = document.getElementById("liProximaPagChaveamento");
                                                                        var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                                                                        var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");

                                                                        if (paginaAtualChaveamento === 1) {
                                                                            liProximaPag.className = 'page-item';
                                                                            liVoltarPag.className = 'page-item disabled';
                                                                        } else {
                                                                            liVoltarPag.className = 'page-item';
                                                                            liProximaPag.className = 'page-item';
                                                                        }

                                                                        var xmlreq = CriaRequest();

                                                                        // Atribui uma função para ser executada sempre que houver uma mudança de ado
                                                                        xmlreq.onreadystatechange = function () {

                                                                            // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                                                                            if (xmlreq.readyState === 4) {

                                                                                // Verifica se o arquivo foi encontrado com sucesso
                                                                                if (xmlreq.status === 200) {
                                                                                    divBlocosEliminatorios.innerHTML = "";
                                                                                    divBlocosEliminatorios.innerHTML = this.responseText;
                                                                                    handleMasks();

                                                                                } else {
                                                                                    divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                                                                                }
                                                                            }
                                                                        };
                                                                        xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao + "&repescagem=" + respescagem
                                                                                + "&extensao=" + extensao + "&pag=" + paginaAtualChaveamento, true);
                                                                        xmlreq.send();



                                                                    }
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

                                                                        var idEquipe1 = document.getElementById('selectEquipe1' + idConfronto).value;
                                                                        var idEquipe2 = document.getElementById('selectEquipe2' + idConfronto).value;

                                                                        if (op === '3') {
                                                                            if (idEquipe1 !== idEquipe2) {
                                                                                $('#modalInserirDadosConfronto' + idConfronto).modal('hide');
                                                                                getDados2(idConfronto);
                                                                            }

                                                                        }

                                                                    }

                                                                }

                                                                function isHoraInicialMenorHoraFinal(idConfronto)
                                                                {


                                                                    var horaInicial = document.getElementById('horaInicioJogo' + idConfronto).value;
                                                                    alert(horaInicial);
                                                                    var horaFinal = document.getElementById('horaFinalJogo' + idConfronto).value;
                                                                    alert(horaFinal);


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


                                                                /**
                                                                 * Função para criar um objeto XMLHTTPRequest
                                                                 */
                                                                function CriaRequest() {
                                                                    try {
                                                                        request = new XMLHttpRequest();
                                                                    } catch (IEAtual) {

                                                                        try {
                                                                            request = new ActiveXObject("Msxml2.XMLHTTP");
                                                                        } catch (IEAntigo) {

                                                                            try {
                                                                                request = new ActiveXObject("Microsoft.XMLHTTP");
                                                                            } catch (falha) {
                                                                                request = false;
                                                                            }
                                                                        }
                                                                    }

                                                                    if (!request)
                                                                        alert("Seu Navegador não suporta Ajax!");
                                                                    else
                                                                        return request;
                                                                }

                                                                /**
                                                                 * Função para enviar os dados
                                                                 */
                                                                function getDados2(idConfrontoColetivo) {
                                                                    alert("HELLOO MY NAME IS AJAX 1!");
                                                                    // Declaração de Variáveis
                                                                    //var nome   = document.getElementById("txtnome").value;
                                                                    var result = document.getElementById("cardConfrontoColetivo" + idConfrontoColetivo);

                                                                    var equipeSelect1Value = document.getElementById("selectEquipe1" + idConfrontoColetivo).value;

                                                                    var equipeSelect2Value = document.getElementById("selectEquipe2" + idConfrontoColetivo).value;

                                                                    var dataJogo = document.getElementById("dataJogo" + idConfrontoColetivo).value;

                                                                    var horaInicio = document.getElementById("horaInicioJogo" + idConfrontoColetivo).value;

                                                                    var horaFinal = document.getElementById("horaFinalJogo" + idConfrontoColetivo).value;

                                                                    var localJogo = document.getElementById("selectLocalJogo" + idConfrontoColetivo).value;

                                                                    var idBlocoEliminatorio = document.getElementById("idBlocoEliminatorio" + idConfrontoColetivo).value;

                                                                    var numeroConfrontosBloco = parseInt(document.getElementById("numeroConfrontosBlocoEliminatorio" + idBlocoEliminatorio).value);

                                                                    var idCompeticao = document.getElementById("idCompeticao" + idConfrontoColetivo).value;


                                                                    var xmlreq = CriaRequest();

                                                                    // Exibi a imagem de progresso
                                                                    //result.innerHTML = '<img src="Progresso1.gif"/>';

                                                                    // Iniciar uma requisição
                                                                    xmlreq.open("GET", "ajax/cadastrarConfrontoColetivoSisEliminatorio.jsp?idConfronto=" + idConfrontoColetivo + "&selectEquipe1=" + equipeSelect1Value
                                                                            + "&selectEquipe2=" + equipeSelect2Value + "&dataJogo=" + dataJogo + "&horaInicioJogo=" + horaInicio + "&horaFinalJogo=" + horaFinal + "&localJogo=" + localJogo +
                                                                            "&idBlocoEliminatorio=" + idBlocoEliminatorio + "&idCompeticao=" + idCompeticao, true);

                                                                    // Atribui uma função para ser executada sempre que houver uma mudança de ado
                                                                    xmlreq.onreadystatechange = function () {

                                                                        // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                                                                        if (xmlreq.readyState === 4) {

                                                                            // Verifica se o arquivo foi encontrado com sucesso
                                                                            if (xmlreq.status === 200) {
                                                                                var partsHtmlString = xmlreq.responseText.split('$');
                                                                                //alert("SPLIT:"+ partsHtmlString[0]);
                                                                                //alert("SPLIT:"+ partsHtmlString[1]);
                                                                                result.innerHTML = partsHtmlString[0];
                                                                                //alert(partsHtmlString[1]);
                                                                                //alert(partsHtmlString[2]);
                                                                                //alert(partsHtmlString[3]);
                                                                                var j = 1;
                                                                                for (var i = (numeroConfrontosBloco + 1); i <= (2 * (numeroConfrontosBloco + 1)); i++) {
                                                                                    //alert("ok"+i);
                                                                                    //alert("param"+(2*(numeroConfrontosBloco+1));
                                                                                    if ((i % 2) === 0) {
                                                                                        var equipeSelect2 = document.getElementById("selectEquipe2" + partsHtmlString[j]);
                                                                                        equipeSelect2.innerHTML = partsHtmlString[i];
                                                                                        //alert(partsHtmlString[i]);
                                                                                        j++;
                                                                                    } else {
                                                                                        var equipeSelect1 = document.getElementById("selectEquipe1" + partsHtmlString[j]);
                                                                                        equipeSelect1.innerHTML = partsHtmlString[i];
                                                                                        //alert(partsHtmlString[i]);
                                                                                    }
                                                                                }

                                                                                var divModalFinalizarJogo = document.getElementById("divModalFinalizarJogo" + idConfrontoColetivo);
                                                                                /*
                                                                                 alert(i);
                                                                                 alert(partsHtmlString[i]);
                                                                                 i++;
                                                                                 alert("+1:"+i);
                                                                                 alert(partsHtmlString[i]);
                                                                                 i++;
                                                                                 alert("+2:"+i);
                                                                                 alert(partsHtmlString[i]);
                                                                                 i++;
                                                                                 alert("+3:XXX"+i);
                                                                                 alert(partsHtmlString[i]);
                                                                                 alert(this.responseText);
                                                                                 */

                                                                                //alert(partsHtmlString[i]);

                                                                                //alert("Tamanho parts: "+partsHtmlString.length);
                                                                                var tamaho = parseInt(partsHtmlString.length) - 2;
                                                                                //alert("BABAY BABY:"+partsHtmlString[tamaho]);
                                                                                divModalFinalizarJogo.innerHTML = partsHtmlString[tamaho];
                                                                                //$('#modalFinalizarJogo' + idConfrontoColetivo).modal('show');
                                                                            } else {
                                                                                result.innerHTML = "Erro: " + xmlreq.statusText;
                                                                            }
                                                                        }
                                                                    };
                                                                    xmlreq.send();
                                                                }


</script>