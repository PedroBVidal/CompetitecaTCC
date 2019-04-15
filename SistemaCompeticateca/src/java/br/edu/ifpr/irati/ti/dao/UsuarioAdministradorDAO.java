/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import br.edu.ifpr.irati.ti.modelo.Competicao;
import br.edu.ifpr.irati.ti.modelo.UsuarioParticipante;
import gerais.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public class UsuarioAdministradorDAO {
    
    
    public UsuarioParticipante buscarPorId(int id){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql = "from usuarioparticipante u where u.idUsuario = '"+id+"'";
        Query query = session.createQuery(hql);
        query.setMaxResults(1);
        UsuarioParticipante usuarioParticipante = (UsuarioParticipante) query.uniqueResult();        
        session.clear();
        session.close();
        return usuarioParticipante;
    }
}
