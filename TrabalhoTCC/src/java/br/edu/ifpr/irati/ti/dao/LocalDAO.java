
package br.edu.ifpr.irati.ti.dao;

import gerais.HibernateUtil;
import br.edu.ifpr.irati.ti.modelo.Local;

import java.util.List;
import org.hibernate.Session;


public class LocalDAO {
    public void salvar(Local local){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.save(local);
        sessao.getTransaction().commit();
    }
    public void alterar(Local local){
       Session sessao = HibernateUtil.getSessionFactory().openSession();
       sessao.beginTransaction();
       sessao.update(local);
       sessao.getTransaction().commit();
    }
    public void excluir(Local local){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.delete(local);
        sessao.getTransaction().commit();
    }
    public List<Local> buscarTudo(){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        String hql = "from local";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    public Local buscar(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from local a where l.nome = '"+str+"' ";
        org.hibernate.Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Local local = (Local) query.uniqueResult();        
        session.clear();
        session.close();
        return local;
    }
}
