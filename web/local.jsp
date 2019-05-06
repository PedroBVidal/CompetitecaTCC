
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
         <script src="https://code.jquery.com/jquery-3.1.1.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Modern Business - Start Bootstrap Template</title>
        <meta name="viewport" content="initial-scale=1.0, width=device-width" />
        <link rel="stylesheet" type="text/css" href="https://js.api.here.com/v3/3.0/mapsjs-ui.css?dp-version=1549984893" />
        <script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-core.js"></script>
        <script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-service.js"></script>
        <script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-ui.js"></script>
        <script type="text/javascript" src="https://js.api.here.com/v3/3.0/mapsjs-mapevents.js"></script>
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
        %>

        <!-- Navigation -->


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
            <h1 class="my-4">Gerenciar Locais</h1>

           
                <div class="form-group input-group">
                            <span class="input-group-addon"><a class="btn btn-success" href="#">Buscar 
                        </a></span>
                            <input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control">
                        </div>


                    <table id="tabela" class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">Nome</th>
                                <th scope="col">Cidade</th>
                                <th scope="col">Ação</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            LocalControle lc = new LocalControle();
                            for(Local local : lc.buscarTodosLocal()){
                            %>
                            <tr>

                                <td><%=local.getNome()%></td>
                                <td><%=local.getCidade()%></td>
                                <td>
                                    <button class="btn btn-primary" data-toggle="modal" data-target="#<%=local.getIdLocal()%>">
                                        <!-- Adicionar icone -->
                                        <i class="fas fa-eye"></i>
                                    </button></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                        <script>
                        //Código de busca da tabela
                        $('input#txt_consulta').quicksearch('table#tabela tbody tr');

                    </script>
                    <%
                    
                        for(Local local2 : lc.buscarTodosLocal()){
                    %>
                    <div class="modal fade" id="<%=local2.getIdLocal()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">Detalhes: <%=local2.getNome()%></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <h4>Endereço</h4>
                                    <br>
                                    <b>Rua: </b><%=local2.getEndereco()%><br>
                                    <b>Número: </b><%=local2.getNumero()%><br>
                                    <b>Bairro: </b><%=local2.getBairro()%><br>
                                    <b>CEP:</b><%=local2.getCep()%> <br>
                                    <b>Cidade: </b><%=local2.getCidade()%><br>
                                    <b>Estado: </b><%=local2.getEstado()%><br>
                                    <br>
                                    <!--<h4>Localização</h4>
                                    <div class="row">
                                        <div class="col-md-12 modal_body_map">
                                            <div id="map<%=local2.getIdLocal()%>" style="position:absolute; width:600px; height:200px; background:grey" ></div>
                                            <div id="panel<%=local2.getIdLocal()%>" style="position:absolute; width:49%; left:51%; height:100%; background:inherit" ></div>
                                            <script>
                                                function geocode<%=local2.getIdLocal()%>(platform) {
                                                    var geocoder = platform.getGeocodingService(),
                                                            geocodingParameters = {
                                                                searchText: '<%=local2.getEndereco()%>,<%=local2.getNumero()%>,<%=local2.getCidade()%> <%=local2.getEstado()%>',
                                                                                    jsonattributes: 1
                                                                                };
        
                                                                        geocoder.geocode(
                                                                                geocodingParameters,
                                                                                onSuccess,
                                                                                onError
                                                                                );
                                                                    }
                                                                    /**
                                                                     * This function will be called once the Geocoder REST API provides a response
                                                                     * @param  {Object} result          A JSONP object representing the  location(s) found.
                                                                     *
                                                                     * see: http://developer.here.com/rest-apis/documentation/geocoder/topics/resource-type-response-geocode.html
                                                                     */
                                                                    function onSuccess<%=local2.getIdLocal()%>(result) {
                                                                        var locations = result.response.view[0].result;
                                                                        /*
                                                                         * The styling of the geocoding response on the map is entirely under the developer's control.
                                                                         * A representitive styling can be found the full JS + HTML code of this example
                                                                         * in the functions below:
                                                                         */
                                                                        addLocationsToMap(locations);
                                                                        addLocationsToPanel(locations);
                                                                        // ... etc.
                                                                    }
        
                                                                    /**
                                                                     * This function will be called if a communication error occurs during the JSON-P request
                                                                     * @param  {Object} error  The error message received.
                                                                     */
                                                                    function onError<%=local2.getIdLocal()%>(error) {
                                                                        alert('Ooops!');
                                                                    }
        
        
        
        
                                                                    /**
                                                                     * Boilerplate map initialization code starts below:
                                                                     */
        
                                                                    //Step 1: initialize communication with the platform
                                                                    var platform = new H.service.Platform({
                                                                        'app_id': '1LnjQjzj6do9MhsjjKVw',
                                                                        'app_code': 'EAWDGTh7gFao6v-9LtUc-A'
                                                                    });
                                                                    var pixelRatio = window.devicePixelRatio || 1;
                                                                    var defaultLayers = platform.createDefaultLayers({
                                                                        tileSize: pixelRatio === 1 ? 256 : 512,
                                                                        ppi: pixelRatio === 1 ? undefined : 320
                                                                    });
        
                                                                    //Step 2: initialize a map - this map is centered over California
                                                                    var map = new H.Map(document.getElementById('map<%=local2.getIdLocal()%>'),
                                                                            defaultLayers.normal.map, {
                                                                                center: {lat: 37.376, lng: -122.034},
                                                                                zoom: 15,
                                                                                pixelRatio: pixelRatio
                                                                            });
        
                                                                    var locationsContainer = document.getElementById('panel<%=local2.getIdLocal()%>');
        
                                                                    //Step 3: make the map interactive
                                                                    // MapEvents enables the event system
                                                                    // Behavior implements default interactions for pan/zoom (also on mobile touch environments)
                                                                    var behavior = new H.mapevents.Behavior(new H.mapevents.MapEvents(map));
        
                                                                    // Create the default UI components
                                                                    var ui = H.ui.UI.createDefault(map, defaultLayers);
        
                                                                    // Hold a reference to any infobubble opened
                                                                    var bubble;
        
                                                                    /**
                                                                     * Opens/Closes a infobubble
                                                                     * @param  {H.geo.Point} position     The location on the map.
                                                                     * @param  {String} text              The contents of the infobubble.
                                                                     */
                                                                    function openBubble<%=local2.getIdLocal()%>(position, text) {
                                                                        if (!bubble) {
                                                                            bubble = new H.ui.InfoBubble(
                                                                                    position,
                                                                                    {content: text});
                                                                            ui.addBubble(bubble);
                                                                        } else {
                                                                            bubble.setPosition(position);
                                                                            bubble.setContent(text);
                                                                            bubble.open();
                                                                        }
                                                                    }
        
                                                                    /**
                                                                     * Creates a series of list items for each location found, and adds it to the panel.
                                                                     * @param {Object[]} locations An array of locations as received from the
                                                                     *                             H.service.GeocodingService
                                                                     */
                                                                    function addLocationsToPanel<%=local2.getIdLocal()%>(locations) {
        
                                                                        var nodeOL = document.createElement('ul'),
                                                                                i;
        
                                                                        nodeOL.style.fontSize = 'small';
                                                                        nodeOL.style.marginLeft = '5%';
                                                                        nodeOL.style.marginRight = '5%';
        
        
                                                                        for (i = 0; i < locations.length; i += 1) {
                                                                            var li = document.createElement('li'),
                                                                                    divLabel = document.createElement('div'),
                                                                                    address = locations[i].location.address,
                                                                                    content = '<strong style="font-size: large;">' + address.label + '</strong></br>';
                                                                            position = {
                                                                                lat: locations[i].location.displayPosition.latitude,
                                                                                lng: locations[i].location.displayPosition.longitude
                                                                            };
        
                                                                            content += '<strong>houseNumber:</strong> ' + address.houseNumber + '<br/>';
                                                                            content += '<strong>street:</strong> ' + address.street + '<br/>';
                                                                            content += '<strong>district:</strong> ' + address.district + '<br/>';
                                                                            content += '<strong>city:</strong> ' + address.city + '<br/>';
                                                                            content += '<strong>postalCode:</strong> ' + address.postalCode + '<br/>';
                                                                            content += '<strong>county:</strong> ' + address.county + '<br/>';
                                                                            content += '<strong>country:</strong> ' + address.country + '<br/>';
                                                                            content += '<br/><strong>position:</strong> ' +
                                                                                    Math.abs(position.lat.toFixed(4)) + ((position.lat > 0) ? 'N' : 'S') +
                                                                                    ' ' + Math.abs(position.lng.toFixed(4)) + ((position.lng > 0) ? 'E' : 'W');
        
                                                                            divLabel.innerHTML = content;
                                                                            li.appendChild(divLabel);
        
                                                                            nodeOL.appendChild(li);
                                                                        }
        
                                                                        locationsContainer.appendChild(nodeOL);
                                                                    }
        
        
                                                                    /**
                                                                     * Creates a series of H.map.Markers for each location found, and adds it to the map.
                                                                     * @param {Object[]} locations An array of locations as received from the
                                                                     *                             H.service.GeocodingService
                                                                     */
                                                                    function addLocationsToMap<%=local2.getIdLocal()%>(locations) {
                                                                        var group = new H.map.Group(),
                                                                                position,
                                                                                i;
        
                                                                        // Add a marker for each location found
                                                                        for (i = 0; i < locations.length; i += 1) {
                                                                            position = {
                                                                                lat: locations[i].location.displayPosition.latitude,
                                                                                lng: locations[i].location.displayPosition.longitude
                                                                            };
                                                                            marker = new H.map.Marker(position);
                                                                            marker.label = locations[i].location.address.label;
                                                                            group.addObject(marker);
                                                                        }
        
                                                                        group.addEventListener('tap', function (evt) {
                                                                            map.setCenter(evt.target.getPosition());
                                                                            openBubble(
                                                                                    evt.target.getPosition(), evt.target.label);
                                                                        }, false);
        
                                                                        // Add the locations group to the map
                                                                        map.addObject(group);
                                                                        map.setCenter(group.getBounds().getCenter());
                                                                    }
        
                                                                    // Now use the map as required...
                                                                    geocode<%=local2.getIdLocal()%>(platform);
        
        
                                            </script>
                                        </div>
                                    </div>-->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>

                                </div>
                            </div>
                        </div>
                    </div>        
                    <%}%>
                    
                    <a href="novoLocal.jsp" class="btn btn-success">
                        <!-- Adicionar icone -->
                        <i class="fas fa-plus"></i>&nbsp;Novo Local
                    </a>

                </div>



                <!-- Bootstrap core JavaScript -->
       
                <script src="vendor/jquery/jquery.min.js"></script>
                <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                <%
                }
                %>
                </body>

                </html>

