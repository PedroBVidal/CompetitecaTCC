/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name = "usuario")
@Proxy(lazy = false)
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class Usuario implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idUsuario;
    
    
    @Column(name="nome", nullable = false)
    private String nome;

    
    @ManyToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SELECT)
    private List<MensagemEnviada> mensagensEnviadas;
    
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SELECT)
    private List<MensagemRecebida> mensagensRecebidas;

    public Usuario() {
    }

    public Usuario(int idUsuario,String nome) {
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.mensagensEnviadas = new ArrayList<>();
        this.mensagensRecebidas = new ArrayList<>();
    }

    
    
    public void adicionarMensagemRecebida(MensagemRecebida mensagemRecebida) {
        this.getMensagensRecebidas().add(mensagemRecebida);
    }

    public void removerMensagemRecebida(MensagemRecebida mensagemRecebida) {
        this.getMensagensRecebidas().remove(mensagemRecebida);
    }

    public void adicionarMensagemEnviada(MensagemEnviada mensagemEnviada) {
        this.getMensagensEnviadas().add(mensagemEnviada);
    }

    public void removerMensagemEnviada(MensagemEnviada mensagemEnviada) {
        this.getMensagensEnviadas().remove(mensagemEnviada);
    }
    
    
    /**
     * @return the idUsuario
     */
    public int getIdUsuario() {
        return idUsuario;
    }

    /**
     * @param idUsuario the idUsuario to set
     */
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }



    /**
     * @return the nome
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }



    /**
     * @return the mensagensEnviadas
     */
    public List<MensagemEnviada> getMensagensEnviadas() {
        return mensagensEnviadas;
    }

    /**
     * @param mensagensEnviadas the mensagensEnviadas to set
     */
    public void setMensagensEnviadas(List<MensagemEnviada> mensagensEnviadas) {
        this.mensagensEnviadas = mensagensEnviadas;
    }

    /**
     * @return the mensagensRecebidas
     */
    public List<MensagemRecebida> getMensagensRecebidas() {
        return mensagensRecebidas;
    }

    /**
     * @param mensagensRecebidas the mensagensRecebidas to set
     */
    public void setMensagensRecebidas(List<MensagemRecebida> mensagensRecebidas) {
        this.mensagensRecebidas = mensagensRecebidas;
    }
    
    
    
    
    
    
    
}
