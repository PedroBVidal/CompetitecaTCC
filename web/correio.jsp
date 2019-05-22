<%-- 
    Document   : minhasMensagens
    Created on : 13/03/2019, 07:36:26
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido"%>
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

    </head>

    <body>

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
            <h1 class="mt-4 mb-3">Minhas mensagens

            </h1>

            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#naolidas" role="tab" aria-controls="nav-home" aria-selected="true">Não Lidas</a>
                <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#entrada" role="tab" aria-controls="nav-profile" aria-selected="false">Entrada</a>
                <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#enviadas" role="tab" aria-controls="nav-contact" aria-selected="false">Enviadas</a>
            </div>
            <div class="tab-content" id="nav-tabContent">
             
                
                <!--<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">...</div>-->
            
          
                <!-- Marketing Icons Section -->
                  <div class="tab-pane fade show active" id="naolidas" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row">
                        <%
                            for(MensagemRecebida mR: usuarioAdm.getMensagensRecebidas()){
                
                            if(mR instanceof ComunicadoAPRecebido){
                
                            ComunicadoAPRecebido cR = (ComunicadoAPRecebido) mR;
                        %>
                        <div class="col-lg-4 mb-4">
                            <div class="card h-100">
                                <h4 class="card-header"><%=cR.getAssunto()%></h4>
                                <div class="card-body">
                                    <p class="card-text"><%=cR.getTexto()%></p>
                                </div>
                                <div class="card-footer">
                                    <a href="#" class="btn btn-outline-primary">Marcar como visualizada</a>
                                </div>
                            </div>
                        </div>
                        <%}}%>

                       
                    <!-- /.row -->


                </div>
                        </div>
                    <div class="tab-pane fade" id="entrada" role="tabpanel" aria-labelledby="nav-profile-tab"><h1>Entrada</h1></div>
                    <div class="tab-pane fade" id="enviadas" role="tabpanel" aria-labelledby="nav-profile-tab"><h1>Enviadas</h1></div>
            </div>
        </div>
        <!-- /.container -->



        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
