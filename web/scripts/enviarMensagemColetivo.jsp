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
    List<Usuario> dest = new ArrayList<>();
    UsuarioParticipante2Controle uptc = new UsuarioParticipante2Controle();
    cmcc.fecharSessaoDAOGeneric();
    for (EquipeCompeticao eqc : cmc.getEquipesCompeticao()) {

        Usuario uadmc = (Usuario) session.getAttribute("usuario");
        ComunicadoRecebido cr = new ComunicadoRecebido(mensagem, 0, false, titulo, uadmc);
        crc.salvar(cr);
        crc.fecharSessaoDAOGeneric();
        UsuarioParticipante2 up2 = eqc.getEquipe().getAdministrador();
        dest.add(up2);
        up2.adicionarMensagemRecebida(cr);
        uptc.atualizarCad(up2);
        uptc.fecharSessaoDAOGeneric();
        ee.setAssunto(titulo);
        ee.setMsg(mensagem);
        ee.setEmailDestinatario(up2.getEmail());
        ee.enviarGmail();
    }
    ce.setUsuariosDestinatarios(dest);
    cec.salvar(ce);

    response.sendRedirect("../gerenciarCompModColetiva.jsp?id=" + idCompeticaoColetiva);


%>