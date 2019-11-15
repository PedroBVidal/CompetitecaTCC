<%-- 
    Document   : scriptuser
    Created on : 06/10/2018, 20:40:39
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = "";
    if (request.getParameter("senha") != null) {
        senha = request.getParameter("senha");
    }

    String dataNasc = request.getParameter("dataNascimento");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date nascimento = sdf.parse(dataNasc);
    String cpf = request.getParameter("cpf");
    int cmd = Integer.parseInt(request.getParameter("c"));
    int id = Integer.parseInt(request.getParameter("id"));

    if (cmd == 2) {

        UsuarioParticipanteControle uspc = new UsuarioParticipanteControle();
        UsuarioParticipante usuarioParticipante = uspc.buscarPorId(id);
        uspc.fecharSessaoDAOEspecifico();

        usuarioParticipante.setNome(nome);
        usuarioParticipante.setEmail(email);
        usuarioParticipante.setCpf(cpf);
        usuarioParticipante.setDataNascimento(nascimento);

        if (usuarioParticipante.getMatricula() != null || request.getParameter("siape") != null) {
            usuarioParticipante.setMatricula(request.getParameter("siape"));
        }
        uspc.atualizarCad(usuarioParticipante);
        //usuarioParticipante = uspc.buscarLogin(email, senha);
        session.setAttribute("usuario", null);
        response.sendRedirect("../login.jsp?msg=Dados alterados com sucesso! Para continuar, entre novamente&color=success");

    }
    if (cmd == 1) {
        try {
            UsuarioParticipante usp = new UsuarioParticipante(id, nome, nascimento, cpf, email, senha);
            if (request.getParameter("siape") != null) {
                usp.setMatricula(request.getParameter("siape"));
            }
            UsuarioParticipanteControle uspc = new UsuarioParticipanteControle();
            uspc.criar(usp);
            uspc.fecharSessaoDAOGeneric();
            response.sendRedirect("../login.jsp?color=success&msg=Cadastro efetuado, agora entre com o tipo Administrador");
        } catch (Exception e) {
            response.sendRedirect("../signup.jsp?p=3&color=danger&msg=" + e.getMessage());
        }
    }
%>
