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
    Dao<Competicao> competicaoDAO = new GenericDAO<>(Competicao.class);
    
    public List<Competicao> buscarTodasCompeticoes(){
        List<Competicao> cptc = competicaoDAO.buscarTodos(Competicao.class);
        return cptc;
    }
    public Competicao buscarCompeticaoPorId(int id){
        Competicao cptc = competicaoDAO.buscarPorId(id);
        return cptc;
    }
    
    public void cadastrarCompeticao(Competicao competicao){
        competicaoDAO.salvar(competicao);
    }
    public void eliminarCompeticao(int id){
        Competicao cp = buscarCompeticaoPorId(id);
        competicaoDAO.excluir(cp);
    }
    
}
