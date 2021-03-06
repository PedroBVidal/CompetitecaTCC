/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.AtletaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import java.util.List;

/**
 *
 * @author user
 */
public class AtletaControle {
    
    Dao<Atleta> atdl = new GenericDAO<>(Atleta.class);
    AtletaDAO atletaDAO = new AtletaDAO();
    
    public List<Atleta> buscarTodosAtleta(){
        return atdl.buscarTodos(Atleta.class);
    }
    public Atleta buscarPorId(int id){
        return atletaDAO.buscarPorId(id);
    }
    public void criarAtleta(Atleta atleta){
        atdl.salvar(atleta);
    }
    public void alterarAtleta(Atleta atleta){
        atdl.alterar(atleta);
    }
    public void droparAtleta(Atleta atleta){
        atdl.excluir(atleta);
    }
    
    public void fecharSessaoDAOGeneric(){
       atdl.fecharSessao();  
    }
    
    public void fecharSessaoDAOEspecifico(){
       atletaDAO.fecharSessao();  
    }
        
    public boolean sessaoEstaAberta(){
        return atdl.getSessao().isOpen();
    }
    
}
