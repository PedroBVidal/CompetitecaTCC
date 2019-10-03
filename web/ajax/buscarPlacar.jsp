<%-- 
    Document   : buscarPlacar
    Created on : 03/10/2019, 19:11:46
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
ConfrontoModalidadeColetivaControle cmcc = new ConfrontoModalidadeColetivaControle();
ConfrontoModalidadeColetiva cmc = cmcc.buscarPorId(id);
String resultado = cmc.getEquipes().get(0).getEquipe().getNome()+" | "+cmc.getPlacarEquipe1()+"<br>";
resultado += cmc.getEquipes().get(1).getEquipe().getNome()+" | "+cmc.getPlacarEquipe2();
if(cmc.isFinalizado()){
    resultado += "<br> <span class='badge badge-pill badge-primary'>Finalizado</span>";
}else{
    resultado += "<br> <span class='badge badge-pill badge-warning'>Não realizado</span>";
}

//out.print(resultado);
out.print(resultado);

%>
