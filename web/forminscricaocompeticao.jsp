<%-- 
    Document   : inscricaocompeticao
    Created on : 26/10/2018, 22:56:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.MensagemEnviada"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
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
                int idEquipe = 0;
                int idAtleta = 0;
                // Pega o id passado como parâmtro no botão "Realizar Inscrição" da jsp listaCompeticoes.jsp
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                if (request.getParameter("idAtleta") == null || request.getParameter("idAtleta").equals("")) {
                    idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
                } else {
                    idAtleta = Integer.parseInt(request.getParameter("idAtleta"));
                }
                CompeticaoControle competicaoControle = new CompeticaoControle();
                AtletaControle atletaControle = new AtletaControle();
                
                
                Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);
                Atleta atleta = atletaControle.buscarPorId(idAtleta);
                Set<CompeticaoModalidadeColetiva> cptsmcCompeticao = competicao.getCmodalidadecole();
                List<Equipe> equipesAbertasCptsmc = new ArrayList<>();
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
            <div class="alert alert-<%=cor%>" role="alert">
                <strong><%=mensagem%></strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>


            <h2 class="col mt-4 mb-3 titulos" style="margin: 40px 0px 20px -10px;">Inscreva-se nas competições que deseja partipar dentro de <span class="" ><i><%=competicao.getNome()%></i></span></h2>

            <div class="row">

                <div class="col-12">


                    <div class="card" style="margin-bottom: 20px;">
                        <div class="card-header">
                            Inscrição
                        </div>
                        <div class="card-body">
                            <%
                                if (idEquipe == 0) {

                                    if (competicao.getCmodalidadesolo().size() != 0) {

                                        // Para cada competição vinculada ao evento, adiciona um checkbox, para o atleta se inscrever, caso queira.

                            %>


                            <div class="form-group">
                                <h4 style="margin: -5px 0px 0px -5px;">Competições individuais: </h4>
                            </div>


                            <% 
                                for (CompeticaoModalidadeSolo cms : competicao.getCmodalidadesolo()) {
                                    if (cms.isInativo() == false) {
                                        int flag = 0;
                                        char processo = ' ';
                                        for (InscricaoCompeticaoSolo ics : atleta.getInscricoesCompeticaoSolo()) {
                                            if (ics.getCompeticaoModalidadeSolo().getIdCompeticaoModalidade() == cms.getIdCompeticaoModalidade()) {
                                                processo = ics.getInscricaoAceita();
                                                flag = 1;
                                                break;
                                            }
                                        }
                            %>
                            <!-- Modal Saiba mais -->
                            <div class="modal fade" id="2<%=cms.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=cms.getNomeCompeticao()%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <p><%
                                                if (cms.getInformacaoExtra() == null || cms.getInformacaoExtra().equals("")) {%>
                                                Não há informações extras sobre essa competição
                                                <%} else {
                                                %>
                                                <%=cms.getInformacaoExtra()%>
                                                <%}%></p>

                                        </div>


                                        <div class="modal-footer">

                                            <button type="button" class="btn btn-primary" data-dismiss="modal">Ok!</button>

                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <%
                                if (flag == 0) {
                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                            <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                        </button><button type="button" class="btn btn-success" data-toggle="modal" data-target="#1<%=cms.getIdCompeticaoModalidade()%>" style="width: 160px;">Inscrever-se</button>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal Inscrição -->
                            <div class="modal fade" id="1<%=cms.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente realizar inscrição em <%=cms.getNomeCompeticao()%>?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-footer">

                                            <a class="btn btn-primary" href="scripts/inscreverAtletaEmCompeticaoSolo.jsp?idCms=<%=cms.getIdCompeticaoModalidade()%>&idAtleta=<%=idAtleta%>&idCompeticao=<%=idCompeticao%>">Sim</a>
                                            <a class="btn btn-warning" data-dismiss="modal">Não</a>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <%}
                                if (flag == 1) {
                                    if (processo == 'E') {

                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                            <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                        </button><button type="input" class="btn btn-warning" disabled="true" style="width: 160px;">Em Aprovação</button>
                                    </div>
                                </div>
                            </div>


                            <%}
                                if (processo == 'N') {

                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                            <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                        </button><button type="input" class="btn btn-danger" disabled="true" style="width: 160px;"><i class="fas fa-times" style="margin-right: 10px;"></i>Negada</button>
                                    </div>
                                </div>
                            </div>


                            <%}
                                if (processo == 'A') {

                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                            <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                        </button><button type="input" class="btn btn-success" disabled="true" style="width: 160px;"><i class="fas fa-check"></i> &nbsp;Aprovada</button>
                                    </div>
                                </div>
                            </div>


                            <%}%>


                            <%}
                                            }
                                        }
                                    }
                                }%>

                            <%
                                
                                if (cptsmcCompeticao.size() != 0) {
                                
                            %>  

                            <div class="form-group">
                                <h4 style="margin: -5px 0px 0px -5px;">Competições coletivas: </h4>
                            </div>

                            <%  for (CompeticaoModalidadeColetiva cmc : cptsmcCompeticao) {
                                if(cmc.isInativo() == false){
                            
                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cmc.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#saibaMaisCompeticaoColetiva<%=cmc.getIdCompeticaoModalidade()%>"><i class="fas fa-info-circle"></i>&nbsp;Saiba mais</button>
                                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalTomadaDecissao<%=cmc.getIdCompeticaoModalidade()%>" style="width: 160px;">Inscrever-se</button>                  
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </div>
                    </div>

                    <%  
                        
                        EquipeControle equipeControle = new EquipeControle();
                        
                        for (CompeticaoModalidadeColetiva cmc : cptsmcCompeticao) {
                        
                        List<Equipe> equipesAbertasCmc = equipeControle.buscarEquipesAbertasCmc(cmc.getIdCompeticaoModalidade());
                        
                        for(Equipe equipe : equipesAbertasCmc){
                            equipe.getAtletas();
                            equipesAbertasCptsmc.add(equipe);
                            
                            
                        }
                        
                        if(cmc.isInativo() == false){
                    %>
                    <!-- Modal saiba mais-->          

                    <div class="modal fade" id="saibaMaisCompeticaoColetiva<%=cmc.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel"><%=cmc.getNomeCompeticao()%></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">

                                    <p><%

                                        if (cmc.getInformacaoExtra() == null || cmc.getInformacaoExtra().equals("")) {%>
                                        Não há informações extras sobre essa competição
                                        <%} else {
                                        %>
                                        <%=cmc.getInformacaoExtra()%>
                                        <%}%></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Ok!</button>

                                </div>
                            </div>
                        </div>
                    </div>      
                    <!-- Modal tomada de decissão competição-->
                    <div class="modal" id="modalTomadaDecissao<%=cmc.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title">Selecione a opção desejada</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <ul class="list-unstyled">
                                        <div class="media">
                                            <img src="img/icons8-1-c-48.png" class="align-self-start mr-3" alt="...">
                                            <div class="media-body">
                                                <%
                                                    boolean usuarioÉAdministradorDeEquipe = false;
                                                    
                                                    for(Equipe equipeAtleta : atleta.getUsuarioParticipante().getEquipe()){
                                                    usuarioÉAdministradorDeEquipe = false;    
                                                    
                                                        for(CompeticaoModalidadeColetiva cmcEquipe : equipeAtleta.getCompeticoesModalidadeColeivas()){
                                                            if(cmc.getIdCompeticaoModalidade() == cmcEquipe.getIdCompeticaoModalidade()){
                                                            usuarioÉAdministradorDeEquipe = true;    
                                                            break;
                                                                
                                                            }
                                                            
                                                        }
                                                        if(usuarioÉAdministradorDeEquipe == true){
                                                            break;
                                                        }
                                                    }
                                                %>
                                                
                                                <%
                                                    if(usuarioÉAdministradorDeEquipe == true){
                                                %>
                                                <h5 class="mt-0"><a  class="stretched-link">Solicitar entrada em uma equipe</a></h5>
                                                <p>Você já possui uma equipe aberta a competição <%=cmc.getNomeCompeticao()%>, portando não pode solicitar entrada em outras equipes abertas a ela.</p>
                                                <%}else{%>
                                                <h5 class="mt-0"><a href="javascript:acionarModalSocilitarEntradaEquipe(<%=cmc.getIdCompeticaoModalidade()%>)" class="stretched-link">Solicitar entrada em uma equipe</a></h5>
                                                <p>Solicite entrada em uma equipe que participará da competição <%=cmc.getNomeCompeticao()%>.</p>
                                                <%}%>
                                            </div>
                                        </div>
                                        <div class="media">
                                            <img src="img/icons8-2-c-48.png" class="align-self-start mr-3" alt="...">
                                            <div class="media-body">
                                                <%
                                                    if(usuarioÉAdministradorDeEquipe == true){
                                                %>
                                                <h5 class="mt-0"><a class="stretched-link">Criar minha equipe (Já possui)</a></h5>
                                                <p>Você já possui uma equipe aberta a competição <%=cmc.getNomeCompeticao()%>!</p>
                                                <%}else{%>
                                                <h5 class="mt-0"><a href="criarEquipe.jsp" class="stretched-link">Criar minha equipe</a></h5>
                                                <p>Crie sua equipe e adicione seus integrantes, para depois ingressar com ela em <%=cmc.getNomeCompeticao()%>.</p>
                                                <%}%>
                                            </div>
                                        </div>
                                        <div class="media">
                                            <img src="img/icons8-3-c-48.png" class="align-self-start mr-3" alt="...">
                                            <div class="media-body">
                                                
                                                <h5 class="mt-0"><a href="javascript:acionarCollapseEquipes(<%=cmc.getIdCompeticaoModalidade()%>)" class="stretched-link">Ingressar com uma de minhas equipes</a></h5>
                                                <p>Ingresse com uma de suas equipes de Basquete 3x3 em <%=cmc.getNomeCompeticao()%>.</p>
                                                
                                            </div>
                                        </div>
                                        

                                        <div class="collapse col-12" id="equipes<%=cmc.getIdCompeticaoModalidade()%>">
                                            <% 
                                                int flag = 0;
                                                int i = 0;                                                
                                                UsuarioParticipante2 up22 = atleta.getUsuarioParticipante();
                                                for (Equipe equp : up22.getEquipe()) {
                                                    if (equp.getModalidade().getIdModColetiva() == cmc.getModalidadeColetiva().getIdModColetiva()) {
                                                        flag++;
                                                        break;
                                                    }
                                                }

                                                if (flag > 0) {
                                            %>
                                            <h4>Escolha a equipe que irá inscrever:</h4><br>
                                            <div class="accordion" id="equipas<%=cmc.getIdCompeticaoModalidade()%>">
                                                <%for (Equipe eq : up22.getEquipe()) {
                                                        if (eq.getModalidade().getIdModColetiva() == cmc.getModalidadeColetiva().getIdModColetiva()) {
                                                %>
                                                <div class="card">
                                                    <div class="card-header" id="<%=i%>-<%=cmc.getIdCompeticaoModalidade()%>">
                                                        <h2 class="mb-0">
                                                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#<%=eq.getIdEquipe()%>-<%=cmc.getIdCompeticaoModalidade()%>" aria-expanded="false" aria-controls="<%=eq.getIdEquipe()%>-<%=cmc.getIdCompeticaoModalidade()%>">
                                                                <%=eq.getNome()%>
                                                            </button>
                                                        </h2>
                                                    </div>

                                                    <div id="<%=eq.getIdEquipe()%>-<%=cmc.getIdCompeticaoModalidade()%>" class="collapse" aria-labelledby="<%=i%>-<%=cmc.getIdCompeticaoModalidade()%>" data-parent="#equipas<%=cmc.getIdCompeticaoModalidade()%>">
                                                        <p>Selecione os atletas de sua equipe que participarão desta competição:</p><br>
                                                        <div class="card-body">
                                                            <form action="scripts/inscricaoCompModColetiva.jsp" method="POST">
                                                                <div class="row">
                                                                    <ul>
                                                                        <%
                                                                            int j = 0;
                                                                            for (Atleta atl : eq.getAtletas()) {

                                                                        %>

                                                                        <li><input type="checkbox" name="idAtl<%=j%>" value="<%=atl.getIdAtleta()%>">&nbsp;<%=atl.getUsuarioParticipante().getNome()%></li>

                                                                        <% i++;
                                                                            }

                                                                        %>
                                                                    </ul>
                                                                </div>
                                                                <hr>

                                                                <input type="hidden" name="numAtl" value="<%=eq.getAtletas().size()%>">
                                                                <input type="hidden" name="idCompeticao" value="<%=competicao.getIdCompeticao()%>">
                                                                <input type="hidden" name="idEquipe" value="<%=eq.getIdEquipe()%>">
                                                                <input type="hidden" name="idCompModCol" value="<%=cmc.getIdCompeticaoModalidade()%>">
                                                                <%int sinal = 0;
                                                                    char estado = ' ';
                                                                    for (InscricaoCompeticaoColetiva icc : cmc.getInscricoesCompeticoesColetivas()) {
                                                                        if (icc.getEquipe().getIdEquipe() == eq.getIdEquipe()) {
                                                                            sinal++;
                                                                            estado = icc.getInscricaoAceita();
                                                                            break;
                                                                        }
                                                                    }
                                                                if (sinal > 0) {
                                                                if (estado == 'A') {%>
                                                                <p style="margin-left: 10px;"><button type="submit" role="button" disabled="true" class="btn btn-success popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute."><i class="fas fa-check"></i>Aprovada</button></p>        
                                                                <%}
                                                                    if (estado == 'N') {%>
                                                                <p style="margin-left: 10px;"><button type="submit" role="button" disabled="true" class="btn btn-danger popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute."><i class="fas fa-times" style="margin-right: 10px;"></i>Negada</button></p>        
                                                                <%}
                                                                    if (estado == 'E') {%>
                                                                <p style="margin-left: 10px;"><button type="submit" role="button" disabled="true" class="btn btn-warning popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute.">Em Aprovação</button></p>        
                                                                <%}%>

                                                                <%} else {
                                                                %>
                                                                <p style="margin-left: 10px;"><button type="submit" role="button" class="btn btn-success popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute.">Inscrever</button></p>
                                                                <%}%>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>

                                                <%i++;
                                                        }
                                                    }%>
                                            </div>
                                            <%} else {%>
                                            <div class="card card-body">
                                                Você não possui nenhuma equipe, ou nenhuma equipe elegível para esta competição<br>
                                                Crie uma equipe, caso queira (vá o item 2), senão solicite o ingresso à uma equipe no item 1.
                                            </div>
                                            <%}%>
                                        </div>


                                    </div>
                                    </ul>
                                </div>
                            </div>
                        </div>
                                        
                       <!--Modal Solcitação de entrada em equipe-->              
                       <div id="modalSolicitacaoEntradaEquipe<%=cmc.getIdCompeticaoModalidade()%>"class="modal" tabindex="-1" role="dialog">
                           <div class="modal-dialog modal-lg" role="document">
                               <div class="modal-content">
                                   <div class="modal-header">
                                       <h5 class="modal-title">Equipes que você pode solicitar entrada em <span class="font-weight-bold"><%=cmc.getNomeCompeticao()%></span>:</h5>
                                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                           <span aria-hidden="true">&times;</span>
                                       </button>
                                   </div>
                                   <div class="modal-body">
                                       <table class="table">
                                           <thead class="thead-dark">
                                               <tr>
                                                   <th scope="col">Nome equipe</th>
                                                  
                                                   <th scope="col">Saiba mais / Solcitar entrada</th>
                                                   
                                               </tr>
                                           </thead>
                                           <tbody>
                                               
                                               <%
                                                   
                                                   
                                                   
                                                   boolean equipeJaInscritaNaCmc;
                                                   boolean usuarioJaSocicitouEntrada;
                                                   char estadoSolicitacao = 'E';
                                                   
                                                   for(Equipe e : equipesAbertasCmc){
                                                       
                                                        usuarioJaSocicitouEntrada = false;
                                                        equipeJaInscritaNaCmc = false;
                                                        for(InscricaoCompeticaoColetiva insc: e.getInscricoesCompeticoesColetivas()){
                                                            if(insc.getEquipe().getIdEquipe() == e.getIdEquipe()){
                                                                equipeJaInscritaNaCmc = true;
                                                            }
                                                        }
                                                        
                         
                                               %>
                                               <%
                                                   if (equipeJaInscritaNaCmc == false) {
                                                       for(MensagemEnviada msge : atleta.getUsuarioParticipante().getMensagensEnviadas()){
                                                           if(msge instanceof SolicitacaoEntradaEquipeEnviada){
                                                               SolicitacaoEntradaEquipeEnviada se = (SolicitacaoEntradaEquipeEnviada) msge;
                                                               if(se.getEquipe().getIdEquipe() == e.getIdEquipe()){
                                                                   usuarioJaSocicitouEntrada = true;
                                                                   estadoSolicitacao = se.getEstadoSolicitacao();
                                                               }
                                                           }
                                                       }
                                               %>
                                               <tr>
                                                   
                                                   <td><%=e.getNome()%></td>
                                                   
                                                   <td>
                                                        <button type="button" data-toggle="modal" onclick="abrirModalSaibaMais(<%=e.getIdEquipe()%>)" class="btn btn-info" style="margin-right: 7px;"><i class="fas fa-info-circle"></i>&nbsp;Saiba mais</button>
                                                        <%
                                                            if(usuarioJaSocicitouEntrada == true){
                                                                if(estadoSolicitacao == 'A'){
                                                            
                                                        %>
                                                        <button type="button" data-toggle="modal" onclick="abrirModalSolicitarEntradaEmEquipe(<%=e.getIdEquipe()%>)" class="btn btn-success" disabled="true"><i class="fas fa-check">&nbsp;Aceita</button>
                                                    
                                                    <%}
                                                            else if(estadoSolicitacao == 'N'){
                                                    %>
                                                     <button type="button" data-toggle="modal" class="btn btn-danger" disabled="true"><i class="fas fa-times" style="margin-right: 10px;"></i>&nbsp;Negada</button>

                                                    <%}
                                                            else if(estadoSolicitacao == 'E'){ 
                                                    %>
                                                    <button type="button" data-toggle="modal" class="btn btn-warning" disabled="true">&nbsp;Solicitação enviada</button>

                                                        <%}}else{%>
                                                        <button type="button" data-toggle="modal" onclick="abrirModalSolicitarEntradaEmEquipe(<%=e.getIdEquipe()%>)" class="btn btn-success" >&nbsp;Solicitar entrada</button>

                                                        <%}%>
                                               </td>
                                               </tr>

                                           
                                                <%}%>
                                                   

                                                                                           
                                                <%}%>

                                           </tbody>
                                       </table>
                                   </div>
                                   <div class="modal-footer">
                                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                       <button type="button" class="btn btn-primary">Voltar</button>
                                   </div>
                               </div>
                           </div>
                       </div>
                                               
                    <%}%>
                
                
                    </div>
                
                    <% equipeControle.fecharSessaoDAOEspecifico(); }}
                    %>
                    
                    <%
                        for(CompeticaoModalidadeColetiva cmc : competicao.getCmodalidadecole()){
                           
                        
                            
                        for(Equipe e : equipesAbertasCptsmc){
                            
                        
                    %>
                    <div class="modal" tabindex="-1" role="dialog" id="modalSaibaMaisEquipe<%=e.getIdEquipe()%>">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"><%=e.getNome()%></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <%
                                    if(e.getAdministrador().getAtleta().getSegmento() != null){
                                    %>
                                    <p>Criador da equipe: <%=e.getAdministrador().getNome()%>  (<%=e.getAdministrador().getAtleta().getSegmento().getNome()%>)</p>
                                    <%}else{%>
                                    <p>Criador da equipe: <%=e.getAdministrador().getNome()%></p>
                                    <%}%>
                                   
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                                    
                        <!--Modal solicitar entrada equipe-->
                        <div class="modal" id="modalSolicitarEntradaEmEquipe<%=e.getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Deseja realmente solicitar entrada na equipe <%=e.getNome()%>?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p><span class="font-weight-bold">1- </span>Uma mensagem de solicitação de entrada ao administrador da equipe <%=e.getNome()%> será enviada.</p>
                                        <p><span class="font-weight-bold">2- </span>Quando a solicitação for aceita você será avisado através de uma mensagem dentro do sistema.</p>

                                    </div>
                                    <div class="modal-footer">
                                        <form action="scripts/solicitarEntradaEquipe.jsp" method="POST">
                                            
                                            <input type="hidden" name="idCompeticao" value="<%=cmc.getCompeticao().getIdCompeticao()%>">
                                            <input type="hidden" name="idEquipe" value="<%=e.getIdEquipe()%>">
                                            <input type="hidden" name="idAdmEquipe" value="<%=e.getAdministrador().getIdUsuario()%>">
                                            <input type="hidden" name="idUsuarioRemetente" value="<%=up.getIdUsuario()%>">
                                            <button type="submit" class="btn btn-primary btn active" role="button" aria-pressed="true"><i class="fas fa-sign-in-alt"></i>&nbsp;Solicitar entrada</button>
                                        </form>
                                        
                                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%}}%>
                    
                    
                    
                </div>

            </div>
                    





        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
            function acionarCollapseEquipes(idCompeticaoModalidade){
                alert(idCompeticaoModalidade);
                $('#equipes'+idCompeticaoModalidade).collapse();
            }
            
            function acionarModalSocilitarEntradaEquipe(idCompeticaoModalidade){
               $('#modalTomadaDecissao'+idCompeticaoModalidade).modal('hide');
               $('#modalSolicitacaoEntradaEquipe'+idCompeticaoModalidade).modal('show'); 
            }
            
            
            function fecharModalSaibaMaisEquipe(idEquipe){
                $('#modalSaibaMaisEquipe'+idEquipe).modal('hide');
            }
            
            function abrirModalSaibaMais(idEquipe){
                alert("abrir modal modalSaibaMaisEquipe"+idEquipe);
                $('#modalSaibaMaisEquipe'+idEquipe).modal('show');
            }
            
            function abrirModalSolicitarEntradaEmEquipe(idEquipe){
                $('#modalSolicitarEntradaEmEquipe'+idEquipe).modal('show');
            }
            
        </script>
        <%
            }
        %>
    </body>

</html>
