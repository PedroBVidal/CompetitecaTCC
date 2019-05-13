<%-- 
    Document   : cadastrarEquipe
    Created on : 13/05/2019, 10:21:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    int idModalidadeSelecionada = Integer.parseInt(request.getParameter("idModalidade"));
    String nomeModalidade = request.getParameter("nomeModalidade");
    int idCompeticaoColetiva = Integer.parseInt(request.getParameter("idCompeticaoColetiva"));
    
    int idEquipe = 0;
    
    if(request.getParameter("idEquipe") != null){
        idEquipe = Integer.parseInt("idEquipe");
    }
    
    //Cadastrar nova equipe
    if(idEquipe == 0){
        
    }
    
%>
