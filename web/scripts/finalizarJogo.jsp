<%-- 
    Document   : finalizarJogo
    Created on : 19/08/2019, 11:35:43
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaDeContagem"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.SistemaTodosContraTodos"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.EquipeCompeticaoControle"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idConfronto = Integer.parseInt(request.getParameter("idConfronto"));
    int idEquipe1 = Integer.parseInt(request.getParameter("idEquipe1"));
    int idEquipe2 = Integer.parseInt(request.getParameter("idEquipe2"));
    int idCompeticao = Integer.parseInt(request.getParameter("idCompeticao"));
    

    int placarEquipe1 = Integer.parseInt(request.getParameter("placarConfrontoModal"+idConfronto+idEquipe1));
    int placarEquipe2 = Integer.parseInt(request.getParameter("placarConfrontoModal"+idConfronto+idEquipe2));
    
    CompeticaoModalidadeColetivaControle competicaoModalidadeColetivaControle = new CompeticaoModalidadeColetivaControle();
    EquipeCompeticaoControle equipeCompeticaoControle = new EquipeCompeticaoControle();
    ConfrontoModalidadeColetivaControle confrontoModalidadeColetivaControle = new ConfrontoModalidadeColetivaControle();
    
    CompeticaoModalidadeColetiva competicaoColetiva = competicaoModalidadeColetivaControle.buscarPorId(idCompeticao);
    ConfrontoModalidadeColetiva confronto = confrontoModalidadeColetivaControle.buscarPorId(idConfronto);
    EquipeCompeticao equipe1 = equipeCompeticaoControle.buscarPorId(idEquipe1);
    EquipeCompeticao equipe2 = equipeCompeticaoControle.buscarPorId(idEquipe2);
    
    int valorVitoria = 0, valorDerrota= 0, valorEmpate = 0;
    
    confronto.setFinalizado(true);
    confronto.setPlacarEquipe1(placarEquipe1);
    confronto.setPlacarEquipe2(placarEquipe2);
    
    
    if(competicaoColetiva.getSistemaDeCompeticao() instanceof SistemaTodosContraTodos){
        SistemaTodosContraTodos sistemaDeCompeticaoTodosContraTodos = (SistemaTodosContraTodos) competicaoColetiva.getSistemaDeCompeticao();
        SistemaDeContagem sistemaDeContagem = sistemaDeCompeticaoTodosContraTodos.getSistemaDeContagem();
        
        valorVitoria = sistemaDeContagem.getValorVitoria();
        valorDerrota = sistemaDeContagem.getValorDerrota();
        valorEmpate = sistemaDeContagem.getValorEmpate();
    }
    
    // CASO DE EMPATE
    if(placarEquipe1 == placarEquipe2){
        String resultadoConfronto = equipe1.getEquipe().getNome()+" "+placarEquipe1+" X "+placarEquipe2+" "+equipe2.getEquipe().getNome();
        confronto.setResultado(resultadoConfronto);

        int numJogosEquipe1 = equipe1.getJogos();
        int numEmpatesEquipe1 = equipe1.getEmpates();
        double pontosMarcadosEquipe1 = equipe1.getPontosMarcados();
        double pontosSofridosEquipe1 = equipe1.getPontosSofridos();
        double pontosEquipe1 = equipe1.getPontos();
        double saldoDePontosEquipe1;
        
        numJogosEquipe1++;
        numEmpatesEquipe1++;
        pontosMarcadosEquipe1 += placarEquipe1;
        pontosSofridosEquipe1 += placarEquipe2;
        pontosEquipe1 += valorEmpate;
        saldoDePontosEquipe1 = (pontosMarcadosEquipe1 - pontosSofridosEquipe1);
        
        equipe1.setJogos(numJogosEquipe1);
        equipe1.setEmpates(numEmpatesEquipe1);
        equipe1.setPontosMarcados(pontosMarcadosEquipe1);
        equipe1.setPontosSofridos(pontosSofridosEquipe1);
        equipe1.setPontos(pontosEquipe1);
        equipe1.setSaldoDePontos(saldoDePontosEquipe1);
        
        int numJogosEquipe2 = equipe2.getJogos();
        int numEmpatesEquipe2 = equipe2.getEmpates();
        double pontosMarcadosEquipe2 = equipe2.getPontosMarcados();
        double pontosSofridosEquipe2 = equipe2.getPontosSofridos();
        double pontosEquipe2 = equipe2.getPontos();
        double saldoDePontosEquipe2;
        
        numJogosEquipe2++;
        numEmpatesEquipe2++;
        pontosMarcadosEquipe2 += placarEquipe2;
        pontosSofridosEquipe2 += placarEquipe1;
        pontosEquipe2 += valorEmpate;
        saldoDePontosEquipe2 = (pontosMarcadosEquipe2 - pontosSofridosEquipe2);
        
        equipe2.setJogos(numJogosEquipe2);
        equipe2.setEmpates(numEmpatesEquipe2);
        equipe2.setPontosMarcados(pontosMarcadosEquipe2);
        equipe2.setPontosSofridos(pontosSofridosEquipe2);
        equipe2.setPontos(pontosEquipe2);
        equipe2.setSaldoDePontos(saldoDePontosEquipe2);
        
        equipeCompeticaoControle.alterar(equipe1);
        equipeCompeticaoControle.alterar(equipe2);
        confrontoModalidadeColetivaControle.alterar(confronto);
        
        equipeCompeticaoControle.fecharSessaoDAOGeneric();
        confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
        competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
    }
        // CASO EQUIPE 1 VITORIOSA
        if(placarEquipe1 > placarEquipe2){
        String resultadoConfronto = equipe1.getEquipe().getNome()+" "+placarEquipe1+" X "+placarEquipe2+" "+equipe2.getEquipe().getNome();
        confronto.setResultado(resultadoConfronto);

        int numJogosEquipe1 = equipe1.getJogos();
        int numVitoriasEquipe1 = equipe1.getVitorias();
        double pontosMarcadosEquipe1 = equipe1.getPontosMarcados();
        double pontosSofridosEquipe1 = equipe1.getPontosSofridos();
        double pontosEquipe1 = equipe1.getPontos();
        double saldoDePontosEquipe1;
        
        numJogosEquipe1++;
        numVitoriasEquipe1++;
        pontosMarcadosEquipe1 += placarEquipe1;
        pontosSofridosEquipe1 += placarEquipe2;
        pontosEquipe1 += valorVitoria;
        saldoDePontosEquipe1 = (pontosMarcadosEquipe1 - pontosSofridosEquipe1);
        
        equipe1.setJogos(numJogosEquipe1);
        equipe1.setVitorias(numVitoriasEquipe1);
        equipe1.setPontosMarcados(pontosMarcadosEquipe1);
        equipe1.setPontosSofridos(pontosSofridosEquipe1);
        equipe1.setPontos(pontosEquipe1);
        equipe1.setSaldoDePontos(saldoDePontosEquipe1);
        
        int numJogosEquipe2 = equipe2.getJogos();
        int numDerrotasEquipe2 = equipe2.getDerrotas();
        double pontosMarcadosEquipe2 = equipe2.getPontosMarcados();
        double pontosSofridosEquipe2 = equipe2.getPontosSofridos();
        double pontosEquipe2 = equipe2.getPontos();
        double saldoDePontosEquipe2;
        
        numJogosEquipe2++;
        numDerrotasEquipe2++;
        pontosMarcadosEquipe2 += placarEquipe2;
        pontosSofridosEquipe2 += placarEquipe1;
        pontosEquipe2 += valorDerrota;
        saldoDePontosEquipe2 = (pontosMarcadosEquipe2 - pontosSofridosEquipe2);
        
        equipe2.setJogos(numJogosEquipe2);
        equipe2.setDerrotas(numDerrotasEquipe2);
        equipe2.setPontosMarcados(pontosMarcadosEquipe2);
        equipe2.setPontosSofridos(pontosSofridosEquipe2);
        equipe2.setPontos(pontosEquipe2);
        equipe2.setSaldoDePontos(saldoDePontosEquipe2);
        
        equipeCompeticaoControle.alterar(equipe1);
        equipeCompeticaoControle.alterar(equipe2);
        confrontoModalidadeColetivaControle.alterar(confronto);
        
        equipeCompeticaoControle.fecharSessaoDAOGeneric();
        confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
        competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
    }
        

        // CASO EQUIPE 2 VITORIOSA
        if(placarEquipe1 < placarEquipe2){
        String resultadoConfronto = equipe1.getEquipe().getNome()+" "+placarEquipe1+" X "+placarEquipe2+" "+equipe2.getEquipe().getNome();
        confronto.setResultado(resultadoConfronto);

        int numJogosEquipe1 = equipe1.getJogos();
        int numDerrotasEquipe1 = equipe1.getDerrotas();
        double pontosMarcadosEquipe1 = equipe1.getPontosMarcados();
        double pontosSofridosEquipe1 = equipe1.getPontosSofridos();
        double pontosEquipe1 = equipe1.getPontos();
        double saldoDePontosEquipe1;
        
        numJogosEquipe1++;
        numDerrotasEquipe1++;
        pontosMarcadosEquipe1 += placarEquipe1;
        pontosSofridosEquipe1 += placarEquipe2;
        pontosEquipe1 += valorDerrota;
        saldoDePontosEquipe1 = (pontosMarcadosEquipe1 - pontosSofridosEquipe1);
        
        equipe1.setJogos(numJogosEquipe1);
        equipe1.setDerrotas(numDerrotasEquipe1);
        equipe1.setPontosMarcados(pontosMarcadosEquipe1);
        equipe1.setPontosSofridos(pontosSofridosEquipe1);
        equipe1.setPontos(pontosEquipe1);
        equipe2.setSaldoDePontos(saldoDePontosEquipe1);
        
        int numJogosEquipe2 = equipe2.getJogos();
        int numVitoriasEquipe2 = equipe2.getVitorias();
        double pontosMarcadosEquipe2 = equipe2.getPontosMarcados();
        double pontosSofridosEquipe2 = equipe2.getPontosSofridos();
        double pontosEquipe2 = equipe2.getPontos();
        double saldoDePontosEquipe2;
        
        numJogosEquipe2++;
        numVitoriasEquipe2++;
        pontosMarcadosEquipe2 += placarEquipe2;
        pontosSofridosEquipe2 += placarEquipe1;
        pontosEquipe2 += valorVitoria;
        saldoDePontosEquipe2 = (pontosMarcadosEquipe2 - pontosMarcadosEquipe2);
        
        equipe2.setJogos(numJogosEquipe2);
        equipe2.setVitorias(numVitoriasEquipe2);
        equipe2.setPontosMarcados(pontosMarcadosEquipe2);
        equipe2.setPontosSofridos(pontosSofridosEquipe2);
        equipe2.setPontos(pontosEquipe2);
        equipe2.setSaldoDePontos(saldoDePontosEquipe2);
        
        equipeCompeticaoControle.alterar(equipe1);
        equipeCompeticaoControle.alterar(equipe2);
        confrontoModalidadeColetivaControle.alterar(confronto);
        
        equipeCompeticaoControle.fecharSessaoDAOGeneric();
        confrontoModalidadeColetivaControle.fecharSessaoDAOGeneric();
        competicaoModalidadeColetivaControle.fecharSessaoDAOGeneric();
    }

    
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Estou aqui!</h1>
        <h1>Placar equipe 1: <%=placarEquipe1%></h1>
        <h1>Placar equipe 2: <%=placarEquipe2%></h1>
        <h1>ID competição: <%=idCompeticao%></h1>
        <h1>ID confronto:<%=idConfronto%></h1>
        <h1>ID EQUIPE 1:<%=idEquipe1%></h1>
        <h1>ID EQUIPE 2:<%=idEquipe2%></h1>
    </body>
</html>
