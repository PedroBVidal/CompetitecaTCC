<%-- 
    Document   : inscreverAtletaEmCompeticaoSolo
    Created on : 15/11/2018, 20:41:30
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idCms = Integer.parseInt(request.getParameter("idCms"));
    
    CompeticaoModalidadeSoloControle competicaoModalidadeSoloControle = new CompeticaoModalidadeSoloControle();
    
    CompeticaoModalidadeSolo competicaoModalidadeSolo = competicaoModalidadeSoloControle.buscarPorId(idCms);
    
    
%>
