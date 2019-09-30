<%-- 
    Document   : adicionarMembrosEquipe
    Created on : 19/05/2019, 20:57:53
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.UsuarioParticipante2Controle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.UsuarioParticipante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioParticipante2Controle upc = new UsuarioParticipante2Controle();
    AtletaControle atletaControle = new AtletaControle();
    EquipeControle equipeControle = new EquipeControle();
    
    int contador = Integer.parseInt(request.getParameter("contador"));
    int idEquipe = Integer.parseInt(request.getParameter("idEquipe"));
    boolean membroJaParticipanteDaEquipe = false;
    
    Equipe equipe = equipeControle.buscarPorId(idEquipe);
    
    List<Atleta> membrosEquipe = new ArrayList();
    
    
    if(contador != 0){
    for(int i = 1; i <= contador; i++){
        
        if(request.getParameter("checkBox"+i) != null){
            Atleta atleta = atletaControle.buscarPorId(Integer.parseInt(request.getParameter("checkBox"+i)));
            membrosEquipe.add(atleta);
        }
    }
    }
    
        // Verifica se algum membro selecionado já é participante da equipe 
    for(Atleta atletaEquipe: equipe.getAtletas()){
        for(Atleta atletaSelecionado : membrosEquipe){
            if(atletaSelecionado.getIdAtleta() == atletaEquipe.getIdAtleta()){
                membroJaParticipanteDaEquipe = true;
            }
        }
    }
    
    if(membroJaParticipanteDaEquipe == false){
    for(Atleta a: membrosEquipe){
        equipe.adicionarAtleta(a);
    }
    }
    atletaControle.fecharSessaoDAOEspecifico();
    equipeControle.fecharSessaoDAOEspecifico();

    equipeControle.alterarEquipe(equipe);
    
    equipeControle.fecharSessaoDAOGeneric();
    
    if(membroJaParticipanteDaEquipe){
          response.sendRedirect("../gerenciarEquipe.jsp?msg=Foi adicionado um integrante participante da equipe!&color=warning&idEquipe="+idEquipe); 
    }
    else{
    if(membrosEquipe.size() == 1){
    response.sendRedirect("../gerenciarEquipe.jsp?msg=Membro adicionado com sucesso&color=success&idEquipe="+idEquipe);
    }
    if(membrosEquipe.size() != 1){
    response.sendRedirect("../gerenciarEquipe.jsp?msg=Membros adicionados com sucesso&color=success&idEquipe="+idEquipe);
    }
    }
%>
