<%-- 
    Document   : mensagemMarkRead
    Created on : 22/05/2019, 15:32:52
    Author     : gustavo
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ComunicadoRecebido"%>
<%@page import="br.edu.ifpr.irati.ti.controle.mensagens.ComunicadoRecebidoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>

<%
UsuarioParticipante2 up2 = (UsuarioParticipante2) session.getAttribute("usuario");
int idMensagem = Integer.parseInt(request.getParameter("idMensagem"));
ComunicadoRecebidoControle comunicadoRecebControle = new ComunicadoRecebidoControle();
ComunicadoRecebido comunicadoRecebido = comunicadoRecebControle.buscarPorId(idMensagem);
comunicadoRecebido.setLido(true);
comunicadoRecebControle.alterar(comunicadoRecebido);
response.sendRedirect("../correio.jsp?idUsuario="+up2.getIdUsuario());

%>