package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Atleta;
import java.util.List;
import org.hibernate.Query;


public class AtletaDAO extends Sessao{

    public void salvar(Atleta atleta) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.save(atleta);
        sessao.getTransaction().commit();

    }

    public void alterar(Atleta atleta) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.update(atleta);
        sessao.getTransaction().commit();

    }

    public void excluir(Atleta atleta) {
        abrirSessao();
        sessao.beginTransaction();
        sessao.delete(atleta);
        sessao.getTransaction().commit();

    }

    public List<Atleta> buscarTodos() {
        abrirSessao();
        String hql = "from atleta";
        Query query = sessao.createQuery(hql);
        List results = query.list();

        return results;
    }

    public Atleta buscar(String str) {
        abrirSessao();
        String hql = "from atleta a where a.nome = '" + str + "' ";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Atleta atleta = (Atleta) query.uniqueResult();

        return atleta;
    }

    public Atleta buscarPorId(int id) {
        abrirSessao();
        String hql = "from atleta a where a.idAtleta = '" + id + "'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        Atleta competicao = (Atleta) query.uniqueResult();

        return competicao;
    }

}
