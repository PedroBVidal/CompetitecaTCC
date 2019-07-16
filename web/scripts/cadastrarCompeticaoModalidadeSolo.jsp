<%-- 
    Document   : cadastrarCompeticaoModalidadeColetiva
    Created on : 06/11/2018, 20:15:42
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeSoloControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeSolo"%>
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
    int idModalidadeSolo  = Integer.parseInt(request.getParameter("modalidadeSolo"));
    String sistemaDesempate = request.getParameter("sistemaDesempate");
    String sistemaDesempateSecundario = request.getParameter("sistemaDesempateSecundario");
    String sRepesgagem = request.getParameter("respescagem");
    String sistemaCompeticao = request.getParameter("sistemaCompeticao");
    int idSistemaDeContagem = Integer.parseInt(request.getParameter("sistemaContagem"));
    String infoAdicional = request.getParameter("infoAdicional");
    
    System.out.println("INFO ADICIONAL: "+ infoAdicional);
    
    if(infoAdicional.equals("")){
        System.out.println("INFO ADICIONAL null ou equal '': "+ infoAdicional);
    }

    
    
    
    
    System.out.println("ID EVENTO: " + idEvento);
    System.out.println("Nome competicao:" + nomeCompeticao);
    System.out.println("Modalidade coletiva: " + idModalidadeSolo);
    System.out.println("Sistema de desempate: " + sistemaDesempate);
    System.out.println("Sistema de desempate secundário: " + sistemaDesempateSecundario);
    System.out.println("Repescagem: " + sRepesgagem);
    System.out.println("Sistema competicao: "+ sistemaCompeticao);
    System.out.println("Sistema de contagem: "+ idSistemaDeContagem);
    
    CompeticaoControle competicaoControle = new CompeticaoControle();
    ModalidadeSoloControle modalidadeSoloControle = new ModalidadeSoloControle();
    CompeticaoModalidadeSoloControle competicaoModalidadeSoloControle = new CompeticaoModalidadeSoloControle();
    SistemaDeDesempateControle sistemaDeDesempateControle = new SistemaDeDesempateControle();
    SistemaDeContagemControle sistemaDeContagemControle = new SistemaDeContagemControle();
    
    Competicao competicao = competicaoControle.buscarCompeticaoPorId(idEvento);
    ModalidadeSolo modalidadeSolo = modalidadeSoloControle.buscaPorId(idModalidadeSolo);
    SistemaDeContagem sistemaDeContagem = sistemaDeContagemControle.buscarPorId(idSistemaDeContagem);
    

    modalidadeSoloControle.fecharSessaoDAOGeneric();
    sistemaDeContagemControle.fecharSessaoDAOEspecifico();
    
    SistemaDeDesempate sistemaDeDesempate = new SistemaDeDesempate(0, sistemaDesempate, sistemaDesempateSecundario);
   
    if(sistemaCompeticao.equals("Sistema eliminatório")){
        System.out.println("É um sistema eliminatório");
        boolean repescagem;
        CompeticaoModalidadeSolo competicaoModalidadeSolo;
        if(!infoAdicional.equals("")){
            competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaEliminatorio(), competicao,infoAdicional);
        }else{
            competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaEliminatorio(), competicao);
        }
        // Compra se o request consegui puxar uma parâmetro("sim"). Caso isso ocorre o sistema a ser cadastrado possui repescagem.
        if(sRepesgagem == null){
            repescagem = false;
        }
        else{
            repescagem = true;
        }
        
        SistemaEliminatorio sistemaEliminatorio = new SistemaEliminatorio(repescagem, 0, sistemaCompeticao, new CompeticaoModalidadeSolo());
        
        sistemaEliminatorio.setCompeticaoModalidade(competicaoModalidadeSolo);
        competicaoModalidadeSolo.setSistemaDeCompeticao(sistemaEliminatorio);
        competicao.adcionarCompeticaoModalidadeSolo(competicaoModalidadeSolo);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        sistemaDeDesempateControle.fecharSessaoDAOEspecifico();
        
        competicaoModalidadeSoloControle.salvar(competicaoModalidadeSolo);
        competicaoModalidadeSoloControle.fecharSessaoDAOGeneric();
        
        competicaoControle.fecharSessaoDAOEspecifico();
        competicaoControle.autualizarCompeticao(competicao);
        competicaoControle.fecharSessaoDAOGeneric();
    }
    else if(sistemaCompeticao.equals("Sistema misto")){
        System.out.println("É um sistema misto");
        boolean repescagem;
        CompeticaoModalidadeSolo competicaoModalidadeSolo;
        
        if(!infoAdicional.equals("")|| infoAdicional != null){
        competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaMisto(), competicao,infoAdicional);
        }else{
        competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaMisto(), competicao);
        }
        
        if(sRepesgagem == null){
            repescagem = false;
        }
        else{
            repescagem = true;
        }
        
        SistemaMisto sistemaMisto = new SistemaMisto(repescagem, sistemaDeContagem, sistemaDeDesempate, 0, sistemaCompeticao, new CompeticaoModalidadeSolo());
        
        sistemaMisto.setCompeticaoModalidade(competicaoModalidadeSolo);
        competicaoModalidadeSolo.setSistemaDeCompeticao(sistemaMisto);
        competicao.adcionarCompeticaoModalidadeSolo(competicaoModalidadeSolo);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        sistemaDeDesempateControle.fecharSessaoDAOEspecifico();
        
        competicaoModalidadeSoloControle.salvar(competicaoModalidadeSolo);
        competicaoModalidadeSoloControle.fecharSessaoDAOGeneric();
        
        competicaoControle.fecharSessaoDAOEspecifico();
        competicaoControle.autualizarCompeticao(competicao);
        competicaoControle.fecharSessaoDAOGeneric();
    }
    else{
        System.out.println("É um sistema todos contra todos");
        CompeticaoModalidadeSolo competicaoModalidadeSolo;
         
        if(!infoAdicional.equals("")|| infoAdicional != null){
       competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaTodosContraTodos(), competicao,infoAdicional);
        }else{
        competicaoModalidadeSolo = new CompeticaoModalidadeSolo(modalidadeSolo, 0, nomeCompeticao, new SistemaTodosContraTodos(), competicao);
        }
        
        SistemaTodosContraTodos sistemaTodosContraTodos = new SistemaTodosContraTodos(sistemaDeContagem, sistemaDeDesempate, 0, sistemaCompeticao, new CompeticaoModalidadeSolo());
        
        sistemaTodosContraTodos.setCompeticaoModalidade(competicaoModalidadeSolo);
        competicaoModalidadeSolo.setSistemaDeCompeticao(sistemaTodosContraTodos);
        competicao.adcionarCompeticaoModalidadeSolo(competicaoModalidadeSolo);
        
        sistemaDeDesempateControle.salvar(sistemaDeDesempate);
        sistemaDeDesempateControle.fecharSessaoDAOEspecifico();
        
        competicaoModalidadeSoloControle.salvar(competicaoModalidadeSolo);
        competicaoModalidadeSoloControle.fecharSessaoDAOGeneric();
        
        competicaoControle.fecharSessaoDAOEspecifico();
        competicaoControle.autualizarCompeticao(competicao);
        competicaoControle.fecharSessaoDAOGeneric();
        
    }
    
        response.sendRedirect("../gerenciamentoDeCompeticao.jsp?idCompeticao="+idEvento);
%>
