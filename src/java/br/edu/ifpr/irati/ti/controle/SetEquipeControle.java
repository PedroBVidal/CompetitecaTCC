/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Etapa;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class SetEquipeControle {

    Dao<Etapa> seteDAO = new GenericDAO<>(Etapa.class);

    public List<Etapa> buscarSets() {
        return seteDAO.buscarTodos(Etapa.class);
    }

    public Etapa buscarSetPorId(int id) {
        return seteDAO.buscarPorId(id);
    }
    
    public void salvar(Etapa set){
        seteDAO.salvar(set);
    }
    
    public void alterar(Etapa set){
        seteDAO.alterar(set);
    }
    
    public void excluir(Etapa set){
        seteDAO.excluir(set);
    }

    public boolean sessaoEstaAberta() {
        return seteDAO.getSessao().isOpen();
    }

    public void fecharSessao() {
        seteDAO.fecharSessao();
    }
}
