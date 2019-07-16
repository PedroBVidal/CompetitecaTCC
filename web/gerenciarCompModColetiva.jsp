<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
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

   <link href="https://fonts.googleapis.com/css?family=Quicksand&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css"
              href="css/fonte/style.css"/>
    </head>

    <body style="font-family: 'Quicksand';">
        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                CompeticaoModalidadeColetivaControle competicaoControle = new CompeticaoModalidadeColetivaControle();
                
                
                int idCompeticao = Integer.parseInt(request.getParameter("id"));
                CompeticaoModalidadeColetiva competicao = competicaoControle.buscarPorId(idCompeticao);
                
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
            <br>
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
            <h1 class="mt-4 mb-3 titulos">Gerenciando competicao <span style="color: red;"><%=competicao.getNomeCompeticao()%></span>

            </h1><br>



            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#messages" role="tab">Mensagens</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Competidores</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Classificações</a>



                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">
                    <div class="tab-pane dark" id="inscricao" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta1" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="tabela1" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Equipe</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                            
                                    for(InscricaoCompeticaoColetiva iMc: competicao.getInscricoesCompeticoesColetivas()){
                                        if(iMc.getInscricaoAceita() == 'E'){
                                    String nomeEquipe = iMc.getEquipe().getNome();
                                    
                            
                            
                            
                                %>    
                            <td><%=nomeEquipe%></td>
                            <td>
                                <a href="scripts/aprovaInscCompColetiva.jsp?opt=1&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-check"></i>
                                </a> &nbsp;
                                <a href="scripts/aprovaInscCompColetiva.jsp?opt=2&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-danger">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-times"></i>
                                </a> &nbsp;
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMc.getEquipe().getIdEquipe()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=iMc.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                                            <b>Email para Contato:</b>&nbsp;<%=iMc.getEquipe().getAdministrador().getEmail()%><br>
                                            <b>Atletas Inscritos:</b><br>
                                            <ul>
                                            <%for (Atleta atl : iMc.getAtletas()) {%>
                                            <li><%=atl.getUsuarioParticipante().getNome()%></li>   
                                            <%    }
                                            %>
                                            </ul>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta1').quicksearch('table#tabela1 tbody tr');

                        </script>

                    </div>


                    <div class="tab-pane" id="profile" role="tabpanel">

                        <h1>NONE</h1>
                    </div>


                    <div class="tab-pane active" id="messages" role="tabpanel">

                    </div>
                    <div class="tab-pane" id="settings" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="table" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Equipe</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                            
                                    for(InscricaoCompeticaoColetiva iMc: competicao.getInscricoesCompeticoesColetivas()){
                                        if(iMc.getInscricaoAceita() == 'A'){
                                    String nomeEquipe = iMc.getEquipe().getNome();
                                    
                            
                            
                            
                                %>    
                            <td><%=nomeEquipe%></td>
                            <td>

                                <a href="scripts/aprovaInscCompColetiva.jsp?opt=3&idInsc=<%=iMc.getIdInscricao()%>&idComp=<%=competicao.getIdCompeticaoModalidade()%>" class="btn btn-danger">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-trash-alt"></i>
                                </a> &nbsp;
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=iMc.getEquipe().getIdEquipe()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=iMc.getEquipe().getIdEquipe()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"><%=nomeEquipe%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">

                                            <b>Nome da Equipe:</b>&nbsp; <%=nomeEquipe%> <br>
                                            <b>Email para Contato:</b>&nbsp;<%=iMc.getEquipe().getAdministrador().getEmail()%><br>
                                            <b>Atletas Inscritos:</b><br>
                                            <ul>
                                            <%for (Atleta atl : iMc.getAtletas()) {%>
                                             <li><%=atl.getUsuarioParticipante().getNome()%></li>       
                                               <% }
                                            %>
                                            </ul>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta').quicksearch('table#tabela tbody tr');

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