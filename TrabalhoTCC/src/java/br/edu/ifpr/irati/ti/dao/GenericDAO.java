package br.edu.ifpr.irati.ti.dao;

import gerais.HibernateUtil;
import java.io.Serializable;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Valter Estevam
 * @param <T>
 */
public class GenericDAO<T> implements Dao<T> {

    private final Class classePersistente;

    public GenericDAO(Class classePersistente) {
        this.classePersistente = classePersistente;
    }

    @Override
    public T buscarPorId(Serializable id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        T t = (T) session.load(classePersistente, id);
        session.clear();
        session.close();
        return t;
    }

    @Override
    public void salvar(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.save(t);

        session.getTransaction().commit();
        session.clear();
        session.close();
    }

    @Override
    public void alterar(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.update(t);

        session.getTransaction().commit();
        session.clear();
        session.close();
    }

    @Override
    public void excluir(T t) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();

        session.delete(t);

        session.getTransaction().commit();
        session.clear();
        session.close();
    }
    
    @Override
    public List<T> buscarTodos(Class<T> clazz) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from "+clazz.getCanonicalName();
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }
    public T buscarLogin(String email, String senha) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from "+classePersistente.getCanonicalName()+" where email = '"+email+"' and senha = '"+senha+"'";
        Query query = session.createQuery(hql);
        T result = (T) query.uniqueResult();
        session.clear();
        session.close();
        return result;
    }
    public T buscarCodigoPrivado(String codigo) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from "+classePersistente.getCanonicalName()+" where codigo = '"+codigo+"'";
        Query query = session.createQuery(hql);
        T result = (T) query.uniqueResult();
        session.clear();
        session.close();
        return result;
    }

            
}
