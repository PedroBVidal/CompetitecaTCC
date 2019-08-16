package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Competicao;
import java.util.List;
import org.hibernate.Query;


public class CompeticaoDAO extends Sessao{

    public void salvar(Competicao competicao) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(competicao);
        sessao.getTransaction().commit();

    }

    public void alterar(Competicao competicao) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.update(competicao);
        sessao.getTransaction().commit();

    }

    public void excluir(Competicao competicao) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(competicao);
        sessao.getTransaction().commit();

    }

    public List<Competicao> buscarTodos() {
        abrirSessao();
        String hql = "from competicao";
        Query query = sessao.createQuery(hql);
        List results = query.list();

        return results;
    }

    public Competicao buscar(String str) {
        abrirSessao();
        String hql = "from competicao c where c.nome = '" + str + "' ";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Competicao competicao = (Competicao) query.uniqueResult();

        return competicao;
    }

    public List<Competicao> buscarPorParteNome(String str) {
        abrirSessao();
        String hql = "from competicao c where c.nome LIKE '%" + str + "%'";
        Query query = sessao.createQuery(hql);
        List results = query.list();

        return results;
    }

    public Competicao buscarPorId(int id) {
        abrirSessao();
        String hql = "from competicao c where c.idCompeticao = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Competicao competicao = (Competicao) query.uniqueResult();

        return competicao;
    }
    
    public boolean isDirty(){
        return getSessao().isDirty();
    }
}
