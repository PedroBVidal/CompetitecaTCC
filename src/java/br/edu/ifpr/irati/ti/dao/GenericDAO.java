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

    private Session sessao;

    @Override
    public Session abrirSessao() {
        if (getSessao() == null || getSessao().isOpen() == false) {
            System.out.println("estou abrindo uma sessão");
            this.setSessao(HibernateUtil.getSessionFactory().openSession());
        }
        else{
           System.out.println("não é preciso abrir uma sessao"); 
        }
        return getSessao();
    }

    @Override
    public void fecharSessao() {
        if (getSessao() != null || getSessao().isOpen() == true) {
            getSessao().clear();
            getSessao().close();
        }
    }
    
    public GenericDAO(Class classePersistente) {
        this.classePersistente = classePersistente;
    }



    
    @Override
    public T buscarPorId(Serializable id) {
        abrirSessao(); 
        T t = (T) getSessao().load(classePersistente, id);
        return t;
    }

    @Override
    public void salvar(T t) {
        
        abrirSessao(); 
        getSessao().beginTransaction();

        getSessao().save(t);
        
        getSessao().getTransaction().commit();

    }

    @Override
    public void alterar(T t) {
        abrirSessao();
        getSessao().beginTransaction();

        getSessao().update(t);

        getSessao().getTransaction().commit();

    }

    @Override
    public void excluir(T t) {
        abrirSessao();
        getSessao().beginTransaction();

        getSessao().delete(t);

        getSessao().getTransaction().commit();

    }
    
    @Override
    public List<T> buscarTodos(Class<T> clazz) {
        abrirSessao();
        String hql = "from "+clazz.getCanonicalName();
        Query query = getSessao().createQuery(hql);
        List results = query.list();

        return results;
    }
    
    @Override
    public T buscarLogin(String email, String senha) {
        abrirSessao();
        String hql = "from "+classePersistente.getCanonicalName()+" where email = '"+email+"' and senha = '"+senha+"'";
        Query query = getSessao().createQuery(hql);
        T result = (T) query.uniqueResult();

        return result;
    }
    @Override
    public T buscarCodigoPrivado(String codigo) {
        abrirSessao();
        String hql = "from "+classePersistente.getCanonicalName()+" where codigo = '"+codigo+"'";
        Query query = getSessao().createQuery(hql);
        T result = (T) query.uniqueResult();

        return result;
    }

    /**
     * @return the sessao
     */
    @Override
    public Session getSessao() {
        return sessao;
    }

    /**
     * @param sessao the sessao to set
     */
    @Override
    public void setSessao(Session sessao) {
        this.sessao = sessao;
    }



            
}
