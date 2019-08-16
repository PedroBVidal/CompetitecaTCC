/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.CompeticaoModalidadeColetivaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.Confronto;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaControle {
    
    Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAOGeneric = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
    CompeticaoModalidadeColetivaDAO competicaoModalidadeColetivaDAO = new CompeticaoModalidadeColetivaDAO();
    
    
    public void salvar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        competicaoModalidadeColetivaDAOGeneric.salvar(competicaoModalidadeColetiva);
    }
    
    public CompeticaoModalidadeColetiva buscarPorId(int id){
        return competicaoModalidadeColetivaDAOGeneric.buscarPorId(id);
    }
    
    public void alterar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        competicaoModalidadeColetivaDAOGeneric.alterar(competicaoModalidadeColetiva);
    }
    
    public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculasModalidade(int idModalidadeColetiva){
        return competicaoModalidadeColetivaDAO.buscarCompeticoesColetivasVinculadasModalidadeColetiva(idModalidadeColetiva);
    }
    
    public void fecharSessaoDAOGeneric(){
        competicaoModalidadeColetivaDAOGeneric.fecharSessao();
    }
    
    public void fechaarSessaoDAOEspecifico(){
        competicaoModalidadeColetivaDAO.fecharSessao();
    }
    
    public boolean sessaoDAOGenericEstaAberta(){
        return competicaoModalidadeColetivaDAOGeneric.getSessao().isOpen();
    }
    

    
    public void gerarConfrontosSistemaTodosContraTodos(CompeticaoModalidadeColetiva cmc){
        
        List<Confronto> confrontosModalidadesColetivas = new ArrayList<>();
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
        
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
            confrontoColetivoControle.salvar((ConfrontoModalidadeColetiva) confronmc);
            
            cont++;
        }
        cmc.setJogosEmAndamento(true);
        cmc.setConfrontos(confrontosModalidadesColetivas);
        cmcc.alterar(cmc);
        
    }
    
    
}
