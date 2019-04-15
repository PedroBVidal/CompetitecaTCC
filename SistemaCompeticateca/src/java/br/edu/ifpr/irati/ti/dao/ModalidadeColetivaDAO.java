/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.DAO;

import gerais.HibernateUtil;
import br.edu.ifpr.irati.ti.modelo.ModalidadeColetiva;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author user
 */
public class ModalidadeColetivaDAO {
    public void salvar(ModalidadeColetiva modalidadecoletiva){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.save(modalidadecoletiva);
        sessao.getTransaction().commit();
    }
    public void alterar(ModalidadeColetiva modalidadecoletiva){
       Session sessao = HibernateUtil.getSessionFactory().openSession();
       sessao.beginTransaction();
       sessao.update(modalidadecoletiva);
       sessao.getTransaction().commit();
    }
    public void excluir(ModalidadeColetiva modalidade){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        sessao.delete(modalidade);
        sessao.getTransaction().commit();
    }
    public List<ModalidadeColetiva> buscarTudo(){
        Session sessao = HibernateUtil.getSessionFactory().openSession();
        sessao.beginTransaction();
        String hql = "from modalidadeColetiva";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    public ModalidadeColetiva buscar(String str){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from modalidadecoletiva a where r.titulo = '"+str+"' ";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        ModalidadeColetiva modalidadecoletiva = (ModalidadeColetiva) query.uniqueResult();        
        session.clear();
        session.close();
        return modalidadecoletiva;
    }
}
