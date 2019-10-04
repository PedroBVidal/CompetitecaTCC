/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

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
public class ConfrontoModalidadeColetivaControle {
    
    Dao<ConfrontoModalidadeColetiva> confrontoModalidadeColetivaDAOGeneric = new GenericDAO<>(ConfrontoModalidadeColetiva.class);

    
    public void salvar(ConfrontoModalidadeColetiva confrontoModalidadeColetiva){
        confrontoModalidadeColetivaDAOGeneric.salvar(confrontoModalidadeColetiva);
    }
    
    public ConfrontoModalidadeColetiva buscarPorId(int id){
        return confrontoModalidadeColetivaDAOGeneric.buscarPorId(id);
    }
    
    public void alterar(ConfrontoModalidadeColetiva confrontoModalidadeColetiva){
        confrontoModalidadeColetivaDAOGeneric.alterar(confrontoModalidadeColetiva);
    }
    
    public void excluir(ConfrontoModalidadeColetiva confrontoModalidadeColetiva){
        confrontoModalidadeColetivaDAOGeneric.excluir(confrontoModalidadeColetiva);
    }
    
    
    public void fecharSessaoDAOGeneric(){
        confrontoModalidadeColetivaDAOGeneric.fecharSessao();
    }
    
    public boolean sessaoDAOGenericEstaAberta(){
        return confrontoModalidadeColetivaDAOGeneric.getSessao().isOpen();
    }
    
    
    
    public void gerarConfrontosModalidadeColetiva(CompeticaoModalidadeColetiva cmc){
        
        List<Confronto> confrontosModalidadesColetivas = new ArrayList<>();
        List<EquipeCompeticao> equipesCompeticao = cmc.getEquipesCompeticao();
        ConfrontoModalidadeColetivaControle confrontoColetivoControle = new ConfrontoModalidadeColetivaControle();
        CompeticaoModalidadeColetivaControle cmcc = new CompeticaoModalidadeColetivaControle();
        
        
        int numeroEquipes = equipesCompeticao.size();
        System.out.println("Número de equipes: "+ numeroEquipes);
        int i = 0, j = 1,z=1;
        
        while(i < numeroEquipes){

            while(z <= (numeroEquipes - (i + 1))){

            EquipeCompeticao e1 = equipesCompeticao.get(i);
            EquipeCompeticao e2 = equipesCompeticao.get(j);
            
            List<EquipeCompeticao> equipesConfrontantes = new ArrayList<>();
            equipesConfrontantes.add(e1);
            equipesConfrontantes.add(e2);
            ConfrontoModalidadeColetiva confrontoColetivo = new ConfrontoModalidadeColetiva(equipesConfrontantes, cmc.getModalidadeColetiva());
            // A cada confronto coletivo criado, salva no banco.
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
        for(Confronto confronmcGeneric : confrontosModalidadesColetivas){
            
            ConfrontoModalidadeColetiva confronmc = (ConfrontoModalidadeColetiva) confronmcGeneric;
            
            System.out.println("Confronto "+ cont);
     
            System.out.println(confronmc.getEquipes().get(0)+"("+confronmc.getEquipes().get(0).getIdEquipeCompeticao());
            System.out.println(confronmc.getEquipes().get(1).getEquipe().getNome()+"("+confronmc.getEquipes().get(1).getIdEquipeCompeticao());
            System.out.println("");
            

            
            cont++;
        }
        
        cmc.setJogosEmAndamento(true);
        
        // Adiciona a lista de confronto a competição
        cmc.setConfrontos(confrontosModalidadesColetivas);
        cmcc.alterar(cmc);
        cmcc.fecharSessaoDAOGeneric();
    }
    
}
