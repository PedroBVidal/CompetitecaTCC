<%-- 
    Document   : inscricaocompeticao
    Created on : 26/10/2018, 22:56:15
    Author     : Usuário
--%>

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

    </head>

    <body>
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {

                // Pega o id passado como parâmtro no botão "Realizar Inscrição" da jsp listaCompeticoes.jsp
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                int idAtleta = Integer.parseInt(request.getParameter("idAtleta"));

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
            if(request.getParameter("msg") != null){
                String mensagem = request.getParameter("msg");
                String cor = request.getParameter("color");
            %>
            <div class="alert alert-<%=cor%>" role="alert">
                <strong><%=mensagem%></strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
            }
            %>


            <h2 class="col mt-4 mb-3" style="margin: 20px 0px 20px -10px;">Inscreva-se nas competições que deseja partipar dentro de <span class="font-italic"><%=competicao.getNome()%></span></h2>

            <div class="row">

                <div class="col-12">
                    <form action="scripts/inscricaoAtletaEvento.jsp?idCompeticao=<%=idCompeticao%>&idUsuarioParticipante=<%=up.getIdUsuario()%>" method="POST">

                        <div class="card">
                            <div class="card-header">
                                Inscrição
                            </div>
                            <div class="card-body">
                            <%
                                if (competicao.getCmodalidadesolo().size() != 0) {

                                    // Para cada competição vinculada ao evento, adiciona um checkbox, para o atleta se inscrever, caso queira.

                            %>

                           
                                <div class="form-group">
                                    <h4 style="margin: -5px 0px 0px -5px;">Competições individuais: </h4>
                                </div>


                                <%      
                                    for (CompeticaoModalidadeSolo cms : competicao.getCmodalidadesolo()) {
                                        int flag = 0;
                                        char processo = ' ';
                                        for(InscricaoCompeticaoSolo ics : atleta.getInscricoesCompeticaoSolo()){
                                           if(ics.getCompeticaoModalidadeSolo().getIdCompeticaoModalidade() == cms.getIdCompeticaoModalidade()){
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
                                                                if (cms.getInformacaoExtra() != null) {%>
                                                    <%=cms.getInformacaoExtra()%>
                                                    <%} else {
                                                    %>
                                                    Não há informações extras sobre essa competição
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
                                        if(processo == 'E'){

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
                                if(processo == 'N'){

                                %>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                                <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                            </button><button type="input" class="btn btn-danger" disabled="true" style="width: 160px;"><i class="fas fa-times"></i>Negada</button>
                                        </div>
                                    </div>
                                </div>
                                 

                                <%}
                                if(processo == 'A'){

                                %>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cms.getNomeCompeticao()%>">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#2<%=cms.getIdCompeticaoModalidade()%>">
                                                <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                            </button><button type="input" class="btn btn-danger" disabled="true" style="width: 160px;"><i class="fas fa-check"></i> &nbsp;Aprovada</button>
                                        </div>
                                    </div>
                                </div>
                                                
 
                                <%}%>
                                
                                            
                                            <%}
                                        }
                                    }%>

                                <%
                                    if (competicao.getCmodalidadecole().size() != 0) {


                                %>  

                                <div class="form-group">
                                    <h4 style="margin: -5px 0px 0px -5px;">Competições coletivas: </h4>
                                </div>

                                <%
                                    for (CompeticaoModalidadeColetiva cmc : competicao.getCmodalidadecole()) {
                                %>

                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" disabled="true"  aria-label="Recipient's username" aria-describedby="button-addon2" value="<%=cmc.getNomeCompeticao()%>">
                                        <div class="input-group-append">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#saibaMaisCompeticaoColetiva<%=cmc.getIdCompeticaoModalidade()%>"><i class="fas fa-info-circle"></i>&nbsp;Saiba mais</button>
                                               
                                            </a><button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalTomadaDecissao<%=cmc.getIdCompeticaoModalidade()%>" style="width: 160px;">Inscrever-se</button>
                                        </div>
                                    </div>
                                </div>
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
                                                        if (cmc.getInformacaoExtra() != null) {%>
                                                                <%=cmc.getInformacaoExtra()%>
                                                                <%} else {
                                                                %>
                                                                Não há informações extras sobre essa competição
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
                                                <p style="margin-left: 10px;"><a href="formSolicitarEntradaEmEquipe.jsp?idCmc=<%=cmc.getIdCompeticaoModalidade()%>" role="button" class="btn btn-primary popover-test" title="Solicitar entrada em equipe" data-content="Popover body content is set in this attribute.">Clique aqui</a></p>
                                                </div>
                                            </div>
     
                                        </div>
                                    </div>
                                </div>      
                                <%}
                                    }%>

                            </div>
                        </div>
                    </form>
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
