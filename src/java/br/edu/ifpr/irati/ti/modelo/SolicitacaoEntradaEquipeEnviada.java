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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "solicitacaoentradaequipe_pp_enviado")
@PrimaryKeyJoinColumn(name = "idMensagemEnviada")
@Proxy(lazy = false)
public class SolicitacaoEntradaEquipeEnviada extends MensagemPPEnviada implements Serializable{
    
    @Column(name = "estadoSolicitacao")    
    private char estadoSolicitacao; 
    
    @Column(name = "texto",nullable = false)
    private String texto;
    
    @ManyToOne
    private Equipe equipe;
    
    @ManyToOne
    private UsuarioParticipante2 usuarioDestinatario;
    


    public SolicitacaoEntradaEquipeEnviada() {
    }

    public SolicitacaoEntradaEquipeEnviada(char estadoSolicitacao, String texto, Equipe equipe, UsuarioParticipante2 usuarioDestinatario, List<UsuarioParticipante2> usuariosParticipantes, int idMensagemEnviada, String assunto) {
        super(usuariosParticipantes, idMensagemEnviada, assunto);
        this.estadoSolicitacao = estadoSolicitacao;
        this.texto = texto;
        this.equipe = equipe;
        this.usuarioDestinatario = usuarioDestinatario;
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
     * @return the usuarioDestinatario
     */
    public UsuarioParticipante2 getUsuarioDestinatario() {
        return usuarioDestinatario;
    }

    /**
     * @param usuarioDestinatario the usuarioDestinatario to set
     */
    public void setUsuarioDestinatario(UsuarioParticipante2 usuarioDestinatario) {
        this.usuarioDestinatario = usuarioDestinatario;
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
