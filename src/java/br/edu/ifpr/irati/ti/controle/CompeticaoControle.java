/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class CompeticaoControle {
    Dao<Competicao> competicao = new GenericDAO<>(Competicao.class);
    
    public List<Competicao> buscarTodasCompeticoes(){
        List<Competicao> cptc = competicao.buscarTodos(Competicao.class);
        return cptc;
    }
    public Competicao buscarCompeticaoPorId(int id){
        Competicao cptc = competicao.buscarPorId(id);
        return cptc;
    }
}
