<%-- 
    Document   : gerarBlocos
    Created on : 22/10/2019, 22:40:27
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



    <%
                            SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
                            SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
                            int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                            int pag = Integer.parseInt(request.getParameter("pag"));        
                            int extensao = Integer.parseInt(request.getParameter("extensao"));
                            String repescagem = request.getParameter("repescagem");
                            boolean acompanhamento = false;
                            if(request.getParameter("acompanhamento") != null){
                            if(Boolean.parseBoolean(request.getParameter("acompanhamento"))){
                                acompanhamento = true;
                            }
                            }
                            int numeroConfrontosBlocoAnterior = 0;
                            int numeroConfrontosBlocoAtual = 0;
                            int etapaBlocoIncio = pag;
                            CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
                            LocalControle localControle = new LocalControle();
                            CompeticaoModalidadeColetiva competicao = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
                            
                            
                            
                            if(request.getParameter("etapaParam") != null){
                                etapaBlocoIncio = Integer.parseInt(request.getParameter("pag"));
                            }
                            if(request.getParameter("extensao") != null){
                                extensao = Integer.parseInt(request.getParameter("extensao"));
                            }
                            List<BlocoEliminatorio> filtroBlocos = new ArrayList();
                            int cont = etapaBlocoIncio;
                            if(repescagem.equals("true")){
                            filtroBlocos = competicao.filtrarBlocoEliminatorioRepescagemPorEtapa(etapaBlocoIncio, extensao, true);
                            }
                            else{
                            filtroBlocos = competicao.filtrarBlocoEliminatorioPorEtapa(etapaBlocoIncio, extensao, false);  
                            }
                            
    
                            List<BlocoEliminatorio> blocosEliminatorios = new ArrayList();
                            
                            if(repescagem.equals("true")){
                            blocosEliminatorios = competicao.buscarBlocosEliminatoriosRepescagem();
                            }
                            else{
                            blocosEliminatorios = competicao.getBlocosEliminatorios(); 
                            }
                            for (BlocoEliminatorio bE : filtroBlocos) {
                                
                            
                            int etapaBloco = bE.getEtapa();
                            int param = 0;
                            
                            int blocosInvisiveisA = 0, blocosInvisiveisP = 0;
                            param = blocosEliminatorios.get(etapaBlocoIncio-1).getConfrontos().size() - blocosEliminatorios.get(cont-1).getConfrontos().size();

                            System.out.println("PARAM: "+param);
                            if(param % 2 == 0){
                                blocosInvisiveisA = param/2;
                                blocosInvisiveisP = param/2;
                            }
                            else{
                                blocosInvisiveisA = (param - 1)/2;
                                blocosInvisiveisP = (param + 1)/2;
                            }
                            System.out.println("Etapa bloco: "+ etapaBloco);
                            System.out.println("Blocos invisíveis anterior: "+ blocosInvisiveisA);

                            List<EquipeCompeticao> equipesCompeticao   = competicao.getEquipesCompeticao();
                            List<EquipeCompeticao> equipesJaSelecionadas = new ArrayList();
                            
                            System.out.println("ANTES PUB: "+bE.getEtapa()+"-"+equipesCompeticao);
                            // Verifica se já faz parte do bloco eliminatorio
                            for (Confronto confronto : bE.getConfrontos()) {
                                
                            System.out.println("CCC");
                            ConfrontoModalidadeColetiva confColetivo = (ConfrontoModalidadeColetiva) confronto;
                            if(confColetivo.getEquipes().isEmpty() == false){
                                for(EquipeCompeticao eq: confColetivo.getEquipes()){
                                    for(EquipeCompeticao equipeCompeticao: equipesCompeticao){
                                        if(eq.getIdEquipeCompeticao() == equipeCompeticao.getIdEquipeCompeticao()){
                                            
                                            equipesJaSelecionadas.add(equipeCompeticao);
                                            break;
                                        }
                                    }
                                }
                            }
                            }
                            System.out.println("DEPOIS PUB: "+bE.getEtapa()+"-"+equipesCompeticao);
                               
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
                                        
                                        if(confmc.getDataConfronto() != null){
                                        dataJogo = sdfData.format(confmc.getDataConfronto());
                                        }
                                        if(confmc.getHoraInicio() != null){
                                        horaInicioJogo = sdfHora.format(confmc.getHoraInicio());
                                        }
                                        if(confmc.getHoraTermino() != null){
                                        horaFinalJogo = sdfHora.format(confmc.getHoraTermino());
                                        }
                                        
                                        if (confmc.getEquipes().size() == 0) {

                                        } else {
                                            
                                            
                                            if (confmc.getEquipes().size() == 2) {
                                                nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome();
                                                nomeEquipe2 = confmc.getEquipes().get(1).getEquipe().getNome();
                                            }
                                            else if (confmc.getEquipes().size() == 1) {
                                                if(confmc.getEquipes().get(0).getPosicaoChave() == 1){
                                                   nomeEquipe1 = confmc.getEquipes().get(0).getEquipe().getNome(); 
                                                }
                                                if(confmc.getEquipes().get(0).getPosicaoChave() == 2){
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

                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">

                                            </div>
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                </div>
                                                <input type="text" class="form-control" id="inlineFormInputGroupUsername2">
                                            </div>

                                            <a href="#" class="badge badge-info"><i class="fas fa-eye"></i>&nbsp;Saiba mais</a>
                                            <%
                                                if(acompanhamento == false){
                                            %>
                                            <a href="javascript:acionarModalInserirDadosConfronto(<%=confmc.getIdConfronto()%>);" class="badge badge-primary">Inserir dados do jogo</a>
                                            <a href="#" class="badge badge-success"><i class="fas fa-greater-than"></i></a>
                                            <%}%>
                                        </li>
                                    </ul>
                                </div>
                                <%
                                    if(acompanhamento == false){
                                %>
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
                                                                        for(EquipeCompeticao equipeSelecionada : equipesJaSelecionadas){
                                                                            
                                                                        if(equipeSelecionada.getIdEquipeCompeticao() == equipe1.getIdEquipeCompeticao()){
                                                                            adicionarOption = false;
                                                                            break;
                                                                        }
                                                                        }
                                                                        if(adicionarOption == true){
                                                                %>

                                                                <option value="<%=equipe1.getIdEquipeCompeticao()%>"><%=equipe1.getEquipe().getNome()%></option>
                                                                <%}}%>
                                                                <%
                                                                    EquipeCompeticao equipe1Conf = new EquipeCompeticao();
                                                                    EquipeCompeticao equipe2Conf = new EquipeCompeticao();
                                                                    if(confmc.getEquipes().size() == 2){
                                                                    
                                                                    equipe1Conf = confmc.getEquipes().get(0);
                                                                    equipe2Conf = confmc.getEquipes().get(1);
                                                                %>
                                                                <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                <%}
                                                                   else if(confmc.getEquipes().size() == 1){
                                                                    if(confmc.getEquipes().get(0).getPosicaoChave() == 1){
                                                                        equipe1Conf = confmc.getEquipes().get(0);
                                                                    
                                                                %>
                                                                <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                <%}
                                                                    else if(confmc.getEquipes().get(0).getPosicaoChave() == 2){
                                                                        equipe2Conf = confmc.getEquipes().get(0);
                                                                  
                                                                 %> 
                                                                <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>"><%=equipe2Conf.getEquipe().getNome()%></option>

                                                                <%}}%>
                                                                
                                                            </select>
                                                            
                                                            <select required="true" class="form-control col" id="selectEquipe2<%=confmc.getIdConfronto()%>" name="selectEquipe2">
                                                                <option selected value="0"></option>
                                                                <%

                                                                    for (EquipeCompeticao equipe2 : equipesCompeticao) {
                                                                    adicionarOption = true;
                                                                    for(EquipeCompeticao equipeSelecionada : equipesJaSelecionadas){
                                                                            
                                                                        if(equipeSelecionada.getIdEquipeCompeticao() == equipe2.getIdEquipeCompeticao()){
                                                                            adicionarOption = false;
                                                                            break;
                                                                        }
                                                                        }
                                                                        if(adicionarOption == true){
                                                                %>
                                                                <option value="<%=equipe2.getIdEquipeCompeticao()%>"><%=equipe2.getEquipe().getNome()%></option>
                                                                <%}}%>
                                                                
                                                                
                                                                <%
                                                                    if (confmc.getEquipes().size() == 2) {
                                                                        
                                                                        
                                                                            equipe1Conf = confmc.getEquipes().get(0);
                                                                            equipe2Conf = confmc.getEquipes().get(1);

                                                                %>
                                                                <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                
                                                                <%
                                                                    }
                                                                    else if(confmc.getEquipes().size() == 1){
                                                                        if(confmc.getEquipes().get(0).getPosicaoChave() == 1){
                                                                          equipe1Conf = confmc.getEquipes().get(0);
   
                                                                
                                                                %>
                                                                <option value="<%=equipe1Conf.getIdEquipeCompeticao()%>"><%=equipe1Conf.getEquipe().getNome()%></option>
                                                                
                                                                <%
                                                                    }
                                                                    else if(confmc.getEquipes().get(0).getPosicaoChave() == 2){
                                                                        equipe2Conf = confmc.getEquipes().get(0);
                                                                    
                                                                %>
                                                                <option value="<%=equipe2Conf.getIdEquipeCompeticao()%>" selected="true"><%=equipe2Conf.getEquipe().getNome()%></option>
                                                                
                                                                <%}}%>
                                                            </select>
                                                            
                                                        </div>

                                                    </div>

                                                    <div class="form-row">
                                                        <div class="form-group col">
                                                            <p class="text-left">Data do jogo:</p>
                                                            <input type="text" class="dateMask form-control" data-mask="00/00/0000" id="dataJogo<%=confmc.getIdConfronto()%>" name="dataJogo<%=confmc.getIdConfronto()%>" value="<%=dataJogo%>">
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

                                <%}%>

                                <%}%>
                            </div>
                        </div>
                        <%
                            for (int i = 0; i < blocosInvisiveisP; i++) {
                        %>
                        <div style="margin-bottom: 15px; height: 9rem;"></div>                        
                        <%}%> 

                        <%cont++;}
                        %>
                        

