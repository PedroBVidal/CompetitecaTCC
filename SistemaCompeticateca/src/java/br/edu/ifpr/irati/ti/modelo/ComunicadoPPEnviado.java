/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "comunicado_pp_enviado")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
public class ComunicadoPPEnviado extends MensagemPPEnviada implements Serializable{
    
    @Column(name = "texto",nullable = false)
    private String texto;

    public ComunicadoPPEnviado() {
    }
    
    
    public ComunicadoPPEnviado(String texto, int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
        this.texto = texto;
    }

    public ComunicadoPPEnviado(String texto, List<UsuarioParticipante2> usuariosParticipantes, int idMensagemEnviada, String assunto) {
        super(usuariosParticipantes, idMensagemEnviada, assunto);
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
