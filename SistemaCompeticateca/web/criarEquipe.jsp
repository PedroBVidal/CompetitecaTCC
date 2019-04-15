
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
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
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
        %>

        <!-- Navigation -->
        
        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <h1 class="my-4">Criar uma nova equipe</h1>


            <form action="scripts/editarEquipe.jsp" method="POST" class="col">
                <input type="hidden" name="op" value="1">
                <input type="hidden" name="idUsuario" value="<%=up.getIdUsuario()%>">

                <label for="" class="col-md-12">
                    Nome:
                    <input type="text" required class="form-control" name="nome" placeholder="Informe o nome da Equipe" >
                </label>
                <label for="" class="col-md-12">
                    Modalidade:
                    <select name="modalidade" class="form-control" >
                        <option value="">Selecione</option>

                        <%
                            ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
                            for(ModalidadeColetiva mc : mcc.buscarTodosModalidadeColetiva()){
                        %>
                        <option value="<%=mc.getIdModColetiva()%>"><%=mc.getNome()%></option>
                        <%}%>
                    </select>
                </label>
                    <input type="hidden" name="size" value="0">

                <button type="submit" class="btn btn-success">Salvar</button>


            </form> 
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
        }
        %>
    </body>

</html>

