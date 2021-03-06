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
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "solicitacaoentradaequipe_recebida")
@PrimaryKeyJoinColumn(name = "idMensagemRecebida")
@Proxy(lazy = false)
public class SolicitacaoEntradaEquipeRecebida extends MensagemRecebida implements Serializable {
    
    @Column(name = "estadoSolicitacao")    
    private char estadoSolicitacao; 
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    @ManyToOne
    private Equipe equipe;
    

    
    @OneToOne
    private SolicitacaoEntradaEquipeEnviada solicitacaoEntradaEquipeEnviada;
    

    public SolicitacaoEntradaEquipeRecebida() {
    }

    public SolicitacaoEntradaEquipeRecebida(char estadoSolicitacao, String texto, Equipe equipe, SolicitacaoEntradaEquipeEnviada solicitacaoEntradaEquipeEnviada, int idMensagemRecebida, boolean lido, String assunto, Usuario remetente) {
        super(idMensagemRecebida, lido, assunto, remetente);
        this.estadoSolicitacao = estadoSolicitacao;
        this.texto = texto;
        this.equipe = equipe;
        this.solicitacaoEntradaEquipeEnviada = solicitacaoEntradaEquipeEnviada;
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
     * @return the solicitacaoEntradaEquipeEnviada
     */
    public SolicitacaoEntradaEquipeEnviada getSolicitacaoEntradaEquipeEnviada() {
        return solicitacaoEntradaEquipeEnviada;
    }

    /**
     * @param solicitacaoEntradaEquipeEnviada the solicitacaoEntradaEquipeEnviada to set
     */
    public void setSolicitacaoEntradaEquipeEnviada(SolicitacaoEntradaEquipeEnviada solicitacaoEntradaEquipeEnviada) {
        this.solicitacaoEntradaEquipeEnviada = solicitacaoEntradaEquipeEnviada;
    }

    /**
     * @return the estadoSolicitacao
     */
    public char getEstadoSolicitacao() {
        return estadoSolicitacao;
    }

    /**
     * @param estadoSolicitacao the estadoSolicitacao to set
     */
    public void setEstadoSolicitacao(char estadoSolicitacao) {
        this.estadoSolicitacao = estadoSolicitacao;
    }

    

    
    
    
    
    
    
}
