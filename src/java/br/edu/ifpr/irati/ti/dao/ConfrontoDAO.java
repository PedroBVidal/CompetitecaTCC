
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Confronto;
import java.util.List;
import org.hibernate.Query;


public class ConfrontoDAO extends Sessao{
    
    public void salvar(Confronto confronto){
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(confronto);
        sessao.getTransaction().commit();
        sessao.clear();
        sessao.close();
    }
    
    public void alterar(Confronto confronto){
        abrirSessao();
        sessao.beginTransaction();
        sessao.update(confronto);
        sessao.getTransaction().commit();   
        sessao.clear();
        sessao.close();
    }
    
    public void excluir(Confronto confronto){
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(confronto);
        sessao.getTransaction().commit();
        sessao.clear();
        sessao.close();
    }
    
    public List<Confronto> buscarTodos(){
        abrirSessao();
        String hql = "from confronto";
        Query query = sessao.createQuery(hql);
        List results = query.list();
        sessao.clear();
        sessao.close();
        return results;
    }
    

    
    
}
