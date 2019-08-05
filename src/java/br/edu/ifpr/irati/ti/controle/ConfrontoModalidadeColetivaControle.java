/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ConfrontoModalidadeColetiva;

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
    
    public void fecharSessaoDAOGeneric(){
        confrontoModalidadeColetivaDAOGeneric.fecharSessao();
    }
    
    
    
}
