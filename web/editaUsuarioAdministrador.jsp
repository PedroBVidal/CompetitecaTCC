
<%@page import="java.text.SimpleDateFormat"%>
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

        <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">
        <%
            Object usuario = session.getAttribute("usuario");
            if (usuario == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else if (usuario instanceof UsuarioParticipante) {

                UsuarioParticipante usuarioADM = (UsuarioParticipante) usuario;
        %>



        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <br>
            <h1 class="my-4 titulos">Editar Usuário</h1>

            <div class="card">
                <h5 class="card-header">Cadastro</h5>
                <div class="card-body">
                    <form action="scripts/scriptuserAdministrador.jsp" method="POST" class="col">
                        <input type="hidden" name="c" value="2">
                        <input type="hidden" name="id" value="<%=usuarioADM.getIdUsuario()%>">

                        <label for="" class="col-md-12">
                            Nome:
                            <input type="text" required class="form-control" name="nome" placeholder="Informe seu nome" value="<%=usuarioADM.getNome()%>">
                        </label>
                        <label for="" class="col-md-12">
                            Email:
                            <input type="email" required class="form-control" name="email" placeholder="Insira seu email" value="<%=usuarioADM.getEmail()%>">
                        </label>
                        <label for="" class="col-md-12">
                            <%SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String data = sdf.format(usuarioADM.getDataNascimento());
                            %>
                            Data de nascimento:
                            <input type="text" required class="dataMask form-control" name="dataNascimento" placeholder="Insira sua data de nascimento" value="<%=data%>">
                        </label>
                        <label for="" class="col-md-12">
                            CPF:
                            <input type="text" required class="cpfMask form-control" name="cpf" placeholder="Insira seu CPF" value="<%=usuarioADM.getCpf()%>" >
                        </label>
                        <label for="" class="col-md-12">
                            Senha:<br>
                            <a href="recuperarSenha.jsp?opt=1&usr=<%=usuarioADM.getIdUsuario()%>" class="btn btn-primary">Alterar senha</a>
                        </label>
                        <label for="" class="col-md-12">
                            <input type="checkbox" value="1" id="radioSegmento_b" <%if (usuarioADM.getMatricula() != null) {%>checked<%}%> onclick="adicionarInserirSIAPE();">
                            Trabalho no IFPR - Campus Irati
                        </label>

                        <div class="col-md-12" id="segmento_b">
                            <%if (usuarioADM.getMatricula() != null) {%>
                            <label for="" class="col-md-12">SIAPE:<input type="text" required class="siapeMasc form-control" name="siape" maxlength="7" placeholder="Insira o sua matrícula SIAPE" value="<%=usuarioADM.getMatricula()%>"></label><br>
                                <%}
                                %>

                        </div>

                        <button type="submit" class="btn btn-success">Alterar</button>


                    </form>

                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
                                $('.dataMask').mask('00/00/0000', {reverse: true});
                                $('.cpfMask').mask('000.000.000-00', {reverse: true});
                                $('.matriculaMasc').mask('00000000000', {reverse: true});
                                $('.siapeMasc').mask('0000000', {reverse: true});
                                function adicionarInserirSIAPE() {
                                    if (radioSegmento_b.checked === true) {
                                        var div = document.getElementById("segmento_b");
                                        div.innerHTML = '<label for="" class="col-md-12">SIAPE:<input type="text" required class="siapeMasc form-control" name="siape" maxlength="7" placeholder="Insira o sua matrícula SIAPE"<%if (usuarioADM.getMatricula() != null) {%>value = "<%=usuarioADM.getMatricula()%>"<%}%> ></label><br>';
                                    }
                                    if (radioSegmento_b.checked === false) {
                                        var div = document.getElementById("segmento_b");
                                        div.innerHTML = '';
                                    }
                                }
                                function declaracao(id, radio) {
                                    var radio = document.getElementById(radio);
                                    if (radio.checked === true) {
                                        var div = document.getElementById(id);
                                        div.className = "btn btn-success";
                                        div.disabled = false;
                                    }
                                    if (radio.checked === false) {
                                        var div = document.getElementById(id);
                                        div.className = "btn btn-success disabled";
                                        div.disabled = true;
                                    }
                                }
                                $('.dataMask').mask('00/00/0000', {reverse: true});
                                $('.cpfMask').mask('000.000.000-00', {reverse: true});
                                $('.matriculaMasc').mask('00000000000', {reverse: true});
                                $('.siapeMasc').mask('0000000', {reverse: true});


        </script>
        <%
            } else {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }
        %>
    </body>

</html>

