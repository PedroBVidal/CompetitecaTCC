
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
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
                request.setCharacterEncoding("UTF-8");
        %>

        <!-- Navigation -->


        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <h1 class="mt-4 mb-3 titulos">Criar evento


            </h1><br>



            <!-- Content Row -->
            <div class="row">

                <!-- Content Column -->
                <div class="col-lg-9 mb-4">
            <%
               
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
                    <form action="scripts/cadastrarcompeticao.jsp" method="POST" class="col">
                        <input type="hidden" name="op" value="2">
                        <input type="hidden" name="id" value="0">
                        <input type="hidden" name="iduser" value="<%=up.getIdUsuario()%>">

                        <div class="form-group">
                            <label>Nome da competição:</label>
                            <input required type="text" class="form-control" name="nomeCompeticao">
                        </div>
                        <div class="form-group">
                            <label>Data de início das inscrições:</label>
                            <input required type="text" class="naozeibeu form-control" name="dataInicioInsc" id="dataInicioInscricao">
                        </div>
                        <div class="form-group">
                            <label> Data de término das Inscrições:</label>
                            <input required type="text" class="naozeibeu form-control" name="dataTerminoInsc"  id="dataTerminoInscricao">
                            <div id="datasInscricaoIncorretas">
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Data de início da competição:</label>
                            <input required type="text" class="naozeibeu form-control" name="dataInicioCompeticao"  id="dataInicioCpt">
                        </div>
                        <div class="form-group">
                            <label> Data de término da competição:</label>
                            <input required type="text" class="naozeibeu form-control" name="dataTerminoCompeticao"  id="dataTerminoCpt">
                            <div id="datasCompeticaoIncorretas">
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Informação adicional sobre a competição(opcional):</label>
                            <textarea style="resize:none;" name="infoadicional" class="form-control"></textarea>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="checkBoxInterseries" value="1">&nbsp;<label>Competição do tipo interséries? <a href="javascript:abirModalSaibaMaisInterseries();" class="badge badge-primary"><i class="fas fa-info"></i>&nbsp;Ajuda</a></label><br>
                            
                        </div>
                        <button type="submit" class="btn btn-success">
                            <!-- Adicionar icone onclick="validarFormulario();"-->
                            <i class="fas fa-plus"></i>&nbsp;Criar
                        </button>
                    </form>
                </div>

                        
            </div>
            <!-- /.row -->
            <!-- Modal Ajuda interséries-->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Ajuda</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Em uma competição do tipo interséries apenas equipes de um mesmo ano poderão inscrever-se nas competições coletivas.</p>
                            <p>Exemplo: Uma equipe do 2º ANO pode ser composta por membros do 2ºANO AGRO E 2ºANO INFO.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <!-- Bootstrap core JavaScript -->

        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="js/moment.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
            $('.naozeibeu').mask('00/00/0000', {reverse: true});
            
            function abirModalSaibaMaisInterseries(){
                $('#exampleModal').modal('show');
            }
            
            function validarFormulario(){
                alert("validar");
                var dataInicioCompeticao = document.getElementById("dataInicioCpt").value;
                var dataTerminoCompeticao = document.getElementById("dataTerminoCpt").value;
                var dataInicioInscricao = document.getElementById("dataInicioInscricao").value;
                var dataTerminoIncricao = document.getElementById("dataTerminoInscricao").value;
                var divDatasCompeticaoIncorretas = document.getElementById("datasCompeticaoIncorretas");
                var divDatasInscricaoIncorretas = document.getElementById("datasInscricaoIncorretas");
                
                
                var dateString = dataInicioCompeticao;
                var momentObj = moment(dataInicioCompeticao, 'dd/MM/yyyy');
                
                alert(momentObj);
                //var momentString = momentObj.format('YYYY-MM-DD');
                
                
                //var day = moment(dataInicioCompeticao);
                
                //alert(dataInicioCompeticao);
                
                //alert("DATA INICIO INCRICAO: "+ dataInicioInscricao);
                //alert("DATA TERMINO INCRICAO: "+ dataTerminoIncricao);
                //alert("DATA INCIO COMPETICAO: "+ dataInicioCompeticao);
                //alert("DATA INICIO COMPETICAO: "+ dataTerminoCompeticao);
                
                                  //document.forms["formCompeticaoModalidadeColetiva"].action = "scripts/cadastrarCompeticaoModalidadeColetiva.jsp";

                if(dataInicioInscricao <= dataTerminoIncricao){
                    alert("Entrei aqui!");
                  

                }

                

            }
            
            
            
        </script>
        <%
        }
        %>
    </body>

</html>

