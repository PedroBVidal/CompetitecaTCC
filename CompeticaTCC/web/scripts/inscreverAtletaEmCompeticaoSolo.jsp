<%-- 
    Document   : inscreverAtletaEmCompeticaoSolo
    Created on : 15/11/2018, 20:41:30
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.InscricaoCompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<!DOCTYPE html>
<%

    int idCms = Integer.parseInt(request.getParameter("idCms"));
    int idAtleta = Integer.parseInt(request.getParameter("idAtleta"));
    int idEvento = Integer.parseInt(request.getParameter("idCompeticao"));
    System.out.println("ID CMS"+ idCms);
    System.out.println("ID ATLETA:"+ idAtleta);
    
    CompeticaoModalidadeSoloControle competicaoModalidadeSoloControle = new CompeticaoModalidadeSoloControle();
    AtletaControle  atletaControle = new AtletaControle();
    InscricaoCompeticaoModalidadeSoloControle inscricaoCompeticaoSoloControle = new InscricaoCompeticaoModalidadeSoloControle();
    
    CompeticaoModalidadeSolo competicaoModalidadeSolo = competicaoModalidadeSoloControle.buscarPorId(idCms);
    Atleta atleta = atletaControle.buscarPorId(idAtleta);
    
    InscricaoCompeticaoSolo inscricaoCompeticaoSolo = new InscricaoCompeticaoSolo(0,competicaoModalidadeSolo, atleta,false);
    
    
    atleta.adicionarCompeticaoModalidadeSolo(competicaoModalidadeSolo);
    atleta.adicionarInscricaoCompeticaoSolo(inscricaoCompeticaoSolo);
    
    competicaoModalidadeSolo.adcionarInscricaoModalidadeSolo(inscricaoCompeticaoSolo);
    
    // Salvar e alterar os dados
    inscricaoCompeticaoSoloControle.salvar(inscricaoCompeticaoSolo);
    atletaControle.alterarAtleta(atleta);
    competicaoModalidadeSoloControle.alterar(competicaoModalidadeSolo);
    String msg = "Engresso realizado com sucesso";
    String color = "success";
    
    response.setCharacterEncoding("UTF-8");
    response.sendRedirect("../forminscricaocompeticao.jsp?idAtleta="+idAtleta+"&idCompeticao="+idEvento+"&msg="+msg+"&color="+color);
    
%>
