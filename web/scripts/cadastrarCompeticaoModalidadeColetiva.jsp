<%-- 
    Document   : cadastrarCompeticaoModalidadeColetiva
    Created on : 06/11/2018, 20:15:42
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaMisto"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidade"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaEliminatorio"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Competicao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SistemaDeContagemControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.controle.SistemaDeDesempateControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%

    System.out.println("ENTREI AQUI!");
    
    int idEvento = Integer.parseInt(request.getParameter("idCompeticao"));
    String nomeCompeticao = request.getParameter("nomeCompeticao");
    int idModalidadeColetiva  = Integer.parseInt(request.getParameter("modalidadeColetiva"));
    String sistemaDesempate = request.getParameter("sistemaDesempate");
    String sistemaDesempateSecundario = request.getParameter("sistemaDesempateSecundario");
    String sRepesgagem = request.getParameter("respescagem");
    String sistemaCompeticao = request.getParameter("sistemaCompeticao");
    int idSistemaDeContagem = Integer.parseInt(request.getParameter("sistemaContagem"));
    
    
    
    
    System.out.println("ID EVENTO: " + idEvento);
    System.out.println("Nome competicao:" + nomeCompeticao);
    System.out.println("Modalidade coletiva: " + idModalidadeColetiva);
    System.out.println("Sistema de desempate: " + sistemaDesempate);
    System.out.println("Sistema de desempate secundário: " + sistemaDesempateSecundario);
    System.out.println("Repescagem: " + sRepesgagem);
    System.out.println("Sistema competicao: "+ sistemaCompeticao);
    System.out.println("Sistema de contagem: "+ idSistemaDeContagem);
    
    CompeticaoControle competicaoControle = new CompeticaoControle();
    ModalidadeColetivaControle modalidadeColetivaControle = new ModalidadeColetivaControle();
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    SistemaDeDesempateControle sistemaDeDesempateControle = new SistemaDeDesempateControle();
    SistemaDeContagemControle sistemaDeContagemControle = new SistemaDeContagemControle();
    
    Competicao competicao = competicaoControle.buscarCompeticaoPorId(idEvento);
    ModalidadeColetiva modalidadeColetiva = modalidadeColetivaControle.buscaPorId(idModalidadeColetiva);
    SistemaDeContagem sistemaDeContagem = sistemaDeContagemControle.buscarPorId(idSistemaDeContagem);
    SistemaDeDesempate sistemaDeDesempate = new SistemaDeDesempate(0, sistemaDesempate, sistemaDesempateSecundario);
   
    if(sistemaCompeticao.equals("Sistema eliminatório")){
        System.out.println("É um sistema eliminatório");
        boolean repescagem;
        
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva(modalidadeColetiva, 0, nomeCompeticao, new SistemaEliminatorio());
        
        if(sRepesgagem == null){
            repescagem = false;
        }
        else{
            repescagem = true;
        }
        
        SistemaEliminatorio sistemaEliminatorio = new SistemaEliminatorio(repescagem, 0, sistemaCompeticao, new CompeticaoModalidadeColetiva());
        
        sistemaEliminatorio.setCompeticaoModalidade(competicaoModalidadeColetiva);
        competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaEliminatorio);
        competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        competicaoModalidadeColetivaControle.salvar(competicaoModalidadeColetiva);
        competicaoControle.autualizarCompeticao(competicao);
        
        
    }
    else if(sistemaCompeticao.equals("Sistema misto")){
        System.out.println("É um sistema misto");
        boolean repescagem;
        
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva(modalidadeColetiva, 0, nomeCompeticao, new SistemaMisto());
        
        
        if(sRepesgagem == null){
            repescagem = false;
        }
        else{
            repescagem = true;
        }
        
        SistemaMisto sistemaMisto = new SistemaMisto(repescagem, sistemaDeContagem, sistemaDeDesempate, 0, sistemaCompeticao, new CompeticaoModalidadeColetiva());
        
        sistemaMisto.setCompeticaoModalidade(competicaoModalidadeColetiva);
        competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaMisto);
        competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        competicaoModalidadeColetivaControle.salvar(competicaoModalidadeColetiva);
        competicaoControle.autualizarCompeticao(competicao);
        
    }
    else{
        System.out.println("É um sistema todos contra todos");
        
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva(modalidadeColetiva, 0, nomeCompeticao, new SistemaTodosContraTodos());
               
        
        SistemaTodosContraTodos sistemaTodosContraTodos = new SistemaTodosContraTodos(sistemaDeContagem, sistemaDeDesempate, 0, sistemaCompeticao, new CompeticaoModalidadeColetiva());
        
        sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeColetiva);
        competicaoModalidadeColetiva.setSistemaDeCompeticao(sistemaTodosContraTodos);
        competicao.adicionarCompeticaoModalidadeColetiva(competicaoModalidadeColetiva);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        competicaoModalidadeColetivaControle.salvar(competicaoModalidadeColetiva);
        competicaoControle.autualizarCompeticao(competicao);
        
        
    }
    
    response.sendRedirect("../gerenciamentoDeCompeticao.jsp?idCompeticao="+idEvento);
%>
