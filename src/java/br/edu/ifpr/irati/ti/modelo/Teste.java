/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import br.edu.ifpr.irati.ti.dao.CompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class Teste {
    
    
        public static void main(String[] args) {
        
    
    Dao<Competicao> competicaoDAOGeneric = new GenericDAO<>(Competicao.class);
    CompeticaoDAO competicaoDAO = new CompeticaoDAO();
    
    List<Competicao> competicoes = competicaoDAOGeneric.buscarTodos(Competicao.class);
    
    for(Competicao c : competicoes){
        
        System.out.println(c.getNome());
    }
    
    System.exit(1);
    }
}
