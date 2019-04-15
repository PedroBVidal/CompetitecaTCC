<%-- 
    Document   : inativarCompeticaoModalidadeSolo
    Created on : 01/03/2019, 21:04:01
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    
    int idEvento = Integer.parseInt(request.getParameter("idEvento"));
    
    CompeticaoModalidadeSoloControle competicaoModalidadeSoloControle = new CompeticaoModalidadeSoloControle();
    
    System.out.println("(Id competicao)"+ idCompeticao);
    
    CompeticaoModalidadeSolo cms = competicaoModalidadeSoloControle.buscarPorId(idCompeticao);
    
    cms.setInativo(true);
    
    
    
    competicaoModalidadeSoloControle.alterar(cms);
    
    String msg = "Competicao apagada com sucesso";
    
    response.sendRedirect("../gerenciamentoDeCompeticao.jsp?msg="+msg+"&color=success&idCompeticao="+idEvento);
%>