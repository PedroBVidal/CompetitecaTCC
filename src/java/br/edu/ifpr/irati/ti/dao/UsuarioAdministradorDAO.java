/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;


import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import java.util.List;
import javax.persistence.EntityManager;
import org.hibernate.Query;


/**
 *
 * @author Usuário
 */
public class UsuarioAdministradorDAO extends Sessao {
    
    
    public UsuarioParticipante buscarPorId(int id){
        abrirSessao();
        String hql = "from usuarioParticipante u where u.idUsuario = '"+id+"'";
        Query query = sessao.createQuery(hql);
        
        query.setMaxResults(1);
        UsuarioParticipante usuarioParticipante = (UsuarioParticipante) query.uniqueResult();        
        
        return usuarioParticipante;
    }
    
        public List<Competicao> buscarPorIdConfrontos(int id){
        abrirSessao();
        String hql = "select u.competicoes from usuarioParticipante u where u.idUsuario = '"+id+"'";
        Query query = sessao.createQuery(hql);

        List results = query.list();
        
        return results;
    }
}
