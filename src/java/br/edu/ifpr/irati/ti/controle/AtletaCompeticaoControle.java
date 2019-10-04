/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.AtletaCompeticao;
import java.util.List;

/**
 *
 * @author olive
 */
public class AtletaCompeticaoControle {

    Dao<AtletaCompeticao> atdl = new GenericDAO<>(AtletaCompeticao.class);

    public List<AtletaCompeticao> buscarTodosAtleta() {
        return atdl.buscarTodos(AtletaCompeticao.class);
    }

    public AtletaCompeticao buscarPorId(int id) {
        return atdl.buscarPorId(id);
    }

    public void criarAtletaCompeticao(AtletaCompeticao atleta) {
        atdl.salvar(atleta);
    }

    public void alterarAtletaCompeticao(AtletaCompeticao atleta) {
        atdl.alterar(atleta);
    }

    public void droparAtletaCompeticao(AtletaCompeticao atleta) {
        atdl.excluir(atleta);
    }

    public void fecharSessaoDAOGeneric() {
        atdl.fecharSessao();
    }

    public boolean sessaoEstaAberta() {
        return atdl.getSessao().isOpen();
    }
}
