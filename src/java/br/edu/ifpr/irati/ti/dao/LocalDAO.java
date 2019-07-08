
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Local;
import java.util.List;



public class LocalDAO extends Sessao {
    public void salvar(Local local){
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(local);
        sessao.getTransaction().commit();
    }
    public void alterar(Local local){
       abrirSessao();
       sessao.beginTransaction();
       sessao.update(local);
       sessao.getTransaction().commit();
    }
    public void excluir(Local local){
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(local);
        sessao.getTransaction().commit();
    }
    public List<Local> buscarTudo(){
        abrirSessao();
        sessao.beginTransaction();
        String hql = "from local";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();
        return results;
    }
    public Local buscar(String str){
        abrirSessao();
        String hql = "from local a where l.nome = '"+str+"' ";
        org.hibernate.Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Local local = (Local) query.uniqueResult();        
        return local;
    }
}
