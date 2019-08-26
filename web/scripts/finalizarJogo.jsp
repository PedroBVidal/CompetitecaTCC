<%-- 
    Document   : finalizarJogo
    Created on : 19/08/2019, 11:35:43
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idConfronto = Integer.parseInt(request.getParameter("idConfronto"));
    int idEquipe1 = Integer.parseInt(request.getParameter("idEquipe1"));
    int idEquipe2 = Integer.parseInt(request.getParameter("idEquipe2"));
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    
    
    String placarEquipe1 = request.getParameter("placarConfrontoModal"+idConfronto+idEquipe1);
    String placarEquipe2 = request.getParameter("placarConfrontoModal"+idConfronto+idEquipe2);
    
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
    ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva competicaoColetiva = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    ConfrontoModalidadeColetiva confronto = confrontoModalidadeColetivaControle.buscarPorId(idConfronto);
    EquipeCompeticao equipe1 = equipeCompeticaoControle.buscarPorId(idEquipe1);
    EquipeCompeticao equipe2 = equipeCompeticaoControle.buscarPorId(idEquipe2);
    
    int valorVitoria, valorDerrota, valorEmpate;
    
    confronto.setFinalizado(true);
    confronto.setResultado(resultado);
    
    
    if(competicaoColetiva.getSistemaDeCompeticao() instanceof SistemaTodosContraTodos){
        SistemaTodosContraTodos sistemaDeCompeticaoTodosContraTodos = (SistemaTodosContraTodos) competicaoColetiva.getSistemaDeCompeticao();
        SistemaDeContagem sistemaDeContagem = sistemaDeCompeticaoTodosContraTodos.getSistemaDeContagem();
        
        valorVitoria = sistemaDeContagem.getValorVitoria();
        valorDerrota = sistemaDeContagem.getValorDerrota();
        valorEmpate = sistemaDeContagem.getValorEmpate();
    }
    
    
    if(placarEquipe1 == placarEquipe2){
        
    }
    
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Estou aqui!</h1>
        <h1>Placar equipe 1: <%=placarEquipe1%></h1>
        <h1>Placar equipe 2: <%=placarEquipe2%></h1>
        <h1>ID competição: <%=idCompeticao%></h1>
        <h1>ID confronto:<%=idConfronto%></h1>
        <h1>ID EQUIPE 1:<%=idEquipe1%></h1>
        <h1>ID EQUIPE 2:<%=idEquipe2%></h1>
    </body>
</html>
