/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
            document.getElementById('email').value=("");
          
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
            document.getElementById('email').value=(conteudo.address);
           
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("Email inexistente.Tente novamente com um email válido");
        }
    }
        
    function pesquisaemail(valor) {

        
        var email = valor;

        //Verifica se campo cep possui valor informado.
        if (email != "") {

          

            

                //Preenche os campos com "..." enquanto consulta webservice.
                document.getElementById('email').value="A validar...";
                

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                'https://api.trumail.io/v2/lookups/jsonp?email='+email+'&callback=meu_callback'
                script.src =  'https://api.trumail.io/v2/lookups/jsonp?email='+email+'&callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Email inexistente. Tente outro!");
            }
      //end if.
        
    };

