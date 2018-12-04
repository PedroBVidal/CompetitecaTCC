<%-- 
    Document   : editarLocal
    Created on : 06/10/2018, 23:36:20
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String nome = request.getParameter("nome");
    
    String endereco = request.getParameter("endereco");
    String cidade = request.getParameter("cidade");
    int id = Integer.parseInt(request.getParameter("id"));
    int op = Integer.parseInt(request.getParameter("op"));
    Local local = new Local(id,nome,endereco,cidade);
    if(op == 1){
        LocalControle lc = new LocalControle();
        try{
        lc.alterarLocal(local);
        response.sendRedirect("../local.jsp?msg=Local alterado com sucesso&color=success");
        }catch(Exception e){
        response.sendRedirect("../local.jsp?msg=Houve um erro ao alterar&color=danger");    
        }
        
    }
    if(op == 2){
        LocalControle lc = new LocalControle();
        Local loc = lc.buscaPorId(id);
        try{
        lc.droparLocal(loc);
        response.sendRedirect("../local.jsp?msg=Local Excluido com sucesso&color=warning");
        }catch(Exception e){
        response.sendRedirect("../local.jsp?msg=Houve um erro ao excluir&color=danger");    
        }
    }
    if(op == 3){
        LocalControle lc = new LocalControle();
        try{
        lc.salvaLocal(local);
        response.sendRedirect("../local.jsp?msg=Local criado com sucesso&color=success");
        }catch(Exception e){
        response.sendRedirect("../local.jsp?msg=Houve um erro ao criar um local&color=danger");    
        }
    }

%>