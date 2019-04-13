<%-- 
    Document   : privado.jsp
    Created on : 22/03/2019, 09:39:29
    Author     : gustavo
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("idComp"));
    CompeticaoControle cc = new CompeticaoControle();
    Competicao comp = cc.buscarCompeticaoPorId(id);
    
    comp.setPrivado(true);
    cc.autualizarCompeticao(comp);
    
    response.sendRedirect("../gerenciamentoDeCompeticao.jsp?idCompeticao="+id);
%>
