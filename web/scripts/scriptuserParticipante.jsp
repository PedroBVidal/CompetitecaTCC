<%-- 
    Document   : scriptuserParticipante
    Created on : 12/10/2018, 16:44:50
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    int cmd = Integer.parseInt(request.getParameter("c"));
    int id = Integer.parseInt(request.getParameter("id"));
    
    UsuarioParticipante2 usp = new UsuarioParticipante2(id,nome,email,senha);
    if(cmd == 2){
       UsuarioParticipante2Controle uspc = new UsuarioParticipante2Controle();
       uspc.atualizarCad(usp);
       usp = uspc.buscarLogin(email,senha);
       session.setAttribute("usuario",usp);
       response.sendRedirect("../interfaceDoParticipante.jsp");
       
    }

%>
