<%-- 
    Document   : enviarMensagemColetivo
    Created on : 18/10/2019, 08:36:02
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.email.EnviarEmail"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoRecebidoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoRecebido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoEnviadoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoEnviado"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idCompeticaoColetiva = Integer.parseInt(request.getParameter("idCompeticaoColetiva"));
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idCompeticaoColetiva);

    ComunicadoEnviadoControle cec = new ComunicadoEnviadoControle();
    EnviarEmail ee = new EnviarEmail();
    String titulo = cmc.getNomeCompeticao() + " - ";
    titulo += request.getParameter("titulo");
    String mensagem = request.getParameter("mensagem");
    ComunicadoEnviado ce = new ComunicadoEnviado(titulo, 0, mensagem);
    ComunicadoRecebidoControle crc = new ComunicadoRecebidoControle();
    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
    List<Usuario> dest = new ArrayList<>();
    cmcc.fecharSessaoDAOGeneric();
    for (EquipeCompeticao eqc : cmc.getEquipesCompeticao()) {

        Usuario uadmc = (Usuario) session.getAttribute("usuario");
        ComunicadoRecebido cr = new ComunicadoRecebido(mensagem, 0, false, titulo, uadmc);
        crc.salvar(cr);
        //crc.fecharSessaoDAOGeneric();
        int  idUsuarioDest = eqc.getEquipe().getAdministrador().getIdUsuario();
        UsuarioParticipante2 usuarioParticipante2 =  usuarioParticipante2Controle.buscarPorId(idUsuarioDest);
        dest.add(usuarioParticipante2);
        usuarioParticipante2.adicionarMensagemRecebida(cr);
        usuarioParticipante2Controle.atualizarCad(usuarioParticipante2);
        usuarioParticipante2Controle.fecharSessaoDAOGeneric();
        ee.setAssunto(titulo);
        ee.setMsg(mensagem);
        ee.setEmailDestinatario(usuarioParticipante2.getEmail());
        ee.enviarGmail();
    }
    ce.setUsuariosDestinatarios(dest);
    cec.salvar(ce);
    cec.fecharSessaoDAOGeneric();
    response.sendRedirect("../gerenciarCompModColetiva.jsp?id=" + idCompeticaoColetiva);


%>