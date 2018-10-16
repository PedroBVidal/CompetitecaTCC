/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.Equipe;
import java.util.List;

/**
 *
 * @author user
 */
public class AtletaControle {
    Dao<Atleta> atdl = new GenericDAO<>(Atleta.class);
    public List<Atleta> buscarTodosAtleta(){
        return atdl.buscarTodos(Atleta.class);
    }
    public Atleta buscarPorId(int id){
        return atdl.buscarPorId(id);
    }
    public void criarAtleta(Atleta atleta){
        System.out.println(atleta.getNome());
        atdl.salvar(atleta);
    }
    public void alterarAtleta(Atleta atleta){
        atdl.alterar(atleta);
    }
    public void droparAtleta(Atleta atleta){
        atdl.excluir(atleta);
    }
}
