<%-- 
    Document   : teste
    Created on : 28/10/2018, 21:41:50
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Página de interação: formInscricaoCompeticao.jsp
    
    // Puxa os parâmetros do formulário de cadastro.
    
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    // Puxa o id do evento(competicao) que o atleta será inscrito.
    String sIdCompeticao = request.getParameter("idCompeticao");
    String sIdUsuarioParticipante = request.getParameter("idUsuarioParticipante");
    
    System.out.println(nome + email + sIdCompeticao + " " + sIdUsuarioParticipante);
    
    
    // Instancia os controladores de Atleta, Competicao e UsuarioParticipante
    AtletaControle atletaControle = new AtletaControle();
    CompeticaoControle competicaoControle = new CompeticaoControle();
    UsuarioParticipante2Controle usuarioParticipante2Controle = new UsuarioParticipante2Controle();
    
    // Busca uma competicao que tenha o id passado como parâmetro
    Competicao competicao = competicaoControle.buscarCompeticaoPorId(Integer.parseInt(sIdCompeticao)); 
    
    // Busca um usuario partcipante que tenha o id passado como parâmetro
    UsuarioParticipante2 usuarioParticipante2 = usuarioParticipante2Controle.buscarPorId(Integer.parseInt(sIdUsuarioParticipante));
    
    System.out.println("USUARIO PARTICIPANTE1 CRIADO (Atletas vicnulados):" + usuarioParticipante2.getAtletas());

    
    // Instancia um atleta
    // O atributo aprovado é false.
    //O atleta é vinculado a competicao
    
    int flag = 0;
    
        for (Atleta a : usuarioParticipante2.getAtletas()) {
                    System.out.println("ID COMPETICAO VINCULADA A ATLETA:" + a.getCompeticao().getIdCompeticao());
                    System.out.println("ID COMPETICAO:" + competicao.getIdCompeticao());
                    
                if (a.getCompeticao().getIdCompeticao() == competicao.getIdCompeticao()) {
                    flag = 1;
                }
            }
    
    if(flag == 0){
    Atleta atleta = new Atleta(0, nome, email, false, competicao, usuarioParticipante2);
    
    System.out.println("ATLETA CRIADO PELO BANCO:"+  atleta);
    
    //Salva no banco o atleta.
    atletaControle.criarAtleta(atleta);
    
    System.out.println("USUARIO PARTICIPANTE2 CRIADO (Atletas vicnulados):" + usuarioParticipante2.getAtletas());

    
    // Adiciona um atleta na List<Atleta> do usuário participante.
    usuarioParticipante2.adicionarAtleta(atleta);
     
    System.out.println("USUARIO PARTICIPANTE3 CRIADO (Atletas vicnulados):" + usuarioParticipante2.getAtletas());
    
    //Atualiza o usuário participante, agora com um atleta a mais vinculado a ele.
    usuarioParticipante2Controle.atualizarCad(usuarioParticipante2);
    
    int idAtletaCriado = 0;
    
    for(Atleta a: usuarioParticipante2.getAtletas()){
        
        if(a.equals(atleta)){
            idAtletaCriado = a.getIdAtleta();
            break;
        }
    }
    
    
    //Redireciona para a página inscricaoAtletaCompeticao
    response.sendRedirect("../forminscricaocompeticao.jsp?msg=Cadastro efetuado no evento "+ competicao.getNome()+"&idCompeticao="+competicao.getIdCompeticao()+"&idAtleta="+idAtletaCriado);
    }
    
    else{
        response.sendRedirect("../index.jsp");

    }
%>

