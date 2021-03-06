/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import br.edu.ifpr.irati.ti.modelo.SistemaDeDesempate;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class SistemaDeDesempateControle {
    
    Dao<SistemaDeDesempate> sistemaDeDesempateDAO = new GenericDAO<>(SistemaDeDesempate.class);
    
    public List<SistemaDeDesempate> buscarTodos(){
        return sistemaDeDesempateDAO.buscarTodos(SistemaDeDesempate.class);
    }
    
    public void salvar(SistemaDeDesempate sistemaDeDesempate){
        sistemaDeDesempateDAO.salvar(sistemaDeDesempate);
    }
    
    public void fecharSessaoDAOEspecifico(){
        sistemaDeDesempateDAO.fecharSessao();
    }
    
    
}
