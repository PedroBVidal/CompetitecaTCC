
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;


@Entity(name="atleta")
@Proxy(lazy = false)
public class Atleta implements Serializable {

    
 
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idAtleta;
    
    @Column (name = "nome", nullable = false, length = 100)
    private String nome;
    
    @Column (name = "email", nullable = false, length = 100)
    private String email;
    
    @ManyToMany(mappedBy = "atletas", fetch=FetchType.EAGER)
    private List<Equipe> equipes;
    
    
    @ManyToOne
    private Competicao competicao;
    
    
    @OneToMany (mappedBy = "atleta", fetch = FetchType.EAGER)
    private List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo;
    
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<Mensagem> mensagens;
    
    @ManyToMany(fetch = FetchType.EAGER)
    private List<CompeticaoModalidadeSolo> competicoesModalidadeSolo;
    
    //VER!
    //@ManyToMany(fetch=FetchType.EAGER)
    //private List<Confronto> confrontosModalidadeSolo;
    
        
    @Column(name="aprovado")
    @Type(type="true_false")
    private boolean aprovado;
    

    public Atleta() {
        idAtleta = 0;
        nome = "";
        email = "";
        aprovado = false;
        equipes = new ArrayList<>();
        competicao = new Competicao();
        inscricoesCompeticaoSolo = new ArrayList<>();
        competicoesModalidadeSolo = new ArrayList<>();
        //confrontosModalidadeSolo = new ArrayList<>();
    }

    public Atleta(int idAtleta, String nome, String email, boolean aprovado) {
        this.idAtleta = idAtleta;
        this.nome = nome;
        this.email = email;
        this.aprovado = aprovado;
        this.equipes = new ArrayList<>();
        //this.confrontosModalidadeSolo = new ArrayList<>();
        this.competicao = new Competicao();
        inscricoesCompeticaoSolo = new ArrayList<>();
        competicoesModalidadeSolo = new ArrayList<>();
    }

    public Atleta(int idAtleta, String nome, String email, boolean aprovado, Competicao competicao) {
        this.idAtleta = idAtleta;
        this.nome = nome;
        this.email = email;
        this.aprovado = aprovado;
        this.equipes = new ArrayList<>();
        //this.confrontosModalidadeSolo = new ArrayList<>();
        this.competicao = competicao;
        inscricoesCompeticaoSolo = new ArrayList<>();
        competicoesModalidadeSolo = new ArrayList<>();
    }

    public Atleta(int idAtleta, String nome, String email, List<Equipe> equipes, Competicao competicao, List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo, List<Mensagem> mensagens, List<CompeticaoModalidadeSolo> competicoesModalidadeSolo, boolean aprovado) {
        this.idAtleta = idAtleta;
        this.nome = nome;
        this.email = email;
        this.equipes = equipes;
        this.competicao = competicao;
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
        this.mensagens = mensagens;
        this.competicoesModalidadeSolo = competicoesModalidadeSolo;
        this.aprovado = aprovado;
    }


    public void adicionarCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        this.competicoesModalidadeSolo.add(competicaoModalidadeSolo);
    }
    
    public void removerCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        this.competicoesModalidadeSolo.remove(competicaoModalidadeSolo);
    }
    
    public void adicionarInscricaoCompeticaoSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo){
        this.inscricoesCompeticaoSolo.add(inscricaoCompeticaoSolo);
    }
    
    public void removerInscricaoCompeticaoSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo){
        this.inscricoesCompeticaoSolo.remove(inscricaoCompeticaoSolo);
    }
    
    public void adicionarEquipe(Equipe equipe){
        this.getEquipes().add(equipe);
    }
    
    public void removerEquipe(Equipe equipe){
        this.getEquipes().add(equipe);
    }
    

    /*public void adicionarConfrontoSolo(Confronto confronto){
        this.getConfrontosModalidadeSolo().add(confronto);
    }
    
    public void removerConfrontoSolo(Confronto confronto){
        this.getConfrontosModalidadeSolo().remove(confronto);
    }*/
    


    /**
     * @return the idAtleta
     */
    public int getIdAtleta() {
        return idAtleta;
    }

    /**
     * @param idAtleta the idAtleta to set
     */
    public void setIdAtleta(int idAtleta) {
        this.idAtleta = idAtleta;
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
     * @return the equipes
     */
    public List<Equipe> getEquipes() {
        return equipes;
    }

    /**
     * @param equipes the equipes to set
     */
    public void setEquipes(List<Equipe> equipes) {
        this.equipes = equipes;
    }



    /**
     * @return the aprovado
     */
    public boolean isAprovado() {
        return aprovado;
    }

    /**
     * @param aprovado the aprovado to set
     */
    public void setAprovado(boolean aprovado) {
        this.aprovado = aprovado;
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

    /**
     * @return the inscricoesCompeticaoSolo
     */
    public List<InscricaoCompeticaoSolo> getInscricoesCompeticaoSolo() {
        return inscricoesCompeticaoSolo;
    }

    /**
     * @param inscricoesCompeticaoSolo the inscricoesCompeticaoSolo to set
     */
    public void setInscricoesCompeticaoSolo(List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo) {
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
    }

    /**
     * @return the mensagens
     */
    public List<Mensagem> getMensagens() {
        return mensagens;
    }

    /**
     * @param mensagens the mensagens to set
     */
    public void setMensagens(List<Mensagem> mensagens) {
        this.mensagens = mensagens;
    }

    /**
     * @return the competicoesModalidadeSolo
     */
    public List<CompeticaoModalidadeSolo> getCompeticoesModalidadeSolo() {
        return competicoesModalidadeSolo;
    }

    /**
     * @param competicoesModalidadeSolo the competicoesModalidadeSolo to set
     */
    public void setCompeticoesModalidadeSolo(List<CompeticaoModalidadeSolo> competicoesModalidadeSolo) {
        this.competicoesModalidadeSolo = competicoesModalidadeSolo;
    }
    
    
    


    
  
}
