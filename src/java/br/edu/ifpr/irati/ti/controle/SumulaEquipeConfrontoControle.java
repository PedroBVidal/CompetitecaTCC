/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.SumulaEquipeConfronto;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class SumulaEquipeConfrontoControle {
    
    Dao<SumulaEquipeConfronto> sumulaEquipeConfrontoDAO = new GenericDAO<>(SumulaEquipeConfronto.class);

    public List<SumulaEquipeConfronto> buscarSumulaEquipeConfrontos() {
        return sumulaEquipeConfrontoDAO.buscarTodos(SumulaEquipeConfronto.class);
    }

    public SumulaEquipeConfronto buscarSumulaEquipeConfrontoPorId(int id) {
        return sumulaEquipeConfrontoDAO.buscarPorId(id);
    }
    
    public void salvar(SumulaEquipeConfronto SumulaEquipeConfronto){
        sumulaEquipeConfrontoDAO.salvar(SumulaEquipeConfronto);
    }
    
    public void alterar(SumulaEquipeConfronto SumulaEquipeConfronto){
        sumulaEquipeConfrontoDAO.alterar(SumulaEquipeConfronto);
    }
    
    public void excluir(SumulaEquipeConfronto SumulaEquipeConfronto){
        sumulaEquipeConfrontoDAO.excluir(SumulaEquipeConfronto);
    }

    public boolean sessaoEstaAberta() {
        return sumulaEquipeConfrontoDAO.getSessao().isOpen();
    }

    public void fecharSessao() {
        sumulaEquipeConfrontoDAO.fecharSessao();
    }
    
    
}
