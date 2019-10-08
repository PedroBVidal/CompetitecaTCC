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
 function getDados(idConfrontoColetivo) {
     
     // Declaração de Variáveis
     //var nome   = document.getElementById("txtnome").value;
     var result = document.getElementById("cardConfrontoColetivo"+idConfrontoColetivo);

     var equipeSelect1 = document.getElementById("selectEquipe1"+idConfrontoColetivo).value;

     var equipeSelect2 = document.getElementById("selectEquipe2"+idConfrontoColetivo).value;

     var dataJogo = document.getElementById("dataJogo"+idConfrontoColetivo).value;

     var horaInicio = document.getElementById("horaInicioJogo"+idConfrontoColetivo).value;

     var horaFinal = document.getElementById("horaFinalJogo"+idConfrontoColetivo).value;

     var localJogo = document.getElementById("selectLocalJogo"+idConfrontoColetivo).value;

     
     var xmlreq = CriaRequest();
      
     // Exibi a imagem de progresso
     //result.innerHTML = '<img src="Progresso1.gif"/>';
      
     // Iniciar uma requisição
     xmlreq.open("GET", "ajax/cadastrarConfrontoColetivoSisEliminatorio.jsp?idConfronto=" + idConfrontoColetivo+"&selectEquipe1="+equipeSelect1
     +"&selectEquipe2="+equipeSelect2+"&dataJogo="+dataJogo+"&horaInicioJogo="+horaInicio+"&horaFinalJogo="+horaFinal+"&localJogo="+localJogo, true);
      
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

