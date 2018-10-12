<%-- 
    Document   : editarEquipe
    Created on : 07/10/2018, 10:30:24
    Author     : user
--%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Equipe"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Atleta"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.AtletaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ModalidadeColetivaControle"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    int op = Integer.parseInt(request.getParameter("op"));
    EquipeControle eqpc = new EquipeControle();
        
    if(op == 3){

        String nome = request.getParameter("nome");
    int idModalidade = Integer.parseInt(request.getParameter("modalidade"));
    int tamanhoAtletas = Integer.parseInt(request.getParameter("size"));
         List<Atleta> atletas = new ArrayList<>();
    AtletaControle atc = new AtletaControle();
    ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
    ModalidadeColetiva mc = mcc.buscaPorId(idModalidade);
    if(tamanhoAtletas > 0){
    for(int i=0;i<tamanhoAtletas;i++){
        if(request.getParameter(""+i) != null){
            atletas.add(atc.buscarPorId(Integer.parseInt(request.getParameter(""+i))));
        }
    }
        Equipe eqp = new Equipe(0,nome,atletas,mc,false);
        eqpc.criarEquipe(eqp);
        response.sendRedirect("../equipes.jsp?msg=Equipe cadastrada com sucesso&color=success");
    }else{
        //out.println(mc.getNome());
        Equipe eq = new Equipe(0,nome,mcc.buscaPorId(idModalidade),false);
        eqpc.criarEquipe(eq);
        response.sendRedirect("../equipes.jsp?msg=Equipe cadastrada com sucesso&color=success");

    }
    }else if(op == 2){
        int id = Integer.parseInt(request.getParameter("id"));
        eqpc.droparEquipe(eqpc.buscarPorId(id));
        response.sendRedirect("../equipes.jsp?msg=Equipe Apagada com sucesso&color=warning");
        
    }else if(op == 1){
                int id = Integer.parseInt(request.getParameter("id"));
        String nome = request.getParameter("nome");
    int idModalidade = Integer.parseInt(request.getParameter("modalidade"));
    int tamanhoAtletas = Integer.parseInt(request.getParameter("size"));
         List<Atleta> atletas = new ArrayList<>();
    AtletaControle atc = new AtletaControle();
    ModalidadeColetivaControle mcc = new ModalidadeColetivaControle();
    ModalidadeColetiva mc = mcc.buscaPorId(idModalidade);
    if(tamanhoAtletas > 0){
    for(int i=0;i<tamanhoAtletas;i++){
        if(request.getParameter(""+i) != null){
            atletas.add(atc.buscarPorId(Integer.parseInt(request.getParameter(""+i))));
        }
    }
    out.println(atletas.size());
        Equipe eqp = new Equipe(id,nome,atletas,mc,false);
        eqpc.alterarEquipe(eqp);
        response.sendRedirect("../equipes.jsp?msg=Equipe alterada com sucesso&color=success");
    }else{
        //out.println(mc.getNome());
        Equipe eq = new Equipe(id,nome,mcc.buscaPorId(idModalidade),false);
        eqpc.alterarEquipe(eq);
        response.sendRedirect("../equipes.jsp?msg=Equipe alterada com sucesso&color=success");

    }
    }
    
    
    
%>