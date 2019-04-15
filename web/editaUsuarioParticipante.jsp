
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SegmentoControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Segmento"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%-- 
    Document   : index.jsp
    Created on : 01/10/2018, 09:16:10
    Author     : Usuário
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
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

    
        <%
            Object usuario = session.getAttribute("usuario");
            
            if(usuario == null){
                response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
            }else if(usuario instanceof UsuarioParticipante2){
                
            UsuarioParticipante2 uPSession = (UsuarioParticipante2) usuario;
            UsuarioParticipante2Controle upc = new UsuarioParticipante2Controle();
            
           
            
            // Puxa o usuário participante do banco, com o intuito de buscar outras instâncias vinculadas a ele
            UsuarioParticipante2 up = upc.buscarPorId(uPSession.getIdUsuario());
            Atleta atleta = up.getAtleta();
            String onload = "";
            // Deixa o checkBox "estou/trabalho no campus IFPR IRATI" já selecionado caso o atleta seja do campus IFPR"
            if(atleta.getSegmento() != null){
                onload = "onload='selecionarCheckBox();'";
            }
        %>

        <body <%=onload%>> 
        
        <header>
            <jsp:include page="navbarUsuarioParticipante.jsp" flush="true" />
        </header>
        <%
            // Formata a data de nascimento do atleta
             SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
             String sDataNascimentoAtleta = sdf.format(atleta.getDataNascimento());
        %>
        <!-- Page Content -->
        <div class="container">
            <h1 class="my-4">Alterar dados</h1>
            <div class="card">
                <h5 class="card-header"></h5>
                <div class="card-body">

            
            <form action="scripts/scriptuserParticipante.jsp" method="POST" class="col">
                                
                        


                        <input type="hidden" name="c" value="2">
                        <input type="hidden" name="idUsuario" value="<%=up.getIdUsuario()%>">

                        <label for="" class="col-md-12">
                            Nome:
                            <input type="text" required class="form-control" name="nome" placeholder="Informe o seu nome" value="<%=up.getNome()%>">
                        </label>
                        <label for="" class="col-md-12">
                            Email:
                            <input type="email" required class="form-control" name="email" placeholder="Insira o seu email" value="<%=up.getEmail()%>">
                        </label>
                        <label for="" class="col-md-12">
                            Data de nascimento:
                            <input type="text" required class="form-control dataMask" name="dataNascimento" placeholder="Insira sua data de nascimento" value="<%=sDataNascimentoAtleta%>">
                        </label>
                        <label for="" class="col-md-12">
                            CPF:
                            <input type="text" required class="cpfMask form-control" name="cpf" placeholder="Insira seu CPF" value="<%=atleta.getCpf()%>">
                        </label>

                        <label for="" class="col-md-12">
                            Senha:
                            <input type="password" required class="form-control" id="password" name="senha" placeholder="Insira a sua senha" value="<%=up.getSenha()%>">
                            Confirme a Senha:
                            <input onkeyup="validatePassword()" type="password" required class="form-control" id="confirm_password" placeholder="Confirme a sua senha" value="<%=up.getSenha()%>">
                            <div class="invalid-feedback">

                            </div>
                        </label>

                        <label for="" class="col-md-12">
                            <input type="checkbox" value="1" id="radioSegmento" onclick="adicionarSelectTurma();">
                            Estudo/trabalho no IFPR - Campus Irati
                        </label>
                        
                        <div class="col-md-12" id="divSegmento">
                            <%
                                if(atleta.getSegmento() != null){
                            %>
                            
                                <label for="inputState">Segmento:</label>
                                <select id="modalidadeColetiva" class="form-control" name="segmento">
                                <%
                                    SegmentoControle segmentoControle = new SegmentoControle();
                                for(Segmento s: segmentoControle.buscarSegmentos()){
                                    
                                    String selected = "";
                                    if(s.getIdSegmento() == atleta.getSegmento().getIdSegmento()){
                                    // Deixa pré-selecionado o segmento em que o atleta está vinculado
                                    selected = "selected";  
                                    }
                                %>
                                
                                <option value="<%=s.getIdSegmento()%>" <%=selected%>><%=s.getNome()%></option>
                                <%}%>
                                
                                </select>
                                
                                <%}
                                %>

                        </div>

                        <div class="col-md-12" id="btnEnviar" style="margin-top:10px;">
                            <button type="submit" class="btn btn-success">Enviar</button>
                        </div>  

                        
                        </form> 
                </div>
            </div>
        </div>

                <!-- Bootstrap core JavaScript -->
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js"></script>

                <script>
                    
                $('.dataMask').mask('00/00/0000', {reverse: true});
                $('.cpfMask').mask('000.000.000-00', {reverse: true});
                    
                function selecionarCheckBox(){
                    radioSegmento.checked = true;
                }    
                
                function adicionarSelectTurma(){
                        if(radioSegmento.checked === true){
                        var div = document.getElementById("divSegmento");
                        div.innerHTML = '<label for="inputState">Segmento:</label><select id="modalidadeColetiva" class="form-control" name="segmento"><%SegmentoControle segmentoControle = new SegmentoControle();for(Segmento s: segmentoControle.buscarSegmentos()){%><option value="<%=s.getIdSegmento()%>"><%=s.getNome()%></option><%}%></select>';
                        }
                        if(radioSegmento.checked === false){
                        var div = document.getElementById("divSegmento"); 
                        div.innerHTML = '';
                        }
                }
                
            function validatePassword() {
                var password = document.getElementById("password")
                        , confirm_password = document.getElementById("confirm_password");
                if (password.value !== confirm_password.value) {
                confirm_password.setCustomValidity("As senhas não coincidem!");
                } else {
                confirm_password.setCustomValidity('');
                }
            }
                
                </script>
<%
} else {
    response.sendRedirect("login.jsp?e=Pagina de acesso restrito, entre primeiro");
}
%>
                </body>

                </html>


