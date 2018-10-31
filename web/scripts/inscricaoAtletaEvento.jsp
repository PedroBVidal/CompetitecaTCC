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
    
    // Busca uma competicao que tenha o id passado como parâmetro
    UsuarioParticipante2 usuarioParticipante2 = usuarioParticipante2Controle.buscarPorId(Integer.parseInt(sIdUsuarioParticipante));
    
    // Instancia um atleta
    // O atributo aprovado é false.
    //O atleta é vinculado a competicao
    
    
    Atleta atleta = new Atleta(0, nome, email, false, competicao);
    
    //Salva no banco o atleta.
    atletaControle.criarAtleta(atleta);
    
    // Adiciona um atleta na List<Atleta> do usuário participante.
    usuarioParticipante2.adicionarAtleta(atleta);
    
    //Atualiza o usuário participante, agora com um atleta a mais vinculado a ele.
    usuarioParticipante2Controle.atualizarCad(usuarioParticipante2);
    
    //Redireciona para a página inscricaoAtletaCompeticao
    response.sendRedirect("../forminscricaocompeticao.jsp?msg=Cadastro efetuado no evento "+ competicao.getNome()+"&idCompeticao="+competicao.getIdCompeticao());
    
%>

