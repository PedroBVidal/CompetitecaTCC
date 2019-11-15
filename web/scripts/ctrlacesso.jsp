<%-- 
    Document   : ctrlacesso
    Created on : 16/10/2018, 19:01:43
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");

    session = request.getSession();

    if (request.getParameter("c") != null) {
        session.setAttribute("usuario", null);
        response.sendRedirect("../index.jsp");

    } else {
        if (request.getParameter("tipo").equals("1")) {
            UsuarioParticipanteControle upc = new UsuarioParticipanteControle();

            try {
                UsuarioParticipante up = upc.buscarLogin(email, senha);
                upc.fecharSessaoDAOGeneric();
                if (up.getAtivo() == 1) {
                    session.setAttribute("usuario", up);
                    response.sendRedirect("../gerenciamento.jsp");
                } else {
                    response.sendRedirect("../login.jsp?msg=Ative o seu usuário primeiro! Verifique a sua caixa de email&color=danger");
                }

            } catch (Exception e) {
                session.setAttribute("usuario", null);
                response.sendRedirect("../login.jsp?msg=" + e.getMessage() + "&color=danger");
            }

            if (request.getParameter("c") != null) {
                int codigo = Integer.parseInt(request.getParameter("c"));

                if (codigo == 1) {
                    session.setAttribute("usuario", null);
                    //response.sendRedirect("../login.jsp?e=Sessão Finalizada com Sucesso");
                }
            }
        } else {
            UsuarioParticipante2Controle usuarioParticpanteControle = new UsuarioParticipante2Controle();

            try {
                UsuarioParticipante2 usuarioParticipante = usuarioParticpanteControle.buscarLogin(email, senha);
                usuarioParticpanteControle.fecharSessaoDAOGeneric();
                if (usuarioParticipante.getAtivo() == 1) {
                    session.setAttribute("usuario", usuarioParticipante);
                    response.sendRedirect("../interfaceDoParticipante.jsp");
                } else {
                    response.sendRedirect("../login.jsp?msg=Ative o seu usuário primeiro! Verifique a sua caixa de email&color=danger");

                }

            } catch (Exception e) {

                session.setAttribute("usuario", null);
                response.sendRedirect("../login.jsp?msg=" + e.getMessage() + "&color=danger");
            }

        }
    }


%>
