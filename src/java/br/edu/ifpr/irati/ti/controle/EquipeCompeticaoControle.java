/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.EquipeCompeticao;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class EquipeCompeticaoControle {
    
    Dao<EquipeCompeticao> equipeCompeticaoDAOGeneric = new GenericDAO<>(EquipeCompeticao.class);
    
    
    public void salvar(EquipeCompeticao equipeCompeticao){
        equipeCompeticaoDAOGeneric.salvar(equipeCompeticao);
    }
    
    public void alterar(EquipeCompeticao equipeCompeticao){
        equipeCompeticaoDAOGeneric.alterar(equipeCompeticao);
    }
    
    public EquipeCompeticao buscarPorId(int id){
        return equipeCompeticaoDAOGeneric.buscarPorId(id);
    }
    
    public List<EquipeCompeticao> buscarTodos(){
        return equipeCompeticaoDAOGeneric.buscarTodos(EquipeCompeticao.class);
    }
    
    public void fecharSessaoDAOGeneric(){
        equipeCompeticaoDAOGeneric.fecharSessao();
    }
    
    public void ordenarEquipesCompeticao(String desempatePrimario, String desempateSecundario){
        
    }
    
}
