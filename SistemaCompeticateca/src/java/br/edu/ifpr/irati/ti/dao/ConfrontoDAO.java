
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Confronto;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


public class ConfrontoDAO {
    
    public void salvar(Confronto confronto){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(confronto);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public void alterar(Confronto confronto){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(confronto);
        session.getTransaction().commit();   
        session.clear();
        session.close();
    }
    
    public void excluir(Confronto confronto){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(confronto);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public List<Confronto> buscarTodos(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from confronto";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    

    
    
}
