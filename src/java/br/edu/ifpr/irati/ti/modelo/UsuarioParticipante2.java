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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import org.hibernate.annotations.Proxy;

@Entity(name = "usuarioParticipante2")
@PrimaryKeyJoinColumn(name = "idUsuario")
@Proxy(lazy = false)
public class UsuarioParticipante2 extends Usuario implements Serializable {
    
    @Column(name="senha",nullable = false)
    private String senha;
    
    @Column(name="email", nullable = false, unique=true)
    private String email;
    
    @OneToOne
    private Atleta atleta;
    
    @OneToMany(mappedBy = "administrador", fetch = FetchType.EAGER)
    //@Fetch(value = FetchMode.SUBSELECT)
    private List<Equipe> equipe;

    public UsuarioParticipante2() {
    }

    public UsuarioParticipante2(int idUsuario,String email,String nome, String senha) {
        super(idUsuario, nome);
        this.senha = senha;
        this.email = email;
        this.atleta = new Atleta();
        this.equipe = new ArrayList<>();
    }

    public UsuarioParticipante2(String senha, String email, Atleta atleta, List<Equipe> equipe, int idUsuario, String nome) {
        super(idUsuario, nome);
        this.senha = senha;
        this.email = email;
        this.atleta = atleta;
        this.equipe = equipe;
    }
    
    public void adicionarEquipe(Equipe equipe){
        this.equipe.add(equipe);
    }
    
    public void removerEquipe(Equipe equipe){
        this.equipe.add(equipe);
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
    
    
    

    

    

}
