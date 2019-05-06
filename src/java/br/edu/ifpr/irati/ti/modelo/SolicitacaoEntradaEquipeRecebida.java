/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "solicitacaoentradaequipe_pp_recebida")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class SolicitacaoEntradaEquipeRecebida extends MensagemPPRecebida implements Serializable {
    
    @Column(name = "inativo")
    @Type(type = "true_false")
    private boolean solicitacaoAceita; 
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    @ManyToOne
    private Equipe equipe;
    
    @ManyToOne
    private Atleta atleta;

    public SolicitacaoEntradaEquipeRecebida() {
    }

    public SolicitacaoEntradaEquipeRecebida(boolean solicitacaoAceita, String texto, Equipe equipe, Atleta atleta, UsuarioParticipante2 remetente, int idMensagemRecebida, boolean lido, String assunto) {
        super(remetente, idMensagemRecebida, lido, assunto);
        this.solicitacaoAceita = solicitacaoAceita;
        this.texto = texto;
        this.equipe = equipe;
        this.atleta = atleta;
    }

    /**
     * @return the solicitacaoAceita
     */
    public boolean isSolicitacaoAceita() {
        return solicitacaoAceita;
    }

    /**
     * @param solicitacaoAceita the solicitacaoAceita to set
     */
    public void setSolicitacaoAceita(boolean solicitacaoAceita) {
        this.solicitacaoAceita = solicitacaoAceita;
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
     * @return the equipe
     */
    public Equipe getEquipe() {
        return equipe;
    }

    /**
     * @param equipe the equipe to set
     */
    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    /**
     * @return the atleta
     */
    public Atleta getAtleta() {
        return atleta;
    }

    /**
     * @param atleta the atleta to set
     */
    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
    }
    
    
    
    
    
}
