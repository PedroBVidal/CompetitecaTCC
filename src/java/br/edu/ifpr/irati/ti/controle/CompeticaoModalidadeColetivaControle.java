/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaControle {
    
    Dao<CompeticaoModalidadeColetiva> competicaoModalidadeColetivaDAO = new GenericDAO<>(CompeticaoModalidadeColetiva.class);
    
    public void salvar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        competicaoModalidadeColetivaDAO.salvar(competicaoModalidadeColetiva);
    }
    
    public CompeticaoModalidadeColetiva buscarPorId(int id){
        return competicaoModalidadeColetivaDAO.buscarPorId(id);
    }
    
    public void alterar(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        competicaoModalidadeColetivaDAO.alterar(competicaoModalidadeColetiva);
    }
    
    public void fecharSessaoDAOGeneric(){
        competicaoModalidadeColetivaDAO.fecharSessao();
    }

}
