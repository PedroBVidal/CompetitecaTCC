/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeSolo;
/**
 *
 * @author olive
 */
public class BlocoEliminatorioControle {
    Dao<BlocoEliminatorio> dao = new GenericDAO<>(BlocoEliminatorio.class);
    public void salvar(BlocoEliminatorio competicaoModalidadeSolo) {
        dao.salvar(competicaoModalidadeSolo);
    }
    public BlocoEliminatorio buscarPorId(int id) {
        return dao.buscarPorId(id);
    }
    public void alterar(BlocoEliminatorio competicaoModalidadeSolo) {
        dao.alterar(competicaoModalidadeSolo);
    }
    public void fecharSessaoDAOGeneric() {
        dao.fecharSessao();
    }
}
