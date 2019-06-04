<%-- 
    Document   : decisaoMsgSolicitacao
    Created on : 28/05/2019, 12:01:01
    Author     : Usuário
--%>

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
    
    UsuarioParticipante2 up = usuarioParticipante2Controle.buscarPorId(upSession.getIdUsuario());
    SolicitacaoEntradaEquipeRecebida solicitacaoEntradaEquipeRecebida = msgSolicEntRecebControle.buscarPorId(idMensagemRecebida);
    SolicitacaoEntradaEquipeEnviada solicitacaoEntradaEquipeEnviada = solicitacaoEntradaEquipeRecebida.getSolicitacaoEntradaEquipeEnviada();

    if(op == 1){
        solicitacaoEntradaEquipeRecebida.setLido(true);
        solicitacaoEntradaEquipeRecebida.setEstadoSolicitacao('A');
        
        solicitacaoEntradaEquipeEnviada.setEstadoSolicitacao('A');
        
        // Adiciona o atleta vinculado ao usuário remetente na equipe do usuário destinatário
        int cont = 0;
        boolean flag = false;
        for(Equipe e : up.getEquipe()){
            
            if(e.getIdEquipe() == solicitacaoEntradaEquipeRecebida.getEquipe().getIdEquipe()){
                
                for(Atleta a: e.getAtletas()){
                    if(a.getIdAtleta() == up.getAtleta().getIdAtleta()){
                        flag = true;
                    }
                }
                if(flag != true){
                up.getEquipe().get(cont).adicionarAtleta(solicitacaoEntradaEquipeRecebida.getRemetente().getAtleta());
                }
                break;
            }
            else{
                cont++;
            }
        }
        usuarioParticipante2Controle.atualizarCad(up);
        msgSolicEntEnvControle.alterar(solicitacaoEntradaEquipeEnviada);
        msgSolicEntRecebControle.alterar(solicitacaoEntradaEquipeRecebida);
        
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