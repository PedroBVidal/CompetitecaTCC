<%-- 
    Document   : gerarJogosCompeticaoModalidadeColetiva
    Created on : 02/08/2019, 08:21:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 

    int idCompeticaoModalidadeColetiva = Integer.parseInt(request.getParameter("idCompModColetiva"));
    
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idCompeticaoModalidadeColetiva);
    
    cmcc.fecharSessaoDAOGeneric();
    
    cmcc.gerarConfrontosSistemaTodosContraTodos(cmc);
    

    
%>
<meta charset="utf-8">

    <form method="POST" name="formEnviarIdCompeticaoColetivaAlterada">
        <input type="hidden" name="id" value="<%=cmc.getIdCompeticaoModalidade()%>">
    </form>

<script>
    window.onload = enviarFormulario();
    function enviarFormulario(){
            document.forms["formEnviarIdCompeticaoColetivaAlterada"].action = "../gerenciarCompModColetiva.jsp";
            document.forms["formEnviarIdCompeticaoColetivaAlterada"].submit();  
    }
</script>