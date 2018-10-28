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
                
                
                String sIdCompeticao = request.getParameter("id");
                int idCompeticao = Integer.parseInt(sIdCompeticao);
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
            <div class="list-group col-3" id="myList" role="tablist">
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#modalidadeSolo" role="tab">Gerenciar modalidade solo</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Gerenciar modalidade coletiva</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Messages</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>
            </div>

            <!-- Tab panes -->
            <div class="tab-content col-9">
                <div class="tab-pane active dark" id="modalidadeSolo" role="tabpanel">
                    
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Identificador</th>
                                <th scope="col">Nome</th>
                            </tr>
                        </thead>

                        <tbody>
                            
                            

                        </tbody>
                    </table>
                </div>
                <a href="formcadastromodalidadesolo.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>" class="btn btn-success">
                    <!-- Adicionar icone -->
                    <i class="fas fa-plus"></i>&nbsp;Nova modalidade solo
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
