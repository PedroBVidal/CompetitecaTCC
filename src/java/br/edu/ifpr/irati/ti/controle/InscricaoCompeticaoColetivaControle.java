/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoColetiva;
import br.edu.ifpr.irati.ti.modelo.InscricaoCompeticaoSolo;

/**
 *
 * @author Usuário
 */
public class InscricaoCompeticaoColetivaControle {
    
    
    Dao<InscricaoCompeticaoColetiva> inscricaoCompeticaoColetivaDAO = new GenericDAO<>(InscricaoCompeticaoColetiva.class);
    
    
    public void salvar(InscricaoCompeticaoColetiva icc){
        inscricaoCompeticaoColetivaDAO.salvar(icc);
    }
   
    public InscricaoCompeticaoColetiva buscarId(int id){
        return inscricaoCompeticaoColetivaDAO.buscarPorId(id);
    }
    public void alterar(InscricaoCompeticaoColetiva icc){
        inscricaoCompeticaoColetivaDAO.alterar(icc);
    }
    
}
