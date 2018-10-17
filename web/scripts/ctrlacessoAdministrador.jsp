<%-- 
    Document   : ctrlacesso
    Created on : 05/10/2018, 09:15:11
    Author     : Aluno
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%
    request.setCharacterEncoding("UTF-8");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    session = request.getSession();
    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
    

    try{
        UsuarioParticipante up = upc.buscarLogin(email,senha);
        session.setAttribute("usuario",up);
        response.sendRedirect("../gerenciamento.jsp");
    }catch(Exception e){
        
                if (request.getParameter("c") == null) {
                        session.setAttribute("usuario", null);
                        response.sendRedirect("../login.jsp?e=" + e.getMessage());
                    } else {
                        int codigo = Integer.parseInt(request.getParameter("c"));
                        if (codigo == 1) {
                            session.setAttribute("usuario", null);
                            response.sendRedirect("../login.jsp?e=Saiu de sua conta.");
                        }
                    }
    }
    

    
    
    

%>

