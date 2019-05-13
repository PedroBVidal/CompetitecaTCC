
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
                String nomeModalidade = request.getParameter("nomeEquipe");
                
                if(request.getParameter("idEquipe") != null){
                    int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
                }
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
                    <label  for="" class="col-md-12">
                    Selecione as competições que você deseja participar:
                    </label>
                    <label  for="" class="col-md-12">
                        <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                                </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>
                    </label>
                    
                <label for="" class="col-md-12"> 
                    <table class="table table-sm col-md-12">
                        <thead>
                            <tr>
                                <th scope="col">Evento</th>
                                <th scope="col">Competição</th>
                                <th scope="col">Modalidade</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <%
                                    ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
                                    CompeticaoControle competicaoControle = new CompeticaoControle();
                                    
                                    ModalidadeColetiva modalidadeColetivaSelecionada = mcc.buscaPorId(idModalidadeColetivaSelecionada);
                                    
                                    List<CompeticaoModalidadeColetiva> competicoesModalidadesColetivas = new ArrayList<>();
                                    
                                    for(Competicao cpt : competicaoControle.buscarTodasCompeticoes()){
                                        
                                        for(CompeticaoModalidadeColetiva cmc : cpt.getCmodalidadecole()){
                                            
                                        if(cmc.getIdCompeticaoModalidade() == idModalidadeColetivaSelecionada){
                                    
                                %>
                                <td><%=cpt.getNome()%></td>
                                <td><%=cmc.getNomeCompeticao()%></td>
                                <td><%=modalidadeColetivaSelecionada.getNome()%></td>
                                <td>
                                    <a class="btn btn-primary" href="scripts/cadastrarEquipe.jsp?nomeModalidade=<%=nomeModalidade%>&idModalidade=<%=idModalidadeColetivaSelecionada%>&idCompeticaoColetiva=<%=cmc.getIdCompeticaoModalidade()%>" role="button">Desejo participar</a>
                                </td>
                                
                                <%}%>
                                
                                <%}}%>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td colspan="2">Larry the Bird</td>
                                <td>@twitter</td>
                            </tr>
                        </tbody>
                    </table>
                
                </label>
                <!-- -->   
                <label for="" class="col-md-12"> 
                    <table class="table table-sm col-md-12">
                        <thead>
                            <tr>
                                <th scope="col">Evento</th>
                                <th scope="col">Competição</th>
                                <th scope="col">Modalidade</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                
                                    
                            </tr>
 
                        </tbody>
                    </table>
                
                </label>    




                <label for="" class="col-md-12">
                <a class="btn btn-primary" href="#" role="button">Próximo</a>
                </label>
                        </div>
                    </div>
             
            </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>


        <%
        }
        %>
    </body>

</html>


