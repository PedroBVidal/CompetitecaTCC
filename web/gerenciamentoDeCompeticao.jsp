<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
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

    </head>

    <body>
        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                CompeticaoControle competicaoControle = new CompeticaoControle();
                
                
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);
                
        %>

        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>


        <!-- Page Content -->
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
            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">Gerenciando competicao <span style="color: red;"><%=competicao.getNome()%></span>

            </h1><br>



            <!-- List group -->
            <div class="row">
            <div class="list-group col-2" id="myList" role="tablist">
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#modalidadeSolo" role="tab">Nova competição coletiva</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Nova competição individual</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Messages</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>
            </div>

            <!-- Tab panes -->
            <div class="tab-content col-10">
                <div class="tab-pane active dark" id="modalidadeSolo" role="tabpanel">
                    
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Modalidade</th>
                                <th scope="col">Sistema de Competição</th>
                                <th scope="col">Ação</th>
                            </tr>
                        </thead>

                        <tbody>
                            
                        <td>Nome</td>
                        <td>Modalidade</td>
                        <td>Todos contra Todos</td>
                        <td><a href="#" class="btn btn-success">
                                <!-- Adicionar icone -->
                                <i class="fas fa-edit"></i>
                            </a> &nbsp;
                            <a href="#" class="btn btn-danger">
                                <!-- Adicionar icone -->
                                <i class="fas fa-trash-alt"></i>
                            </a> &nbsp;
                            <button class="btn btn-primary" data-toggle="modal" data-target="#">
                                <!-- Adicionar icone -->
                                <i class="fas fa-eye"></i>
                            </button></td>

                        </tbody>
                    </table>
                </div>
                <a href="formcadastrocompeticaomodalidadecoletiva.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>" class="btn btn-success">
                    <!-- Adicionar icone -->
                    <i class="fas fa-plus"></i>&nbsp;Nova competição coletiva
                </a>
                
                <div class="tab-pane" id="profile" role="tabpanel">
                    
                    
                    
                </div>
                <div class="tab-pane" id="messages" role="tabpanel">torem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
                <div class="tab-pane" id="settings" role="tabpanel">Porem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</div>
            </div>

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
