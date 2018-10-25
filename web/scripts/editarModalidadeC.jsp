<%-- 
    Document   : editarModalidadeC
    Created on : 07/10/2018, 10:16:36
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String nome = request.getParameter("nome");
int id = Integer.parseInt(request.getParameter("id"));
int op = Integer.parseInt(request.getParameter("op"));
ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
ModalidadeColetiva mc = new ModalidadeColetiva(id,nome);
if(op == 1){
    try{
        mcc.salvaModalidadeColetiva(mc);
        response.sendRedirect("../criarModalidadeC.jsp?msg=Modalidade Criada com sucesso&color=success");
    }catch(Exception e){
        response.sendRedirect("../criarModalidadeC.jsp?msg=Houve um erro ao criar a Modalidade&color=danger");
        
    }
}

%>
