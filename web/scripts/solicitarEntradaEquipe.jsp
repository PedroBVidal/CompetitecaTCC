<%-- 
    Document   : solicitarEntradaEquipe
    Created on : 19/05/2019, 23:26:49
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.MsgSolicitacaoEntradaRecebidaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.MsgSolicitacaoEntradaEnviadaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    UsuarioParticipante2Controle upControle = new UsuarioParticipante2Controle();
    EquipeControle equipeControle = new EquipeControle();
    MsgSolicitacaoEntradaEnviadaControle msgSolcitacaoEnviadaControle = new MsgSolicitacaoEntradaEnviadaControle();
    MsgSolicitacaoEntradaRecebidaControle msgSolicitacaoRecebidaControle = new MsgSolicitacaoEntradaRecebidaControle();
    
    int idAdmEquipe = Integer.parseInt(request.getParameter("idAdmEquipe"));
    int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
    int idUsuarioRemetente = Integer.parseInt(request.getParameter("idUsuarioRemetente"));
    
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    
    System.out.println(idAdmEquipe);
    System.out.println(idEquipe);
    System.out.println(idUsuarioRemetente);
    
    UsuarioParticipante2 userAdmEquipe = upControle.buscarPorId(idAdmEquipe);
    UsuarioParticipante2 userRemetente = upControle.buscarPorId(idUsuarioRemetente);
    Equipe equipe = equipeControle.buscarPorId(idEquipe);
    
    
    List<UsuarioParticipante2> destinatarios = new ArrayList<>();
    destinatarios.add(userAdmEquipe);
            
    SolicitacaoEntradaEquipeEnviada msgSolicitacaoEntradaEnviada = new SolicitacaoEntradaEquipeEnviada(false, "Olá, desejo participar de sua equipe", equipe, userRemetente, destinatarios, 0, "Solicitacao entrada");
    SolicitacaoEntradaEquipeRecebida msgSolicitacaoEntradaRecebida = new SolicitacaoEntradaEquipeRecebida(false, "Olá, desejo participar de sua equipe", equipe, userAdmEquipe, userRemetente, 0, false, "Solicitacao entrada");
    
    userAdmEquipe.adicionarMensagemRecebida(msgSolicitacaoEntradaRecebida);
    userRemetente.adicionarMensagemEnviada(msgSolicitacaoEntradaEnviada);
    
    msgSolcitacaoEnviadaControle.cadastrar(msgSolicitacaoEntradaEnviada);
    msgSolicitacaoRecebidaControle.cadastrar(msgSolicitacaoEntradaRecebida);
    upControle.atualizarCad(userAdmEquipe);
    upControle.atualizarCad(userRemetente);
    
    response.sendRedirect("../forminscricaocompeticao.jsp?idCompeticao="+idCompeticao+"&idAtleta="+userRemetente.getAtleta().getIdAtleta()+"&msg=Pedido de entrada em na equiepe nviada com sucesso&color=success");


%>