/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.Usuario;
import br.edu.ifpr.irati.ti.modelo.Usuario;
import java.util.List;

/**
 *
 * @author olive
 */
public class UsuarioControle {

    Dao<Usuario> usuarioDAO = new GenericDAO<>(Usuario.class);

    public void atualizarCad(Usuario user) {
        usuarioDAO.alterar(user);
    }

    public void criar(Usuario user) throws Exception {
        usuarioDAO.salvar(user);

    }

    public Usuario buscarPorId(int id) {
        return usuarioDAO.buscarPorId(id);
    }

    public List<Usuario> buscarTodos() {
        return usuarioDAO.buscarTodos(Usuario.class);
    }

    public void fecharSessaoDAOGeneric() {
        usuarioDAO.fecharSessao();
    }

    public boolean sessaoEstaAberta() {
        return usuarioDAO.getSessao().isOpen();
    }

    public void abrirSessaoDAOGeneric() {
        usuarioDAO.abrirSessao();
    }
}
