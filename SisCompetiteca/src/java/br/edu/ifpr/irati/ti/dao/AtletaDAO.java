package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Atleta;
import gerais.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

public class AtletaDAO {

    public void salvar(Atleta atleta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(atleta);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }

    public void alterar(Atleta atleta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.update(atleta);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }

    public void excluir(Atleta atleta) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.delete(atleta);
        session.getTransaction().commit();
        session.clear();
        session.close();
    }

    public List<Atleta> buscarTodos() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from atleta";
        Query query = session.createQuery(hql);
        List results = query.list();
        session.clear();
        session.close();
        return results;
    }

    public Atleta buscar(String str) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from atleta a where a.nome = '" + str + "' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Atleta atleta = (Atleta) query.uniqueResult();
        session.clear();
        session.close();
        return atleta;
    }

    public Atleta buscarPorId(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from atleta a where a.idAtleta = '" + id + "'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        Atleta competicao = (Atleta) query.uniqueResult();
        session.clear();
        session.close();
        return competicao;
    }

}
