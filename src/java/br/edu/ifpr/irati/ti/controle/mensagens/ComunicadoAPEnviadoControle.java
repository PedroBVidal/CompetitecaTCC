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
 * @author gustavo
 */
public class ComunicadoAPEnviadoControle {
        Dao<ComunicadoEnviado> atdl = new GenericDAO<>(ComunicadoAPEnviado.class);
   
    public List<ComunicadoAPEnviado> buscarTodos(){
        return atdl.buscarTodos(ComunicadoAPEnviado.class);
    }
    public ComunicadoAPEnviado buscarPorId(int id){
        return atdl.buscarPorId(id);
    }
    public void salvar(ComunicadoAPEnviado atleta){
        atdl.salvar(atleta);
    }
    public void alterar(ComunicadoAPEnviado atleta){
        atdl.alterar(atleta);
    }
    public void excluir(ComunicadoAPEnviado atleta){
        atdl.excluir(atleta);
    }
}

