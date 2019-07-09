/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Segmento;
import java.util.List;
import org.hibernate.Query;


/**
 *
 * @author Usuário
 */
public class SegmentoDAO extends Sessao {
    
        
    public Segmento buscarPorId(int id) {
        abrirSessao();
        String hql = "from segmento s where s.idSegmento = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Segmento segmento = (Segmento) query.uniqueResult();

        return segmento;
    }
        
        
        public List<Segmento> buscarTodos(){
        abrirSessao();
        String hql = "from segmento";
        Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }

        
}
