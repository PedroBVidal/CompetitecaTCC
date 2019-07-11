<%-- 
    Document   : minhasMensagens
    Created on : 13/03/2019, 07:36:26
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Segmento"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoRecebido"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.MensagemRecebida"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
        <!-- Página de estilo própria-->
        <link href="css/estilo.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
          href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <%
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

            //System.out.println("ENTREI EM minhas mensagens não lidas!");
            UsuarioParticipante2Controle upControle = new UsuarioParticipante2Controle();

            UsuarioParticipante2 usuarioAdm = upControle.buscarPorId(idUsuario);


        %>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3 titulos">Minhas mensagens

            </h1>

            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#naolidas" role="tab" aria-controls="nav-home" aria-selected="true">Não Lidas</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#entrada" role="tab" aria-controls="nav-profile" aria-selected="false">Entrada</a>
                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#enviadas" role="tab" aria-controls="nav-contact" aria-selected="false">Enviadas</a>
            </div>
            <div class="tab-content" id="nav-tabContent">


                <!--<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>-->


                <!-- Caixa das Não Lidas, somente-->
                <div class="tab-pane fade show active" id="naolidas" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row">

                        <div class="accordion col-12" id="accordionExample">
                            <%
                                for (MensagemRecebida mR : usuarioAdm.getMensagensRecebidas()) {

                                    if (mR instanceof ComunicadoRecebido) {

                                        ComunicadoRecebido cR = (ComunicadoRecebido) mR;
                                        if (cR.isLido() == false) {
                            %>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#<%=cR.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <%=cR.getAssunto()%>
                                        </button>
                                    </h2>
                                </div>

                                <div id="<%=cR.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <%=cR.getTexto()%><br><br>
                                        <a href="scripts/mensagemMarkRead.jsp?idMensagem=<%=cR.getIdMensagemRecebida()%>" class="btn btn-outline-primary">Marcar como visualizada</a>
                                    </div>
                                </div>
                            </div>
                            <%}
                                }%>

                            <%
                                if (mR instanceof SolicitacaoEntradaEquipeRecebida) {
                                    SolicitacaoEntradaEquipeRecebida solicEntReceb = (SolicitacaoEntradaEquipeRecebida) mR;
                                    if (solicEntReceb.isLido() == false) {

                            %>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#<%=solicEntReceb.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <%=solicEntReceb.getAssunto()%>
                                        </button>
                                    </h2>
                                </div>

                                <div id="<%=solicEntReceb.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                            Usuario remetente: <a href="#" data-target="#1" class="stretched-link" onclick="acionarModalSaibaMaisAtleta(<%=solicEntReceb.getRemetente().getIdUsuario()%>);"><%=solicEntReceb.getRemetente().getNome()%></a>
                                        
                                        </p>
                                        
                                        <%=solicEntReceb.getTexto()%><span class="font-weight-bold"><%=solicEntReceb.getEquipe().getNome()%>.</span><br><br>
                                        
                                        <form name="formularioMsgSolicitacao" action="scripts/decisaoMsgSolicitacaoEntradaEquipe.jsp">
                                            <input type="hidden" id="idMensagemRecebida" name="idMensagemRecebida" value="<%=solicEntReceb.getIdMensagemRecebida()%>">
                                            <input type="hidden" id="opcao" name="op">
                                        </form>
                                        
                                        <button type="button" class="btn btn btn-success" onclick="enviarFormulario(1);">Aceitar</button>
                                        <button type="button" class="btn btn-danger btn" onclick="enviarFormulario(2);">Rejeitar</button>

                                    </div>
                                </div>
                            </div>
                                            
                                <!-- Modal INFO USER PARTICIPANTE -->
                                <div class="modal fade" id="modalSaibaMaisAtleta<%=solicEntReceb.getRemetente().getIdUsuario()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Nome: <%=solicEntReceb.getRemetente().getNome()%></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                    String dataNascimento = "";
                                                    String email = "";
                                                    boolean possuiSegemento = false;
                                                    String nomeSegmento = "";
                                                    
                                                    if(solicEntReceb.getRemetente() instanceof UsuarioParticipante2){
                                                        UsuarioParticipante2 usuarioRemetente = (UsuarioParticipante2) solicEntReceb.getRemetente();
                                                         Atleta atletaVinculadoUsuario = usuarioRemetente.getAtleta();
                                                         dataNascimento = sdf.format(atletaVinculadoUsuario.getDataNascimento());
                                                         email = usuarioRemetente.getEmail();
                                                         if(atletaVinculadoUsuario.getSegmento() != null){
                                                             nomeSegmento = atletaVinculadoUsuario.getSegmento().getNome();
                                                             possuiSegemento = true;
                                                         }
                                                    }
                                                    
                                                    
                                                %>
                                                <p><span class="font-weight-bold">Email: </span><%=email%></p>
                                                <p><span class="font-weight-bold">Data de nascimento: </span><%=dataNascimento%></p>
                                                <%
                                                    
                                                    if(possuiSegemento){
                                                %>
                                                <p><span class="font-weight-bold">Segmento IFPR-IRATI: </span><%=nomeSegmento%></p>
                                                <%}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <%}
                                }%>
                            <%}%>
                        </div>



                        <!-- /.row -->


                    </div>
                </div>
                        
                        
                        
                        
                        
                        
                <!--Caixa de Entrada(Lidas e Não Lidas)-->
                <div class="tab-pane fade" id="entrada" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <div class="row">

                        <div class="accordion col-12" id="accordionExample2">
                            <%
                                for (MensagemRecebida mR : usuarioAdm.getMensagensRecebidas()) {

                                    if (mR instanceof ComunicadoRecebido) {

                                        ComunicadoRecebido cR = (ComunicadoRecebido) mR;
                                        if (cR.isLido() == false) {
                            %>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#e<%=cR.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <span style="color:#dc3545;"><%=cR.getAssunto()%></span>
                                        </button>
                                    </h2>
                                </div>

                                <div id="e<%=cR.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <%=cR.getTexto()%><br><br>
                                        <a href="scripts/mensagemMarkRead.jsp?idMensagem=<%=cR.getIdMensagemRecebida()%>" class="btn btn-outline-primary">Marcar como visualizada</a>
                                    </div>
                                </div>
                            </div>
                            <%} else {%>
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link " type="button" data-toggle="collapse" data-target="#e<%=cR.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <span style="color:#28a745;"><%=cR.getAssunto()%></span>
                                        </button>
                                    </h2>
                                </div>

                                <div id="e<%=cR.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <%=cR.getTexto()%><br><br>

                                    </div>
                                </div>
                            </div>


                            <% }
                                        }


                                    if(mR instanceof SolicitacaoEntradaEquipeRecebida){
                                        SolicitacaoEntradaEquipeRecebida solictEntReceb = (SolicitacaoEntradaEquipeRecebida) mR;
                                        if(solictEntReceb.isLido() == false){
                            %>
                                        
                                        
                            <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#e<%=solictEntReceb.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <span style="color:#dc3545;"><%=solictEntReceb.getAssunto()%></span>
                                        </button>
                                    </h2>
                                </div>

                                <div id="e<%=solictEntReceb.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                            Usuario remetente: <a href="javascript:acionarModalSaibaMaisAtleta2(<%=solictEntReceb.getRemetente().getIdUsuario()%>)" data-target="#1" class="stretched-link"><%=solictEntReceb.getRemetente().getNome()%></a>
                                        
                                        </p>
                                        
                                        <%=solictEntReceb.getTexto()%><span class="font-weight-bold"><%=solictEntReceb.getEquipe().getNome()%>.</span><br><br>
                                        
                                        <form name="formularioMsgSolicitacao" action="scripts/decisaoMsgSolicitacaoEntradaEquipe.jsp">
                                            <input type="hidden" id="idMensagemRecebida" name="idMensagemRecebida" value="<%=solictEntReceb.getIdMensagemRecebida()%>">
                                            <input type="hidden" id="opcao" name="op">
                                        </form>
                                        
                                        <button type="button" class="btn btn btn-success" onclick="enviarFormulario(1);">Aceitar</button>
                                        <button type="button" class="btn btn-danger btn" onclick="enviarFormulario(2);">Rejeitar</button>

                                    </div>
                                </div>
                            </div>
                                            
                                            
                            <!-- Modal INFO USER PARTICIPANTE (CAIXA DE ENTRADA)-->
                                <div class="modal fade" id="modalSaibaMaisAtleta2<%=solictEntReceb.getRemetente().getIdUsuario()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Nome: <%=solictEntReceb.getRemetente().getNome()%></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                    String dataNascimento = "";
                                                    String email = "";
                                                    boolean possuiSegemento = false;
                                                    String nomeSegmento = "";
                                                    
                                                    if(solictEntReceb.getRemetente() instanceof UsuarioParticipante2){
                                                        UsuarioParticipante2 usuarioRemetente = (UsuarioParticipante2) solictEntReceb.getRemetente();
                                                         Atleta atletaVinculadoUsuario = usuarioRemetente.getAtleta();
                                                         dataNascimento = sdf.format(atletaVinculadoUsuario.getDataNascimento());
                                                         email = usuarioRemetente.getEmail();
                                                         if(atletaVinculadoUsuario.getSegmento() != null){
                                                             nomeSegmento = atletaVinculadoUsuario.getSegmento().getNome();
                                                             possuiSegemento = true;
                                                         }
                                                    }
                                                    
                                                    
                                                %>
                                                <p><span class="font-weight-bold">Email: </span><%=email%></p>
                                                <p><span class="font-weight-bold">Data de nascimento: </span><%=dataNascimento%></p>
                                                <%
                                                    
                                                    if(possuiSegemento){
                                                %>
                                                <p><span class="font-weight-bold">Segmento IFPR-IRATI: </span><%=nomeSegmento%></p>
                                                <%}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>                
                                            
                                            
                                            
                                            
                                            
                            <%} else{%>
                             <div class="card">
                                <div class="card-header" id="headingOne">
                                    <h2 class="mb-0">
                                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#e<%=solictEntReceb.getIdMensagemRecebida()%>" aria-expanded="true" aria-controls="collapseOne">
                                            <span style="color:#28a745;"><%=solictEntReceb.getAssunto()%></span>
                                        </button>
                                    </h2>
                                </div>

                                <div id="e<%=solictEntReceb.getIdMensagemRecebida()%>" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                                    <div class="card-body">
                                        <p>
                                            Usuario remetente: <%=solictEntReceb.getRemetente().getNome()%>
                                        
                                        </p>
                                        
                                        <%=solictEntReceb.getTexto()%><span class="font-weight-bold"><%=solictEntReceb.getEquipe().getNome()%>.</span><br><br>
                                        
                                        
                                        <%
                                            String texto = "";
                                            if(solictEntReceb.getEstadoSolicitacao() == 'A'){
                                                texto = "Solcitação aceita";
                                            }
                                            if(solictEntReceb.getEstadoSolicitacao() == 'N'){
                                                texto = "Solicitação negada";
                                            }
                                        %>
                                        <button type="button" class="btn btn btn-outline-primary" disabled><%=texto%></button>

                                    </div>
                                </div>
                            </div>
                            
                            <%}}}%>
                        </div>


                    </div>

                </div>
                <div class="tab-pane fade" id="enviadas" role="tabpanel" aria-labelledby="nav-profile-tab"><h1>Enviadas</h1></div>
            </div>
            <!-- /.container -->



            <!-- Bootstrap core JavaScript -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script>
              
            function enviarFormulario(op){
                
               inptOp = document.getElementById("opcao");
               
               if(op === 1){
                   inptOp.value = "1";
               }
               
               if(op === 2){
                   inptOp.value = "2";
               }

               document.forms["formularioMsgSolicitacao"].submit();
               
            }
            
            function acionarModalSaibaMaisAtleta(idAtleta){
                $('#modalSaibaMaisAtleta'+idAtleta).modal('show');
            
            }
            
            function acionarModalSaibaMaisAtleta2(idAtleta){
                $('#modalSaibaMaisAtleta2'+idAtleta).modal('show');
            
            }
    
    
            </script>
    </body>

</html>
