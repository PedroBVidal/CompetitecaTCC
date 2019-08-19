<%-- 
    Document   : editarConfrontoColetivo
    Created on : 10/08/2019, 00:13:32
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
     int idConfrontoColetivo = Integer.parseInt(request.getParameter("idConfronto"));
     int op = Integer.parseInt(request.getParameter("op"));
     int idLocal = Integer.parseInt(request.getParameter("localJogo"+idConfrontoColetivo));
     String sDataJogo = request.getParameter("dataJogo"+idConfrontoColetivo);
     String sHoraInicio = request.getParameter("horaInicioJogo"+idConfrontoColetivo);
     String sHoraTermino = request.getParameter("horaTerminoJogo"+idConfrontoColetivo);
     
     LocalControle localControle = new LocalControle();
     ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
     CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
     
     SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
     SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
     
     Date dataJogo = sdfData.parse(sDataJogo);
     Date horaInicio = sdfHora.parse(sHoraInicio);
     Date horaTermino = sdfHora.parse(sHoraTermino);
     
     //CompeticaoModalidadeColetiva competicaoModalidade = (CompeticaoModalidadeColetiva) competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
     Local local = localControle.buscaPorId(idLocal);
     localControle.fecharSessaoDAOGeneric();
     
     ConfrontoModalidadeColetiva confmc = confrontoModalidadeColetivaControle.buscarPorId(idConfrontoColetivo);
     
     confmc.setHoraInicio(horaInicio);
     confmc.setHoraTermino(horaTermino);
     confmc.setDataConfronto(dataJogo);
     confmc.setLocal(local);
     
     confrontoModalidadeColetivaControle.alterar(confmc);
     //competicaoModalidadeColetivaControle.alterar(competicaoModalidade);
     // Fecha as sessões abertas durante a transação;

     confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
     //competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
%>

<meta charset="utf-8">

    <form method="POST" name="formAlterarDadosJogo">
        <input type="hidden" name="id" value="<%=idCompeticao%>">
    </form>

<script>
    window.onload = enviarFormulario();
    function enviarFormulario(){
            document.forms["formAlterarDadosJogo"].action = "../gerenciarCompModColetiva.jsp";
            document.forms["formAlterarDadosJogo"].submit();  
    }
</script>