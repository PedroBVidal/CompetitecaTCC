<%-- 
    Document   : salvarNovaSenha
    Created on : 21/10/2019, 22:42:33
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int idUsuario = Integer.parseInt(request.getParameter("id"));
    int tipo = Integer.parseInt(request.getParameter("opt"));
    String senha = request.getParameter("senha");

    if (tipo == 1) {
        UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
        UsuarioParticipante up = upc.buscarPorId(idUsuario);
        upc.fecharSessaoDAOGeneric();
        up.setSenha(senha);
        upc.atualizarCad(up);
        upc.fecharSessaoDAOGeneric();
        out.print("Logue-se");
        //response.sendRedirect("../login.jsp?msg=Recuperação Realizada com sucesso!, agora acesse com a sua nova senha!&color=success");
    } else if (tipo == 2) {
        UsuarioParticipante2Controle upc = new UsuarioParticipante2Controle();
        UsuarioParticipante2 up = upc.buscarPorId(idUsuario);
        up.setSenha(senha);
        upc.atualizarCad(up);
        upc.fecharSessaoDAOGeneric();
        //response.sendRedirect("../login.jsp?msg=Recuperação Realizada com sucesso!, agora acesse com a sua nova senha!&color=success");
    }

%>
