
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.ModalidadeSolo;
import java.util.List;
import org.hibernate.Query;



public class ModalidadeSoloDAO extends Sessao{
    
    public void salvar(ModalidadeSolo modalidadesolo){
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(modalidadesolo);
        sessao.getTransaction().commit();

    }
    
    public void alterar(ModalidadeSolo modalidadesolo){
        abrirSessao();
        sessao.beginTransaction();
        sessao.update(modalidadesolo);
        sessao.getTransaction().commit();   

    }
    
    public void excluir(ModalidadeSolo modalidadesolo){
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(modalidadesolo);
        sessao.getTransaction().commit();

    }
    
    public List<ModalidadeSolo> buscarTodos(){
        abrirSessao();
        String hql = "from modalidadesolo";
        Query query = sessao.createQuery(hql);
        List results = query.list();

        return results;
    }
    
    public ModalidadeSolo buscar(String str){
        abrirSessao();
        String hql = "from modalidadesolo m where m.nome = '"+str+"' ";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        ModalidadeSolo modalidadesolo = (ModalidadeSolo) query.uniqueResult();        

        return modalidadesolo;
    }  
}
