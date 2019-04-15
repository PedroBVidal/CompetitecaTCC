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

@Entity(name = "mensagem_pp_recebida")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public class MensagemPPRecebida extends MensagemRecebida implements Serializable{
    
    @ManyToOne(fetch = FetchType.EAGER)
    private UsuarioParticipante2 remetente;

    public MensagemPPRecebida() {
    }

    public MensagemPPRecebida(UsuarioParticipante2 remetente, int idMensagemRecebida, boolean lido, String assunto) {
        super(idMensagemRecebida, lido, assunto);
        this.remetente = remetente;
    }

    

    /**
     * @return the remetente
     */
    public UsuarioParticipante2 getRemetente() {
        return remetente;
    }

    /**
     * @param remetente the remetente to set
     */
    public void setRemetente(UsuarioParticipante2 remetente) {
        this.remetente = remetente;
    }
    
    
    
    
}
