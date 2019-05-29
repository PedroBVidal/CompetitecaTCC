<%-- 
    Document   : mensagemMarkRead
    Created on : 22/05/2019, 15:32:52
    Author     : gustavo
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoAPRecebidoControle"%>

<%
UsuarioParticipante2 up2 = (UsuarioParticipante2) session.getAttribute("usuario");
int idMensagem = Integer.parseInt(request.getParameter("idMensagem"));
ComunicadoAPRecebidoControle caprc = new ComunicadoAPRecebidoControle();
ComunicadoAPRecebido capr = caprc.buscarPorId(idMensagem);
capr.setLido(true);
caprc.alterar(capr);
response.sendRedirect("../correio.jsp?idUsuario="+up2.getIdUsuario());

%>