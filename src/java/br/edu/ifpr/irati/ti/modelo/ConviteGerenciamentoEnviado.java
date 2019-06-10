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
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;


@Entity(name = "convite_gerenciamento_enviado")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
public class ConviteGerenciamentoEnviado extends MensagemEnviada implements Serializable {
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    
    @ManyToOne(fetch = FetchType.EAGER)
    private Competicao competicao;

    public ConviteGerenciamentoEnviado() {
    }

    public ConviteGerenciamentoEnviado(String texto, Competicao competicao, int idMensagemEnviada, List<Usuario> usuariosDestinatarios, String assunto) {
        super(idMensagemEnviada, usuariosDestinatarios, assunto);
        this.texto = texto;
        this.competicao = competicao;
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



    /**
     * @return the competicao
     */
    public Competicao getCompeticao() {
        return competicao;
    }

    /**
     * @param competicao the competicao to set
     */
    public void setCompeticao(Competicao competicao) {
        this.competicao = competicao;
    }
    
    
    
    
}
