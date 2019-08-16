/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.dao;

import gerais.HibernateUtil;
import org.hibernate.Session;

/**
 *
 * @author Usuário
 */
public abstract class Sessao {

    protected Session sessao;

    public Session abrirSessao() {
        if (getSessao() == null || getSessao().isOpen() == false) {
            System.out.println("estou abrindo uma sessão");
            this.setSessao(HibernateUtil.getSessionFactory().openSession());
        }
        return getSessao();
    }

    public void fecharSessao() {
        if (getSessao() != null || getSessao().isOpen() == true) {
            getSessao().clear();
            
            getSessao().close();
        }
    }
    
    public void flush(){
        getSessao().flush();
    }

    /**
     * @return the sessao
     */
    public Session getSessao() {
        return sessao;
    }

    /**
     * @param sessao the sessao to set
     */
    public void setSessao(Session sessao) {
        this.sessao = sessao;
    }



}
