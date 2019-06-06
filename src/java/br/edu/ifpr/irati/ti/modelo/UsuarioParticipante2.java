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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name = "usuarioparticipante2")
@Proxy(lazy = false)
public class UsuarioParticipante2 implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idUsuario;

    @Column(name="email", nullable = false, unique=true)
    private String email;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "senha", nullable = false)
    private String senha;
    
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<MensagemEnviada> mensagensEnviadas;
    
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<MensagemRecebida> mensagensRecebidas;

    @OneToOne
    private Atleta atleta;
    
    @OneToMany(mappedBy = "administrador", fetch = FetchType.EAGER)
    //@Fetch(value = FetchMode.SUBSELECT)
    private List<Equipe> equipe;

    public UsuarioParticipante2() {

    }

    public UsuarioParticipante2(int idUsuario, String email, String nome, String senha) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.atleta = new Atleta();
        this.mensagensEnviadas = new ArrayList<>();
        this.mensagensRecebidas = new ArrayList<>();
        this.equipe = new ArrayList<>();
       
    }

    public UsuarioParticipante2(int idUsuario, String email, String nome, String senha, List<MensagemEnviada> mensagensEnviadas, List<MensagemRecebida> mensagensRecebidas, Atleta atleta) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.mensagensEnviadas = mensagensEnviadas;
        this.mensagensRecebidas = mensagensRecebidas;
        this.atleta = atleta;
        this.equipe = new ArrayList<>();
    }

    public void adicionarMensagemRecebida(MensagemRecebida mensagemRecebida){
        this.getMensagensRecebidas().add(mensagemRecebida);
    }
    
    public void removerMensagemRecebida(MensagemRecebida mensagemRecebida){
        this.getMensagensRecebidas().remove(mensagemRecebida);
    }
    
    public void adicionarMensagemEnviada(MensagemEnviada mensagemEnviada){
        this.getMensagensEnviadas().add(mensagemEnviada);
    }
    
    public void removerMensagemEnviada(MensagemEnviada mensagemEnviada){
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
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
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
     * @return the senha
     */
    public String getSenha() {
        return senha;
    }

    /**
     * @param senha the senha to set
     */
    public void setSenha(String senha) {
        this.senha = senha;
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

    /**
     * @return the equipe
     */
    public List<Equipe> getEquipe() {
        return equipe;
    }

    /**
     * @param equipe the equipe to set
     */
    public void setEquipe(List<Equipe> equipe) {
        this.equipe = equipe;
    }
    
    public void adicionarEquipe(Equipe equipe){
        this.equipe.add(equipe);
    }
    
    public void removerEquipe(Equipe equipe){
        this.equipe.remove(equipe);
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
