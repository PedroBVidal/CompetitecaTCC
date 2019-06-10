/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle.mensagens;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoEnviado;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class ComunicadoEnviadoControle {
    
    
    Dao<ComunicadoEnviado> comunicadoEnvGenericDAO = new GenericDAO<>(ComunicadoEnviado.class);
   
    public List<ComunicadoEnviado> buscarTodos(){
        return comunicadoEnvGenericDAO.buscarTodos(ComunicadoEnviado.class);
    }
    public ComunicadoEnviado buscarPorId(int id){
        return comunicadoEnvGenericDAO.buscarPorId(id);
    }
    public void salvar(ComunicadoEnviado comunicadoEnviado){
        comunicadoEnvGenericDAO.salvar(comunicadoEnviado);
    }
    public void alterar(ComunicadoEnviado comunicadoEnviado){
        comunicadoEnvGenericDAO.alterar(comunicadoEnviado);
    }
    public void excluir(ComunicadoEnviado comunicadoEnviado){
        comunicadoEnvGenericDAO.excluir(comunicadoEnviado);
    }
    
    
}
