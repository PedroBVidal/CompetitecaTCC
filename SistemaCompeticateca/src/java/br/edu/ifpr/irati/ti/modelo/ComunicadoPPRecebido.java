/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "comunicado_pp_recebido")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class ComunicadoPPRecebido extends MensagemPPRecebida implements Serializable{
    
    @Column(name = "texto",nullable = false)
    private String texto;

    public ComunicadoPPRecebido() {
    }

    public ComunicadoPPRecebido(String texto, UsuarioParticipante2 remetente, int idMensagemRecebida, boolean lido, String assunto) {
        super(remetente, idMensagemRecebida, lido, assunto);
        this.texto = texto;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }
    
    
    
}
