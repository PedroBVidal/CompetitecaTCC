<%-- 
    Document   : inscricaocompeticao
    Created on : 26/10/2018, 22:56:15
    Author     : Usuário
--%>

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


            <h2 class="col mt-4 mb-3 titulos" style="margin: 20px 0px 20px -10px;">Inscreva-se nas competições que deseja partipar dentro de <span class="" ><i><%=competicao.getNome()%></i></span></h2>

            <div class="row">

                <div class="col-12">


                    <div class="card">
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


                            <%                                for (CompeticaoModalidadeSolo cms : competicao.getCmodalidadesolo()) {
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
                                if (competicao.getCmodalidadecole().size() != 0) {

                            %>  

                            <div class="form-group">
                                <h4 style="margin: -5px 0px 0px -5px;">Competições coletivas: </h4>
                            </div>

                            <%  for (CompeticaoModalidadeColetiva cmc : competicao.getCmodalidadecole()) {
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
                            <%}%>
                        </div>
                    </div>

                    <%  for (CompeticaoModalidadeColetiva cmc : competicao.getCmodalidadecole()) {
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
                    <div class="modal fade" id="modalTomadaDecissao<%=cmc.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Selecione a opção desejada</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <h5 style="margin-left: 20px;">1- Criar uma nova equipe:</h5>
                                        <p style="margin-left: 10px;"><a href="criarEquipe.jsp" role="button" class="btn btn-primary popover-test" title="Criar equipe" data-content="Popover body content is set in this attribute.">Clique aqui</a></p>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <h5 style="margin-left: 20px;">2- Solicitar entrada em uma equipe: </h5>
                                        <form action="formSolicitarEntradaEmEquipe.jsp" method="POST">
                                            <input type="hidden" name="idCmc" value="<%=cmc.getIdCompeticaoModalidade()%>">
                                            <p style="margin-left: 10px;"><button type="submit" role="button" class="btn btn-primary popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute.">Clique aqui</button></p>
                                        </form>

                                    </div>
                                    <div class="row">
                                        <h5 style="margin-left: 20px;">3- Ingressar com uma de minhas equipes: </h5>
                                        <p style="margin-left: 10px;"><button type="button" role="button" class="btn btn-primary" data-toggle="collapse" data-target="#equipes<%=cmc.getIdCompeticaoModalidade()%>" aria-expanded="false" aria-controls="equipes<%=cmc.getIdCompeticaoModalidade()%>" >Clique aqui</button></p>

                                        <div class="collapse col-12" id="equipes<%=cmc.getIdCompeticaoModalidade()%>">
                                            <% int flag = 0;
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
                                </div>
                            </div>
                        </div>
                    </div>
                    <%}%>


                    <%}
                    %>



                </div>
            </div>
        </div>






        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
        </script>
        <%
            }
        %>
    </body>

</html>
