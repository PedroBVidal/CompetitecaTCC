<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%
int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
System.out.println(idUsuario); 
int idCompeticao = Integer.parseInt(request.getParameter("idComp"));

if(request.getParameter("op").equals("1")){
    CompeticaoControle cc = new CompeticaoControle();
    Competicao comp = cc.buscarCompeticaoPorId(idCompeticao);
    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
    UsuarioParticipante up = upc.buscarPorId(idUsuario);
    comp.adicionarAdministrador(up);
    cc.autualizarCompeticao(comp);
    up.adicionarCompeticao(comp);
    upc.atualizarCad(up);
    
    response.sendRedirect("../gerenciamentoDeCompeticao.jsp?id="+idCompeticao+"&msg=Administrador adicionado com Sucesso&color=success");
}else if(request.getParameter("op").equals("2")){
    CompeticaoControle cc = new CompeticaoControle();
    Competicao comp = cc.buscarCompeticaoPorId(idCompeticao);
    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
    UsuarioParticipante up = upc.buscarPorId(idUsuario);
    up.removerCompeticao(comp);
    upc.atualizarCad(up);
    comp.removerAdministrador(up);
    cc.autualizarCompeticao(comp);
    response.sendRedirect("../gerenciamentoDeCompeticao.jsp?id="+idCompeticao+"&msg=Administrador removido com Sucesso&color=warning");
}
%>