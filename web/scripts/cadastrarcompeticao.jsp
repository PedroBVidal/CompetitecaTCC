<%-- 
    Document   : cadastrarcompeticao
    Created on : 23/10/2018, 17:39:55
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    CompeticaoControle competicaoControle = new CompeticaoControle();
    
    if(request.getParameter("op").equals("1")){
        
        int id = Integer.parseInt(request.getParameter("idCompeticao"));
        
        Competicao competicao = competicaoControle.buscarCompeticaoPorId(id);
        
        competicao.setInativo(true);
        
        competicaoControle.autualizarCompeticao(competicao);
        response.sendRedirect("../competicoes.jsp?msg=Competicao apagada com sucesso&color=success");

        
    }else if(request.getParameter("op").equals("2")){
    String nomeCompeticao = request.getParameter("nomeCompeticao");
    String sDataInicioCompeticao = request.getParameter("dataInicioCompeticao");
    String sDataTerminoCompeticao = request.getParameter("dataTerminoCompeticao");
    
    /*System.out.println(nomeCompeticao);
    System.out.println(sDataInicioCompeticao);
    System.out.println(sDataTerminoCompeticao);
    */
    
    
    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
    UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
    Date dataInicioCompeticao, dataTerminoCompeticao;
    
    dataInicioCompeticao = sdf.parse(sDataInicioCompeticao);
    dataTerminoCompeticao = sdf.parse(sDataTerminoCompeticao);
    
    String msgErro = "As datas de início e termino da competição infromadas não conferem";
    // COMPARA SE A DATA DE INICIO VEM ANTES DA DATA DE TERMINO
    if (dataInicioCompeticao.before(dataTerminoCompeticao)) {
                Competicao competicao = new Competicao(0, nomeCompeticao,dataInicioCompeticao,dataTerminoCompeticao);
                competicao.adicionarAdministrador(up);
                competicaoControle.cadastrarCompeticao(competicao);
                up.adicionarCompeticao(competicao);
                upc.atualizarCad(up);
                response.sendRedirect("../competicoes.jsp?msg=Competicao criada com sucesso&color=success");
        }
    else{
        response.setCharacterEncoding("UTF-8");
        response.sendRedirect("../criarcompeticao.jsp?msg="+msgErro+"&color=danger");
        
    }
    }
    
    

%>
