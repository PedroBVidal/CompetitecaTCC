/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeEnviada;
import br.edu.ifpr.irati.ti.modelo.SolicitacaoEntradaEquipeRecebida;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public class MensagemSolicitacaoEntradaRecebidaDAO {
    
    
    public SolicitacaoEntradaEquipeRecebida buscarPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from solicitacaoentradaequipe_pp_recebida s where s.idMensagemRecebida = '" + id + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        SolicitacaoEntradaEquipeRecebida solicEntReceb = (SolicitacaoEntradaEquipeRecebida) query.uniqueResult();
        session.clear();
        session.close();
        return solicEntReceb;
    }
    
    
    
}
