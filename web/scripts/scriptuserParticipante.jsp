<%-- 
    Document   : scriptuserParticipante
    Created on : 12/10/2018, 16:44:50
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Segmento"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SegmentoControle"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="java.util.Date"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = "";

    String cpf = request.getParameter("cpf");
    String sDataNascimento = request.getParameter("dataNascimento");
    int idSegmento = 0;
    String matricula = "";

    if (request.getParameter("segmento") != null) {
        idSegmento = Integer.parseInt(request.getParameter("segmento"));
        matricula = request.getParameter("matricula");
    } else {
        System.out.println("ID SEGMENTO: " + idSegmento);
    }

    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    Date dataNascimento = sdf.parse(sDataNascimento);

    int cmd = Integer.parseInt(request.getParameter("c"));
    if (cmd == 1) {
        senha = request.getParameter("senha");
    }

    UsuarioParticipante2Controle uspc = new UsuarioParticipante2Controle();
    AtletaControle atletaControle = new AtletaControle();
    SegmentoControle segmentoControle = new SegmentoControle();

    if (cmd == 2) {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));

        UsuarioParticipante2 usp = uspc.buscarPorId(idUsuario);

        usp.setEmail(email);
        usp.setNome(nome);

        Atleta atleta = usp.getAtleta();
        atleta.setCpf(cpf);
        atleta.setDataNascimento(dataNascimento);

        if (request.getParameter("segmento") != null) {
            usp.setMatricula(matricula);
            Segmento segmento = segmentoControle.buscarSegmentoPorId(idSegmento);
            atleta.setSegmento(segmento);
            System.out.println("Sessão aberta(Script) UsuarioParticipanteDAO: " + uspc.sessaoEstaAberta());
            System.out.println("Sessão aberta(Script) SegmentoDAO: " + segmentoControle.sessaoEstaAberta());
            segmentoControle.fecharSessao();
        } else {
            atleta.setSegmento(null);
        }
        //
        uspc.atualizarCad(usp);
        //
        /*
            System.out.println("Sessão aberta(Script) UsuarioParticipanteDAO(Generic): "+uspc.sessaoEstaAberta());
            System.out.println("Sessão aberta(Script) SegmentoDAO: "+segmentoControle.sessaoEstaAberta());
            System.out.println("Sessão aberta(Script) AtletaDAO(Generic): "+atletaControle.sessaoEstaAberta());
         */

        uspc.fecharSessaoDAOGeneric();
        /*
            System.out.println("Sessão aberta(Script) AtletaDAO(Generic): "+atletaControle.sessaoEstaAberta());
            System.out.println("Sessão aberta(Script) SegmentoDAO: "+segmentoControle.sessaoEstaAberta());
            System.out.println("Sessão aberta(Script) UsuarioParticipanteDAO(Generic): "+uspc.sessaoEstaAberta());
         */
        atletaControle.alterarAtleta(atleta);
        atletaControle.fecharSessaoDAOGeneric();

        //uspc.fecharSessaoDAOGeneric();

        session.setAttribute("usuario", null);
        response.sendRedirect("../login.jsp?msg=Dados alterados com sucesso! Para continuar, entre novamente&color=success");

    }
    if (cmd == 1) {

        try {
            UsuarioParticipante2 usuarioParticipante = new UsuarioParticipante2(0, email, nome, senha);
            Atleta atleta = new Atleta(0, dataNascimento, cpf);

            if (request.getParameter("segmento") != null) {
                Segmento segmento = segmentoControle.buscarSegmentoPorId(idSegmento);
                atleta.setSegmento(segmento);
                usuarioParticipante.setMatricula(matricula);
            }

            usuarioParticipante.setAtleta(atleta);
            atleta.setUsuarioParticipante(usuarioParticipante);

            atletaControle.criarAtleta(atleta);
            atletaControle.fecharSessaoDAOGeneric();
            uspc.criar(usuarioParticipante);
            uspc.fecharSessaoDAOGeneric();

            response.sendRedirect("../login.jsp?color=success&msg=Cadastro efetuado, agora entre com o tipo Participante");
        } catch (Exception e) {
            response.sendRedirect("../signup.jsp?p=2&color=danger&msg=" + e.getMessage());
        }
    }

%>
