<%-- 
    Document   : interfaceDoParticipante
    Created on : 12/10/2018, 10:55:20
    Author     : Usuário
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
        
    </head>
    <body>
        
        <%
           Object usuario = session.getAttribute("usuario");
           if (usuario == null) {
           response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
           } else if (usuario instanceof UsuarioParticipante2) {

           UsuarioParticipante2 up = (UsuarioParticipante2) usuario;
        
        %>
        
        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>
        
        <div class="container">
        
        
        
        <!-- Portfolio Section -->
            <h2>Competições que você participa: </h2>

            <div class="row">
           <%
            List<Atleta> atletas = up.getAtletas();
            List<Competicao> competicoes = new ArrayList<>();
            
            for(Atleta a: atletas){
                competicoes.add(a.getCompeticao());
            }
            
            
            for(Competicao competicao : competicoes){
           %>

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#"><%=competicao.getNome()%></a>
                            </h4>
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        </div>
                    </div>
                </div>
                <%}%>

            </div>
        </div>
        
    </body>
    
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
<%} else {
        response.sendRedirect("login.jsp?e=Pagina de acesso restrito");
    }
%>