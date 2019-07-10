/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle.mensagens;

import br.edu.ifpr.irati.ti.dao.AtletaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoRecebido;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class ComunicadoRecebidoControle {
    
    
    Dao<ComunicadoRecebido> comunicadoRecebGenericDAO = new GenericDAO<>(ComunicadoRecebido.class);
    
    public List<ComunicadoRecebido> buscarTodos(){
        return comunicadoRecebGenericDAO.buscarTodos(ComunicadoRecebido.class);
    }
    public ComunicadoRecebido buscarPorId(int id){
        return comunicadoRecebGenericDAO.buscarPorId(id);
    }
    public void salvar(ComunicadoRecebido comunicadoRecebido){
        comunicadoRecebGenericDAO.salvar(comunicadoRecebido);
    }
    public void alterar(ComunicadoRecebido comunicadoRecebido){
        comunicadoRecebGenericDAO.alterar(comunicadoRecebido);
    }
    public void excluir(ComunicadoRecebido comunicadoRecebido){
        comunicadoRecebGenericDAO.excluir(comunicadoRecebido);
    }
    
        
    public void fecharSessaoDAOGeneric(){
        comunicadoRecebGenericDAO.fecharSessao();
    }
    
    public boolean sesssaoEstaAberta(){
        return comunicadoRecebGenericDAO.getSessao().isOpen();
    }
    
    
}
