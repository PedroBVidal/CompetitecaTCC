/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.controle.mensagens;

import br.edu.ifpr.irati.ti.dao.Dao;
import br.edu.ifpr.irati.ti.dao.GenericDAO;
import br.edu.ifpr.irati.ti.dao.MensagemSolicitacaoEntradaEnviadaDAO;
import br.edu.ifpr.irati.ti.modelo.Atleta;
import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class MsgSolicitacaoEntradaEnviadaControle {
    
    Dao<SolicitacaoEntradaEquipeEnviada> genericSolicEntradaEquipeEnvDAO = new GenericDAO<>(SolicitacaoEntradaEquipeEnviada.class);
    MensagemSolicitacaoEntradaEnviadaDAO msgSolicitacaoEntradaEnviadaDAO = new MensagemSolicitacaoEntradaEnviadaDAO();
    
    public void cadastrar(SolicitacaoEntradaEquipeEnviada msg){
        genericSolicEntradaEquipeEnvDAO.salvar(msg);
    }
    
    public void alterar(SolicitacaoEntradaEquipeEnviada msg){
        genericSolicEntradaEquipeEnvDAO.alterar(msg);
    }
    
    public void excluir(SolicitacaoEntradaEquipeEnviada msg){
        genericSolicEntradaEquipeEnvDAO.excluir(msg);
    }
    
    public SolicitacaoEntradaEquipeEnviada buscarPorId(int id){
        return msgSolicitacaoEntradaEnviadaDAO.buscarPorId(id);
    }
    
    public List<SolicitacaoEntradaEquipeEnviada> buscarTodas(){
        return genericSolicEntradaEquipeEnvDAO.buscarTodos(SolicitacaoEntradaEquipeEnviada.class);
    }
    
        
    public void fecharSessaoDAOGeneric(){
        genericSolicEntradaEquipeEnvDAO.fecharSessao();
    }
    
    public void fecharSessaoDAOEspecifico(){
        msgSolicitacaoEntradaEnviadaDAO.fecharSessao();
    }
}
