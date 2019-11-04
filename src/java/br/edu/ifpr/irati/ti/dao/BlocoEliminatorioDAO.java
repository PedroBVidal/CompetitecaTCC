/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.BlocoEliminatorio;
import java.util.List;

/**
 *
 * @author Usuário
 */
public class BlocoEliminatorioDAO extends Sessao {
    
    public List<BlocoEliminatorio> filtrarBlocoEliminatorioPorEtapa2(int idCompeticaoModalidade, int value,  int extensao, boolean repescagem){
        
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select bE from bloco_eliminatorio as bE WHERE bE.etapa >= '"+value+"' and bE.etapa = '"+(value + extensao -1)+"' and bE.blocoRepescagem = false";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
        
    }
    
    
        public List<BlocoEliminatorio> filtrarBlocoEliminatorioPorEtapa(int idCompeticaoModalidade, int value,  int extensao, boolean repescagem){
        
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select blocosEliminatorios from bloco_eliminatorio as bloco INNER JOIN cmc.blocosEliminatorios as bE WHERE cmc.idCompeticaoModalidade = "+idCompeticaoModalidade+" and bE.etapa >= '"+value+"' and bE.etapa <= '"+(value + extensao -1)+"' and bE.blocoRepescagem = false";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
        
    }
    
    /*
            public List<Equipe> buscarEquipesPorModalidadeECompeticaoColetiva(int idCptMod, int idModalidade) {
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select e from equipe as e INNER JOIN e.competicoesModalidadeColeivas as cmc WHERE cmc.idCompeticaoModalidade = '"+idCptMod+"' and e.modalidade = '"+idModalidade+"'";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
        }
    */
}
