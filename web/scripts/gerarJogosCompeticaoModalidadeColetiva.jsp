<%-- 
    Document   : gerarJogosCompeticaoModalidadeColetiva
    Created on : 02/08/2019, 08:21:15
    Author     : Usuário
--%>

<%@page import="br.edu.ifpr.irati.ti.modelo.Local"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.ConfrontoModalidadeColetivaControle"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.EquipeCompeticao"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.Confronto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva"%>
<%@page import="br.edu.ifpr.irati.ti.controle.CompeticaoModalidadeColetivaControle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int idCompeticaoModalidadeColetiva = Integer.parseInt(request.getParameter("idCompModColetiva"));
    
    CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();

    CompeticaoModalidadeColetiva cmc = cmcc.buscarPorId(idCompeticaoModalidadeColetiva);

            
        List<Confronto> confrontosModalidadesColetivas = new ArrayList<>();
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
        
        int numeroEquipes = equipesCompeticao.size();
        System.out.println("Número de equipes: "+ numeroEquipes);
        int i = 0, j = 1,z=1;
        
        while(i < numeroEquipes){
            System.out.println("I: "+ i);
            while(z <= (numeroEquipes - (i + 1))){
            System.out.println("J: "+ j);
            EquipeCompeticao e1 = equipesCompeticao.get(i);
            EquipeCompeticao e2 = equipesCompeticao.get(j);
            
            List<EquipeCompeticao> equipesConfrontantes = new ArrayList<>();
            equipesConfrontantes.add(e1);
            equipesConfrontantes.add(e2);
            ConfrontoModalidadeColetiva confrontoColetivo = new ConfrontoModalidadeColetiva(equipesConfrontantes, cmc.getModalidadeColetiva());
            confrontoColetivoControle.salvar((ConfrontoModalidadeColetiva) confrontoColetivo);
            confrontosModalidadesColetivas.add(confrontoColetivo);
            j++;
            z++;
            }
            i++;
            j = i + 1;
            z = 1;
        }
        int cont = 1;
        for(Confronto confronmc : confrontosModalidadesColetivas){
            /*
            System.out.println("Confronto "+ cont);
            System.out.println(confronmc.getEquipes().get(0).getEquipe().getNome()+"("+confronmc.getEquipes().get(0).getIdEquipeCompeticao());
            System.out.println(confronmc.getEquipes().get(1).getEquipe().getNome()+"("+confronmc.getEquipes().get(1).getIdEquipeCompeticao());
            System.out.println("");
            */

            
            cont++;
        }
        
        cmc.setConfrontos(confrontosModalidadesColetivas);
        cmcc.alterar(cmc);
%>
