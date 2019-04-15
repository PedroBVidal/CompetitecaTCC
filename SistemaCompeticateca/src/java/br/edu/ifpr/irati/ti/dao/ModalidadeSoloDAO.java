
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


public class ModalidadeSoloDAO {
    
    public void salvar(ModalidadeSolo modalidadesolo){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(modalidadesolo);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public void alterar(ModalidadeSolo modalidadesolo){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(modalidadesolo);
        session.getTransaction().commit();   
        session.clear();
        session.close();
    }
    
    public void excluir(ModalidadeSolo modalidadesolo){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(modalidadesolo);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    public List<ModalidadeSolo> buscarTodos(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from modalidadesolo";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    
    public ModalidadeSolo buscar(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from modalidadesolo m where m.nome = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        ModalidadeSolo modalidadesolo = (ModalidadeSolo) query.uniqueResult();        
        session.clear();
        session.close();
        return modalidadesolo;
    }  
}
