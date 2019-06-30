
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.LocalControle"%>
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
        <script>

            function limpa_formulário_cep() {
                //Limpa valores do formulário de cep.
                document.getElementById('rua').value = ("");
                document.getElementById('bairro').value = ("");
                document.getElementById('cidade').value = ("");
                document.getElementById('uf').value = ("");
                document.getElementById('ibge').value = ("");
            }

            function meu_callback(conteudo) {
                if (!("erro" in conteudo)) {
                    //Atualiza os campos com os valores.
                    document.getElementById('rua').value = (conteudo.logradouro);
                    document.getElementById('bairro').value = (conteudo.bairro);
                    document.getElementById('cidade').value = (conteudo.localidade);
                    document.getElementById('uf').value = (conteudo.uf);
                    document.getElementById('ibge').value = (conteudo.ibge);
                } //end if.
                else {
                    //CEP não Encontrado.

                    alert("CEP não encontrado.");
                    limpa_formulário_cep();
                }
            }

            function pesquisacep(valor) {
                // $('.cepfilter').mask('00000-000', {reverse: true});
                //Nova variável "cep" somente com dígitos.
                var cep = valor.replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if (validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        document.getElementById('rua').value = "...";
                        document.getElementById('bairro').value = "...";
                        document.getElementById('cidade').value = "...";
                        document.getElementById('uf').value = "...";


                        //Cria um elemento javascript.
                        var script = document.createElement('script');

                        //Sincroniza com o callback.
                        script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                        //Insere script no documento e carrega o conteúdo.
                        document.body.appendChild(script);

                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulário_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulário_cep();
                }
            }
            ;
        </script>
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
                
        %>


        <header>
            <jsp:include page="navbarUsuarioAdministrador.jsp" flush="true" />
        </header>

        <!-- Page Content -->
        <div class="container">
            <br>
            <h1 class="my-4 titulos">Criar um novo Local</h1>


            <form action="scripts/editarLocal.jsp" method="POST" class="col">
                <input type="hidden" name="op" value="3">
                <input type="hidden" name="id" value="0">

                <label for="" class="col-md-12">
                    Nome:
                    <input type="text" required class="form-control" name="nome" placeholder="Informe o nome do local" >
                </label>
                <div class="form-group col-md-12">
                    <label>CEP:</label>
                    <input type="text" onblur="pesquisacep(this.value);" class="naozeibeu form-control" name="cep" id="cep" placeholder="Insira o CEP">
                </div>
                <label for="" class="col-md-12">
                    Rua:
                    <input type="text" required class="form-control" name="rua" id="rua" placeholder="Insira a rua" >
                </label>
                <label for="" class="col-md-12">
                    Número:
                    <input type="text" required class="form-control" name="numero" id="numero" placeholder="Insira o número" >
                </label>
                <label for="" class="col-md-12">
                    Bairro:
                    <input type="text" required class="form-control" name="bairro" id="bairro" placeholder="Insira o Bairro" >
                </label>
                <label for="" class="col-md-12">
                    Cidade:
                    <input readonly type="text" required class="form-control" name="cidade" id="cidade" placeholder="Insira a cidade">
                </label>
                <label for="" class="col-md-12">
                    Estado:
                    <input readonly type="text" required class="form-control" name="estado" id="uf" placeholder="Insira a rua" >
                </label>


                <button type="submit" class="btn btn-success">Salvar</button>


            </form> 
        </div>


        <!-- Bootstrap core JavaScript -->


        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>
        <script>
                        $('.naozeibeu').mask('00000-000', {reverse: true});
        </script>
        <%
        }
        %>
    </body>

</html>

