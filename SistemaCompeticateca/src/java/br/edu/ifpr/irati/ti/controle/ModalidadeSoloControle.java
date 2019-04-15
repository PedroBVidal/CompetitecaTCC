/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import java.util.List;

/**
 *
 * @author user
 */
public class ModalidadeSoloControle {
     Dao<ModalidadeSolo> msc = new GenericDAO<>(ModalidadeSolo.class);
    /**
     * Usado para buscar todos as Modalidades Coletivas
     * @return 
     */
    public List<ModalidadeSolo> buscarTodosModalidadeSolo(){
        List<ModalidadeSolo> modalidades = msc.buscarTodos(ModalidadeSolo.class);
        return modalidades;
    }
    /**
     * Usado para salvar um local
     * @param mc 
     */
    public void salvaModalidadeSolo(ModalidadeSolo mc){
        msc.salvar(mc);
    }
    /**
     * Busca um local por id
     * @param id
     * @return 
     */
    public ModalidadeSolo buscaPorId(int id){
        return msc.buscarPorId(id);
    }
    /**
     * Apaga o local do banco de dados
     * @param mc 
     */
    public void droparModalidadeSolo(ModalidadeSolo mc){
        msc.excluir(mc);
    }
    /**
     * Altera o local no banco de dados
     * @param mc 
     */
    public void alterarModalidadeSolo(ModalidadeSolo mc){
        msc.alterar(mc);
    }
}
