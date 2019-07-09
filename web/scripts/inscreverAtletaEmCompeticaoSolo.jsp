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
    String msg = "";
    String color = ""; 
    boolean inscricaoJaRealizada = false;
    
    CompeticaoModalidadeSoloControle competicaoModalidadeSoloControle = new CompeticaoModalidadeSoloControle();
    AtletaControle  atletaControle = new AtletaControle();
    InscricaoCompeticaoModalidadeSoloControle inscricaoCompeticaoSoloControle = new InscricaoCompeticaoModalidadeSoloControle();
    
    CompeticaoModalidadeSolo competicaoModalidadeSolo = competicaoModalidadeSoloControle.buscarPorId(idCms);
    
    Atleta atleta = atletaControle.buscarPorId(idAtleta);
    
    

    
    // Verifica se o usuário já realizou inscricao na competição
    for(InscricaoCompeticaoSolo insc : atleta.getInscricoesCompeticaoSolo()){
        if(insc.getIdInscricao() == idCms){
            inscricaoJaRealizada = true;
        }
    }
    
    
    if(inscricaoJaRealizada == false){
    InscricaoCompeticaoSolo inscricaoCompeticaoSolo = new InscricaoCompeticaoSolo(0,competicaoModalidadeSolo, atleta,'E');
    atleta.adicionarCompeticaoModalidadeSolo(competicaoModalidadeSolo);
    atleta.adicionarInscricaoCompeticaoSolo(inscricaoCompeticaoSolo);
    
    
    
    
    atletaControle.fecharSessaoDAOEspecifico();
    
    competicaoModalidadeSolo.adcionarInscricaoModalidadeSolo(inscricaoCompeticaoSolo);
    
    // Salvar e alterar os dados
    inscricaoCompeticaoSoloControle.salvar(inscricaoCompeticaoSolo);
    inscricaoCompeticaoSoloControle.fecharSessaoDAOGeneric();
    atletaControle.alterarAtleta(atleta);
    atletaControle.fecharSessaoDAOGeneric();
    competicaoModalidadeSoloControle.alterar(competicaoModalidadeSolo);
    competicaoModalidadeSoloControle.fecharSessaoDAOGeneric();
    msg = "Ingresso realizado com sucesso";
    color = "success";
    }
    
    if(inscricaoJaRealizada == true){
        competicaoModalidadeSoloControle.fecharSessaoDAOGeneric();
        atletaControle.fecharSessaoDAOEspecifico();
        msg = "Ingresso ja realizado com sucesso";
        color = "success";
    }
    
    
    response.setCharacterEncoding("UTF-8");
    response.sendRedirect("../forminscricaocompeticao.jsp?idAtleta="+idAtleta+"&idCompeticao="+idEvento+"&msg="+msg+"&color="+color);
    
%>
