<%-- 
    Document   : gerarJogosCompeticaoModalidadeColetivaSistemaEliminatorio
    Created on : 01/10/2019, 20:47:03
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idCompeticaoColetiva = Integer.parseInt(request.getParameter("idCompModColetiva"));
    
    CompeticaoModalidadeColetivaControle cptModColetivaControle = new CompeticaoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva cmc = cptModColetivaControle.buscarPorId(idCompeticaoColetiva);
    cptModColetivaControle.fecharSessaoDAOGeneric();
    
    SistemaEliminatorio sistemaDeCompeticao = (SistemaEliminatorio) cmc.getSistemaDeCompeticao();
    boolean repescagem = sistemaDeCompeticao.isRepescagem();
    
    cptModColetivaControle.gerarConfrontosSistemaEliminatorio(cmc, repescagem);
    
    response.sendRedirect("../gerenciarCompModColetiva.jsp?id="+idCompeticaoColetiva);
%>
