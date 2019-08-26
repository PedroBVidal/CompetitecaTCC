<%-- 
    Document   : gerarJogosModalidadeSolo
    Created on : 20/08/2019, 07:32:45
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idCompeticaoModalidadeSolo = Integer.parseInt(request.getParameter("idCompModSolo"));

    CompeticaoModalidadeSoloControle cmsc = new CompeticaoModalidadeSoloControle();

    CompeticaoModalidadeSolo cms = cmsc.buscarPorId(idCompeticaoModalidadeSolo);
    cmsc.fecharSessaoDAOGeneric();
    if (cms.isJogosEmAndamento()) {
        cms.setConfrontos(new ArrayList<Confronto>());
        cmsc.alterar(cms);
        cmsc.fecharSessaoDAOGeneric();
        cmsc.gerarPartidaTodosContraTodos(cms);
    } else {

        cmsc.gerarPartidaTodosContraTodos(cms);
    }

    response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idCompeticaoModalidadeSolo);
%>

