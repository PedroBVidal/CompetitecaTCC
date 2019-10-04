<%-- 
    Document   : buscarPlacar
    Created on : 03/10/2019, 19:11:46
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(id);
    String resultado = "<div class='card'>";
    resultado += "<div class='card-header'>";
    resultado += cmc.getNomeCompeticao();
    resultado += "</div>";
    resultado += "<div class='card-body'>";
    resultado += "<div class='row'>";
    for (Confronto cnft : cmc.getConfrontos()) {
        ConfrontoModalidadeColetiva cmmc = (ConfrontoModalidadeColetiva) cnft;
        resultado += "<div class='card' style='width: 18rem;'>";
        resultado += "<div class='card-body'>";
        resultado += cmmc.getEquipes().get(0).getEquipe().getNome() + " | " + cmmc.getPlacarEquipe1() + "<br>";
        resultado += cmmc.getEquipes().get(1).getEquipe().getNome() + " | " + cmmc.getPlacarEquipe2();
        if (cmmc.isFinalizado()) {
            resultado += "<br> <span class='badge badge-pill badge-success'>Finalizado</span>";
        } else {
            resultado += "<br> <span class='badge badge-pill badge-warning'>Não realizado</span>";
        }
        resultado += "</div>";
        resultado += "</div>";

    }
    resultado += "</div>";
    resultado += "</div>";
    resultado += "</div>";
//cmcc.fecharSessaoDAOGeneric();

//out.print(resultado);
    out.print(resultado);

%>