/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Equipe;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public class EquipeDAO {
        public void salvar(Equipe equipe){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.save(equipe);
        sessao.getTransaction().commit();
    }
    public void alterar(Equipe equipe){
       Session sessao = HibernateUtil.getSessionFactory().openSession();
       sessao.beginTransaction();
       sessao.update(equipe);
       sessao.getTransaction().commit();
    }
    public void excluir(Equipe equipe){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.delete(equipe);
        sessao.getTransaction().commit();
    }
    public List<Equipe> buscarTudo(){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        String hql = "from equipe";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    public Equipe buscar(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from equipe a where e.nome = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Equipe equipe = (Equipe) query.uniqueResult();        
        session.clear();
        session.close();
        return equipe;
    }
    
        public Equipe buscarPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from equipe e where e.idEquipe = '" + id + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Equipe equipe = (Equipe) query.uniqueResult();
        session.clear();
        session.close();
        return equipe;
        }
}
