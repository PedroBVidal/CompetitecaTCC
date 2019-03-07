/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;


@Entity(name = "mensagementreadministradores")
@PrimaryKeyJoinColumn(name = "idMensagem")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class MensagemEntreAdministradores extends Mensagem implements Serializable {
    

    
    @ManyToOne(fetch = FetchType.EAGER)
    private UsuarioParticipante remetente;
    
    @ManyToOne(fetch = FetchType.EAGER)
    private UsuarioParticipante destinatario;

    public MensagemEntreAdministradores() {
        super();
        remetente = new UsuarioParticipante();
        destinatario = new UsuarioParticipante();
    }

    public MensagemEntreAdministradores(UsuarioParticipante remetente, UsuarioParticipante destinatario, int idMensagem, boolean lido, String assunto) {
        super(idMensagem, lido, assunto);
        this.remetente = remetente;
        this.destinatario = destinatario;
    }
    
    
    
    
    
    
}
