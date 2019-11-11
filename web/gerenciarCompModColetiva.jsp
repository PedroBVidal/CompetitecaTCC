<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>
        
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">
        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if (up == null) {

                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {

                CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();
                LocalControle localControle = new LocalControle();
                int idCompeticao = Integer.parseInt(request.getParameter("id"));
                CompeticaoModalidadeColetiva competicao = competicaoControle.buscarPorId(idCompeticao);
                
                SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
                SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
        %>

        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        

        <!-- Page Content -->
        <div class="container">
            <%                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("msg") != null) {
                    String mensagem = request.getParameter("msg");
                    String cor = request.getParameter("color");
            %>
            <br>
            <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                <strong><%=mensagem%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%}%>
            
            <%
                int emAprov = 0;
                for (InscricaoCompeticaoColetiva icc : competicao.getInscricoesCompeticoesColetivas()) {
                    if (icc.getInscricaoAceita() == 'E') {
                        emAprov++;
                    }
                }
            %>
            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3 titulos">Gerenciando competicao <span style="color: red;"><%=competicao.getNomeCompeticao()%> </span>
            </h1>
            <%if (competicao.getNumVagasDisp() > 0) {%>
            <span class="badge badge-pill badge-success" style="width: 1.75in;">Vagas Disp.:&nbsp;<%=competicao.getNumVagasDisp()%>&nbsp;|&nbsp;<%=competicao.getNumVagas()%></span>
            <%} else {
            %>
            <span class="badge badge-pill badge-danger" style="width: 1.75in;">Insc. Fechadas</span>
            <%}%>
            &nbsp;
            <%if (emAprov <= competicao.getNumVagasDisp()) {%>
            <span class="badge badge-pill badge-success" style="width: 1.75in;">Em aprovação:&nbsp;<%=emAprov%></span>
            <%} else {%>
            <span class="badge badge-pill badge-danger" style="width: 1.75in;">Em aprovação:&nbsp;<%=emAprov%></span>
            <%}%>
            <br>
            <br>
            
            <%
            if(competicao.getSistemaDeCompeticao().getNome().equals("Sistema todos contra todos")){
            %>
            <jsp:include page="interfaceSistemaTodosContraTodos.jsp" flush="true" />
            <%}
                else if (competicao.getSistemaDeCompeticao().getNome().equals("Sistema eliminatório")){
            %>
            <jsp:include page="interfaceSistemaEliminatorio.jsp" flush="true" />
            <%}%>
        </div>
    </body>

</html>                        

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script> 

        <%
            }
            
        %>


