<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="java.text.SimpleDateFormat"%>
<a href="gerenciarEquipe.jsp"></a>
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
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">

    </head>

    <body>
        <%
            UsuarioParticipante2 up2 = (UsuarioParticipante2) session.getAttribute("usuario");
            if(up2 == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                EquipeControle equipeControle = new EquipeControle();
                
                
                int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
                Equipe equipe = equipeControle.buscarPorId(idEquipe);
               
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
            <h1 class="mt-4 mb-3">Gerenciando equipe <span style="color: red;"><%=equipe.getNome()%></span>

            </h1><br>


            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#membros" role="tab">Gerenciar Membros</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#competicoes" role="tab">Buscar Competições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#mcompeticoes" role="tab">Minhas Competições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#solicitacoes" role="tab">Solicitações</a>

                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">
                    <div class="tab-pane dark" id="membros" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>




                        <table id="tabela" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Atleta</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>

                                <%
                                    for(Atleta atleta: equipe.getAtletas()){
                                        String nome = atleta.getUsuarioParticipante().getNome();
                                        String email = atleta.getUsuarioParticipante2();
                                    
                                %>
                            <td><%=nome%></td>
                            <td><%=email%></td>
                            <td>
                                <a href="scripts/addUsuarioAdm.jsp?idUsuario=<%=atleta.getIdAtleta()%>&idComp=<%=atleta.getIdAtleta()%>&op=1" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>    
                            <%}%>
                            </tbody>



                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                        </script>
                    </div>
                    <div class="tab-pane active dark" id="competicoes" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Nome</th>
                                    <th scope="col">Data de Início</th>
                                    <th scope="col">Data de Término</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                    CompeticaoControle cc = new CompeticaoControle();
                                    
                                    for(Competicao cpt: cc.buscarTodasCompeticoes()){
                                        
                                    if(!cpt.isInativo() && !cpt.isPrivate()){
                                
                                    String nomeCompeticao = cpt.getNome();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                    String dataInicio = sdf.format(cpt.getDataInicio());
                                    String dataTermino = sdf.format(cpt.getDataTermino());
        
 
                            
                            
                            
                                %>    
                            <td><%=nomeCompeticao%></td>
                            <td><%=dataInicio%></td>
                            <td><%=dataTermino%></td>
                            <td><a href="gerenciarCompModColetiva.jsp?id=<%=cpt.getIdCompeticao()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-clipboard-list"></i>
                                </a> &nbsp;
                            </td>
                            <%}}%>
                            </tbody>
                                <script>
                                    //Código de busca da tabela
                                    $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                                </script>

                                </div>


                                <div class="tab-pane" id="mcompeticoes" role="tabpanel">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                            </a></span>
                                        <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                                    </div>
                                    <table class="table table-striped">
                                        <thead class="table-dark">
                                            <tr>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Data de Início</th>
                                                <th scope="col">Data de Término</th>
                                                <th scope="col">Ação</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <%
                                    
                                                for(Competicao cpt: equipe.){
                                        
                                                if(!cpt.isInativo() && !cpt.isPrivate()){
                                
                                                String nomeCompeticao = cpt.getNome();
                                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                String dataInicio = sdf.format(cpt.getDataInicio());
                                                String dataTermino = sdf.format(cpt.getDataTermino());
        
 
                            
                            
                            
                                            %>    
                                        <td><%=nomeCompeticao%></td>
                                        <td><%=dataInicio%></td>
                                        <td><%=dataTermino%></td>
                                        <td><a href="gerenciarCompModColetiva.jsp?id=<%=cpt.getIdCompeticao()%>" class="btn btn-success">
                                                <!-- Adicionar icone -->
                                                <i class="fas fa-clipboard-list"></i>
                                            </a> &nbsp;

                                            <script>
                                                //Código de busca da tabela
                                                $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                                            </script>

                                            </div>


                                            </div>


                                            <div class="tab-pane" id="messages" role="tabpanel">

                                            </div>
                                            <div class="tab-pane" id="settings" role="tabpanel">
                                                <div class="form-group input-group">
                                                    <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                                        </a></span>
                                                    <input name="consulta" id="txt_consulta2" placeholder="Consultar" type="text" class="form-control">
                                                </div>




                                                <table id="tabela2" class="table table-striped">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th scope="col">Usuário</th>
                                                            <th scope="col">Email</th>
                                                            <th scope="col">Ação</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <%
                                                            //UsuarioParticipanteControle upca = new UsuarioParticipanteControle();
                                                            for(UsuarioParticipante upact: competicao.getAdministradores()){
                                
                                                            String nomeUsuario = upact.getNome();
                                                            String email = upact.getEmail();
                                    
                            
                            
                            
                                                        %>    
                                                    <td><%=nomeUsuario%></td>
                                                    <td><%=email%></td>
                                                    <td>
                                                        <%
                                                            if(!email.equals(up.getEmail())){
                                                        %>
                                                        <a href="scripts/addUsuarioAdm.jsp?idUsuario=<%=upact.getIdUsuario()%>&idComp=<%=competicao.getIdCompeticao()%>&op=2" class="btn btn-danger">
                                                            <!-- Adicionar icone -->
                                                            <i class="fas fa-trash-alt"></i>
                                                        </a>
                                                        <%}%>
                                                    </td>    

                                                    </tbody>


                                                    <%}%>
                                                </table>
                                                <script>
                                                    //Código de busca da tabela
                                                    $('input#txt_consulta2').quicksearch('table#tabela2 tbody tr');

                                                </script>
                                            </div>
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
