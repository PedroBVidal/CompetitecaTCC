/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeSoloControle {
    
    Dao<CompeticaoModalidadeSolo> competicaoModalidadeSoloDAO = new GenericDAO<>(CompeticaoModalidadeSolo.class);

    
    public void salvar(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        competicaoModalidadeSoloDAO.salvar(competicaoModalidadeSolo);
    }
    
    public CompeticaoModalidadeSolo buscarPorId(int id){
        return competicaoModalidadeSoloDAO.buscarPorId(id);
    }
    
    public void alterar(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        competicaoModalidadeSoloDAO.alterar(competicaoModalidadeSolo);
    }
    
}
