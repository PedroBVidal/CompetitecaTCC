<%-- 
    Document   : scriptuser
    Created on : 06/10/2018, 20:40:39
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    int cmd = Integer.parseInt(request.getParameter("c"));
    int id = Integer.parseInt(request.getParameter("id"));
    UsuarioParticipante usp = new UsuarioParticipante(id,nome,email,senha);
    if(cmd == 2){
       UsuarioParticipanteControle uspc = new UsuarioParticipanteControle();
       uspc.atualizarCad(usp);
       usp = uspc.buscarLogin(email,senha);
       session.setAttribute("usuario",usp);
       response.sendRedirect("../gerenciamento.jsp");
       
    }

%>
