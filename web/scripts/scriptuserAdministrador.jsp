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
    
    
    
    if(cmd == 2){
       
       UsuarioParticipanteControle uspc = new UsuarioParticipanteControle();
       UsuarioParticipante usuarioParticipante = uspc.buscarPorId(id);
       uspc.fecharSessaoDAOEspecifico();
       
       usuarioParticipante.setNome(nome);
       usuarioParticipante.setEmail(email);
       usuarioParticipante.setSenha(senha);
       
       uspc.atualizarCad(usuarioParticipante);
       usuarioParticipante = uspc.buscarLogin(email,senha);
       session.setAttribute("usuario",usuarioParticipante);
       response.sendRedirect("../gerenciamento.jsp");
       
    }
    if(cmd == 1){
        try{
        UsuarioParticipante usp = new UsuarioParticipante(id,nome,email,senha);
        UsuarioParticipanteControle uspc = new UsuarioParticipanteControle();
        uspc.criar(usp);
        uspc.fecharSessaoDAOGeneric();
        response.sendRedirect("../login.jsp?color=success&msg=Cadastro efetuado, agora entre com o tipo Administrador");
        }catch(Exception e){
            response.sendRedirect("../signup.jsp?p=3&color=danger&msg="+e.getMessage());
        }
    }
%>
