
<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

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
<%@page import="br.edu.ifpr.irati.ti.modelo.Mensagem"%>
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
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <!--<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">-->

        <!-- Custom styles for this template -->
        <link href="css/modern-business.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
    </head>

    <body>
        <%
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                CompeticaoModalidadeSoloControle competicaoControle = new CompeticaoModalidadeSoloControle();
                
                
                int idCompeticao = Integer.parseInt(request.getParameter("id"));
                CompeticaoModalidadeSolo competicao = competicaoControle.buscarPorId(idCompeticao);
                
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
            <h1 class="mt-4 mb-3">Adicionar mais administradores à <span style="color: red;"><%=competicao.getNomeCompeticao()%></span>

            </h1><br>



            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#messages" role="tab">Mensagens</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#inscricao" role="tab">Inscrições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Classificações</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Settings</a>


                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">
                    


                <div class="tab-pane" id="profile" role="tabpanel">

                    <h1>NONE</h1>
                </div>


                <div class="tab-pane active" id="messages" role="tabpanel">
                    <table id="tabela" class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Remetente</th>
                                <th scope="col">Assunto</th>
                                <th scope="col">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                UsuarioParticipanteControle upc = new UsuarioParticipanteControle();
                                UsuarioParticipante uper = upc.buscarPorId(up.getIdUsuario());
                                for (Mensagem mesg : uper.getMsg()) {

                            if(mesg.getTipoRemetente() == 2){
                            %>

                            <tr>

                                <td><%=mesg.getTipoUser().getNome()%></td>
                                <td><%=mesg.getAssunto()%></td>
                                <td><a href="abreMensagem.jsp?id=<%=mesg.getIdMensagem()%>" class="btn btn-success">
                                        <!-- Adicionar icone -->
                                        <%if(mesg.isLido() == false){%>
                                        <i class="fas fa-envelope"></i>
                                        <%}else{
                                        %>                                          <i class="fas fa-envelope-open"></i>
                                        <%
}%>
                                    </a> &nbsp;

                                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=mesg.getIdMensagem()%>">
                                        <!-- Adicionar icone -->
                                        <i class="fas fa-eye"></i>
                                    </button></td>
                            </tr>
                            <%}
}%>
                        </tbody>
                    </table>
                </div>
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
