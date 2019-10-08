<%-- 
    Document   : buscarEventos
    Created on : 04/10/2019, 10:02:16
    Author     : olive
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    int id = Integer.parseInt(request.getParameter("idAtleta"));
    CompeticaoControle cc = new CompeticaoControle();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    String resultado = "";
    for (Competicao c : cc.buscarCompeticaoPorParteNome(nome)) {
        if (c.getNome().isEmpty()) {
            resultado += "<h3>Nenhuma competição encontrada</h3>";
        } else {
            String dataInicio = sdf.format(c.getDataInicio());
            String dataTermino = sdf.format(c.getDataTermino());
            resultado += "<div class='col-lg-4 col-sm-6 portfolio-item'>";
            resultado += "<div class='card h-100'>";
            resultado += "<a href='#'><img class='card-img-top' src='img/competiteca_default.png'alt=''></a>";
            resultado += "<div class='card-body'>";
            resultado += "<h4 class='card-title'>";
            resultado += "<p class='fontOverpass'><a href='#'>" + c.getNome() + "</a></p>";
            resultado += "</h4>";
            resultado += "<p class='card-text fontOverpass'><b>Data de Início:</b><span style='margin-left: 5px;'>" + dataInicio + "</span></p>";
            resultado += "<p class='card-text fontOverpass'><b>Data de Termino:</b><span style='margin-left: 5px;'>" + dataTermino + "</span></p>";
            resultado += "<div class='form-group'>";
            resultado += "<p class='fontOverpass'>";
            resultado += "<form action='forminscricaocompeticao.jsp' method='POST'>";
            resultado += "<input type='hidden' name='idCompeticao' value='" + c.getIdCompeticao() + "'>";
            resultado += "<input type='hidden' name='idAtleta' value='" + id + "'>";
            resultado += "<button style='float:right;' class='btn btn-success' type='submit' role='button'>Inscreva-se</button><p>";
            resultado += "</form>";
            resultado += "</div>";
            resultado += "</div>";
            resultado += "</div>";
            resultado += "</div>";
        }
    }
    if (!resultado.equals("")) {
        out.print(resultado);

    }else{
        out.print("<h3>Nenhum evento com '"+nome+"' foi encontrado</h3>");
    }

%>


















