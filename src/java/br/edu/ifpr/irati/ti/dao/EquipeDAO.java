/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Equipe;
import java.util.List;
import org.hibernate.Query;


/**
 *
 * @author Usuário
 */
public class EquipeDAO extends Sessao {
    
    public void salvar(Equipe equipe){
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(equipe);
        sessao.getTransaction().commit();
    }
    public void alterar(Equipe equipe){
       abrirSessao();
       sessao.beginTransaction();
       sessao.update(equipe);
       sessao.getTransaction().commit();
    }
    public void excluir(Equipe equipe){
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(equipe);
        sessao.getTransaction().commit();
    }
    public List<Equipe> buscarTudo(){
        abrirSessao();
        sessao.beginTransaction();
        String hql = "from equipe";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    public Equipe buscar(String str){
        abrirSessao();
        String hql = "from equipe a where e.nome = '"+str+"' ";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Equipe equipe = (Equipe) query.uniqueResult();        
        return equipe;
    }
    
        public Equipe buscarPorId(int id) {
        abrirSessao();
        String hql = "select e from equipe e where e.idEquipe = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Equipe equipe = (Equipe) query.uniqueResult();
        return equipe;
        }
        
        public List<Equipe> buscarEquipesPorModalidadeECompeticaoColetiva(int idCptMod, int idModalidade) {
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select e from equipe as e INNER JOIN e.competicoesModalidadeColeivas as cmc WHERE cmc.idCompeticaoModalidade = '"+idCptMod+"' and e.modalidade = '"+idModalidade+"'";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
        }
        
        public List<Equipe> buscarEquipesAbertasACmc(int idCptMod) {
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select e from equipe as e INNER JOIN e.competicoesModalidadeColeivas as cmc WHERE cmc.idCompeticaoModalidade = '"+idCptMod+"'";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        
        return results;
        }
        
        public List<Equipe> buscarEquipesAbertasACmc2(int idCptMod) {
        abrirSessao();
        sessao.beginTransaction();
        String hql = "select e from equipe as e INNER JOIN e.competicoesModalidadeColeivas as cmc WHERE cmc.idCompeticaoModalidade = '"+idCptMod+"'";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        sessao.close();
        return results;
        }
        
}
