<%-- 
    Document   : editarModalidadeS
    Created on : 07/10/2018, 21:48:18
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeSoloControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");
String nome = request.getParameter("nome");
int id = Integer.parseInt(request.getParameter("id"));
int op = Integer.parseInt(request.getParameter("op"));
ModalidadeSoloControle mcc = new ModalidadeSoloControle();
ModalidadeSolo mc = new ModalidadeSolo(id,nome);
if(op == 1){
    try{
        mcc.salvaModalidadeSolo(mc);
        response.sendRedirect("../criarModalidadeS.jsp?msg=Modalidade Criada com sucesso&color=success");
    }catch(Exception e){
        response.sendRedirect("../criarModalidadeS.jsp?msg=Houve um erro ao criar a Modalidade&color=danger");
        
    }
}

%>
