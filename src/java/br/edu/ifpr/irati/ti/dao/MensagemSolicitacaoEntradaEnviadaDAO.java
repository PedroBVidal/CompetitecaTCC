/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;


import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada;
import org.hibernate.Query;

/**
 *
 * @author Usuário
 */
public class MensagemSolicitacaoEntradaEnviadaDAO extends Sessao{
    
    
        public SolicitacaoEntradaEquipeEnviada buscarPorId(int id) {
        abrirSessao();
        String hql = "from solicitacaoentradaequipe_pp_enviado s where s.idMensagemEnviada = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        SolicitacaoEntradaEquipeEnviada solicEntEnv = (SolicitacaoEntradaEquipeEnviada) query.uniqueResult();
        return solicEntEnv;
    }
    
    
    
    
}
