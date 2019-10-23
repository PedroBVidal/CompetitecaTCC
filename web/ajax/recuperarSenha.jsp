<%-- 
    Document   : recuperarSenha
    Created on : 21/10/2019, 18:46:05
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.email.EnviarEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
    EnviarEmail ee = new EnviarEmail();
    int opt = Integer.parseInt(request.getParameter("opt"));
    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
    UsuarioParticipante2Controle upc2 = new UsuarioParticipante2Controle();
    if (opt == 1) {//Recuperação para usuário Administrador
        try {
            UsuarioParticipante up = upc.recuperaSenhaByEmail(email);
            ee.setAssunto("Competiteca - Recuperação de Senha");
            ee.setEmailDestinatario(up.getEmail());
            ee.setMsg("<h3>Recuperação de Senha</h3><p><b>Olá " + up.getNome() + "</b><br>Que situação, hein?<br> Isso acontece muito, e já estamos habituados; estamos aqui para ajudá-lo :) <br> Para recuperar a sua senha, basta clicar no link <a href='http://localhost:8084/Competiteca/recuperarSenha.jsp?opt=1&usr="+up.getIdUsuario()+"'>Recupere aqui<a/><br> Fácil, né? <br><br><br><br>É muito bom ajudá-lo<br><b>Competiteca - Gestor de Eventos Esportivos</b><br>Rua Pedro Koppe, 100<br>84500-000<br> Irati - PR </p>");
            ee.enviarGmail();
            out.print("<div class='alert alert-success' role='alert'>Um email de recuperação foi enviado para <strong>" + up.getEmail() + "</strong>; ingresse no link lá indicado para a recuperação</div>");

        } catch (Exception e) {
            out.print("Efectuado sem sucesso");
        }

    } else if (opt == 2) { //Recuperação para Usuário Participante
        try {
            UsuarioParticipante2 up = upc2.recuperaSenhaByEmail(email);
            ee.setAssunto("Competiteca - Recuperação de Senha");
            ee.setEmailDestinatario(up.getEmail());
            ee.setMsg("<h3>Recuperação de Senha</h3><p><b>Olá " + up.getNome() + "</b><br>Que situação, hein?<br> Isso acontece muito, e já estamos habituados; estamos aqui para ajudá-lo :) <br> Para recuperar a sua senha, basta clicar no link <a href='http://localhost:8084/Competiteca/recuperarSenha.jsp?opt=2&usr="+up.getIdUsuario()+"'>Recupere aqui<a/><br> Fácil, né? <br><br><br><br>É muito bom ajudá-lo<br><b>Competiteca - Gestor de Eventos Esportivos</b><br>Rua Pedro Koppe, 100<br>84500-000<br> Irati - PR </p>");
            ee.enviarGmail();
            out.print("<div class='alert alert-success' role='alert'>Um email de recuperação foi enviado para <strong>" + up.getEmail() + "</strong>; ingresse no link lá indicado para a recuperação</div>");
        } catch (Exception e) {
            out.print("<div class='alert alert-danger' role='alert'>"+e.getMessage()+"</div>");
        }
    }
%>
