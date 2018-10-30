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
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "equipe")
@Proxy(lazy = false)
public class Equipe implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEquipe;

    @Column(name = "nome", nullable = false)
    private String nome;


    @ManyToMany(fetch = FetchType.EAGER)
    private List<Atleta> atletas;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Confronto> confrontosModalidadeColetiva;
    
    @OneToMany
    private List<Mensagem> mensagens;

    @ManyToOne
    @JoinColumn(name = "competicao_idCompeticao")
    private Competicao competicao;
    
    @OneToMany (mappedBy = "equipe")
    private List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas;

    @ManyToMany
    private List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas;
        
        
    public Equipe() {
        this.idEquipe = 0;
        this.nome = "";
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
    }

    public Equipe(int idEquipe, String nome) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
    }

    public Equipe(int idEquipe, String nome, Competicao competicao, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        this.competicao = competicao;
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
    }

    public Equipe(int idEquipe, String nome, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
    }

    public Equipe(int idEquipe, String nome, List<Atleta> atletas, ModalidadeColetiva modalidade, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = new ArrayList<>();
        this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
    }

    public Equipe(int idEquipe, String nome, List<Atleta> atletas, List<Confronto> confrontosModalidadeColetiva, List<Mensagem> mensagens, Competicao competicao, List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas, List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = confrontosModalidadeColetiva;
        this.mensagens = mensagens;
        this.competicao = competicao;
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
        this.competicoesModalidadeColeivas = competicoesModalidadeColeivas;
    }

    
    

    

    
    public void adicionarAtleta(Atleta atleta) {
        this.getAtletas().add(atleta);
    }

    public void removerAtleta(Atleta atleta) {
        this.getAtletas().remove(atleta);
    }

    public void adicionarConfronto(Confronto confronto) {
        this.getConfrontosModalidadeColetiva().add(confronto);
    }

    public void removerConfronto(Confronto confronto) {
        this.getConfrontosModalidadeColetiva().remove(confronto);
    }

    /**
     * @return the idEquipe
     */
    public int getIdEquipe() {
        return idEquipe;
    }

    /**
     * @param idEquipe the idEquipe to set
     */
    public void setIdEquipe(int idEquipe) {
        this.idEquipe = idEquipe;
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
     * @return the confrontosModalidadeColetiva
     */
    public List<Confronto> getConfrontosModalidadeColetiva() {
        return confrontosModalidadeColetiva;
    }

    /**
     * @param confrontosModalidadeColetiva the confrontosModalidadeColetiva to
     * set
     */
    public void setConfrontosModalidadeColetiva(List<Confronto> confrontosModalidadeColetiva) {
        this.confrontosModalidadeColetiva = confrontosModalidadeColetiva;
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
     * @return the inscricoesCompeticoesColetivas
     */
    public List<InscricaoCompeticaoColetiva> getInscricoesCompeticoesColetivas() {
        return inscricoesCompeticoesColetivas;
    }

    /**
     * @param inscricoesCompeticoesColetivas the inscricoesCompeticoesColetivas to set
     */
    public void setInscricoesCompeticoesColetivas(List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas) {
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
    }

    /**
     * @return the competicoesModalidadeColeivas
     */
    public List<CompeticaoModalidadeColetiva> getCompeticoesModalidadeColeivas() {
        return competicoesModalidadeColeivas;
    }

    /**
     * @param competicoesModalidadeColeivas the competicoesModalidadeColeivas to set
     */
    public void setCompeticoesModalidadeColeivas(List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas) {
        this.competicoesModalidadeColeivas = competicoesModalidadeColeivas;
    }

    

    
    
}
