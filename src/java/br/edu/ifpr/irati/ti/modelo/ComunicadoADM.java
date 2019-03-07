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

@Entity(name = "comunicadoADM")
@PrimaryKeyJoinColumn(name = "idMensagem")
@Proxy(lazy = false)
public class ComunicadoADM extends MensagemEntreAdministradores implements Serializable {
    
    
    //Mudar name para texto
    @Column(name = "assunto",nullable = false)
    private String texto;

    public ComunicadoADM() {
        super();
        texto = "";
    }
    
    
    public ComunicadoADM(String texto, UsuarioParticipante remetente, UsuarioParticipante destinatario, int idMensagem, boolean lido, String assunto) {
        super(remetente, destinatario, idMensagem, lido, assunto);
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
