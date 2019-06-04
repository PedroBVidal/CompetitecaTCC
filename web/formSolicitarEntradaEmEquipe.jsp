
<%@page import="br.edu.ifpr.irati.ti.modelo.MensagemEnviada"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- 
    Document   : index.jsp
    Created on : 19/05/2019, 09:16:10
    Author     : Aluno 
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
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

    </head>

    <body>
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            
            
           
            
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
                
                CompeticaoModalidadeColetivaControle cmcControle = new CompeticaoModalidadeColetivaControle();
                EquipeControle equipeControle = new EquipeControle();
                UsuarioParticipante2Controle usuarioPControle = new UsuarioParticipante2Controle();
                int idCompeticaoModalidadeColetiva = Integer.parseInt(request.getParameter("idCmc"));
                CompeticaoModalidadeColetiva cmc = cmcControle.buscarPorId(idCompeticaoModalidadeColetiva);
                UsuarioParticipante2 usuarioParticipante = usuarioPControle.buscarPorId(up.getIdUsuario());
        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <div class="container">
            
            <%
                request.setCharacterEncoding("UTF-8");
            if(request.getParameter("msg") != null){
                String mensagem = request.getParameter("msg");
                String cor = request.getParameter("color");
            %>
            <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                <strong><%=mensagem%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
            }
            %>
            <h1 class="my-4">Equipes vinculas a competição <span><%=cmc.getNomeCompeticao()%></span></h1>
            <div class="card">
                
                <div class="card-body">
                    <table class="table">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Administrador da equipe</th>
                                <th scope="col">Ação</th>
                                    
                            </tr>
                        </thead>
                        <tbody>
                            
                            <%
                                for (Equipe equipe : equipeControle.buscarTodasEquipe()) {

                                        int flag = 0;
                                        if(equipe.getModalidade().getIdModColetiva() == cmc.getModalidadeColetiva().getIdModColetiva()){
                                        
                                        
                                        for (CompeticaoModalidadeColetiva c : equipe.getCompeticoesModalidadeColeivas()) {

                                            if (c.getIdCompeticaoModalidade() == cmc.getIdCompeticaoModalidade()) {
                                                if (equipe.getAdministrador().getIdUsuario() == up.getIdUsuario()) {
                                                    flag = 4;
                                                }
                                                
                                                if(flag != 4){
                                                for (MensagemEnviada msg : usuarioParticipante.getMensagensEnviadas()) {
                                                    if (msg instanceof SolicitacaoEntradaEquipeEnviada) {
                                                        SolicitacaoEntradaEquipeEnviada see = (SolicitacaoEntradaEquipeEnviada) msg;
                                                        if (see.getEquipe().getIdEquipe() == equipe.getIdEquipe()) {

                                                            if (see.getEstadoSolicitacao() == 'A') {
                                                                flag = 1;
                                                            }
                                                            if (see.getEstadoSolicitacao() == 'N') {
                                                                flag = 2;
                                                            }
                                                            if (see.getEstadoSolicitacao() == 'E') {
                                                                flag = 3;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            }
                                        }
                                        }
                                        else{
                                            flag = 5;
                                        }
                            %>
                            
                            <%
                                if(flag != 4 && flag != 5){
                            %>
                            <tr>
                                <td><%=equipe.getNome()%></td>
                                <td><%=equipe.getAdministrador().getNome()%></td>
                                <td>
                                    <%
                                        if (flag == 0) {
                                                
                                        
                                    %>
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalSolictarEntrada<%=equipe.getIdEquipe()%>"><i class="fas fa-sign-in-alt"></i>&nbsp;Solicitar entrada</button>
                                    <%}%>
                                        <%
                                        
                                            if(flag == 1){
                                        %>
                                        <button type="input" class="btn btn-success" disabled="true" style="width: 300px;">Solicitação aceita</button>
                                        <%}%>
                                        <%
                                        
                                            if(flag == 2){
                                        %>
                                        <button type="input" class="btn btn-danger" disabled="true" style="width: 300px;">Solicitação negada</button>
                                        <%}%>
                                        <%
                                        
                                            if(flag == 3){
                                        %>
                                        <button type="input" class="btn btn-warning" disabled="true" style="width: 220px;">Solicitação em aprovação</button>
                                        <%}%>
                                </td>
                            </tr>
                            
                        <!--Modal solicitar entrada equipe-->
                        <div class="modal fade" id="modalSolictarEntrada<%=equipe.getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Deseja realmente solicitar entrada na equipe <%=equipe.getNome()%>?</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p><span class="font-weight-bold">1- </span>Uma mensagem de solicitação de entrada ao administrador da equipe <%=equipe.getNome()%> será enviada.</p>
                                        <p><span class="font-weight-bold">2- </span>Quando a solicitação for aceita você será avisado através de uma mensagem dentro do sistema.</p>

                                    </div>
                                    <div class="modal-footer">
                                        <%
                                        
                                            if(flag == 0){
                                        %>
                                        <form action="scripts/solicitarEntradaEquipe.jsp" method="POST">
                                            
                                            <input type="hidden" name="idCompeticao" value="<%=cmc.getCompeticao().getIdCompeticao()%>">
                                            <input type="hidden" name="idEquipe" value="<%=equipe.getIdEquipe()%>">
                                            <input type="hidden" name="idAdmEquipe" value="<%=equipe.getAdministrador().getIdUsuario()%>">
                                            <input type="hidden" name="idUsuarioRemetente" value="<%=up.getIdUsuario()%>">
                                            <button type="submit" class="btn btn-primary btn active" role="button" aria-pressed="true"><i class="fas fa-sign-in-alt"></i>&nbsp;Solicitar entrada</button>
                                        </form>
                                        
                                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <%}}}%>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
            
            
            
            
            
       

        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
            
        }
        %>
    </body>

</html>


