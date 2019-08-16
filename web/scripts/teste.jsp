<%-- 
    Document   : teste
    Created on : 12/08/2019, 15:03:35
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        CompeticaoModalidadeColetivaControle cmcControle = new CompeticaoModalidadeColetivaControle();
        int idCompeticao = Integer.parseInt(request.getParameter("id"));
        
        //System.out.println("Sessão aberta? "+ cmcControle.sessaoDAOGenericEstaAberta());
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = cmcControle.buscarPorId(idCompeticao);
        
        
        
        for(Confronto confronto : competicaoModalidadeColetiva.getConfrontos()){
            System.out.println("ID LOCAL (TESTE SCRIPT): "+ confronto.getLocal().getIdLocal());
            System.out.println("DATA CONFRONTO (TESTE SCRIPT)"+ confronto.getDataConfronto());       
        }
    %>
</html>
