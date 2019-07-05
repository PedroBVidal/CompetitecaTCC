<%-- 
    Document   : inscricaoCompModColetiva
    Created on : 29/05/2019, 11:05:55
    Author     : gustavo
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.InscricaoCompeticaoColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.dao.GenericDAO"%>
<%@page import="br.edu.ifpr.irati.ti.dao.Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int numAtl = Integer.parseInt(request.getParameter("numAtl"));
    int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    int idComModCol = Integer.parseInt(request.getParameter("idCompModCol"));
    List<Atleta> atls = new ArrayList<>();
    AtletaControle atc = new AtletaControle();
    InscricaoCompeticaoColetivaControle iccc = new InscricaoCompeticaoColetivaControle();
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idComModCol);
    EquipeControle eqpc = new EquipeControle();
    Equipe eqp = eqpc.buscarPorId(idEquipe);
    for (int i = 0; i < numAtl; i++) {
      if(request.getParameter("idAtl" + i) != null){
        atls.add(atc.buscarPorId(Integer.parseInt(request.getParameter("idAtl" + i))));
       }
       System.out.println(numAtl);
    }

    InscricaoCompeticaoColetiva icc = new InscricaoCompeticaoColetiva(0, cmc, eqp, atls, 'E');
    iccc.salvar(icc);
    cmc.adicionarInscricao(icc);
    cmcc.alterar(cmc);
    response.sendRedirect("../forminscricaocompeticao.jsp?idEquipe="+eqp.getIdEquipe()+"&idCompeticao="+idCompeticao+"&msg=Inscricao Realizada com Sucesso&color=success");

%>
