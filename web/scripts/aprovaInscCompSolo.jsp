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
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoAPRecebidoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPEnviado"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoAPEnviadoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
   
    int idInsc = Integer.parseInt(request.getParameter("idInsc"));
    int opt = Integer.parseInt(request.getParameter("opt"));
    String idComp = request.getParameter("idComp");
    InscricaoCompeticaoModalidadeSoloControle icmsc = new InscricaoCompeticaoModalidadeSoloControle();
    InscricaoCompeticaoSolo icms = icmsc.buscarId(idInsc);
    if(opt == 1){
        icms.setInscricaoAceita('A');
        icmsc.alterar(icms);
        ComunicadoAPEnviado comunicado = new ComunicadoAPEnviado("Parabéns, sua inscrição na competição "++" foi aceita",0,"Inscrição Aceita");
        response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Inscrição aprovada com sucesso&color=success");
    }else if(opt == 2){
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
          response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Incrição negada com sucesso&color=success");
    }else if(opt == 3){
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Competidor Expluso com sucesso&color=success");
    }

    
%>
