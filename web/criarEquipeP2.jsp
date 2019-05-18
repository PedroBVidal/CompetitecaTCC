
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
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
        <style>
div.ex1 {
  background-color: lightblue;
  width: 110px;
  height: 110px;
  overflow: scroll;
}

div.ex2 {
  background-color: lightblue;
  width: 110px;
  height: 110px;
  overflow: hidden;
}

div.ex3 {
  width: 600px;
  height: 330px;
  overflow: auto;
}

div.ex4 {
  background-color: lightblue;
  width: 110px;
  height: 110px;
  overflow: visible;
}
</style>
    </head>

    <body>
        <%
            UsuarioParticipante2 up = (UsuarioParticipante2) session.getAttribute("usuario");
            if(up == null){
                
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else{
                
                int idModalidadeColetivaSelecionada = Integer.parseInt(request.getParameter("modalidade"));
                String nomeEquipe = request.getParameter("nomeEquipe");
                int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
                

        %>

        <!-- Navigation -->
        
        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <h1 class="my-4">Criar uma nova equipe</h1>
            <div class="card">
                <div class="card-header">
                    Etapa 2
                </div>
                
                <div class="card-body">
                    

                    <form action="" method="POST" class="col" name="formCompeticoesColetivas">
                        <input type="hidden" value="<%=idUsuario%>" name="idUsuario">
                        <input type="hidden" value="<%=nomeEquipe%>" name="nomeEquipe">
                        <input type="hidden" value="<%=idModalidadeColetivaSelecionada%>" name="idModalidadeColetivaSelecionada">
      
                                <%
                                    ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
                                    CompeticaoControle competicaoControle = new CompeticaoControle();
                                    
                                    ModalidadeColetiva modalidadeColetivaSelecionada = mcc.buscaPorId(idModalidadeColetivaSelecionada);
                                    boolean flag;
                                    List<CompeticaoModalidadeColetiva> competicoesModalidadesColetivas = new ArrayList<>();
                                    
                                    int contadorCheckBox = 0;
                                    
                                    for(Competicao cpt : competicaoControle.buscarTodasCompeticoes()){
                                        System.out.println("Nome competição" + cpt.getNome());
                                        for(CompeticaoModalidadeColetiva cmc : cpt.getCmodalidadecole()){
                                            System.out.println(cmc.getNomeCompeticao());
                                        if(cmc.getModalidadeColetiva().getIdModColetiva() == idModalidadeColetivaSelecionada){
                                        System.out.println("entrei aqui");    
                                        contadorCheckBox++;  
                                        flag = true;
                                        
                                        String idCheckBox = "checkBox"+contadorCheckBox;
                                        String idTdNomeCmc = "idTdNomeCmc"+contadorCheckBox;
                                        String idTdNomeCpt = "idTdNomeCpt"+contadorCheckBox;
                                        String idTr = "idTr"+contadorCheckBox;
                                %>
                                
                                <%
                                    if(contadorCheckBox == 1){
                                %>
                                <label  for="" class="col-md-12">
                                    <div class="row">
                                        <h4 class="col-md-11">
                                            Selecione as competições em que sua equipe ficará aberta
                                        </h4>
                                    </div>
                                </label>

                                <!-- Modal Ajuda-->
                                <div class="modal fade" id="modalAjuda" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Ajuda</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Nesse formulário você deve selecionar as competições em que sua equipe ficará aberta para que outros atletas solicitem entrada nela.</p>
                                            </div>
                                            <div class="modal-footer">

                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <label  for="" class="col-md-12">
                                    <div class="form-group input-group">
                                        <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                            </a></span>
                                        <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                                    </div>
                                </label>

                                

                                    <label for="" class="col-md-12"> 
                                        <table class="table table-sm col-md-12" id="tabela">
                                            <thead>
                                                <tr>
                                                    <th scope="col">Competição</th>
                                                    <th scope="col">Evento</th>
                                                    <th scope="col">Modalidade</th>
                                                    <th scope="col"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                <%}%>
                                <tr id="<%=idTr%>" class="">
                                <input id="<%=idTdNomeCmc%>" type="hidden" value="<%=cmc.getNomeCompeticao()%>">
                                <input id="<%=idTdNomeCpt%>" type="hidden" value="<%=cpt.getNome()%>">
                                
                                
                                <td><%=cmc.getNomeCompeticao()%></td>
                                <td><%=cpt.getNome()%></td>
                                <td><%=modalidadeColetivaSelecionada.getNome()%></td>
                                <td>
                                    
                                    <input type="checkbox" id="<%=idCheckBox%>" name="<%=idCheckBox%>" value="<%=cmc.getIdCompeticaoModalidade()%>" onclick="mudarCorCelula(<%=contadorCheckBox%>)">
                                      
                                        <label></label>
                                </td>
                                
                                <%}%>
                                </tr>
                                <%}}%>
                    

                        </tbody>
                    </table>

                </label>
                                
                <%
                    if(contadorCheckBox != 0){
                %>
                <input id="contador" name="contador" type="hidden" value="<%=contadorCheckBox%>">
                 <label for="" class="col-md-12">
                    <div class="row">  
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-success" data-toggle="modal" onclick="abrirModalCadastro(<%=contadorCheckBox%>);">
                        Próximo
                    </button>
                        <button style="margin-left: 10px;" type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAjuda">
                            <i class="far fa-question-circle"></i>&nbsp;Ajuda
                        </button>
                    </div>   
                </label>
                </form> 


                    <!-- Modal competições selecionadas-->
                    <div class="modal fade" id="modalCompeticoesVinculadas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deseja realmente deixar sua equipe aberta às seguintes competições?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <table class="table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">Competição</th>
                                                <th scope="col">Evento</th>
                                            </tr>
                                        </thead>
                                        <tbody id="bodyModal">


                                        </tbody>
                                    </table>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="enviarFormulario(1);">Sim</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal nenhuma competição vinculada-->
                    <div class="modal fade" id="modalNenhumaCompeticaoVinculada" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deseja realmente cadastrar sua equipe?</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p class="font-weight-bold">Você não selecionou nehuma competição a ser vinculada a sua equipe</p>
                                    <p>Dessa forma, atletas cadastrados no sistema não poderão solicitar entrada em sua equipe.</p>
                                    <p><span class="font-weight-bold">Obs:</span> No entanto, você (administrador da equipe) poderá convidar os integrantes da sua equipe normalmente.</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Não</button>
                                    <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="enviarFormulario(1);">Sim</button>
                                </div>
                            </div>
                        </div>
                    </div>
               <%}%>
                <%
                    if(contadorCheckBox == 0){
                %>
                <input id="contador2" name="contador" type="hidden" value="<%=contadorCheckBox%>">
                <div class="card text-center">
                    <div class="card-header">
                        
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Não foi encontrada nenhuma competição de <%=modalidadeColetivaSelecionada.getNome()%></h5>
                        <p><span class="font-weight-bold">Obs:</span> No entanto, você (administrador da equipe), poderá criar normalmente sua equipe e convidar seus integrantes, para uma posterior competição dessa modalidade.</p>

                        <button class="btn btn-primary" onclick="enviarFormulario(2);">Criar equipe</button>
                    </div>
                    <div class="card-footer text-muted">
                        
                    </div>
                </div>
                
                </form>
                <%}%>
                

                
                
                
                
                        </div>
                    </div>
             
            </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>

        <script>
            $('input#txt_consulta').quicksearch('table#tabela tbody tr');
            

            function acionarModalCompeticoesVinculadas(){
                $('#modalCompeticoesVinculadas').modal('show');
            }
            
            function acionarModalNenhumaCompeticaoVinculada(){
                $('#modalNenhumaCompeticaoVinculada').modal('show');
            }
            
            function enviarFormulario(op){
                
               if(op === 1){
               document.forms["formCompeticoesColetivas"].action = "scripts/cadastrarEquipe.jsp";
               document.forms["formCompeticoesColetivas"].submit();
               }
               
               if(op === 2){
               document.forms["formCompeticoesColetivas"].action = "scripts/cadastrarEquipe.jsp";
               document.forms["formCompeticoesColetivas"].submit();
               }
               
            }
            
            
            
           function mudarCorCelula(id){
               if(document.getElementById('checkBox'+id).checked === true){
               document.getElementById('idTr'+id).className = 'table-success';
               }
               else{
               document.getElementById('idTr'+id).className = ''; 
               }
           }
           
            function abrirModalCadastro(contador){
                
                   
                var dadosBodyModal = '';
                var existeCheckBoxSelecionado = false;
                
                for (var i = 1; i <= contador; i++) {
                    

                    var checkBox = document.getElementById("checkBox"+i);
                    
                    if(checkBox.checked === true){
                        
                        existeCheckBoxSelecionado = true;
                        var bodyModal = document.getElementById("bodyModal");
                        var nomeCompeticaoColetiva = document.getElementById("idTdNomeCmc"+i).value;
                        var nomeEvento = document.getElementById("idTdNomeCpt"+i).value;

                        
                       
                       dadosBodyModal += '<tr><td>'+nomeCompeticaoColetiva+'</td><td>'+nomeEvento+'</td></tr>';
                       
                    }
                }
                if(existeCheckBoxSelecionado){
                bodyModal.innerHTML = dadosBodyModal;
                acionarModalCompeticoesVinculadas();
                }
                else{
                    acionarModalNenhumaCompeticaoVinculada();
                }

            }
        </script>
        <%
        }
        %>
    </body>

</html>


