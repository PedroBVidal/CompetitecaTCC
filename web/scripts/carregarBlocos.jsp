<%-- 
    Document   : gerarBlocos
    Created on : 22/10/2019, 22:40:27
    Author     : Usuário
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        int idCompeticao = Integer.parseInt(request.getParameter("id"));
        int pag = Integer.parseInt(request.getParameter("pag"));
        int extensao = Integer.parseInt(request.getParameter("extensao"));
        String repescagem = request.getParameter("repescagem");
        
        
    
    
    %>
</html>
<meta charset="utf-8">
<h1>Hello</h1>
<form method="POST" name="formCarregarBlocos">
    <input type="hidden" name="id" value="<%=idCompeticao%>">
    <input type="hidden" name="pag" value="<%=pag%>">
    <input type="hidden" name="extensao" value="<%=extensao%>">
    <input type="hidden" name="repescagem" value="<%=repescagem%>">
</form>

<script>
    window.onload = enviarFormulario();
    function enviarFormulario() {
        document.forms["formCarregarBlocos"].action = "../gerenciarCompModColetiva.jsp";
        document.forms["formCarregarBlocos"].submit();
    }
</script>