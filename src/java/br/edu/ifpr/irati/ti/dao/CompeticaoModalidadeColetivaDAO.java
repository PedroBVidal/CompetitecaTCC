/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.CompeticaoModalidadeColetiva;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.SQLQuery;

/**
 *
 * @author Usuário
 */
public class CompeticaoModalidadeColetivaDAO extends Sessao{
    
    
        public CompeticaoModalidadeColetiva buscarPorId(int id) {
        abrirSessao();
        String hql = "from competicaomodalidadecoletiva c where c.idCompeticaoModalidadde = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        CompeticaoModalidadeColetiva competicaoModalidadeColetiva = (CompeticaoModalidadeColetiva) query.uniqueResult();
        return competicaoModalidadeColetiva;
        
    }
     
     public List<Date> testeCompeticao(){
        abrirSessao();
        SQLQuery query = sessao.createSQLQuery("SELECT CURRENT_DATE");
        List results = (List) query.list();
        return results;
     }
     
     public List<CompeticaoModalidadeColetiva> buscarCompeticoesColetivasVinculadasModalidadeColetiva(int idModalidadeColetiva){
        abrirSessao();
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String sDate = sdf.format(date);
        
        String hql = "select cmc from competicaomodalidade as cmc INNER JOIN cmc.competicao as competicao where cmc.modalidadeColetiva = '"+idModalidadeColetiva+"' and cmc.inativo = 'F' and competicao.dataInicioInsc <= '"+sDate+"' and competicao.dataTerminoInsc >= '"+sDate+"'";
        Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    

     
     
     
     
}
