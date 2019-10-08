/**
  * Função para criar um objeto XMLHTTPRequest
  */
 function CriaRequest() {
     try{
         request = new XMLHttpRequest();        
     }catch (IEAtual){
          
         try{
             request = new ActiveXObject("Msxml2.XMLHTTP");       
         }catch(IEAntigo){
          
             try{
                 request = new ActiveXObject("Microsoft.XMLHTTP");          
             }catch(falha){
                 request = false;
             }
         }
     }
      
     if (!request) 
         alert("Seu Navegador não suporta Ajax!");
     else
         return request;
 }
  
 /**
  * Função para enviar os dados
  */
 function getDados(id) {
      
     // Declaração de Variáveis
     //var nome   = document.getElementById("txtnome").value;
     var result = document.getElementById("partidas");
     var xmlreq = CriaRequest();
      
     // Exibi a imagem de progresso
     //result.innerHTML = '<img src="Progresso1.gif"/>';
      
     // Iniciar uma requisição
     xmlreq.open("GET", "ajax/buscarPlacar.jsp?id=" + id, true);
      
     // Atribui uma função para ser executada sempre que houver uma mudança de ado
     xmlreq.onreadystatechange = function(){
          
         // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
         if (xmlreq.readyState == 4) {
              
             // Verifica se o arquivo foi encontrado com sucesso
             if (xmlreq.status == 200) {
                 result.innerHTML = xmlreq.responseText;
             }else{
                 result.innerHTML = "Erro: " + xmlreq.statusText;
             }
         }
     };
     xmlreq.send();
     setTimeout('getDados('+id+')',500);
 }
 
 
 function alterarConfrontColetivo(idConfrontoColetivo){
     // Declaração de Variáveis
     //var nome   = document.getElementById("txtnome").value;
     var result = document.getElementById("cardConfrontoColetivo"+idConfrontoColetivo);
     alert(result);
     alert("Hello");
     var equipeSelect1 = document.getElementById("selectEquipe1"+idConfrontoColetivo);
     alert(equipeSelect1);
     var equipeSelect2 = document.getElementById("selectEquipe2"+idConfrontoColetivo);
     alert(equipeSelect2);
     var dataJogo = document.getElementById("dataJogo"+idConfrontoColetivo);
     alert(dataJogo);
     var horaInicio = document.getElementById("horaInicioJogo"+idConfrontoColetivo);
     alert(horaInicio);
     var horaTermino = document.getElementById("horaFinalJogo"+idConfrontoColetivo);
     alert(horaTermino);
     var localJogo = document.getElementById("selectLocalJogo"+idConfrontoColetivo);
     alert(localJogo);
     
     var xmlreq = CriaRequest();
     alert('Entrei aqui! AJAX 2.000');
     alert("HELLO!");
     alert(localJogo);
     // Exibi a imagem de progresso
     //result.innerHTML = '<img src="Progresso1.gif"/>';
      
     // Iniciar uma requisição
     
     xmlreq.open("GET", "ajax/alterarConfrontoColetivo.jsp?id=" + idConfrontoColetivo+"&selectEquipe1=", true);
      
     // Atribui uma função para ser executada sempre que houver uma mudança de ado
     xmlreq.onreadystatechange = function(){
          
         // Verifica se foi concluído com sucesso e a conexão fechada (readyState=4)
         if (xmlreq.readyState == 4) {
              
             // Verifica se o arquivo foi encontrado com sucesso
             if (xmlreq.status == 200) {
                 result.innerHTML = xmlreq.responseText;
             }else{
                 result.innerHTML = "Erro: " + xmlreq.statusText;
             }
         }
     };
     xmlreq.send();
 }
 
 
 function alterarConfrontoColetivo(idConfrontoColetivo){
     alert("OH HELLO!");
 }