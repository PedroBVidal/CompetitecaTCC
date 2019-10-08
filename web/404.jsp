<%-- 
    Document   : 404
    Created on : 08/10/2019, 07:38:34
    Author     : olive
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="shortcut icon" href="img/favicon.ico">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Competiteca - 404</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body>

        <jsp:include page="navbarindex.jsp" flush="true" />

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">404
                <small>Página não encontrada</small>
            </h1>


            <div class="jumbotron">
                <h1 class="display-1">404</h1>
                <p>A página que você procura não existe; para continuar em nosso site, tome uma das decisões listadas abaixo:</p>
                <ul>
                    <li>
                        <a href="login.jsp">Quero ingressar em minha conta</a>
                    </li>
                    <li>
                        <a href="index.jsp">Quero ir para a Home</a>
                    </li>
                    <li>
                        <a href="signup.jsp?p=1">Quero me cadastrar</a>
                    </li>
                </ul>
            </div>
            <!-- /.jumbotron -->

        </div>
        <!-- /.container -->

        

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
