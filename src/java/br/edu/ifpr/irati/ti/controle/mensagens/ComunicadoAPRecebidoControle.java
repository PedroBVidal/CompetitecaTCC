/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle.mensagens;

import br.edu.ifpr.irati.ti.dao.AtletaDAO;
import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido;
import br.edu.ifpr.irati.ti.modelo.ComunicadoAPRecebido;
import java.util.List;

/**
 *
 * @author gustavo
 */
public class ComunicadoAPRecebidoControle {
       Dao<ComunicadoAPRecebido> atdl = new GenericDAO<>(ComunicadoAPRecebido.class);
    AtletaDAO atletaDAO = new AtletaDAO();
    
    public List<ComunicadoAPRecebido> buscarTodos(){
        return atdl.buscarTodos(ComunicadoAPRecebido.class);
    }
    public ComunicadoAPRecebido buscarPorId(int id){
        return atdl.buscarPorId(id);
    }
    public void salvar(ComunicadoAPRecebido atleta){
        atdl.salvar(atleta);
    }
    public void alterar(ComunicadoAPRecebido atleta){
        atdl.alterar(atleta);
    }
    public void excluir(ComunicadoAPRecebido atleta){
        atdl.excluir(atleta);
    }
}
