/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaDAO extends Sessao{
    
        public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculadasCompeticaoModalidade(int idModalidadeColetiva) {
        abrirSessao();
        String hql = "from competicaomodalidade cmc where cmc.idCompeticaoModalidadde = '"+idModalidadeColetiva+"'";
        Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    
        public CompeticaoModalidadeColetiva buscarPorId(int id) {
        abrirSessao();
        String hql = "from competicaomodalidadecoletiva c where c.administrador = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = (CompeticaoModalidadeColetiva) query.uniqueResult();
        return competicaoModalidadeColetiva;
        
    }
    
}
