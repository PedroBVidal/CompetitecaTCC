<%-- 
    Document   : ingressoPvd
    Created on : 22/03/2019, 14:04:13
    Author     : gustavo
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("codigo");
    
    try{
    CompeticaoControle cc = new CompeticaoControle();
    Competicao comp = cc.buscarPorCodigo(codigo);
    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
    UsuarioParticipante2 up2 = up2c.buscarPorId(Integer.parseInt(request.getParameter("idUsuario")));
    Atleta atl = up2.getAtleta();
    response.sendRedirect("../forminscricaocompeticao.jsp?idCompeticao="+comp.getIdCompeticao()+"&idAtleta="+atl.getIdAtleta());
    }catch(Exception e){
        response.sendRedirect("../listaCompeticoes.jsp?msg="+e.getMessage()+"&color=danger");
    }

%>
