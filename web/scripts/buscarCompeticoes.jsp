<%-- 
    Document   : buscarCompeticao
    Created on : 25/10/2018, 18:27:27
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    String nomeCompeticao = request.getParameter("nomeCompeticao");
    
    CompeticaoControle competicaoControle = new CompeticaoControle();
    
    
    

%>
