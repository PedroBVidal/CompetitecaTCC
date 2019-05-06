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
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

/**
 *
 * @author Usuário
 */
@Entity(name = "convite_gerenciamento_aa_recebido")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class ConviteGerenciamentoAARecebido extends MensagemAARecebida implements Serializable {
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    @Column(name="aceito")
    @Type(type="true_false")
    private boolean aceito;
    
    @ManyToOne(fetch = FetchType.EAGER)
    private Competicao competicao;

    public ConviteGerenciamentoAARecebido() {
    }

    public ConviteGerenciamentoAARecebido(String texto, boolean aceito, Competicao competicao, UsuarioParticipante remetente, int idMensagem, boolean lido, String assunto) {
        super(remetente, idMensagem, lido, assunto);
        this.texto = texto;
        this.aceito = aceito;
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
     * @return the aceito
     */
    public boolean isAceito() {
        return aceito;
    }

    /**
     * @param aceito the aceito to set
     */
    public void setAceito(boolean aceito) {
        this.aceito = aceito;
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
