/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida;
import org.hibernate.Query;

/**
 *
 * @author Usuário
 */
public class MensagemSolicitacaoEntradaRecebidaDAO extends Sessao{
    
    
    public SolicitacaoEntradaEquipeRecebida buscarPorId(int id) {
        abrirSessao();
        String hql = "from solicitacaoentradaequipe_recebida s where s.idMensagemRecebida = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        SolicitacaoEntradaEquipeRecebida solicEntReceb = (SolicitacaoEntradaEquipeRecebida) query.uniqueResult();
        return solicEntReceb;
    }
    
    
    
}
