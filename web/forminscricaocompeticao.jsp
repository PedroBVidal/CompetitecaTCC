<%-- 
    Document   : inscricaocompeticao
    Created on : 26/10/2018, 22:56:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
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

                // Pega o id passado como parâmtro no botão "Realizar Inscrição" da jsp listaCompeticoes.jsp
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                CompeticaoControle competicaoControle = new CompeticaoControle();
                
                Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);
                System.out.println("ID COMPETICAO:"+ idCompeticao);
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

            <h1 class="col" style="margin: 20px 0px 20px -10px;">Inscrição</h1>
            <h2 class="col" style="margin: 20px 0px 20px -10px;">Selecione as competições que deseja partipar dentro de <%=competicao.getNome()%></h2>

            <div class="row">

                <div class="col-12">
                    <form action="scripts/inscricaoAtletaEvento.jsp?idCompeticao=<%=idCompeticao%>&idUsuarioParticipante=<%=up.getIdUsuario()%>" method="POST">

                        <div class="card">
                            <div class="card-header">
                                Passo 2
                            </div>
                            
                            <div class="card-body">
                                <div class="form-group">
                                    <h4 style="margin: -5px 0px 0px -5px;">Competições individuais: </h4>
                                </div>
                                <%
                                    if(competicao.getCmodalidadesolo() == null){
                                       
                                    }
                                    else{
                                    for(CompeticaoModalidadeSolo cms: competicao.getCmodalidadesolo()){
                                %>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <input type="checkbox" aria-label="Checkbox for following text input">
                                            </div>
                                        </div>
                                        <input type="text" class="form-control disabled" readonly="true" aria-label="Text input with checkbox" value="<%=cms.getNomeCompeticao()%>">
                                    </div>
                                </div>
                                <%}}%>
                                
                                <div class="form-group">
                                    <h4 style="margin: 15px 0px 0px -5px;">Competições coletivas: </h4>
                                </div>
                                <div class="form-group">
                                    <p>
                                    <a class="btn btn-info" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                        <i class="fas fa-info-circle"></i>&nbsp;Saiba mais
                                    </a>
                                    </p>
                                    <!--Collapse de infromação sobre o cadastro de modalidades coletivas-->
                                    <div class="collapse" id="collapseExample">
                                        <div class="card card-body">
                                            <ol> 
                                                <li id="lista">Selecione as modalidades coletivas que você tenha interesse em participar.</li>
                                                <li class="lista">Posteriormente você poderá escolher entre:</li>
                                                <ul>
                                                    <li class="lista"><span class="font-weight-bold">Enviar uma solicitação de entrada para uma equipe</span> ou <span class="font-weight-bold">Criar uma nova equipe.</span></li>
                                                </ul>
                                                <li class="lista">A escolha entre criar ou solicitar entrada em uma equipe <span class="font-weight-bold">deverá ser realizada para cada competição coletiva selecionada.</span></li>
                                            </ol>  
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <input type="checkbox" aria-label="Checkbox for following text input">
                                            </div>
                                        </div>
                                        <input type="text" class="form-control disabled" readonly="true" aria-label="Text input with checkbox" value="Basquete 3x3">
                                    </div>
                                </div>
                                <div class="form-group">
                                <button type="submit" class="btn btn-success">Cadastrar-me</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>




                <!-- Bootstrap core JavaScript -->

                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
                <script>
                </script>
                <%
                    }
                %>
                </body>

                </html>
