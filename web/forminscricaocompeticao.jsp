<%-- 
    Document   : inscricaocompeticao
    Created on : 26/10/2018, 22:56:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
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
        <link href="css/estilo.css" rel="stylesheet">

    </head>

    <body>
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
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
            
            <h1 class="col fontCabinCondensed" style="margin: 20px 0px 20px -10px;">Inscrição</h1>
        
            <div class="row">
                <div class="col-2">
                    <!-- List group -->
                    <div class="list-group" id="myList" role="tablist">
                        <a class="list-group-item list-group-item-action active" data-toggle="list" href="#home" role="tab">Passo 1</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Passo 2</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Passo 3</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Passo 4</a>
                    </div>
                </div>
                <div class="col-10">
                    <!-- Tab panes -->
                    
                        <div class="tab-content">

                            <div class="tab-pane active" id="home" role="tabpanel">
                                <div class="card">
                                    <div class="card-header">
                                        Insira seus dados pessoais
                                    </div>
                                    <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Nome completo:</label>
                                    <input type="text" name="nome" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Seu nome" value="<%=up.getNome()%>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Seu email:</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputPassword1" placeholder="Seu email" value="<%=up.getEmail()%>">
                                </div>
                                        <button type="button" class="btn btn-info" onclick="painelAnterior();">Passo anterior</button>
                                        <button type="button" class="btn btn-info" onclick="proximoPainel();">Proximo passo</button>
                                </div>
                                </div>

                            </div>
                            <div class="tab-pane" id="profile" role="tabpanel">
                                <form action="scripts/inscricaoAtletaCompeticao.jsp">
                                <div class="card">
                                    <div class="card-header">
                                        Selecione as microcompetições que você deseja participar
                                    </div>
                                <div class="card-body">
                                        
                                <div class="form-group">
                                    <div class="card" style="width: 18rem;">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item">    <div class="col-auto my-1">
                                                    <div class="custom-control custom-checkbox mr-sm-2">
                                                        <input type="checkbox" class="custom-control-input" id="customControlAutosizing">
                                                        <label class="custom-control-label" for="customControlAutosizing">Remember my preference</label>
                                                    </div>
                                                </div></li>
                                            <li class="list-group-item">Dapibus ac facilisis in</li>
                                            <li class="list-group-item">Vestibulum at eros</li>
                                        </ul>
                                    </div>
                                </div>
                                        <button type="button" class="btn btn-info" onclick="painelAnterior();">Passo anterior</button>
                                        <button type="button" class="btn btn-info" onclick="proximoPainel();">Proximo passo</button>
                                </div>
                                </div>
                                </form>
                            </div>
                            <div class="tab-pane" id="messages" role="tabpanel">3</div>
                            <div class="tab-pane" id="settings" role="tabpanel"><button type="submit" class="btn btn-success">Enviar</button></div>

                        </div>
                    </form
                </div>
            </div>



            <!-- Bootstrap core JavaScript -->

            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
            <script>

                $('.naozeibeu').mask('00/00/0000', {reverse: true});
                    
                var prox = 1;
    
                function proximoPainel(){
                    if(prox != 4){
                    prox = prox + 1;
                    $('#myList a:nth-child('+prox+')').tab('show');
                    }
                }
    
                function painelAnterior(){
                    if(prox != 1){
                    prox = prox - 1;
                    $('#myList a:nth-child('+prox+')').tab('show');
                    }
                }
            </script>
            <%
                }
            %>
    </body>

</html>
