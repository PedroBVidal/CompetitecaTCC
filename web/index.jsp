<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template!</title>

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
            if (usuario instanceof UsuarioParticipante2) {

        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <% } else if (usuario == null) {

        %>
        <header>
            <jsp:include page="navbarindex.jsp" flush="true" />
        </header>

        <%} else if (usuario instanceof UsuarioParticipante) {

        %>
        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <%}%>




        <header>
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner" role="listbox">
                    <!-- Slide One - Set the background image for this slide in the line below -->
                    <div class="carousel-item active" style="background-image: url('img/competiteca_default.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>First Slide</h3>
                            <p>This is a description for the first slide.</p>
                        </div>
                    </div>
                    <!-- Slide Two - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('img/competiteca_default.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Second Slide</h3>
                            <p>This is a description for the second slide.</p>
                        </div>
                    </div>
                    <!-- Slide Three - Set the background image for this slide in the line below -->
                    <div class="carousel-item" style="background-image: url('img/competiteca_default.png')">
                        <div class="carousel-caption d-none d-md-block">
                            <h3>Third Slide</h3>
                            <p>This is a description for the third slide.</p>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </header>

        <!-- Page Content -->
        <div class="container">

            <h1 class="my-4">Seja Bem-Vindo a Competiteca</h1>

            <!-- Marketing Icons Section -->
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Um sistema que faz tudo por você</h4>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Card Title</h4>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus commodi similique totam consectetur praesentium molestiae atque exercitationem ut consequuntur, sed eveniet, magni nostrum sint fuga.</p>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 mb-4">
                    <div class="card h-100">
                        <h4 class="card-header">Card Title</h4>
                        <div class="card-body">
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente esse necessitatibus neque.</p>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <!-- Portfolio Section -->
            <h2>Competições em Andamento</h2>

            <div class="row">
                <%
                    CompeticaoControle cptcc = new CompeticaoControle();
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    //List<Competicao> cptcl = cptcc.buscarTodasCompeticoes();
                    int i = 0;
                    for (Competicao cptc : cptcc.buscarTodasCompeticoes()) {

                %>
                <!--Início Modal-->
                <div class="modal fade" id="<%=i%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalScrollableTitle">Escolha uma competição a acompanhar</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h3>Competições Coletivas</h3>
                                <hr>
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Nome</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  if (cptc.getCmodalidadecole().size() > 0) {

                                                for (CompeticaoModalidadeColetiva cmc : cptc.getCmodalidadecole()) {

                                        %>


                                        <tr>

                                            <td><%=cmc.getNomeCompeticao()%></td>
                                            <td><a class="btn btn-success" href="acompanharComp.jsp?idCompeticao=<%=cmc.getIdCompeticaoModalidade()%>" role="button">Ir</a></td>

                                        </tr>
                                        <%}
                                        } else {%>
                                        <tr>
                                            <td>Não Há competições coletivas disponíveis</td>
                                            <td></td>
                                        </tr>
                                        <%}
                                        %>
                                    </tbody>
                                </table>

                                <h3>Competições Individuais</h3>
                                <hr>
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th scope="col">Nome</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%if (cptc.getCmodalidadesolo().size() > 0) {

                                                for (CompeticaoModalidadeSolo cms : cptc.getCmodalidadesolo()) {

                                        %>


                                        <tr>

                                            <td><%=cms.getNomeCompeticao()%></td>
                                            <td><a class="btn btn-success" href="acompanharComp.jsp?idCompeticao=<%=cms.getIdCompeticaoModalidade()%>" role="button">Ir</a></td>

                                        </tr>
                                        <%}
                                        } else {%>
                                        <tr>

                                            <td>Não há competições solo disponíveis</td>
                                            <td></td>

                                        </tr>
                                        <%}
                                        %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Fim Modal-->
                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="img/competiteca_default.png" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#"><%=cptc.getNome()%></a>
                            </h4>
                            <p class="card-text">
                                <b>Período da Competição:</b>&nbsp;<%=sdf.format(cptc.getDataInicio())%> a <%=sdf.format(cptc.getDataTermino())%> <br>
                                <%  int inscritos = 0;
                                    if (cptc.getCmodalidadecole().size() > 0) {
                                        for (CompeticaoModalidadeColetiva cmc : cptc.getCmodalidadecole()) {
                                            inscritos += cmc.getNumParticipantes();
                                        }
                                    }
                                    if (cptc.getCmodalidadesolo().size() > 0) {
                                        for (CompeticaoModalidadeSolo cms : cptc.getCmodalidadesolo()) {
                                            inscritos += cms.getNumParticipantes();
                                        }
                                    }
                                %>
                                <b>Número de Participantes:</b>&nbsp;<%=inscritos%><br>

                            </p>
                        </div>
                        <div class="card-footer">
                            <button style="float:right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#<%=i%>">
                                Acompanhe
                            </button>
                        </div>
                    </div>
                </div>
                <%i++;
                    }%>

            </div>
            <!-- /.row -->



        </div>
        <!-- /.container -->

        <!-- Footer -->
        <footer class="py-5 bg-dark">
            <div class="container">
                <p class="m-0 text-center text-white">Copyright 2019 &copy; A Oliveira & Vidal Software</p>
            </div>

            <!-- /.container -->
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
