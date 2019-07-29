/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import java.util.List;

/**
 *
 * @author Usuário
 */
public class EquipeCompeticaoDAO extends Sessao{
    
    public List<EquipeCompeticaoDAO> buscarEquipesCompeticaoVinculadasCompeticao(int idCompeticao){
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select e from competicaomodalidadecoletiva as e INNER JOIN e.competicoesModalidadeColeivas as cmc WHERE cmc.idCompeticaoModalidade = '"+idCptMod+"' and e.modalidade = '"+idModalidade+"'";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    
    
    
}
