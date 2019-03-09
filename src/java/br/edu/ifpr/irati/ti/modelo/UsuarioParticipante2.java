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
import org.hibernate.annotations.Proxy;

@Entity(name = "usuarioparticipante2")
@Proxy(lazy = false)
public class UsuarioParticipante2 implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idUsuario;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "nome", nullable = false)
    private String nome;

    @Column(name = "senha", nullable = false)
    private String senha;

    @OneToMany(fetch = FetchType.EAGER)
    private List<MensagemRecebida> msg;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "usuarioParticipante")
    private List<Atleta> atletas;

    public UsuarioParticipante2() {
        idUsuario = 0;
        email = "";
        nome = "";
        senha = "";
        atletas = new ArrayList<>();
        msg = new ArrayList<>();
    }

    public UsuarioParticipante2(int idUsuario, String email, String nome, String senha) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.atletas = new ArrayList<>();
        this.msg = new ArrayList<>();
    }

    public UsuarioParticipante2(int idUsuario, String email, String nome, String senha, List<Atleta> atletas, List<MensagemRecebida> msg) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.atletas = atletas;
        this.msg = msg;
    }

    public void adicionarAtleta(Atleta atleta) {
        this.atletas.add(atleta);
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
     * @return the atletas
     */
    public List<Atleta> getAtletas() {
        return atletas;
    }

    /**
     * @param atletas the atletas to set
     */
    public void setAtletas(List<Atleta> atletas) {
        this.atletas = atletas;
    }

    /**
     * @return the msg
     */
    public List<MensagemRecebida> getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(List<MensagemRecebida> msg) {
        this.msg = msg;
    }

    public void addMensagem(MensagemRecebida msg) {
        this.msg.add(msg);
    }

    public void removeMensagem(MensagemRecebida msg) {
        this.msg.remove(msg);
    }

}
