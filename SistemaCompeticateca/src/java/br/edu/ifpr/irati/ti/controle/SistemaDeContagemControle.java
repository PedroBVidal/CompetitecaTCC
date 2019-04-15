/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.SistemaDeContagem;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class SistemaDeContagemControle {
    
     Dao<SistemaDeContagem> sistemaDeContagemDAO = new GenericDAO<>(SistemaDeContagem.class);
    
    
     public List<SistemaDeContagem> buscarTodos(){
         return sistemaDeContagemDAO.buscarTodos(SistemaDeContagem.class);
     }
     
     public SistemaDeContagem buscarPorId(int id){
         return sistemaDeContagemDAO.buscarPorId(id);
     }
     
}
