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

@Entity(name = "comunicado_aa_recebido")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class ComunicadoAARecebido extends MensagemAARecebida implements Serializable {
    
    
    //Mudar name para texto
    @Column(name = "texto",nullable = false)
    private String texto;

    public ComunicadoAARecebido() {
        super();
        texto = "";
    }

    public ComunicadoAARecebido(String texto, UsuarioParticipante remetente, int idMensagem, boolean lido, String assunto) {
        super(remetente, idMensagem, lido, assunto);
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
