<%-- 
    Document   : cadastrarConfrontoColetivoSisEliminatorio
    Created on : 05/10/2019, 18:22:40
    Author     : Usuário
--%>

<%@page import='java.util.ArrayList'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.Local'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.EquipeCompeticao'%>
<%@page import='br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva'%>
<%@page import='java.text.SimpleDateFormat'%>
<%@page import='br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle'%>
<%@page import='br.edu.ifpr.irati.ti.controle.LocalControle'%>
<%@page import='br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle'%>
<%@page contentType='text/html' pageEncoding='UTF-8'%>
<%
    String resultado = "";
    
    int idConfronto = Integer.parseInt(request.getParameter("idConfronto"));
    int idEquipe1 = Integer.parseInt(request.getParameter("selectEquipe1"));
    int idEquipe2 = Integer.parseInt(request.getParameter("selectEquipe2"));
    int idLocal = Integer.parseInt(request.getParameter("localJogo"));
    String dataJogo = request.getParameter("dataJogo");
    String horaInicioJogo = request.getParameter("horaInicioJogo");
    String horaFinalJogo = request.getParameter("horaFinalJogo");
    
    
    ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
    LocalControle localControle = new LocalControle();
    EquipeCompeticaoControle  eqCompControle = new EquipeCompeticaoControle();
    SimpleDateFormat sdfHora = new SimpleDateFormat("HH:mm");
    SimpleDateFormat sdfData = new SimpleDateFormat("dd/MM/yyyy");
    EquipeCompeticao equipeComp1 = new EquipeCompeticao();
    EquipeCompeticao equipeComp2 = new EquipeCompeticao();
    
    ConfrontoModalidadeColetiva confModColetiva = confrontoColetivoControle.buscarPorId(idConfronto);
    if(idEquipe1 != 0){
    equipeComp1 = eqCompControle.buscarPorId(idEquipe1);
    }
    if(idEquipe2 != 0){
    equipeComp2 = eqCompControle.buscarPorId(idEquipe2);
    }
    Local localJogo = localControle.buscaPorId(idLocal);

    
    confModColetiva.removeAllEquipesCompeticao();
    if(idEquipe1 != 0 && idEquipe2 != 0){
    confModColetiva.adicionarEquipeCompeticao(equipeComp1);
    confModColetiva.adicionarEquipeCompeticao(equipeComp2);
    }
    confModColetiva.setLocal(localJogo);
    
    confrontoColetivoControle.alterar(confModColetiva);
    String nomeEq1 = "";
    String nomeEq2 = "";
    if(idEquipe1 != 0){ 
    nomeEq1 = confModColetiva.getEquipes().get(0).getEquipe().getNome();
    }
    if(idEquipe2 != 0){
    nomeEq2 = confModColetiva.getEquipes().get(1).getEquipe().getNome();
    }
    
    resultado+= "<ul class='list-group list-group-flush'>";
    resultado+=     "<li class='list-group-item'>";  
    resultado+=     "<div class='input-group mb-2 mr-sm-2'>";
    resultado+=     "<div class='input-group-prepend'>";
    resultado+=     "<div class='input-group-text' style='width: 10rem;'>"+nomeEq1+"</div>";
    resultado+=     "</div>";
    resultado+=     "<input type='text' class='form-control' id='inlineFormInputGroupUsername2'>";
    resultado+=     "</div>";
    resultado+=     "<div class='input-group mb-2 mr-sm-2'>";
    resultado+=     "<div class='input-group-prepend'>";
    resultado+=     "<div class='input-group-text' style='width: 10rem;'>"+nomeEq2+"</div>";
    resultado+=     "</div>";
    resultado+=     "<input type='text' class='form-control' id='inlineFormInputGroupUsername2'>";
    resultado+=     "</div>";
    resultado+=     "<a href='#' class='badge badge-info'><i class='fas fa-eye'></i></a>";
    resultado+=     "\n";
    resultado+=     "<a href='javascript:acionarModalInserirDadosConfronto("+confModColetiva.getIdConfronto()+");' class='badge badge-primary'>Inserir dados do jogo</a>";
    resultado+=     "\n";
    resultado+=     "<a href='#' class='badge badge-success'><i class='fas fa-greater-than'></i></a>";
    resultado+=     "\n";
    resultado+=     "</li>";
    resultado+=     "</ul>";                        
    
    
    out.print(resultado);

%>
