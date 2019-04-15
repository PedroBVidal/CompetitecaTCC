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
        String senha = request.getParameter("senha");
        String cpf = request.getParameter("cpf");
        String sDataNascimento = request.getParameter("dataNascimento");
        int idSegmento = Integer.parseInt(request.getParameter("segmento"));

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Date dataNascimento = sdf.parse(sDataNascimento);

        int cmd = Integer.parseInt(request.getParameter("c"));
        int id = Integer.parseInt(request.getParameter("id"));
        
        UsuarioParticipante2Controle uspc = new UsuarioParticipante2Controle();
        AtletaControle atletaControle = new AtletaControle();
        SegmentoControle segmentoControle = new SegmentoControle();
        


        if (cmd == 2) {
            UsuarioParticipante2 usp = uspc.buscarPorId(id);
            uspc.atualizarCad(usp);
            usp = uspc.buscarLogin(email, senha);
            session.setAttribute("usuario", usp);
            response.sendRedirect("../interfaceDoParticipante.jsp");

        }
        if (cmd == 1) {
            
            
            UsuarioParticipante2 usuarioParticipante = new UsuarioParticipante2(0, email, nome, senha);
            Atleta atleta = new Atleta(0, dataNascimento, cpf);
            Segmento segmento = segmentoControle.buscarSegmentoPorId(id);
            
            atleta.setSegmento(segmento);
            usuarioParticipante.setAtleta(atleta);
            atleta.setUsuarioParticipante(usuarioParticipante);
            
            atletaControle.criarAtleta(atleta);
            uspc.criar(usuarioParticipante);

            response.sendRedirect("../login.jsp?e=Cadastro efetuado, agora entre com o tipo Participante");
        }

%>
