<%-- 
    Document   : enviarMensagemColetivo
    Created on : 18/10/2019, 08:36:02
    Author     : olive
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
int idCompeticaoColetiva = Integer.parseInt(request.getParameter("idCompeticaoColetiva"));
CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idCompeticaoColetiva);

for (EquipeCompeticao eqc : cmc.getEquipesCompeticao()) {
        UsuarioParticipante2 up2 = eqc.getEquipe().getAdministrador();
        
    }

%>