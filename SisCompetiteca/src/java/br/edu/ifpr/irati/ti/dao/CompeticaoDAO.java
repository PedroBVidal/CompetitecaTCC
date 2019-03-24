
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Competicao;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


public class CompeticaoDAO {
    
    public void salvar(Competicao competicao){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(competicao);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public void alterar(Competicao competicao){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(competicao);
        session.getTransaction().commit();   
        session.clear();
        session.close();
    }
    
    public void excluir(Competicao competicao){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(competicao);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public List<Competicao> buscarTodos(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicao";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    
    public Competicao buscar(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicao c where c.nome = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Competicao competicao = (Competicao) query.uniqueResult();        
        session.clear();
        session.close();
        return competicao;
    }
    
        public List<Competicao> buscarPorParteNome(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicao c where c.nome LIKE '%"+ str +"%'";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    
        public Competicao buscarPorId(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from competicao c where c.idCompeticao = '"+id+"'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Competicao competicao = (Competicao) query.uniqueResult();        
        session.clear();
        session.close();
        return competicao;
    }
}
