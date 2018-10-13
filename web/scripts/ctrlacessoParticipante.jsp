<%-- 
    Document   : ctrlacessoParticipante
    Created on : 12/10/2018, 10:45:27
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    session = request.getSession();
    
    UsuarioParticipante2Controle usuarioParticpanteControle = new UsuarioParticipante2Controle();
    
    try {
        UsuarioParticipante2 usuarioParticipante = usuarioParticpanteControle.buscarLogin(email, senha);
        session.setAttribute("usuario",usuarioParticipante);
        response.sendRedirect("../interfaceDoParticipante.jsp");
    }
    catch(Exception e){
        
        session.setAttribute("usuario",null);
        response.sendRedirect("../login.jsp?e="+e.getMessage());
    }

%>
