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

/**
 *
 * @author Usuário
 */
@Entity(name = "comunicado_recebido")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class ComunicadoRecebido extends MensagemRecebida implements Serializable{
    
    
    @Column(name = "texto",nullable = false, length = 2000)
    private String texto;

    public ComunicadoRecebido() {
    }

    public ComunicadoRecebido(String texto, int idMensagemRecebida, boolean lido, String assunto, Usuario remetente) {
        super(idMensagemRecebida, lido, assunto, remetente);
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
