<%-- 
    Document   : ingressoPvd
    Created on : 22/03/2019, 14:04:13
    Author     : gustavo
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("codigo");
    
    try{
    CompeticaoControle cc = new CompeticaoControle();
    Competicao comp = cc.buscarPorCodigo(codigo);
    response.sendRedirect("../forminscricaoatletaevento.jsp?idCompeticao="+comp.getIdCompeticao());
    }catch(Exception e){
        response.sendRedirect("../listaCompeticoes.jsp?msg="+e.getMessage()+"&color=danger");
    }

%>
