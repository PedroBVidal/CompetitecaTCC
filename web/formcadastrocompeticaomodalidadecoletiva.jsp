<%-- 
    Document   : formcadastromodalidadesolo
    Created on : 27/10/2018, 21:12:52
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SistemaDeContagemControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
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
                
                int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
        %>

        <!-- Navigation -->


        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3">Cadastrar nova competição coletiva


            </h1><br>



            <!-- Content Row -->
            <div class="row">
                
                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
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
                    

                    
                                <!-- List group -->
            <div class="row">
            <div class="list-group col-2" id="myList" role="tablist">
                <a class="list-group-item list-group-item-action active" data-toggle="list" href="#modalidadeSolo" role="tab" id="passo1">Passo 1</a>
                <a class="list-group-item list-group-item-action" data-toggle="list" href="#profile" role="tab" id="passo2">Passo 2</a>
            </div>
                
                
            
            <!-- Tab panes -->
            
            <div class="tab-content col-10">
                
                    
                <div class="tab-pane active dark" id="modalidadeSolo" role="tabpanel">
                    <!--<form action="cadastrarCompeticaoModalidadeColetiva.jsp?idCompeticao=<>">-->
                    <div class="card">
                        <div class="card-header">
                            Cadastro
                        </div>
                        
                        <div class="card-body">
                            <div class="form-group">
                                <label for="formGroupExampleInput">Nome da competição:</label>
                                <input type="text" class="form-control" id="formGroupExampleInput" name="nomeCompeticao">
                            </div>
                            
                           <div class="form-group">
                                <label for="inputState">Modalidade coletiva:</label>
                                <select id="modalidadeColetiva" class="form-control" name="modalidadeColetiva">
                                    <%
                                        ModalidadeColetivaControle modalidadeColetivaControle = new ModalidadeColetivaControle();
                                        
                                        for(ModalidadeColetiva modalidadeColetiva: modalidadeColetivaControle.buscarTodosModalidadeColetiva()){
                                    
                                    %>
                                    <option value="<%=modalidadeColetiva.getIdModColetiva()%>"><%=modalidadeColetiva.getNome()%></option>
                                    <%}%>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputState">Sistema de competição:</label>
                                <select id="sisCompeticao" class="form-control" name="sistemaCompeticao">
                                    <option selected>Sistema todos contra todos</option>
                                    <option>Sistema eliminatório</option>
                                    <option>Sistema misto</option>
                                </select>
                            </div>

                            <button href="#" class="btn btn-primary" onclick="proximoPasso()">Próximo passo</button>
                        </div>
                    </div>
                </div>

                
                <div class="tab-pane" id="profile" role="tabpanel">
                    <div class="card">
                        <div class="card-header">
                            Configurar sistema de competição
                        </div>
                        
                        <div class="card-body">

                            <div class="form-group">
                                <label for="inputState">Sistema de contagem:</label>
                                <select id="modalidadeColetiva" class="form-control" name="sistemaContagem">
                                    <%
                                        SistemaDeContagemControle sistemaDeContagemControle = new SistemaDeContagemControle();
                                        
                                        for(SistemaDeContagem sistemaDeContagem: sistemaDeContagemControle.buscarTodos()){
                                    %>
                                    <option value="<%=sistemaDeContagem.getIdSistemaDeContagem()%>"><%=sistemaDeContagem.getNome()%></option>
   
                                    <%}%>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="inputState">Sistema de desempate:</label>
                                <select id="modalidadeColetiva" class="form-control" name="sistemaDesempate">
                                    <option selected>Pontos sofridos</option>
                                    <option>Pontos marcados</option>
                                    <option>Vitorias</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="inputState">Sistema de desempate secundário:</label>
                                <select id="modalidadeColetiva" class="form-control" name="sistemaDesempateSecundario">
                                    <option selected>Pontos sofridos</option>
                                    <option>Pontos marcados</option>
                                    <option>Vitorias</option>
                                </select>
                            </div>
                            
                            <div class="form-group" id="divSisMistoElim">
                                
                            </div>

                                <a href="scripts/cadastrarCompeticaoModalidadeColetiva.jsp" class="btn btn-success">Cadastrar competição</a>
                        </div>
                    </div>
                    
                
                </div>
                    
               
            </div>

        </div>
                    
                    
                    
                    
                </div>
            </div>
            <!-- /.row -->

        </div>




        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
            $('.naozeibeu').mask('00/00/0000', {reverse: true});
            
            function proximoPasso(){
                
                $('#myList a:last-child').tab('show');
                
                document.getElementById("passo1").className = "list-group-item list-group-item-action disabled";
                
                var e = document.getElementById("sisCompeticao");
                var itemSelecionado = e.options[e.selectedIndex].text;
                
                alert(itemSelecionado);
                
                if(itemSelecionado === "Sistema eliminatório" || itemSelecionado == "Sistema misto"){
                    var div = document.getElementById("divSisMistoElim");
                    alert("yes");
                    div.innerHTML = '<div class="form-group form-check"><input type="checkbox" class="form-check-input" id="exampleCheck1"><label class="form-check-label" for="exampleCheck1">Emilinatórias com repescagem?</label></div>';
                }
            }
            
            
        </script>
        <%
        }
        %>
    </body>

</html>
