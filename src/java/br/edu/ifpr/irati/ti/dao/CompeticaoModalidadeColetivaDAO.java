/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaDAO {
    
        public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculadasCompeticaoModalidade(int idModalidadeColetiva) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicaomodalidade cmc where cmc.idCompeticaoModalidadde = '"+idModalidadeColetiva+"'";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    
        public CompeticaoModalidadeColetiva buscarPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicaomodalidadecoletiva c where c.administrador = '" + id + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = (CompeticaoModalidadeColetiva) query.uniqueResult();
        session.clear();
        session.close();
        return competicaoModalidadeColetiva;
        
    }
    
}
