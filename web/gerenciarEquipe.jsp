<%-- 
    Document   : gerenciamentoDeCompeticao
    Created on : 27/10/2018, 13:45:59
    Author     : Usuário
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
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
        <link href="css/estilo.css" rel="stylesheet">
        <style>
            .overflowTableTabPane {
                overflow: auto; width: 920px; height: 350px;
            }
        </style>
    </head>

    <body>
        <%
            UsuarioParticipante2 up2 = (UsuarioParticipante2) session.getAttribute("usuario");
            if (up2 == null) {

                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            } else {


                
                
        %>


        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <%  
                
                request.setCharacterEncoding("UTF-8");
                if (request.getParameter("msg") != null) {
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
            <%
                System.out.println("ENTREI AQUI");
                EquipeControle equipeControle = new EquipeControle();
                UsuarioParticipante2Controle userParticipanteControle = new UsuarioParticipante2Controle();

                int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
                Equipe equipe = equipeControle.buscarPorId(idEquipe);


            %>
            <!-- Page Heading/Breadcrumbs -->

            <h1 class="mt-4 mb-3 fontNunito">Gerenciando equipe <span class="fontNunito" style="font-style: italic;"><%=equipe.getNome()%></span>

            </h1><br>


            <!-- List group -->
            <div class="row">
                <div class="list-group col-2" id="myList" role="tablist">
                    <a class="list-group-item list-group-item-action active" data-toggle="list" href="#membros" role="tab">Minha equipe</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#adicionarMembros" role="tab">Adicionar membros</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#competicoes" role="tab">Buscar Competições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#mcompeticoes" role="tab">Minhas Competições</a>
                    <a class="list-group-item list-group-item-action" data-toggle="list" href="#solicitacoes" role="tab">Solicitações</a>

                </div>

                <!-- Tab panes -->
                <div class="tab-content col-10">

                    <div class="tab-pane dark active" id="membros" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta1" placeholder="Consultar" type="text" class="form-control">
                        </div>


                        <div class="overflowTableTabPane">

                        <table id="tabela1" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Atleta</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>

                                <%
                                    for (Atleta atleta : equipe.getAtletas()) {
                                        String nome = atleta.getUsuarioParticipante().getNome();
                                        String email = atleta.getUsuarioParticipante().getEmail();

                                %>
                            <tr>
                            <td><%=nome%></td>
                            <td><%=email%></td>
                            <td>
                                <a href="scripts/addUsuarioAdm.jsp?idUsuario=<%=atleta.getIdAtleta()%>&idComp=<%=atleta.getIdAtleta()%>&op=1" class="btn btn-danger">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </td>    
                            <%}%>
                            </tr>
                            </tbody>



                        </table>
                        </div>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta1').quicksearch('table#tabela1 tbody tr');

                        </script>
                    </div>
                               
                            
                    <div class="tab-pane dark" id="competicoes" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta2" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="tabela2" class="table table-striped">
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

                                    for (Competicao cpt : cc.buscarTodasCompeticoes()) {

                                        if (!cpt.isInativo() && !cpt.isPrivado()) {

                                            String nomeCompeticao = cpt.getNome();
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            String dataInicio = sdf.format(cpt.getDataInicio());
                                            String dataTermino = sdf.format(cpt.getDataTermino());


                                %>
                            <tr>    
                            <td><%=nomeCompeticao%></td>
                            <td><%=dataInicio%></td>
                            <td><%=dataTermino%></td>
                            <td><a href="forminscricaocompeticao.jsp?idCompeticao=<%=cpt.getIdCompeticao()%>&idEquipe=<%=equipe.getIdEquipe()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-clipboard-list"></i>
                                </a> &nbsp;
                            </td>
                            </tr>
                            <%}
                                }%>
                            </tbody>
                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta2').quicksearch('table#tabela2 tbody tr');

                        </script>

                    </div>


                    <div class="tab-pane" id="mcompeticoes" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta3" placeholder="Consultar" type="text" class="form-control">
                        </div>
                        <table id="tabela3" class="table table-striped">
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

                                    for (CompeticaoModalidadeColetiva cpt : equipe.getCompeticoesModalidadeColeivas()) {
                                        Competicao cptct = cpt.getCompeticao();
                                        if (!cptct.isInativo() && !cptct.isPrivado()) {

                                            String nomeCompeticao = cptct.getNome();
                                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                            String dataInicio = sdf.format(cptct.getDataInicio());
                                            String dataTermino = sdf.format(cptct.getDataTermino());


                                %>
                            <tr>
                                
                            <td><%=nomeCompeticao%></td>
                            <td><%=dataInicio%></td>
                            <td><%=dataTermino%></td>
                            <td><a href="gerenciarCompModColetiva.jsp?id=<%=cptct.getIdCompeticao()%>" class="btn btn-success">
                                    <!-- Adicionar icone -->
                                    <i class="fas fa-clipboard-list"></i>
                                </a> &nbsp;
                            </td>
                            
                            </tr>
                            <%}
                            }%>
                            </tbody>
                            
                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta3').quicksearch('table#tabela3 tbody tr');

                        </script>

                    </div>






                    <div class="tab-pane" id="solicitacoes" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta4" placeholder="Consultar" type="text" class="form-control">
                        </div>




                        <table id="tabela4" class="table table-striped">
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Usuário</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                            <td>Nome</td>
                            <td>Nome</td>
                            <td>Nome</td>

                            </tbody>



                        </table>
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta4').quicksearch('table#tabela4 tbody tr');

                        </script>
                    </div>
                            
            <!-- Tab pane adcionar membros -->                
            <div class="tab-pane" id="adicionarMembros" role="tabpanel">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta4" placeholder="Consultar" type="text" class="form-control">
                        </div>
                
                
                <form action="" method="POST" name="formAdicionarMembrosEquipe">

                    <div class="overflowTableTabPane">
                
                        <table id="tabela4" class="table table-striped">
                            
                            <thead class="table-dark">
                                <tr>
                                    <th scope="col">Nome usuário</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Ação</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%
                                   boolean flag = false;
                                    int contador = 0;
                                    Atleta atletaAdmEquipe = equipe.getAdministrador().getAtleta();
                                    List<Atleta> equipeGetAtletas = equipe.getAtletas();
                                    List<Atleta> integrantesEquipe = equipeGetAtletas;
                                    
                                    integrantesEquipe.add(atletaAdmEquipe);
                                   
                                    
                                    for(UsuarioParticipante2 userParticipante : userParticipanteControle.buscarTodos()){
                                        flag = false;
                                        
                                        
                                        for(Atleta a : integrantesEquipe){
                                            if(a.getIdAtleta() == userParticipante.getAtleta().getIdAtleta()){                                                
                                                flag = true;
                                            }
                                            }
                                    if(flag == false){
                                    contador++;    
                                    
                                    String idTr = "tr"+contador;
                                    String idBtnAdd = "btnAdd"+contador;
                                    String idBtnModalInfo = "btnAdd"+contador;
                                    String idInputSegmento = "inputSegmento"+contador;
                                     String idInputEmail = "inputEmail"+contador;
                                    String idInputNome = "inputNome"+contador;
                                    String idCheckBox = "checkBox"+contador;
                                    String dataTargetModal = "modalInfo"+contador;
                                    
                                    Atleta atleta = userParticipante.getAtleta();
                                %>
                                <!--Verifica se o atleta possui um segmento-->   
                            <%
                                if(atleta.getSegmento() != null){
                            %>
                            <input type="hidden" id="<%=idInputSegmento%>" value="<%=atleta.getSegmento().getNome()%>">
                            <%} else{%>
                            <input type="hidden" id="<%=idInputSegmento%>" value="">
                            <%}%>
                            <input type="hidden" id="<%=idInputNome%>" value="<%=userParticipante.getNome()%>">
                            <input type="hidden" id="<%=idInputEmail%>" value="<%=userParticipante.getEmail()%>">

                                                        
                                <tr id="<%=idTr%>" class="">
                                    <td><%=userParticipante.getNome()%></td>
                                    <td><%=userParticipante.getEmail()%></td>
                                    <td>
                                        
                                           
                                        <button type="button" class="btn btn-success" id="<%=idBtnAdd%>" onclick="mudarCorCelula(<%=contador%>);"><i class="fas fa-plus"></i></button>
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#<%=dataTargetModal%>"><i class="far fa-eye"></i></button>
                                        <input type="checkbox" hidden="true" id="<%=idCheckBox%>" name="<%=idCheckBox%>" value="<%=atleta.getIdAtleta()%>">

                                                                              
                                        
                                    </td>
                                </tr>
                                <!-- Modal INFO USER PARTICIPANTE -->
                                <div class="modal fade" id="<%=dataTargetModal%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Nome: <%=userParticipante.getNome()%></h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <%
                                                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                                    String dataNascimento = sdf.format(userParticipante.getAtleta().getDataNascimento());
                                                %>
                                                <p><span class="font-weight-bold">Email: </span><%=userParticipante.getEmail()%></p>
                                                <p><span class="font-weight-bold">Data de nascimento: </span><%=dataNascimento%></p>
                                                <%
                                                    
                                                    if(userParticipante.getAtleta().getSegmento() != null){
                                                %>
                                                <p><span class="font-weight-bold">Segmento IFPR-IRATI: </span><%=userParticipante.getAtleta().getSegmento().getNome()%></p>
                                                <%}%>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}}%>
                            </tbody>

                        </table>

                    </div>
                   
                    <!--Valores fixos a serem puxados pelo form-->                                                      
                    <input type="hidden" name="contador" value="<%=contador%>">
                    <input type="hidden" name="idEquipe" value="<%=idEquipe%>">

                    <div id="divBtnForm" style="margin-top: 10px;">

                    </div>
                   
                </form>        
                
                            
            <!--MODAL "CONFIRMAÇÃO ADICIONAR MEMBROS -->
                <div class="modal fade" id="modalAtletasAdicionados" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deseja realmente adicionar os seguintes atletas a sua equipe?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">Nome</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Extra</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyModal">


                                        </tbody>
                                    </table>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="enviarFormulario();">Sim</button>
                                </div>
                            </div>
                        </div>
                    </div>            
                            
                    <%
                        System.out.println("Atletas da equipe: "+ equipe.getAtletas());
                        System.out.println("Estou no final da página gerenciar equipe");
                        System.out.println("Integrantes da equipe: "+ integrantesEquipe);
                        System.out.println("ADM DA EQUIPE: " + atletaAdmEquipe);
                        
                    %>      
                            
                            
                            
                            
                            
                        <script>
                            //Código de busca da tabela
                            $('input#txt_consulta4').quicksearch('table#tabela4 tbody tr');

                        </script>
                    </div>     
                                                        

                </div>

            </div>
        </div>
                            




        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script>
        
        var celulasSelecionadas = 0;
        
           function mudarCorCelula(id){
               
               
               var checkBox = document.getElementById('checkBox'+id);
               
               if(checkBox.checked === false){
               
               document.getElementById('tr'+id).className = 'table-success';
               checkBox.checked = true;
               celulasSelecionadas++;
               }
               else{
               document.getElementById('tr'+id).className = '';
               checkBox.checked = false;
               celulasSelecionadas--;
               }
               
               var divBtnForm = document.getElementById("divBtnForm");
               if(celulasSelecionadas !== 0){
                   divBtnForm.innerHTML = '<button type="button" class="btn btn-success" onclick="abrirModalCadastro(<%=contador%>);">Adicionar membros</button>';
               }
               else{
                   divBtnForm.innerHTML = '';
 
               }
           }
           
           function enviarFormulario(){

               document.forms["formAdicionarMembrosEquipe"].action = "scripts/adicionarMembrosEquipe.jsp";
               document.forms["formAdicionarMembrosEquipe"].submit();

            }
           
           function abrirModalCadastro(contador){
                
                   
                var dadosBodyModal = '';
                var existeCheckBoxSelecionado = false;
                
                for (var i = 1; i <= contador; i++) {
                    

                    var checkBox = document.getElementById("checkBox"+i);
                    
                    if(checkBox.checked === true){
                        
                        existeCheckBoxSelecionado = true;
                        var bodyModal = document.getElementById("bodyModal");
                        var nome = document.getElementById("inputNome"+i).value;
                        var segmento = document.getElementById("inputSegmento"+i).value;
                        var email = document.getElementById("inputEmail"+i).value;
                        
                       
                       dadosBodyModal += '<tr><td>'+nome+'</td><td>'+email+'</td><td>'+segmento+'</td></tr>';
                       
                    }
                }
                if(existeCheckBoxSelecionado){
                bodyModal.innerHTML = dadosBodyModal;
                acionarModalAtletasAdicionados();
                }

            }
            
            function acionarModalAtletasAdicionados(){
                $('#modalAtletasAdicionados').modal('show');
            }
            
        </script>
        <%
            }
        %>
    </body>

</html>
