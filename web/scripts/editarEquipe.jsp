<%-- 
    Document   : editarEquipe
    Created on : 07/10/2018, 10:30:24
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    request.setCharacterEncoding("UTF-8");
    int op = Integer.parseInt(request.getParameter("op"));
    EquipeControle eqpc = new EquipeControle();
    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
    UsuarioParticipante2 up2 = up2c.buscarPorId(Integer.parseInt(request.getParameter("idUsuario")));    
    String nome = request.getParameter("nome");
    ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
    int idModalidade = Integer.parseInt(request.getParameter("modalidade"));
    ModalidadeColetiva mc = mcc.buscaPorId(idModalidade);
    //Cria uma equipe
    if(op == 1){
        Equipe eq = new Equipe(0,nome,up2,mc,false);
        eqpc.criarEquipe(eq);
        up2.adicionarEquipe(eq);
        up2c.atualizarCad(up2);
        response.sendRedirect("../listaEquipes.jsp?msg=Equipe criada com sucesso&color=success");
    }
    
    
    
%>
