<%-- 
    Document   : scriptuserParticipante
    Created on : 12/10/2018, 16:44:50
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.email.EnviarEmail"%>
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
    EnviarEmail ee = new EnviarEmail();
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
            usuarioParticipante = uspc.buscarLogin(email, senha);
            uspc.fecharSessaoDAOGeneric();
            ee.setAssunto("Competiteca - Ativação de Cadastro");
            ee.setEmailDestinatario(email);
            String msg = "Olá " + nome + ", seja bem-vindo ao Competiteca, sua biblioteca de competições!<br>";
            msg += "Aqui você poderá: <ul><li>Criar e gerenciar eventos esportivos</li> <li>Criar e gerenciar competições de Basquete, Tênis de Mesa, Vôlei, Futsal, Futebol e Handebol</li><li>Criar competições privadas</li><li>Possibilidade de acompanhamento público das competições</li></ul><br>";
            msg += "Tudo isso e muito mais você só encontra aqui, no Competiteca!<br>";
            msg += "Para ativar o seu cadastro e começar esta experiência incrível, <a href='http://localhost:8084/Competiteca/scripts/confirmUser.jsp?id=" + usuarioParticipante.getIdUsuario() + "'>clique aqui</a>; ao logar, utilize o tipo <b>Participante</b>";
            msg += "<br><br> Agradecemos a sua Preferência!<br> Competiteca Team";
            ee.setMsg(msg);
            ee.enviarGmail();
            response.sendRedirect("../login.jsp?color=success&msg=Para efetuar seu cadastro, ative-o através do link enviado ao email " + email);
        } catch (Exception e) {
            response.sendRedirect("../signup.jsp?p=2&color=danger&msg=" + e.getMessage());
        }
    }

%>
