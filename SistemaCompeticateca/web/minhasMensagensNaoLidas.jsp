<%-- 
    Document   : minhasMensagens
    Created on : 13/03/2019, 07:36:26
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.ConviteGerenciamentoAARecebido"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAARecebido"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.MensagemRecebida"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
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
          <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
      </header>
      
      <%
            int idUsuarioAdministrador = Integer.parseInt(request.getParameter("idUsuarioAdm"));
            
            System.out.println("ENTREI EM minhas mensagens não lidas!");
            
            
            UsuarioParticipanteControle upControle = new UsuarioParticipanteControle();
            
            UsuarioParticipante usuarioAdm = upControle.buscarPorId(idUsuarioAdministrador);
            
            
      %>

    <!-- Page Content -->
    <div class="container">

      <!-- Page Heading/Breadcrumbs -->
      <h1 class="mt-4 mb-3">Minhas mensagens
        
      </h1>

      <ol class="breadcrumb marginBreadcrumb">
        <li class="breadcrumb-item">
          <a href="minhasMensagensNaoLidas.jsp">Mensagens não lidas</a>
        </li>
        <li class="breadcrumb-item">
            <a href="minhasMensagensEnviadas.jsp">Mensagens enviadas</a>
        </li>
        <li class="breadcrumb-item">
            <a href="minhasMensagensRecebidas.jsp">Mensagens recebidas</a>
        </li>
      </ol>
      
                   <!-- Marketing Icons Section -->
      <div class="row">
        <%
            for(MensagemRecebida mR: usuarioAdm.getMensagensRecebidas()){
                
            if(mR instanceof ComunicadoAARecebido){
                
            ComunicadoAARecebido cR = (ComunicadoAARecebido) mR;
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
            <%}%>
            
         <% 
             if(mR instanceof ConviteGerenciamentoAARecebido){
                 
             ConviteGerenciamentoAARecebido cG = (ConviteGerenciamentoAARecebido) mR;
             
         %>
         <div class="col-lg-4 mb-4">
             <div class="card h-100">
                 <h4 class="card-header"><%=cG.getAssunto()%></h4>
                 <div class="card-body">
                     <p class="card-text"><%=cG.getTexto()%></p>
                 </div>
                 <div class="card-footer">
                     <div class="btnsDecissaoMensagem">
                     <a href="scripts/mensagens/aceitarConviteGerenciamento.jsp" class="btn btn-info">Aceitar convite</a>
                     <a href="scripts/mensagens/recusarConviteGerenciamento.jsp" class="btn btn-warning text-white">Recusar convite</a>
                     </div>
                     <a href="scripts/mensagens/marcarMensagemComoVisualizada.jsp" class="btn btn-outline-primary">Marcar como visualizada</a>
                     
                 </div>
             </div>
         </div>
            <%}%>
        <%}%>
      </div>
      <!-- /.row -->



    </div>
    <!-- /.container -->



    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
