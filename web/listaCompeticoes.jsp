<%-- 
    Document   : listaCompeticoes
    Created on : 25/10/2018, 15:53:02
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
        
        <!-- Estilo CSS-->
        <link href="css/estilo.css" rel="stylesheet">
        <meta http-equiv="refresh" content="5(SIGNIFICA QUE IRÁ ATUALIZAR AUTOMÁTICAMENTE EM 5 segundos);url=URL_DESTINO(PODE SER A MESMA PÁGINA)">
    </head>

    <body>
             
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
                
                
                response.setIntHeader("Refresh", 100);
                
                boolean busca = false;
        %>

        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>
        <div class="container">
        
            
   



        
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
            
            <h1 class="my-4 fontCabinCondensed">Competições em andamento</h1>
            
                
            
                
                <form class="form-inline col" style="margin-bottom: 10px;" action="<%= busca = true%>" method="POST">
                    <p class="my-4 fontOverpass col-3">Pesquisar competição:</p>
                    <input class="form-control col-7" type="search"aria-label="Search" name="nomeCompeticao">
                    <button class="btn btn-outline-success col-2" type="submit">Search</button>
                </form>
                
            <div class="card-group">

            <%
                List<Competicao> competicoes = new ArrayList<>();
                CompeticaoControle competicaoControle = new CompeticaoControle();
                
                competicoes = competicaoControle.buscarTodasCompeticoes();
               
               //List<Atleta> atletas = up.getAtletas();
                
                
                for(Competicao competicao : competicoes){
                    
                
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
                String dataInicio = simpleDateFormat.format(competicao.getDataInicio());
                String dataTermino = simpleDateFormat.format(competicao.getDataTermino());
            %>
            
            
                

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <p class="fontOverpass"><a href="#"><%=competicao.getNome()%></a></p>
                            </h4>
                                <p class="card-text fontOverpass"><b>Data de Início:</b><span style="margin-left: 5px;"><%=dataInicio%></span></p>
                                <p class="card-text fontOverpass"><b>Data de Termino:</b><span style="margin-left: 5px;"><%=dataTermino%></span></p>
                                <%
                                    int flag = 0;
                                    int idAtleta = 0;
                                    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
                                    
                                    for(Atleta atleta : usuarioParticipante2Controle.buscarAtletasVincualdadosAoUsuarioParticipante(up)){
                                        
                                        if(atleta.getCompeticao().getIdCompeticao() == competicao.getIdCompeticao()){
                                            idAtleta = atleta.getIdAtleta();
                                            flag = 1;
                                        }
                                        
                                        if(flag == 1){
                                            break;
                                        }
                                    }
                                %>
                                
                                <div class="form-group">
                                
                                <%
                                if(flag == 0){
                                %>
                                <p class="fontOverpass"><a class="btn btn-primary" href="forminscricaoatletaevento.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>" role="button">Realizar inscrição em evento</a><p>
                                <%}
                                if(flag == 1){
                                %>
                                <p class="fontOverpass"><a class="btn btn-info" href="forminscricaocompeticao.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>&idAtleta=<%=idAtleta%>" role="button">Inscrever-se em competições do evento</a><p>
                                <%}%>
                                </div>
                        </div>
                    </div>
                </div>
            
            <%}%>
            </div>  
            
        
        </div> 

        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        

        <%
        }
        %>
    </body>

</html>
