/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "convite_gerenciamento_aa_enviado")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
public class ConviteGerenciamentoAAEnviado extends MensagemAAEnviada implements Serializable {
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    
    @ManyToOne(fetch = FetchType.EAGER)
    private Competicao competicao;

    public ConviteGerenciamentoAAEnviado() {
    }

    public ConviteGerenciamentoAAEnviado(String texto, Competicao competicao, int idMensagemEnviada, String assunto) {
        super(idMensagemEnviada, assunto);
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
