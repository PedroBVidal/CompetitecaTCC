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
                response.sendRedirect("login.jsp?msg=Pagina de acesso restrito, entre primeiro&color=danger");
            } else {
                int idEquipe = 0;
                int idAtleta = 0;
                // Pega o id passado como parâmtro no botão "Realizar Inscrição" da jsp listaCompeticoes.jsp
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));

                idEquipe = Integer.parseInt(request.getParameter("idEquipe"));

                CompeticaoControle competicaoControle = new CompeticaoControle();

                Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);
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
                                Equipe equp = new Equipe();
                                EquipeControle eqc = new EquipeControle();
                                equp = eqc.buscarPorId(idEquipe);

                                if (competicao.getCmodalidadecole().size() != 0) {


                            %>  

                            <div class="form-group">
                                <h4 style="margin: -5px 0px 0px -5px;">Competições coletivas: </h4>
                            </div>

                            <%  for (CompeticaoModalidadeColetiva cmc : competicao.getCmodalidadecole()) {
                                    if (cmc.isInativo() == false) {
                                        int flag = 0;
                                        char processo = ' ';
                                        for (InscricaoCompeticaoColetiva icc : equp.getInscricoesCompeticoesColetivas()) {
                                            if (icc.getCompeticaoModalidadeColetiva().getIdCompeticaoModalidade() == cmc.getIdCompeticaoModalidade()) {
                                                processo = icc.getInscricaoAceita();
                                                flag = 1;
                                                break;
                                            }
                                        }
                                        if (cmc.getModalidadeColetiva().getIdModColetiva() == equp.getModalidade().getIdModColetiva()) {
                                            if (flag == 0) {


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
                            <% } else if (flag == 1) {
                                if (processo == 'E') {

                            %>
                            <div class="form-group">
                                <div class="input-group mb-3">
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cmc.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cmc.getIdCompeticaoModalidade()%>">
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
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cmc.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cmc.getIdCompeticaoModalidade()%>">
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
                                    <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cmc.getNomeCompeticao()%>">
                                    <div class="input-group-append">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cmc.getIdCompeticaoModalidade()%>">
                                            <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                        </button><button type="input" class="btn btn-success" disabled="true" style="width: 160px;"><i class="fas fa-check"></i> &nbsp;Aprovada</button>
                                    </div>
                                </div>
                            </div>


                            <%}
                                            }
                                        }
                                    }
                                }
                            %> 
                        </div>

                    </div>
                </div>
                <%for (CompeticaoModalidadeColetiva cmc2 : competicao.getCmodalidadecole()) {%>
                <!-- Modal saiba mais-->          

                <div class="modal fade" id="saibaMaisCompeticaoColetiva<%=cmc2.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel"><%=cmc2.getNomeCompeticao()%></h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <p><%
                                    if (cmc2.getInformacaoExtra() == null || cmc2.getInformacaoExtra().equals("")) {%>
                                    Não há informações extras sobre essa competição
                                    <%} else {
                                    %>
                                    <%=cmc2.getInformacaoExtra()%>
                                    <%}%></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">Ok!</button>

                            </div>
                        </div>
                    </div>
                </div>      
                <!-- Modal tomada de decissão competição-->
                <div class="modal fade" id="modalTomadaDecissao<%=cmc2.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <%if (equp.getAtletas().size() >= cmc2.getModalidadeColetiva().getLotacaoMaximaEquipe()) {%>
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Selecione os atletas que participarão</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="scripts/inscricaoCompModColetiva.jsp" method="POST">
                                    <div class="row">
                                        <ul>
                                            <%
                                                int i = 0;
                                                for (Atleta atl : equp.getAtletas()) {

                                            %>

                                            <li><input type="checkbox" name="idAtl<%=i%>" value="<%=atl.getIdAtleta()%>">&nbsp;<%=atl.getUsuarioParticipante().getNome()%></li>

                                            <% i++;
                                                }

                                            %>
                                        </ul>
                                    </div>
                                    <hr>

                                    <input type="hidden" name="numAtl" value="<%=equp.getAtletas().size()%>">
                                    <input type="hidden" name="idCompeticao" value="<%=competicao.getIdCompeticao()%>">
                                    <input type="hidden" name="idEquipe" value="<%=equp.getIdEquipe()%>">
                                    <input type="hidden" name="idCompModCol" value="<%=cmc2.getIdCompeticaoModalidade()%>">
                                    <p style="margin-left: 10px;"><button type="submit" role="button" class="btn btn-success popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute.">Inscrever</button></p>
                                </form>

                                <%} else if (equp.getAtletas().size() < cmc2.getModalidadeColetiva().getLotacaoMaximaEquipe()) {
                                %>
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Alerta</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">

                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Você não Possui um número de membros suficientes para se inscrever nesta competição!<br>
                                    Numero necessário:&nbsp;<b><%=cmc2.getModalidadeColetiva().getLotacaoMaximaEquipe()%></b><br>
                                    Restam <b><%=cmc2.getModalidadeColetiva().getLotacaoMaximaEquipe() - equp.getAtletas().size()%></b> atletas em sua equipe
                                </div>

                                <%}%>
                            </div>
                        </div>

                    </div>
                </div>

                <%}
                    }
                %>


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
