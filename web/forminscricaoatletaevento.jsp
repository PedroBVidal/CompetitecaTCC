<%-- 
    Document   : inscricaoAtletaCompeticao
    Created on : 30/10/2018, 19:23:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%
    UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
    if (up == null) {
        response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
    }

    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));

    CompeticaoControle competicaoControle = new CompeticaoControle();
    Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);

    int flag = 0;

    for (Atleta atleta : up.getAtletas()) {

        System.out.println("ID COMPETICAO"+ competicao.getIdCompeticao());
        System.out.println("ID COMPETICAO ATLETA" + atleta.getCompeticao().getIdCompeticao());
        
        if (atleta.getCompeticao().getIdCompeticao() == competicao.getIdCompeticao()) {
            flag = 1;
        }
    }

    if (flag == 1) {
        System.out.println("ENTREI AQUIIIIIIIIIIIIIIIIIIIIIIIII");
        response.sendRedirect("forminscricaocompeticao.jsp?idCompeticao=" + competicao.getIdCompeticao());
    } else {
        

%>
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

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>
        <div class="container">
            <%
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("msg") != null) {
                    String msg = request.getParameter("msg");
                    
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong><%=msg%></strong> .
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <%
                }
            %>
            
            
            

            <h1 class="col fontCabinCondensed" style="margin: 20px 0px 20px -10px;">Inscrição</h1>

            <div class="row">

                <div class="col-10">
                    <!-- O id da competicao e do usuário participante serão utilizados para vincular uma competicao a um atleta, e também vincular um atleta ao usuário participante-->
                    <form action="scripts/inscricaoAtletaEvento.jsp?idCompeticao=<%=idCompeticao%>&idUsuarioParticipante=<%=up.getIdUsuario()%>" method="POST">

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
                                <button type="submit" class="btn btn-success">Cadastrar-me</button>
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
