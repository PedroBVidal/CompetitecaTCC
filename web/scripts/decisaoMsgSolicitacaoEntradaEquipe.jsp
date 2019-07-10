<%-- 
    Document   : decisaoMsgSolicitacao
    Created on : 28/05/2019, 12:01:01
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.MsgSolicitacaoEntradaRecebidaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.MsgSolicitacaoEntradaEnviadaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int idMensagemRecebida = Integer.parseInt(request.getParameter("idMensagemRecebida"));
    int op = Integer.parseInt(request.getParameter("op"));
    UsuarioParticipante2 upSession = (UsuarioParticipante2) session.getAttribute("usuario");
    
    MsgSolicitacaoEntradaEnviadaControle msgSolicEntEnvControle = new MsgSolicitacaoEntradaEnviadaControle();
    MsgSolicitacaoEntradaRecebidaControle msgSolicEntRecebControle = new MsgSolicitacaoEntradaRecebidaControle();
    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
    EquipeControle equipeControle = new EquipeControle();
    
    UsuarioParticipante2 up = usuarioParticipante2Controle.buscarPorId(upSession.getIdUsuario());
    usuarioParticipante2Controle.fecharSessaoDAOGeneric();
    
    SolicitacaoEntradaEquipeRecebida solicitacaoEntradaEquipeRecebida = msgSolicEntRecebControle.buscarPorId(idMensagemRecebida);
    msgSolicEntRecebControle.fecharSessaoDAOEspecifico();
    
    SolicitacaoEntradaEquipeEnviada solicitacaoEntradaEquipeEnviada = solicitacaoEntradaEquipeRecebida.getSolicitacaoEntradaEquipeEnviada();

    if(op == 1){
        solicitacaoEntradaEquipeRecebida.setLido(true);
        solicitacaoEntradaEquipeRecebida.setEstadoSolicitacao('A');
        
        solicitacaoEntradaEquipeEnviada.setEstadoSolicitacao('A');
        
        // Adiciona o atleta vinculado ao usuário remetente na equipe do usuário destinatário
        int cont = 0;
        boolean flag = false;
        
        UsuarioParticipante2 usuarioRemetente = (UsuarioParticipante2) solicitacaoEntradaEquipeRecebida.getRemetente();
        
        
        Equipe equipe = equipeControle.buscarPorId(solicitacaoEntradaEquipeRecebida.getEquipe().getIdEquipe());
        equipe.adicionarAtleta(usuarioRemetente.getAtleta());
        
        equipeControle.fecharSessaoDAOEspecifico();
        equipeControle.alterarEquipe(equipe);
        equipeControle.fecharSessaoDAOGeneric();
        
        msgSolicEntEnvControle.alterar(solicitacaoEntradaEquipeEnviada);
        msgSolicEntEnvControle.fecharSessaoDAOGeneric();
        msgSolicEntRecebControle.alterar(solicitacaoEntradaEquipeRecebida);
        msgSolicEntRecebControle.fecharSessaoDAOGeneric();
    }
    
    if(op == 2){
        solicitacaoEntradaEquipeRecebida.setLido(true);
        solicitacaoEntradaEquipeRecebida.setEstadoSolicitacao('N');
        
        solicitacaoEntradaEquipeEnviada.setEstadoSolicitacao('N');
        
        msgSolicEntEnvControle.alterar(solicitacaoEntradaEquipeEnviada);
        msgSolicEntRecebControle.alterar(solicitacaoEntradaEquipeRecebida);
    }
    
    response.sendRedirect("../correio.jsp?idUsuario="+up.getIdUsuario());


%>