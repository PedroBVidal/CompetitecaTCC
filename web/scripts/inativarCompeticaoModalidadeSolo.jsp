<%-- 
    Document   : inativarCompeticaoModalidade
    Created on : 28/02/2019, 19:11:22
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    
    int idEvento = Integer.parseInt(request.getParameter("idEvento"));
    
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    
    System.out.println("(Id competicao)"+ idCompeticao);
    
    CompeticaoModalidade cms = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    
    cms.setInativo(true);
    
    
    
    //competicaoModalidadeSoloControle.alterar(cms);
    
    String msg = "Competicao apagada com sucesso";
    
    response.sendRedirect("gerenciamentoDeCompeticao.jsp?msg="+msg+"&color=danger?idCompeticao="+ idEvento);
    

%>