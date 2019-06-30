<%-- 
    Document   : formcadastromodalidadesolo
    Created on : 27/10/2018, 21:12:52
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SistemaDeContagemControle"%>
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

  <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
  <link rel="stylesheet" type="text/css"
          href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">

        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {

                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
        %>

        <!-- Navigation -->


        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
<br>
            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3 titulos">Cadastrar nova competição coletiva


            </h1><br>



            <!-- Content Row -->
            <div class="row">

                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
                    <%
                        request.setCharacterEncoding("UTF-8");

                        if (request.getParameter("msg") != null) {
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




                    <!-- List group -->
                    <div class="row">

                        <!-- Tab panes -->

                        <div class="tab-content col-12">


                            <!--<form action="cadastrarCompeticaoModalidadeColetiva.jsp?idCompeticao=<>">-->
                            <div class="card">
                                <div class="card-header">
                                    Cadastro
                                </div>

                                <div class="card-body">

                                    <form action="scripts/cadastrarCompeticaoModalidadeColetiva.jsp">

                                        <div class="form-group">

                                            <input type="hidden" name="idCompeticao" value="<%=idCompeticao%>">
                                            <div class="form-group">
                                                <label for="formGroupExampleInput">Nome da competição:</label>
                                                <input type="text" class="form-control" id="formGroupExampleInput" name="nomeCompeticao">
                                            </div>
                                            <label for="inputState">Modalidade coletiva:</label>
                                            <select id="modalidadeColetiva" class="form-control" name="modalidadeColetiva">
                                                <%
                                                    ModalidadeColetivaControle modalidadeColetivaControle = new ModalidadeColetivaControle();

                                                    for (ModalidadeColetiva modalidadeColetiva : modalidadeColetivaControle.buscarTodosModalidadeColetiva()) {

                                                %>
                                                <option value="<%=modalidadeColetiva.getIdModColetiva()%>"><%=modalidadeColetiva.getNome()%></option>
                                                <%}%>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputState">Sistema de competição:</label>
                                            <select id="sisCompeticao" class="form-control" name="sistemaCompeticao" onchange="proximoPasso()">
                                                <option>Sistema todos contra todos</option>
                                                <option>Sistema eliminatório</option>
                                                <option>Sistema misto</option>
                                            </select>
                                        </div>                        



                                        <div class="form-group">
                                            <label for="inputState">Sistema de contagem:</label>
                                            <select id="modalidadeColetiva" class="form-control" name="sistemaContagem">
                                                <%
                                                    SistemaDeContagemControle sistemaDeContagemControle = new SistemaDeContagemControle();

                                                    for (SistemaDeContagem sistemaDeContagem : sistemaDeContagemControle.buscarTodos()) {
                                                %>
                                                <option value="<%=sistemaDeContagem.getIdSistemaDeContagem()%>"><%=sistemaDeContagem.getNome()%></option>

                                                <%}%>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputState">Sistema de desempate:</label>
                                            <select id="modalidadeColetiva" class="form-control" name="sistemaDesempate">
                                                <option selected>Pontos sofridos</option>
                                                <option>Pontos marcados</option>
                                                <option>Vitorias</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="inputState">Sistema de desempate secundário:</label>
                                            <select id="modalidadeColetiva" class="form-control" name="sistemaDesempateSecundario">
                                                <option selected>Pontos sofridos</option>
                                                <option>Pontos marcados</option>
                                                <option>Vitorias</option>
                                            </select>
                                        </div>

                                        <div class="form-group" id="divSisMistoElim">

                                        </div>

                                        <button type="submit" class="btn btn-success">Cadastrar competição</button>
                                    </form>
                                </div>
                            </div>





                        </div>

                    </div>




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

                                    function proximoPasso() {


                                        var e = document.getElementById("sisCompeticao");
                                        var itemSelecionado = e.options[e.selectedIndex].text;


                                        if (itemSelecionado === "Sistema eliminatório" || "Sistema misto") {
                                            var div = document.getElementById("divSisMistoElim");
                                            div.innerHTML = '<div class="form-group form-check"><input type="checkbox" class="form-check-input" id="exampleCheck1" name="respescagem" value="sim"><label class="form-check-label" for="exampleCheck1">Emilinatórias com repescagem?</label></div>';
                                        }
                                        
                                        if (itemSelecionado === "Sistema todos contra todos"){
                                           var div = document.getElementById("divSisMistoElim");
                                           div.innerHTML = '';
                                        }
                                    }


        </script>
        <%
            }
        %>
    </body>

</html>
