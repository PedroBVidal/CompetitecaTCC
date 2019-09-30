<%-- 
    Document   : cadastrarEquipe
    Created on : 13/05/2019, 10:21:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipanteControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    request.setCharacterEncoding("UTF-8");
    CompeticaoModalidadeColetivaControle cmc = new CompeticaoModalidadeColetivaControle();
    List<CompeticaoModalidadeColetiva> competicoesModalidadeColetiva = new ArrayList<CompeticaoModalidadeColetiva>();
    
    int contador = Integer.parseInt(request.getParameter("contador"));

    if(contador != 0){
    for(int i = 1; i <= contador; i++){
        
        if(request.getParameter("checkBox"+i) != null){
            CompeticaoModalidadeColetiva compModalidadeColetiva = cmc.buscarPorId(Integer.parseInt(request.getParameter("checkBox"+i)));
            competicoesModalidadeColetiva.add(compModalidadeColetiva);
        }
    }
    }
    
    
    int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
    String nomeEquipe = request.getParameter("nomeEquipe");
     int idModalidadeColetiva = Integer.parseInt(request.getParameter("idModalidadeColetivaSelecionada"));
    
     
    //Cadastrar nova equipe
        
        UsuarioParticipante2Controle upc = new UsuarioParticipante2Controle();
        UsuarioParticipante2  uADMEquipe = upc.buscarPorId(idUsuario);
        
        ModalidadeColetivaControle modalidadeControle = new ModalidadeColetivaControle();
        ModalidadeColetiva modalidadeColetiva = modalidadeControle.buscaPorId(idModalidadeColetiva);
        
        System.out.println("Competicoes modalidade coletiva: "+ competicoesModalidadeColetiva);
        System.out.println("contador: "+contador);
        
        EquipeControle ec = new EquipeControle();
        
        Equipe equipe = new Equipe(0, nomeEquipe, uADMEquipe,modalidadeColetiva,false);
        
        equipe.setCompeticoesModalidadeColeivas(competicoesModalidadeColetiva);
        
        ec.criarEquipe(equipe);
        
        uADMEquipe.adicionarEquipe(equipe);
        upc.atualizarCad(uADMEquipe);
        
        
        response.sendRedirect("../listaEquipes.jsp?msg=Equipe criada com sucesso&color=success");
        
    
    
%>
