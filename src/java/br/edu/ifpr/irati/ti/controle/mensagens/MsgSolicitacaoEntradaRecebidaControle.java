/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle.mensagens;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.MensagemSolicitacaoEntradaRecebidaDAO;
import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class MsgSolicitacaoEntradaRecebidaControle {
    
    Dao<SolicitacaoEntradaEquipeRecebida> genericSolicEntradaEquipeRecebidaDAO = new GenericDAO<>(SolicitacaoEntradaEquipeRecebida.class);
    MensagemSolicitacaoEntradaRecebidaDAO msgSolicitacaoEntradaRecebidaDAO = new MensagemSolicitacaoEntradaRecebidaDAO();
    
    public void cadastrar(SolicitacaoEntradaEquipeRecebida msg){
        genericSolicEntradaEquipeRecebidaDAO.salvar(msg);
    }
    
    public void alterar(SolicitacaoEntradaEquipeRecebida msg){
        genericSolicEntradaEquipeRecebidaDAO.alterar(msg);
    }
    
    public void excluir(SolicitacaoEntradaEquipeRecebida msg){
        genericSolicEntradaEquipeRecebidaDAO.excluir(msg);
    }
    
    public SolicitacaoEntradaEquipeRecebida buscarPorId(int id){
        return msgSolicitacaoEntradaRecebidaDAO.buscarPorId(id);
    }
    
    public List<SolicitacaoEntradaEquipeRecebida> buscarTodas(){
        return genericSolicEntradaEquipeRecebidaDAO.buscarTodos(SolicitacaoEntradaEquipeRecebida.class);
    }
    
    
    
}
