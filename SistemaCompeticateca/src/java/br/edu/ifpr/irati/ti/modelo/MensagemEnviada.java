/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Usuário
 */
@Entity(name = "mensagem_enviada")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MensagemEnviada implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idMensagemEnviada;
    
    @Column(name = "assunto",nullable = false)
    protected String assunto;

    public MensagemEnviada() {
    }

    public MensagemEnviada(int idMensagemEnviada, String assunto) {
        this.idMensagemEnviada = idMensagemEnviada;
        this.assunto = assunto;
    }

    /**
     * @return the idMensagemEnviada
     */
    public int getIdMensagemEnviada() {
        return idMensagemEnviada;
    }

    /**
     * @param idMensagemEnviada the idMensagemEnviada to set
     */
    public void setIdMensagemEnviada(int idMensagemEnviada) {
        this.idMensagemEnviada = idMensagemEnviada;
    }

    /**
     * @return the assunto
     */
    public String getAssunto() {
        return assunto;
    }

    /**
     * @param assunto the assunto to set
     */
    public void setAssunto(String assunto) {
        this.assunto = assunto;
    }
    
    
    
    
}
