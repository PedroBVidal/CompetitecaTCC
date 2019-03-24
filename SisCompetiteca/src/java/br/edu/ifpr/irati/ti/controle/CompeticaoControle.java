/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.CompeticaoDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Competicao;
import java.util.List;

/**
 *
 * @author Aluno
 */
public class CompeticaoControle {
    Dao<Competicao> competicaoDAOGeneric = new GenericDAO<>(Competicao.class);
    CompeticaoDAO competicaoDAO = new CompeticaoDAO();
    
    
    public List<Competicao> buscarTodasCompeticoes(){
        List<Competicao> cptc = competicaoDAOGeneric.buscarTodos(Competicao.class);
        return cptc;
    }
    public Competicao buscarCompeticaoPorId(int id){
        Competicao cptc = competicaoDAO.buscarPorId(id);
        return cptc;
    }
    
    public void cadastrarCompeticao(Competicao competicao){
        competicaoDAOGeneric.salvar(competicao);
    }
    
    public List<Competicao> buscarCompeticaoPorParteNome(String str){
        return competicaoDAO.buscarPorParteNome(str);
    }
    
    public void autualizarCompeticao(Competicao competicao){
        competicaoDAOGeneric.alterar(competicao);
    }
    
    public void inativarCompeticao(Competicao competicao){
        
    }
    public Competicao buscarPorCodigo(String codigo){
        return competicaoDAOGeneric.buscarCodigoPrivado(codigo);
    }
    
    
    
}
