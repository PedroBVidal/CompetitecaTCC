<%-- 
    Document   : formcadastrogerenciamento
    Created on : 23/10/2018, 17:14:12
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
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
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if (up == null) {
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
        %>

        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>
        <div class="container">
            <%
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("e") != null) {
                    String erro = request.getParameter("e");
                    
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong><%=erro%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
        <h1 class="text-center">Nova competição</h1>
        
        <div class="card" style="margin: 50px;">
            <div class="card-header">
                Cadastro de competição
            </div>
            <div class="card-body">
                <form action="cadastrarcompeticao.jsp?op=2">
                    <div class="form-group">
                        <label>Nome da competição:</label>
                        <input type="text" class="form-control" name="nomeCompeticao">
                    </div>
                    <div class="form-group">
                        <label>Data de início da competição:</label>
                        <input type="text" class="naozeibeu form-control" name="dataInicioCompeticao">
                    </div>
                    <div class="form-group">
                        <label> Data de término da competição:</label>
                        <input type="text" class="naozeibeu form-control" name="dataTerminoCompeticao">
                    </div>
                    <button type="submit" class="btn btn-primary">Cadastrar</button>
                </form>
            </div>
        </div>
        </div>
        
        <!-- Bootstrap core JavaScript -->
    
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
            $('.naozeibeu').mask('00/00/0000', {reverse: true});
        </script>
        <%
            
        }
        %>
    </body>

</html>
