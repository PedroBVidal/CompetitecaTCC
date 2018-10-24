<%-- 
    Document   : navbarUsuarioAdministrador
    Created on : 12/10/2018, 16:27:35
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                Object usuario =  session.getAttribute("usuario");
                    if (usuario == null) {
                        response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
                    } else if(usuario instanceof UsuarioParticipante){
                        
                    
                    UsuarioParticipante usuarioADM = (UsuarioParticipante) usuario; 
                    
%>

        <!-- Navigation -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-success fixed-top">
            <div class="container ">
                <a class="navbar-brand" href="index.jsp">Competiteca</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="services.html"><i class="fas fa-trophy"></i>&nbsp;Competições</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-clipboard-list"></i>&nbsp;Gerenciar
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
                                <a class="dropdown-item" href="competicoes.jsp">Competições</a>
                                <a class="dropdown-item" href="atleta.jsp">Atletas</a>
                                <a class="dropdown-item" href="equipes.jsp">Equipes</a>
                                <a class="dropdown-item" href="local.jsp">Locais</a>
                                <a class="dropdown-item" href="portfolio-item.html"></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Olá,&nbsp;<%=usuarioADM.getNome()%>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="scripts/ctrlacesso.jsp?c=1">Sair</a>
                                <a class="dropdown-item" href="editaUsuarioAdministrador.jsp?c=<%=usuarioADM.getIdUsuario()%>">Editar Perfil</a>
                            </div>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>
                            
         <%} else {
                    response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro.");
                    }
         %>
