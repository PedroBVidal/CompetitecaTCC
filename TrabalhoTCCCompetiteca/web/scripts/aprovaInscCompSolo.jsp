<%-- 
    Document   : inscreverAtletaEmCompeticaoSolo
    Created on : 15/11/2018, 20:41:30
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.InscricaoCompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoAPRecebidoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPEnviado"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoAPEnviadoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
   
    int idInsc = Integer.parseInt(request.getParameter("idInsc"));
    int opt = Integer.parseInt(request.getParameter("opt"));
    String idComp = request.getParameter("idComp");
    InscricaoCompeticaoModalidadeSoloControle icmsc = new InscricaoCompeticaoModalidadeSoloControle();
    InscricaoCompeticaoSolo icms = icmsc.buscarId(idInsc);
    UsuarioParticipante2 up2 = icms.getAtleta().getUsuarioParticipante();
    ComunicadoAPRecebidoControle crc = new ComunicadoAPRecebidoControle();
    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
    UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
    if(opt == 1){
        icms.setInscricaoAceita('A');
        icmsc.alterar(icms);
        ComunicadoAPRecebido comunicado = new ComunicadoAPRecebido("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita.",up,0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Inscrição Aceita");
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
       // ComunicadoAPEnviado comunicado2 = new ComunicadoAPEnviado("Parabéns, sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi aceita",0,"Inscrição Aceita");
        response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Inscrição aprovada com sucesso&color=success");
    }else if(opt == 2){
        ComunicadoAPRecebido comunicado = new ComunicadoAPRecebido("Infelizmente sua inscrição na competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" foi recusada.",up,0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Inscrição Recusada");
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
          response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Incrição negada com sucesso&color=success");
    }else if(opt == 3){
        ComunicadoAPRecebido comunicado = new ComunicadoAPRecebido("Infelizmente você foi expulso da competição "+icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+", sendo assim não há mais a necessidade de comparecer ao evento.",up,0,false,icms.getCompeticaoModalidadeSolo().getNomeCompeticao()+" - Expulsão");
        //comunicado.adicionarUsuarioParticipante(up);
        crc.salvar(comunicado);
        up2.adicionarMensagemRecebida(comunicado);
        up2c.atualizarCad(up2);
        icms.setInscricaoAceita('N');
        icmsc.alterar(icms);
        response.sendRedirect("../gerenciarCompeticaoModSolo.jsp?id="+idComp+"&msg=Competidor Expluso com sucesso&color=success");
    }

    
%>
