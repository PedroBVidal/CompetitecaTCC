<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Usuario"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <script>
            function validatePassword() {
                var password = document.getElementById("password")
                        , confirm_password = document.getElementById("confirm_password");
                if (password.value !== confirm_password.value) {
                    confirm_password.setCustomValidity("As senhas não coincidem!");
                } else {
                    confirm_password.setCustomValidity('');
                }
            }</script>
        <script type="text/javascript" src="ajax/ajaxProcess.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Recuperando Senha</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">


        <header>
            <jsp:include page="navbarindex.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">


            <%
                request.setCharacterEncoding("UTF-8");
                int id = Integer.parseInt(request.getParameter("usr"));
                int tipo = Integer.parseInt(request.getParameter("opt"));
                UsuarioControle uc = new UsuarioControle();
                Usuario usr = uc.buscarPorId(id);
                if (tipo == 1) {
                    UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
                    UsuarioParticipante up = upc.buscarPorId(id);
                } else if (tipo == 2) {
                    UsuarioParticipante2Controle up2c = new UsuarioParticipante2Controle();
                    UsuarioParticipante2 up = new UsuarioParticipante2();
                }
                if (request.getParameter("msg") != null) {
                    String mensagem = request.getParameter("msg");
                    String cor = request.getParameter("color");
            %>
            <br>
            <div class="alert alert-<%=cor%> alert-dismissible fade show" role="alert">
                <strong><%=mensagem%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
            <br>
            <% if (usr instanceof UsuarioParticipante) {
                    UsuarioParticipante up = (UsuarioParticipante) usr;%>
            <h1 class="my-4 titulos">Olá <%=up.getNome()%></h1>
            <%} else {
                UsuarioParticipante2 up = (UsuarioParticipante2) usr;%>
            <h1 class="my-4 titulos">Olá <%=up.getNome()%></h1>
            <%}%>


            <!-- Marketing Icons Section -->
            <div class="row">
                <div id="mensagem"></div>
                <div class="col">
                    <div class="card h-100">
                        <h4 class="card-header titulos">Redefina sua senha</h4>
                        <div class="card-body">
                            <!--<form>--> 
                                <label for="" class="col-md-12">
                                    Nova senha:
                                    <input type="password" required class="form-control" id="password" name="senha" placeholder="Insira a sua senha">
                                    Confirme a nova senha:
                                    <input onkeyup="validatePassword();" type="password" required class="form-control" id="confirm_password" placeholder="Confirme a sua senha">
                                    <div class="invalid-feedback">

                                    </div>
                                </label>
                        </div>
                        <div class="card-footer">
                            <%if (tipo == 1) {%>
                            <button onclick="criaSenha(1,<%=usr.getIdUsuario()%>);" type="submit" class="btn btn-success">Salvar</button>
                            <%} else if (tipo == 2) {%>
                            <button onclick="criaSenha(2,<%=usr.getIdUsuario()%>);" type="submit" class="btn btn-success">Salvar</button>
                            <%}%>
                        </div>
                       <!-- </form>--> 
                    </div>
                    
                </div>


                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script>

                                        function mudarAction() {
                                            $("#frm").attr("action", "scripts/ctrlacessoParticipante.jsp");
                                        }

                </script>
                </body>

                </html>
