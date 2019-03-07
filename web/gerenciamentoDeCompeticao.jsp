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
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Mensagem"%>
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
            UsuarioParticipante up = (UsuarioParticipante) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                CompeticaoControle competicaoControle = new CompeticaoControle();
                
                
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
                Competicao competicao = competicaoControle.buscarCompeticaoPorId(idCompeticao);
                System.out.println("Competições solo (1): " + competicao.getCmodalidadesolo());
                System.out.println("Competições coletivas (1):" + competicao.getCmodalidadecole());
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
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#modalidadeSolo" role="tab">Nova competição coletiva</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab">Nova competição individual</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#messages" role="tab">Mensagens</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#settings" role="tab">Gerenciar Administradores</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#administradores" role="tab">Adicionar Administradores</a>
                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">
                    <div class="tab-pane dark" id="administradores" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                        </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>

                        

                    
                    <table id="tabela" class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Usuário</th>
                                <th scope="col">Email</th>
                                <th scope="col">Ação</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                UsuarioParticipanteControle upca = new UsuarioParticipanteControle();
                                for(UsuarioParticipante upa: upca.buscarTodos()){
                                
                                String nomeUsuario = upa.getNome();
                                String email = upa.getEmail();
                                    
                            
                            
                            
                            %>    
                        <td><%=nomeUsuario%></td>
                        <td><%=email%></td>
                        <td>
                            <a href="scripts/addUsuarioAdm.jsp?idUsuario=<%=upa.getIdUsuario()%>&idComp=<%=competicao.getIdCompeticao()%>&op=1" class="btn btn-success">
                                <!-- Adicionar icone -->
                                <i class="fas fa-plus"></i>
                            </a>
                        </td>    

                        </tbody>

                        
                        <%}%>
                    </table>
                    <script>
                        //Código de busca da tabela
                        $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                    </script>
                </div>
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
                                <%
                            
                                    for(CompeticaoModalidadeColetiva cptMc: competicao.getCmodalidadecole()){
                                        
                                        if(!cptMc.isInativo()){
                                
                                    String nomeCompeticaoColetiva = cptMc.getNomeCompeticao();
                                    ModalidadeColetiva modalidadeColetiva = cptMc.getModalidadeColetiva();
                                    String nomeModalidadeColetiva = modalidadeColetiva.getNome();
                                    SistemaDeCompeticao sistemaDeCompeticao = cptMc.getSistemaDeCompeticao();
                                    String nomeSistemaDeCompeticao = sistemaDeCompeticao.getNome();
                            
                            
                            
                                %>    
                            <td><%=nomeCompeticaoColetiva%></td>
                            <td><%=nomeModalidadeColetiva%></td>
                            <td><%=nomeSistemaDeCompeticao%></td>
                            <td><a href="gerenciarCompModColetiva.jsp?id=<%=cptMc.getIdCompeticaoModalidade()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-users-cog"></i>
                                </a> &nbsp;
                            <a><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Inativar<%=cptMc.getIdCompeticaoModalidade()%>">
                                    <i class="fas fa-trash-alt"></i></button></a>&nbsp;
                                    
                           
                           


                            <!-- Modal -->
                            <div class="modal fade" id="Inativar<%=cptMc.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir <%=cptMc.getNomeCompeticao()%>?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
  
                                        <div class="modal-footer">
                                            <a href="scripts/inativarCompeticaoModalidadeColetiva.jsp?idEvento=<%=competicao.getIdCompeticao()%>&idCompeticao=<%=cptMc.getIdCompeticaoModalidade()%>"><button class="btn btn-secondary">Sim</button></a>
                                            <button type="button" class="btn btn-primary">Cancelar</button>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                                    
                                    
                                    
                                    &nbsp;
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=cptMc.getIdCompeticaoModalidade()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=cptMc.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Competição coletiva: <%=nomeCompeticaoColetiva%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Modalidade vinculada: <%=nomeModalidadeColetiva%></p>
                                            <ol>
                                                <li>Sistema de competição:&nbsp; <%=nomeSistemaDeCompeticao%></li>
                                                    <%
                                                        if(sistemaDeCompeticao instanceof SistemaTodosContraTodos){
                                                
                                                        SistemaTodosContraTodos sistemaTodosContraTodos = (SistemaTodosContraTodos) sistemaDeCompeticao;
                                                        SistemaDeContagem sistemaDeContagem = sistemaTodosContraTodos.getSistemaDeContagem();
                                                        SistemaDeDesempate sistemaDeDesempate = sistemaTodosContraTodos.getSistemaDeDesempate();
                                            
                                                        String nomeSistemaDeContagem = sistemaDeContagem.getNome();
                                                        String tipoSistemaDesempate = sistemaDeDesempate.getTipoDesempate();
                                                        String tipoSistemaDesempateSecundario = sistemaDeDesempate.getTipoDesempateSecundario();
                                                    %>
                                                <li>Sistema de contagem:&nbsp; <%=nomeSistemaDeContagem%></li>
                                                <li>Crtitério de desempate:&nbsp; <%=tipoSistemaDesempate%></li>
                                                <li>Crtitério de desempate secundário:&nbsp; <%=tipoSistemaDesempateSecundario%></li>

                                                <%}%>
                                                <%
                                                    if(sistemaDeCompeticao instanceof SistemaEliminatorio){
                                                
                                                    SistemaEliminatorio sistemaEliminatorio = (SistemaEliminatorio) sistemaDeCompeticao;
                                                    String sPossuiRepescagem;
                                            
                                                    if(sistemaEliminatorio.isRepescagem()){
                                                        sPossuiRepescagem = "sim";
                                                    }
                                                    else{
                                                        sPossuiRepescagem = "não";
                                                    }
                                            
                                                %>
                                                <li>Eliminatóias com repescagem:&nbsp; <%=sPossuiRepescagem%></li>
                                                    <%}%>
                                                    <%
                if(sistemaDeCompeticao instanceof SistemaMisto){
                                                
                SistemaMisto sistemaMisto = (SistemaMisto) sistemaDeCompeticao;
                String sPossuiRepescagem;
                                            
                if(sistemaMisto.isRepescagem()){
                    sPossuiRepescagem = "sim";
                }
                else{
                    sPossuiRepescagem = "não";
                }
                                            
                SistemaDeContagem sistemaDeContagem = sistemaMisto.getSistemadecontagem();
                SistemaDeDesempate sistemaDeDesempate = sistemaMisto.getSistemaDeDesempate();
                                            
                String nomeSistemaDeContagem = sistemaDeContagem.getNome();
                String tipoSistemaDesempate = sistemaDeDesempate.getTipoDesempate();
                String tipoSistemaDesempateSecundario = sistemaDeDesempate.getTipoDesempateSecundario();
                                            
                                            
                                                    %>
                                                <li>Sistema de contagem:&nbsp; <%=nomeSistemaDeContagem%></li>
                                                <li>Crtitério de desempate:&nbsp; <%=tipoSistemaDesempate%></li>
                                                <li>Crtitério de desempate secundário:&nbsp; <%=tipoSistemaDesempateSecundario%></li>
                                                <li>Eliminatóias com repescagem:&nbsp; <%=sPossuiRepescagem%></li>
                                                    <%}%>
                                            </ol>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </table>
                        <a href="formcadastrocompeticaomodalidadecoletiva.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>" class="btn btn-success">
                            <!-- Adicionar icone -->
                            <i class="fas fa-plus"></i>&nbsp;Nova competição coletiva
                        </a>
                    </div>


                    <div class="tab-pane" id="profile" role="tabpanel">

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
                                <%
                                    System.out.println("Competições solo: " + competicao.getCmodalidadesolo());
                                    System.out.println("Competições coletivas:" + competicao.getCmodalidadecole());
                                    for(CompeticaoModalidadeSolo cptMs: competicao.getCmodalidadesolo()){
                                        
                                        if(!cptMs.isInativo()){
                            
                                    String nomeCompeticaoSolo = cptMs.getNomeCompeticao();
                                    ModalidadeSolo modalidadeSolo = cptMs.getModalidadeSolo();
                                    String nomeModalidadeSolo = modalidadeSolo.getNome();
                                    SistemaDeCompeticao sistemaDeCompeticao = cptMs.getSistemaDeCompeticao();
                                    String nomeSistemaDeCompeticao = sistemaDeCompeticao.getNome();
                            
                            
                            
                                %>    
                            <td><%=nomeCompeticaoSolo%></td>
                            <td><%=nomeModalidadeSolo%></td>
                            <td><%=nomeSistemaDeCompeticao%></td>
                            <td><a href="gerenciarCompeticaoModSolo.jsp?id=<%=cptMs.getIdCompeticaoModalidade()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-users-cog"></i>
                                </a> &nbsp;
                           
                                <a><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#Inativar<%=cptMs.getIdCompeticaoModalidade()%>">
                                        <i class="fas fa-trash-alt"></i></button></a>&nbsp;
                                    
                           
                           


                            <!-- Modal -->
                            <div class="modal fade" id="Inativar<%=cptMs.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente excluir <%=cptMs.getNomeCompeticao()%>?</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
  
                                        <div class="modal-footer">
                                            <a href="scripts/inativarCompeticaoModalidadeSolo.jsp?idEvento=<%=competicao.getIdCompeticao()%>&idCompeticao=<%=cptMs.getIdCompeticaoModalidade()%>"><button class="btn btn-secondary">Sim</button></a>
                                            <button type="button" class="btn btn-primary">Cancelar</button>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <button class="btn btn-primary" data-toggle="modal" data-target="#<%=cptMs.getIdCompeticaoModalidade()%>">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-eye"></i>
                                </button></td>

                            </tbody>

                            <div class="modal fade" id="<%=cptMs.getIdCompeticaoModalidade()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Competição coletiva: <%=nomeCompeticaoSolo%></h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>Modalidade vinculada: <%=nomeModalidadeSolo%></p>
                                            <ol>
                                                <li>Sistema de competição:&nbsp; <%=nomeSistemaDeCompeticao%></li>
                                                    <%
                                                        if(sistemaDeCompeticao instanceof SistemaTodosContraTodos){
                                                
                                                        SistemaTodosContraTodos sistemaTodosContraTodos = (SistemaTodosContraTodos) sistemaDeCompeticao;
                                                        SistemaDeContagem sistemaDeContagem = sistemaTodosContraTodos.getSistemaDeContagem();
                                                        SistemaDeDesempate sistemaDeDesempate = sistemaTodosContraTodos.getSistemaDeDesempate();
                                            
                                                        String nomeSistemaDeContagem = sistemaDeContagem.getNome();
                                                        String tipoSistemaDesempate = sistemaDeDesempate.getTipoDesempate();
                                                        String tipoSistemaDesempateSecundario = sistemaDeDesempate.getTipoDesempateSecundario();
                                                    %>
                                                <li>Sistema de contagem:&nbsp; <%=nomeSistemaDeContagem%></li>
                                                <li>Crtitério de desempate:&nbsp; <%=tipoSistemaDesempate%></li>
                                                <li>Crtitério de desempate secundário:&nbsp; <%=tipoSistemaDesempateSecundario%></li>

                                                <%}%>
                                                <%
                                                    if(sistemaDeCompeticao instanceof SistemaEliminatorio){
                                                
                                                    SistemaEliminatorio sistemaEliminatorio = (SistemaEliminatorio) sistemaDeCompeticao;
                                                    String sPossuiRepescagem;
                                            
                                                    if(sistemaEliminatorio.isRepescagem()){
                                                        sPossuiRepescagem = "sim";
                                                    }
                                                    else{
                                                        sPossuiRepescagem = "não";
                                                    }
                                            
                                                %>
                                                <li>Eliminatóias com repescagem:&nbsp; <%=sPossuiRepescagem%></li>
                                                    <%}%>
                                                    <%
                if(sistemaDeCompeticao instanceof SistemaMisto){
                                                
                SistemaMisto sistemaMisto = (SistemaMisto) sistemaDeCompeticao;
                String sPossuiRepescagem;
                                            
                if(sistemaMisto.isRepescagem()){
                    sPossuiRepescagem = "sim";
                }
                else{
                    sPossuiRepescagem = "não";
                }
                                            
                SistemaDeContagem sistemaDeContagem = sistemaMisto.getSistemadecontagem();
                SistemaDeDesempate sistemaDeDesempate = sistemaMisto.getSistemaDeDesempate();
                                            
                String nomeSistemaDeContagem = sistemaDeContagem.getNome();
                String tipoSistemaDesempate = sistemaDeDesempate.getTipoDesempate();
                String tipoSistemaDesempateSecundario = sistemaDeDesempate.getTipoDesempateSecundario();
                                            
                                            
                                                    %>
                                                <li>Sistema de contagem:&nbsp; <%=nomeSistemaDeContagem%></li>
                                                <li>Crtitério de desempate:&nbsp; <%=tipoSistemaDesempate%></li>
                                                <li>Crtitério de desempate secundário:&nbsp; <%=tipoSistemaDesempateSecundario%></li>
                                                <li>Eliminatóias com repescagem:&nbsp; <%=sPossuiRepescagem%></li>
                                                    <%}%>
                                            </ol>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-dager" data-dismiss="modal">Fechar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}}%>
                        </table>
                        <a href="formcadastrocompeticaomodalidadesolo.jsp?idCompeticao=<%=competicao.getIdCompeticao()%>" class="btn btn-success">
                            <!-- Adicionar icone -->
                            <i class="fas fa-plus"></i>&nbsp;Nova competição individual
                        </a>
                    </div>


                    <div class="tab-pane" id="messages" role="tabpanel">
                        <table class="table table-striped">
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
                            <a href="scripts/addUsuarioAdm.jsp?idUsuario=<%=upact.getIdUsuario()%>&idComp=<%=competicao.getIdCompeticao()%>&op=2" class="btn btn-danger">
                                <!-- Adicionar icone -->
                                <i class="fas fa-trash-alt"></i>
                            </a>
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
