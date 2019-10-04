<%-- 
    Document   : gerarJogosCompeticaoModalidadeColetivaSistemaEliminatorio
    Created on : 01/10/2019, 20:47:03
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idCompeticaoColetiva = Integer.parseInt(request.getParameter("idCompModColetiva"));
    
    CompeticaoModalidadeColetivaControle cptModColetivaControle = new CompeticaoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva cmc = cptModColetivaControle.buscarPorId(idCompeticaoColetiva);
    cptModColetivaControle.fecharSessaoDAOGeneric();
    
    cptModColetivaControle.gerarConfrontosSistemaEliminatorio(cmc);
%>
