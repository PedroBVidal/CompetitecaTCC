<%-- 
    Document   : navbarUsuarioParticipante
    Created on : 12/10/2018, 15:25:23
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.MensagemRecebida"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


        
        
<%
                Object usuario =  session.getAttribute("usuario");
                    if (usuario == null) {
                        response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
                    } else if(usuario instanceof UsuarioParticipante2){
                        
                    
                    UsuarioParticipante2 upSession = (UsuarioParticipante2) usuario;
                    UsuarioParticipante2Controle upControle = new UsuarioParticipante2Controle();
                    UsuarioParticipante2 up = upControle.buscarPorId(upSession.getIdUsuario());
                    
%>
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-success fixed-top">
            <div class="container ">
                <a class="navbar-brand" href="index.jsp">Competiteca</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"> 
                            <a class="nav-link" href="correio.jsp?idUsuario=<%=up.getIdUsuario()%>">&nbsp;
                                <%
                                        int contadorMensagens = 0;
                                        for(MensagemRecebida mesgRecebida : up.getMensagensRecebidas()){
                                            if (mesgRecebida.isLido()) {
                                                    
                                            }
                                            else{
                                                contadorMensagens++;
                                            }
                                        }
               
                                %>
                                <%
                                    if(contadorMensagens != 0){
                                %>
                                <span class="badge badge-info">

                                    <%=contadorMensagens%>
                                </span>
                                <%}%>
                                <span class="sr-only">unread messages</span>Minhas mensagens
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listaEquipes.jsp"><i class="fas fa-users"></i>&nbsp;Minhas Equipes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="listaCompeticoes.jsp"><i class="fas fa-trophy"></i>&nbsp;Eventos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="meusEventos.jsp"><i class="far fa-clipboard"></i>&nbsp;Meus eventos</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Olá,&nbsp;<%=up.getNome()%>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownBlog">
                                <a class="dropdown-item" href="scripts/ctrlacesso.jsp?c=1">Sair</a>
                                <a class="dropdown-item" href="editaUsuarioParticipante.jsp?idUsuario=<%=up.getIdUsuario()%>&c=2">Editar Perfil</a>
                            </div>
                        </li>
                       
                    </ul>
                </div>
            </div>
        </nav>
                            
         <%} else   {
                    response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro.");
                    }
         %>
