<%-- 
    Document   : cadastrarcompeticao
    Created on : 23/10/2018, 17:39:55
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    
    
    String nomeCompeticao = request.getParameter("nomeCompeticao");
    String sDataInicioCompeticao = request.getParameter("dataInicioCompeticao");
    String sDataTerminoCompeticao = request.getParameter("dataTerminoCompeticao");
    
    /*System.out.println(nomeCompeticao);
    System.out.println(sDataInicioCompeticao);
    System.out.println(sDataTerminoCompeticao);
    */
    
    CompeticaoControle competicaoControle = new CompeticaoControle();
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    Date dataInicioCompeticao, dataTerminoCompeticao;
    
    dataInicioCompeticao = sdf.parse(sDataInicioCompeticao);
    dataTerminoCompeticao = sdf.parse(sDataTerminoCompeticao);
    
    String msgErro = "Verifique as datas";
    String msgSucesso = "Competição criada com sucesso";
    // COMPARA SE A DATA DE INICIO VEM ANTES DA DATA DE TERMINO
    if (dataInicioCompeticao.before(dataTerminoCompeticao)) {
                Competicao competicao = new Competicao(0, nomeCompeticao,dataInicioCompeticao,dataTerminoCompeticao);
                competicaoControle.cadastrarCompeticao(competicao);
                response.sendRedirect("competicoes.jsp?e="+ msgSucesso);
        }
    else{
        response.setCharacterEncoding("UTF-8");
        response.sendRedirect("formcadastrocompeticao.jsp?e="+msgErro);
        
        }
    
            
    
    

%>
