/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Segmento;
import br.edu.ifpr.irati.ti.modelo.Segmento;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public class SegmentoDAO {
    
    
        public Segmento buscarPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from segmento s where s.idSegmento = '" + id + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Segmento segmento = (Segmento) query.uniqueResult();
        session.clear();
        session.close();
        return segmento;
    }
        
        
        public List<Segmento> buscarTodos(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from segmento";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
        
        
}
