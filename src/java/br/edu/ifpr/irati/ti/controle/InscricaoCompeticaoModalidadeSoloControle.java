/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo;

/**
 *
 * @author Usuário
 */
public class InscricaoCompeticaoModalidadeSoloControle {
    
    
    Dao<InscricaoCompeticaoSolo> inscricaoCompeticaoModalidadeSoloDAO = new GenericDAO<>(InscricaoCompeticaoSolo.class);
    
    
    public void salvar(InscricaoCompeticaoSolo ics){
        inscricaoCompeticaoModalidadeSoloDAO.salvar(ics);
    }
   
    public InscricaoCompeticaoSolo buscarId(int id){
        return inscricaoCompeticaoModalidadeSoloDAO.buscarPorId(id);
    }
    public void alterar(InscricaoCompeticaoSolo ics){
        inscricaoCompeticaoModalidadeSoloDAO.alterar(ics);
    }
    
    public void fecharSessaoDAOGeneric(){
        inscricaoCompeticaoModalidadeSoloDAO.fecharSessao();
    }
    
}
