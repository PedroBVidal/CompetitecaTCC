/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Usuário
 */
@Entity(name = "mensagem_aa_enviada")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MensagemAAEnviada extends MensagemEnviada implements Serializable {
    
    
    @ManyToMany(fetch = FetchType.EAGER)
    protected List<UsuarioParticipante> usuariosAdmnistradores;

    public MensagemAAEnviada() {
    }

    public MensagemAAEnviada(int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
        this.usuariosAdmnistradores = new ArrayList<>();
    }

    public MensagemAAEnviada(List<UsuarioParticipante> usuariosAdmnistradores, int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
        this.usuariosAdmnistradores = usuariosAdmnistradores;
    }
    
    public void adicionarUsuarioAdministrador(UsuarioParticipante usuarioParticipante){
        this.getUsuariosAdmnistradores().add(usuarioParticipante);
    }
    
    public void removerUsuarioAdministrador(UsuarioParticipante usuarioParticipante){
        this.getUsuariosAdmnistradores().remove(usuarioParticipante);
    }

    /**
     * @return the usuariosAdmnistradores
     */
    public List<UsuarioParticipante> getUsuariosAdmnistradores() {
        return usuariosAdmnistradores;
    }

    /**
     * @param usuariosAdmnistradores the usuariosAdmnistradores to set
     */
    public void setUsuariosAdmnistradores(List<UsuarioParticipante> usuariosAdmnistradores) {
        this.usuariosAdmnistradores = usuariosAdmnistradores;
    }
    
    
    
    
}
