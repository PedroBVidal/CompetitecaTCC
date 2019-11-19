<%-- 
    Document   : acompanharSistemaEliminatorio
    Created on : 12/11/2019, 12:32:57
    Author     : Usuário
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.PosicaoChave"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    CompeticaoModalidadeColetiva competicao = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    LocalControle localControle = new LocalControle();
    SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
    SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
%>
<html>
                <div class="card text-center">
                <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs" >
                <li class="nav-item">
                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Chaveamento</a>

                </li>
                <%
                    SistemaEliminatorio sE = (SistemaEliminatorio) competicao.getSistemaDeCompeticao();
                    if(sE.isRepescagem()){
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
                                <div class="col-6 col-md-4"></div>
                                <div class="col-6 col-md-4">
                                    <%
                                      
                                    int numeroPaginas = competicao.buscarBlocosEliminatorios().size() - 2;
                                    System.out.println("Numero páginas: "+ numeroPaginas);
                                    // Em casos que o numero de etapas é menor que 3
                                    if(numeroPaginas == 0){
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
                            if(request.getParameter("etapaParam") != null){
                                etapaBlocoIncio = Integer.parseInt(request.getParameter("etapaBlocoInicio"));
                            }
                            if(request.getParameter("extensao") != null){
                                extensao = Integer.parseInt(request.getParameter("extensao"));
                            }
                            int cont = etapaBlocoIncio;
                            List<BlocoEliminatorio> filtroBlocos = competicao.filtrarBlocoEliminatorioPorEtapa(etapaBlocoIncio, extensao, false);
                            List<BlocoEliminatorio> blocosEliminatorios = competicao.buscarBlocosEliminatorios();
                            
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
                            
                            // Verifica as competições que já fazem parte do bloco eliminatorio.
                            for (Confronto confronto : bE.getConfrontos()) {

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
                                        int idEquipe1 = 0, idEquipe2 = 0;
                                        int idConfronto = c.getIdConfronto();
                                        
                                        EquipeCompeticao equipeCompeticao1 = new EquipeCompeticao();
                                        EquipeCompeticao equipeCompeticao2 = new EquipeCompeticao();
                                        
                                        if(confmc.getDataConfronto() != null){
                                        dataJogo = sdfData.format(confmc.getDataConfronto());
                                        }
                                        if(confmc.getHoraInicio() != null){
                                        horaInicioJogo = sdfHora.format(confmc.getHoraInicio());
                                        }
                                        if(confmc.getHoraTermino() != null){
                                        horaFinalJogo = sdfHora.format(confmc.getHoraTermino());
                                        }
                                        
                                        
                                        //Nome equipe1 recebe equipe que possui possição chave (1);
                                        //Nome equipe2 recebe equipe que possui posição chave (2)
                                        for(EquipeCompeticao e: confmc.getEquipes()){
                                            for(PosicaoChave p: e.getPosicoesChave()){
                                                if(p.getConfronto().getIdConfronto() == idConfronto &&  p.getPosicaoChave() == 1){
                                                    nomeEquipe1 = e.getEquipe().getNome();
                                                    idEquipe1 = e.getIdEquipeCompeticao();
                                                    equipeCompeticao1 = e;
                                                }
                                                if(p.getConfronto().getIdConfronto() == idConfronto &&  p.getPosicaoChave() == 2){
                                                    nomeEquipe2 = e.getEquipe().getNome();
                                                    idEquipe2 = e.getIdEquipeCompeticao();
                                                    equipeCompeticao2 = e;
                                                }
                                            }
                                        }

                                %>
                                <div class="card" style="margin-bottom: 15px; height: 9rem;" id="cardConfrontoColetivo<%=idConfronto%>">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item disabled">  
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe1%></div>
                                                </div>

                                                    <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=idConfronto%><%=idEquipe1%>">

                                            </div>
                                            <div class="input-group mb-2 mr-sm-2">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text" style="width: 10rem;"><%=nomeEquipe2%></div>
                                                </div>
                                                <input type="text" class="form-control numberMask" id="placarConfrontoEquipe<%=idConfronto%><%=idEquipe2%>">
                                            </div>

                                            <a href="#" class="badge badge-info"><i class="fas fa-eye"></i>&nbsp;Saiba mais</a>

                                        </li>
                                    </ul>
                                </div>


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
                    
                    </div>
                    </div>
                        
                    <!--Tab pane repescagem-->
                    <div class="tab-pane fade" id="teste" role="tabpanel" aria-labelledby="teste-tab">
                        
                    <div class="container">
                            <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                            <div class="row">
                                <div class="col-6 col-md-4"></div>
                                <div class="col-6 col-md-4">
                                    <%
                                    List<BlocoEliminatorio> blocosEliminatoriosRepescagem = competicao.buscarBlocosEliminatoriosRepescagem();

                                    int numeroPaginasChaveamentoRepescagem = blocosEliminatoriosRepescagem.size() - 2;
                                    // Em casos que o numero de etapas é menor que 3
                                    if(numeroPaginasChaveamentoRepescagem == 0){
                                        numeroPaginasChaveamentoRepescagem = 1;
                                    }
                                    if (numeroPaginasChaveamentoRepescagem != 1) {
                                    %>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item disabled" id="liVoltarPagChaveamentoRepescagem">
                                                <a class="page-link" href="javascript:paginaAnterior(3, true, <%=idCompeticao%>);" tabindex="-1" aria-disabled="true" id="pagAnteriorChaveamento">Voltar</a>
                                            </li>
                                            <%
                                                for (int i = 1; i <= numeroPaginasChaveamentoRepescagem; i++) {
                                            %>
                                            <li class="page-item"><a class="page-link" href="javascript:mudarPagina(<%=i%>,3,true,<%=idCompeticao%>)"><%=i%></a></li>

                                            <%}%>
                                            <li class="page-item" id="liProximaPagChaveamentoRepescagem">
                                                <a class="page-link" href="javascript:proximaPagina(3, true, <%=idCompeticao%>);" id="proximaPagChaveamentoRepescagem">Próximo</a>
                                            </li>
                                        </ul>
                                        <input type="hidden" value="<%=numeroPaginasChaveamentoRepescagem%>" id="numeroPaginasRepescagem">
                                    </nav>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                        <div class="row" id="blocosEliminatoriosRepescagem">
                        <%
                            numeroConfrontosBlocoAnterior = 0;
                            numeroConfrontosBlocoAtual = 0;
                            etapaBlocoIncio = 1;
                            extensao = 3;
                            
                            if(request.getParameter("etapaRepescagemParam") != null){
                                etapaBlocoIncio = Integer.parseInt(request.getParameter("etapaBlocoRepescagemInicio"));
                            }
                            if(request.getParameter("extensao") != null){
                                extensao = Integer.parseInt(request.getParameter("extensao"));
                            }
                            cont = etapaBlocoIncio;
                            filtroBlocos = competicao.filtrarBlocoEliminatorioRepescagemPorEtapa(etapaBlocoIncio, extensao, true);
                            blocosEliminatorios = competicao.buscarBlocosEliminatoriosRepescagem();
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
                                        int idEquipe1 = 0, idEquipe2= 0;
                                        EquipeCompeticao equipeCompeticao1 = new EquipeCompeticao();
                                        EquipeCompeticao equipeCompeticao2 = new EquipeCompeticao();
                                        int idConfronto = c.getIdConfronto();
                                        
                                        if(confmc.getDataConfronto() != null){
                                        dataJogo = sdfData.format(confmc.getDataConfronto());
                                        }
                                        if(confmc.getHoraInicio() != null){
                                        horaInicioJogo = sdfHora.format(confmc.getHoraInicio());
                                        }
                                        if(confmc.getHoraTermino() != null){
                                        horaFinalJogo = sdfHora.format(confmc.getHoraTermino());
                                        }
                                        
                                        //Nome equipe1 recebe equipe que possui possição chave (1);
                                        //Nome equipe2 recebe equipe que possui posição chave (2)
                                        for(EquipeCompeticao e: confmc.getEquipes()){
                                            for(PosicaoChave p: e.getPosicoesChave()){
                                                if(p.getConfronto().getIdConfronto() == idConfronto &&  p.getPosicaoChave() == 1){
                                                    nomeEquipe1 = e.getEquipe().getNome();
                                                    idEquipe1 = e.getIdEquipeCompeticao();
                                                    equipeCompeticao1 = e;
                                                }
                                                if(p.getConfronto().getIdConfronto() == idConfronto &&  p.getPosicaoChave() == 2){
                                                    nomeEquipe2 = e.getEquipe().getNome();
                                                    idEquipe2 = e.getIdEquipeCompeticao();
                                                    equipeCompeticao2 = e;
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

                                            <a href="javascript:acionarModalSaibaMaisConfronto();" class="badge badge-info"><i class="fas fa-eye"></i>&nbsp;Saiba mais</a>

                                        </li>
                                    </ul>
                                </div>


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
                    
                    </div>   
                        
                        
                        
                        
                        
                    </div>
                    </div>
                </div>
            </div>
</html>

<script>
        function proximaPagina(extensao,respescagem,idCompeticao) {
        
            if(respescagem){
                var numeroPaginas = parseInt(document.getElementById("numeroPaginasRepescagem").value);
                if((paginaAtualChaveamentoRepescagem + 1) <= numeroPaginas){
                paginaAtualChaveamentoRepescagem++;
                // Ajustes interface NAV de paginação
                var liProximaPag = document.getElementById("liProximaPagChaveamentoRepescagem");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamentoRepescagem");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatoriosRepescagem");
                
                if(paginaAtualChaveamento === numeroPaginas){
                    liVoltarPag.className = 'page-item';
                    liProximaPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }
                var xmlreq = CriaRequest();

                 //Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();


                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamentoRepescagem+"&acompanhamento=true", true);
                 xmlreq.send();
                }
            }
            else{
                var numeroPaginas = parseInt(document.getElementById("numeroPaginas").value);
                if((paginaAtualChaveamento + 1) <= numeroPaginas){
                paginaAtualChaveamento++;
                
                // Ajustes interface NAV de paginação
                var liProximaPag = document.getElementById("liProximaPagChaveamento");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");
                
                if(paginaAtualChaveamento === numeroPaginas){
                    liVoltarPag.className = 'page-item';
                    liProximaPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }

                 var xmlreq = CriaRequest();

                 //Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();


                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamento+"&acompanhamento=true", true);
                 xmlreq.send();
                
            }
        }
    }
    
    function paginaAnterior(extensao,respescagem,idCompeticao){

            if(respescagem){
            var numeroPaginas = document.getElementById("numeroPaginasRepescagem").value;
            if((paginaAtualChaveamentoRepescagem - 1) >= 1){
                paginaAtualChaveamentoRepescagem --; 
                
                var liProximaPag = document.getElementById("liProximaPagChaveamentoRepescagem");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamentoRepescagem");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatoriosRepescagem");
                
                if(paginaAtualChaveamento === 1){
                    liProximaPag.className = 'page-item';
                    liVoltarPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }
                
                var xmlreq = CriaRequest();

                 // Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();

                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamentoRepescagem+"&acompanhamento=true", true);
                 xmlreq.send();
                
                
            }
            }
            else{
            var numeroPaginas = document.getElementById("numeroPaginas").value;
            if((paginaAtualChaveamento - 1) >= 1){
                paginaAtualChaveamento --;
                var liProximaPag = document.getElementById("liProximaPagChaveamento");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");
                
                if(paginaAtualChaveamento === 1){
                    liProximaPag.className = 'page-item';
                    liVoltarPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }
                
                var xmlreq = CriaRequest();

                 // Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();

                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamento+"&acompanhamento=true", true);
                 xmlreq.send();
                
                
                
            }
        }
    }
    
    function mudarPagina(valorPagina,extensao,respescagem,idCompeticao){

            if(respescagem){
                var numeroPaginas = document.getElementById("numeroPaginasRepescagem").value;
                paginaAtualChaveamentoRepescagem = valorPagina;
                var liProximaPag = document.getElementById("liProximaPagChaveamentoRepescagem");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamentoRepescagem");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatoriosRepescagem");
                
                if(paginaAtualChaveamento === 1){
                    liProximaPag.className = 'page-item';
                    liVoltarPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }
                
                var xmlreq = CriaRequest();

                 // Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();

                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamentoRepescagem+"&acompanhamento=true", true);
                 xmlreq.send();
                
            }
            else{
                var numeroPaginas = document.getElementById("numeroPaginas").value;
                paginaAtualChaveamento = valorPagina;
                var liProximaPag = document.getElementById("liProximaPagChaveamento");
                var liVoltarPag = document.getElementById("liVoltarPagChaveamento");
                var divBlocosEliminatorios = document.getElementById("blocosEliminatorios");
                
                if(paginaAtualChaveamento === 1){
                    liProximaPag.className = 'page-item';
                    liVoltarPag.className = 'page-item disabled';
                }
                else{
                   liVoltarPag.className = 'page-item';
                   liProximaPag.className = 'page-item';
                }
                
                var xmlreq = CriaRequest();

                 // Atribui uma função para ser executada sempre que houver uma mudança de ado
                 xmlreq.onreadystatechange = function(){

                     // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
                     if (xmlreq.readyState === 4) {

                         // Verifica se o arquivo foi encontrado com sucesso
                         if (xmlreq.status === 200) {
                             divBlocosEliminatorios.innerHTML = "";
                             divBlocosEliminatorios.innerHTML = this.responseText;
                             handleMasks();

                         }else{
                             divBlocosEliminatorios.innerHTML = "Erro: " + xmlreq.statusText;
                         }
                     }
                 };
                 xmlreq.open("GET", "ajax/carregarBlocos.jsp?idCompeticao=" + idCompeticao+"&repescagem="+respescagem
                 +"&extensao="+extensao+"&pag="+paginaAtualChaveamento+"&acompanhamento=true", true);
                 xmlreq.send();
                
                
                
            }
    }
</script>

