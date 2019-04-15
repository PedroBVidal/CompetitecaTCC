/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Local;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import java.util.List;

/**
 *
 * @author user
 */
public class ModalidadeColetivaControle {
     Dao<ModalidadeColetiva> dmc = new GenericDAO<>(ModalidadeColetiva.class);
    /**
     * Usado para buscar todos as Modalidades Coletivas
     * @return 
     */
    public List<ModalidadeColetiva> buscarTodosModalidadeColetiva(){
        List<ModalidadeColetiva> modalidades = dmc.buscarTodos(ModalidadeColetiva.class);
        return modalidades;
    }
    /**
     * Usado para salvar um local
     * @param mc 
     */
    public void salvaModalidadeColetiva(ModalidadeColetiva mc){
        dmc.salvar(mc);
    }
    /**
     * Busca um local por id
     * @param id
     * @return 
     */
    public ModalidadeColetiva buscaPorId(int id){
        return dmc.buscarPorId(id);
    }
    /**
     * Apaga o local do banco de dados
     * @param mc 
     */
    public void droparModalidadeColetiva(ModalidadeColetiva mc){
        dmc.excluir(mc);
    }
    /**
     * Altera o local no banco de dados
     * @param mc 
     */
    public void alterarModalidadeColetiva(ModalidadeColetiva mc){
        dmc.alterar(mc);
    }
}
