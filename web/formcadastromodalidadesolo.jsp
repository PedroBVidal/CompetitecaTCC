<%-- 
    Document   : formcadastromodalidadesolo
    Created on : 27/10/2018, 21:12:52
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
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
            if(up == null){
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
        %>

        <!-- Navigation -->


        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">Cadastrar nova modalidade solo


            </h1><br>



            <!-- Content Row -->
            <div class="row">
                
                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
                    <%
                request.setCharacterEncoding("UTF-8");
            if(request.getParameter("msg") != null){
                String mensagem = request.getParameter("msg");
                String cor = request.getParameter("color");
                    %>
                    <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                        <strong><%=mensagem%></strong> .
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <%
                    }
                    %>
                    <form action="scripts/editarModalidadeS.jsp" method="POST" class="col">
                        <input type="hidden" name="op" value="1">
                        <input type="hidden" name="id" value="0">
                        

                        <div class="form-group">
                            <label>Nome da modalidade:</label>
                            <input type="text" class="form-control" name="nomeModalidade">
                        </div>
                        <button type="submit" class="btn btn-success">
                            <!-- Adicionar icone -->
                            <i class="fas fa-plus"></i>&nbsp;Cadastrar
                        </button>
                    </form>
                </div>
            </div>
            <!-- /.row -->

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
