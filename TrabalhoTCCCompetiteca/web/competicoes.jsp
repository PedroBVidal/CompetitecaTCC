
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Aluno 
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            CompeticaoControle competicaoControle = new CompeticaoControle();
            
           
            
            if (up == null) {
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {
                
        %>

        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
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
            <h1 class="my-4">Minhas Competições</h1>
            <div class="row">
                <%
                SimpleDateFormat formate = new SimpleDateFormat("dd/MM/yyyy");
                //UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
                //UsuarioParticipante upp = upc.buscarPorId(up.getIdUsuario());
                
                System.out.println("Competições vinculadas ao usuário participante" + up.getCompeticoes());
                 UsuarioParticipanteControle upControle = new UsuarioParticipanteControle();
            UsuarioParticipante usuarioParticipante = upControle.buscarPorId(up.getIdUsuario());
                
                
                
                for(Competicao cptc : usuarioParticipante.getCompeticoes()){
                    System.out.println("Nome:"+cptc.getNome()+"\n Id:"+cptc.getIdCompeticao()+"\n Inativo:"+cptc.isInativo());
                    if(cptc.isInativo() == false){
                       
                %>

                <div class="col-lg-4 col-sm-6 portfolio-item">
                    <div class="card h-100">
                        <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="#"><%=cptc.getNome()%></a>
                            </h4>
                            <p class="card-text"><b>Data de Início:</b><%=formate.format(cptc.getDataInicio())%></p>
                            <p class="card-text"><b>Data de Encerramento:</b><%=formate.format(cptc.getDataTermino())%></p>
                            <!-- Button trigger modal -->
                            <a><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#<%=cptc.getIdCompeticao()%>"><i class="fas fa-trash-alt"></i></button></a>&nbsp;



                            <!-- Modal -->
                            <div class="modal fade" id="<%=cptc.getIdCompeticao()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir <%=cptc.getNome()%>?</h5>
                                            <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>

                                        <div class="modal-footer">
                                            <a href="scripts/cadastrarcompeticao.jsp?op=1&idCompeticao=<%=cptc.getIdCompeticao()%>"><button class="btn btn-secondary">Sim</button></a>
                                            <button type="button" class="btn btn-primary">Cancelar</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="gerenciamentoDeCompeticao.jsp?idCompeticao=<%=cptc.getIdCompeticao()%>"><button class="btn btn-success">Gerenciar Competição</button></a>
                        </div>
                    </div>
                </div>
                <%}}%>
            </div>
            <a href="criarcompeticao.jsp" class="btn btn-success">
                <!-- Adicionar icone -->
                <i class="fas fa-plus"></i>&nbsp;Nova Competição
            </a>

        </div>


        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <%
            
        }
        %>
    </body>

</html>

