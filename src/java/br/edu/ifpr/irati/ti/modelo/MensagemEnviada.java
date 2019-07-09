/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
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
    
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "mensagensEnviadas")
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Usuario> usuariosDestinatarios;
    
    @Column(name = "assunto",nullable = false)
    protected String assunto;

    public MensagemEnviada() {
    }

    public MensagemEnviada(int idMensagemEnviada, String assunto) {
        this.idMensagemEnviada = idMensagemEnviada;
        this.usuariosDestinatarios = new ArrayList<>();
        this.assunto = assunto;
    }

    public MensagemEnviada(int idMensagemEnviada, List<Usuario> usuariosDestinatarios, String assunto) {
        this.idMensagemEnviada = idMensagemEnviada;
        this.usuariosDestinatarios = usuariosDestinatarios;
        this.assunto = assunto;
    }
    
    

    
    public void adicionarUsuarioDestinatario(Usuario usuario){
        this.setUsuariosDestinatarios(new ArrayList<>());
    }
    
    public void removerUsuarioDestinatario(Usuario usuario){
        this.setUsuariosDestinatarios(new ArrayList<>());
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

    /**
     * @return the usuariosDestinatarios
     */
    public List<Usuario> getUsuariosDestinatarios() {
        return usuariosDestinatarios;
    }

    /**
     * @param usuariosDestinatarios the usuariosDestinatarios to set
     */
    public void setUsuariosDestinatarios(List<Usuario> usuariosDestinatarios) {
        this.usuariosDestinatarios = usuariosDestinatarios;
    }
    
    
    
    
}
