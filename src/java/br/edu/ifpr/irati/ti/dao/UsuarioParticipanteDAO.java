/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;


import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante2;
import java.util.List;
import org.hibernate.Query;

/**
 *
 * @author Usuário
 */
public class UsuarioParticipanteDAO extends Sessao {
        
        
        public UsuarioParticipante2 buscarPorId(int id){
        abrirSessao();
        String hql = "from usuarioParticipante2 u where u.idUsuario = '"+id+"'";
        Query query = sessao.createQuery(hql);
        query.setMaxResults(1);
        UsuarioParticipante2 usuarioParticipante = (UsuarioParticipante2) query.uniqueResult();  

        return usuarioParticipante;
    }
        
        
    public List<UsuarioParticipante2> buscarTudo(){
        abrirSessao();
        sessao.beginTransaction();
        String hql = "from usuarioParticipante2";
        org.hibernate.Query query = sessao.createQuery(hql);
        List results = query.list();

        return results;
    }
}
