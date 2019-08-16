/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Local;
import java.util.List;

/**
 *
 * @author user
 */
public class LocalControle {
    Dao<Local> dlc = new GenericDAO<>(Local.class);
    /**
     * Usado para buscar todos os Locais
     * @return 
     */
    public List<Local> buscarTodosLocal(){
        List<Local> locais = dlc.buscarTodos(Local.class);
        return locais;
    }
    /**
     * Usado para salvar um local
     * @param local 
     */
    public void salvaLocal(Local local){
        dlc.salvar(local);
    }
    /**
     * Busca um local por id
     * @param id
     * @return 
     */
    public Local buscaPorId(int id){
        return dlc.buscarPorId(id);
    }
    /**
     * Apaga o local do banco de dados
     * @param local 
     */
    public void droparLocal(Local local){
        dlc.excluir(local);
    }
    /**
     * Altera o local no banco de dados
     * @param local 
     */
    public void alterarLocal(Local local){
        dlc.alterar(local);
    }
    
    public void fecharSessaoDAOGeneric(){
        dlc.fecharSessao();
    }
}
