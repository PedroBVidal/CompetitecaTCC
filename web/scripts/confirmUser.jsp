<%-- 
    Document   : confirmUser
    Created on : 15/11/2019, 15:44:13
    Author     : olive
--%>

<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    UsuarioControle uc = new UsuarioControle();
    Usuario usr = uc.buscarPorId(idUsuario);
    if (usr.getDataAtivacao() == null) {

        usr.setAtivo(1);
        usr.setDataAtivacao(new Date());
        uc.atualizarCad(usr);
        uc.fecharSessaoDAOGeneric();
        response.sendRedirect("../login.jsp?msg=Cadastro ativo com sucesso! Para entrar, basta utilizar o email e senha cadastados e selecionar o tipo indicado no email de ativação&color=success");
    }else{
        response.sendRedirect("../login.jsp?msg=O Cadastro já foi ativado uma vez! Faça o Login&color=warning");
    }
%>
