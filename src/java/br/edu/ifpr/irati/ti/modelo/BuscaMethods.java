/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import java.util.List;

/**
 *
 * @author user
 */
public class BuscaMethods {
    public List<Competicao>buscaTudoCompeticao(){
        Dao<Competicao> daoc = new GenericDAO<>(Competicao.class);
        System.out.println(daoc.buscarTodos(Competicao.class).size());
        return daoc.buscarTodos(Competicao.class);
    }
}
