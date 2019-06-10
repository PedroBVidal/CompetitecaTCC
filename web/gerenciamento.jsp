
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>

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
            if(usuario == null){
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else if(usuario instanceof UsuarioParticipante){
                
            UsuarioParticipante usuarioADM = (UsuarioParticipante) usuario;
        %>



        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <h1 class="my-4">Painel de Controle</h1>

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col">
                    <div class="card h-100">
                        <h4 class="card-header">Entre</h4>
                        <div class="card-body">
                            <form action="scripts/ctrlacessoAdministrador.jsp" method="POST" class="col">

                                <label for="" class="col-md-12">
                                    E-mail:
                                    <input type="email" required class="form-control" name="email" placeholder="Informe seu e-mail">
                                </label>
                                <label for="" class="col-md-12">
                                    Senha:
                                    <input type="password" required class="form-control" name="senha" placeholder="Insira sua senha">
                                </label>

                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-success">Logar</button>

                        </div>
                        </form> 
                    </div>
                </div>


                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<%
} else {
    response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
}
%>
                </body>

                </html>

