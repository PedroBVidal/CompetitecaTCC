
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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Proxy;

@Entity(name="usuarioparticipante")
@Proxy(lazy = false)
public class UsuarioParticipante implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int idUsuario;
    
    @Column(name="email", nullable = false)
    private String email;
    
    @Column(name="nome", nullable = false)
    private String nome;
    
    @Column(name="senha",nullable = false)
    private String senha;
    
    @ManyToMany(fetch= FetchType.EAGER)
    private List<Competicao> competicoes;
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<Mensagem> msg;

    public UsuarioParticipante() {
        idUsuario = 0;
        email = "";
        senha = "";
        competicoes = new ArrayList<>();
        nome = "";
        msg = new ArrayList<>();
    }

    public UsuarioParticipante(int idUsuario,String nome, String email, String senha) {
        this.nome = nome;
        this.idUsuario = idUsuario;
        this.email = email;
        this.senha = senha;
        this.competicoes = new ArrayList<>();
        this.msg = new ArrayList<>();
    }

    public UsuarioParticipante(int idUsuario, String email, String senha, List<Competicao> competicoes, List<Mensagem> msg) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.senha = senha;
        this.competicoes = competicoes;
        this.msg = msg;
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
     * @return the competicoes
     */
    public List<Competicao> getCompeticoes() {
        return competicoes;
    }

    /**
     * @param competicoes the atletas to set
     */
    public void setCompeticoes(List<Competicao> competicoes) {
        this.competicoes = competicoes;
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
    public void adicionarCompeticao(Competicao cp){
        competicoes.add(cp);
    }
    public void removerCompeticao(Competicao cp){
        competicoes.remove(cp);
    }

    /**
     * @return the msg
     */
    public List<Mensagem> getMsg() {
        return msg;
    }

    /**
     * @param msg the msg to set
     */
    public void setMsg(List<Mensagem> msg) {
        this.msg = msg;
    }
    public void addMensagem(Mensagem msg){
        this.msg.add(msg);
    }
    public void removeMensagem(Mensagem msg){
        this.msg.remove(msg);
    }
    
    
    
    

    
    
    
    
}
