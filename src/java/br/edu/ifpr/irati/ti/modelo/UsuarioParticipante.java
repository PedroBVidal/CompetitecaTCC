
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
import javax.persistence.OneToMany;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name="usuarioparticipante")
@Proxy(lazy = false)
public class UsuarioParticipante implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int idUsuario;
    
    @Column(name="email", nullable = false, unique=true)
    private String email;
    
    @Column(name="nome", nullable = false)
    private String nome;
    
    @Column(name="senha",nullable = false)
    private String senha;
    
    @ManyToMany(mappedBy = "administradores", fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Competicao> competicoes;
    
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<MensagemEnviada> mensagensEnviadas;
    
    @OneToMany(fetch = FetchType.EAGER)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<MensagemRecebida> mensagensRecebidas;

    public UsuarioParticipante() {
        idUsuario = 0;
        email = "";
        senha = "";
        competicoes = new ArrayList<>();
        nome = "";
        mensagensEnviadas = new ArrayList<>();
        mensagensRecebidas = new ArrayList<>();
    }

    public UsuarioParticipante(int idUsuario,String nome, String email, String senha) {
        this.nome = nome;
        this.idUsuario = idUsuario;
        this.email = email;
        this.senha = senha;
        this.competicoes = new ArrayList<>();
        this.mensagensEnviadas = new ArrayList<>();
        this.mensagensRecebidas = new ArrayList<>();
    }

    public UsuarioParticipante(int idUsuario, String email, String nome, String senha, List<Competicao> competicoes, List<MensagemEnviada> mensagensEnviadas, List<MensagemRecebida> mensagensRecebidas) {
        this.idUsuario = idUsuario;
        this.email = email;
        this.nome = nome;
        this.senha = senha;
        this.competicoes = competicoes;
        this.mensagensEnviadas = mensagensEnviadas;
        this.mensagensRecebidas = mensagensRecebidas;
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
    
    
    
    
    

    
    
    
    
}
