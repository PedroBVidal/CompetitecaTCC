<%-- 
    Document   : posterPriv
    Created on : 25/03/2019, 14:56:55
    Author     : gustavo
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%            String codigo = request.getParameter("codigo");

            CompeticaoControle cc = new CompeticaoControle();
            Competicao comp = cc.buscarPorCodigo(codigo);
        %>
<html>
    <head>
        <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="window.print();window.close();">
        <style>
            @page 
            {
                size: auto;   /* auto is the initial value */
                margin: 0mm;  /* this affects the margin in the printer settings */
            }
        </style>
       
        <header class="py-5 bg-success">
            <div class="container">
                <h1 style="color:whitesmoke;"><%=comp.getNome()%></h1>
            </div>
        </header>
            <section style="margin-top:2.87in;margin-bottom: 2.87in">
            <div class="container">
                <center>
                    <h3>Inscreva-se em nossa competição pelo código</h3><br>
                    <div id="qrcode">
                    </div>
                    <script src="js/qrcode.min.js"></script>
                    <script>
                        new QRCode(document.getElementById('qrcode'), {
                            text: 'ingressoPvd.jsp?codigo=<%=comp.getCodPriv()%>',
                            width: 300,
                            height: 300,
                            colorDark: '#000000',
                            colorLight: '#ffffff',
                            correctLevel: QRCode.CorrectLevel.M
                        })
                    </script>
                    <br>
                    <h4 style="font-family: 'Nanum Gothic Coding', monospace;"><%=comp.getCodPriv()%></h4>
                </center>
            </div>

        </section>
                <footer class="py-5 bg-success">
                    <div style="color:whitesmoke;" class="container">
                        <h6>Passos para se increver:</h6>
                        <ol>
                            <li>Cadastre-se em competiteca.com</li>
                            <li>Escaneie o QRCode acima</li>
                            <li>Faça o seu login</li>
                            <li>Complete seus dados</li>
                            <li>Escolha sua modalidade</li>
                            <li>Pronto! agora é só esperar pelo dia da primeira partida</li>
                        </ol>
                    </div>
                </footer>
    </body>
</html>
