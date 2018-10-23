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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
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

    @ManyToOne
    private ModalidadeColetiva modalidade;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Atleta> atletas;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<Confronto> confrontosModalidadeColetiva;

    //@ManyToOne
    //@JoinColumn(name = "competicao_idCompeticao")
    //private Competicao competicao;

    @Column(name = "aprovado")
    @Type(type = "true_false")
    private boolean aprovada;

    public Equipe() {
        this.idEquipe = 0;
        this.nome = "";
        this.modalidade = new ModalidadeColetiva();
        this.atletas = new ArrayList<>();
        this.aprovada = false;
        this.confrontosModalidadeColetiva = new ArrayList<>();
      //  this.competicao = new Competicao();
    }

    public Equipe(int idEquipe, String nome, ModalidadeColetiva modalidade, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.modalidade = modalidade;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //this.competicao = new Competicao();
        this.aprovada = aprovada;
    }

    public Equipe(int idEquipe, String nome, Competicao competicao, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.modalidade = new ModalidadeColetiva();
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //this.competicao = competicao;
        this.aprovada = aprovada;
    }

    public Equipe(int idEquipe, String nome, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.modalidade = new ModalidadeColetiva();
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //this.competicao = new Competicao();
        this.aprovada = aprovada;
    }

    public Equipe(int idEquipe, String nome, List<Atleta> atletas, ModalidadeColetiva modalidade, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.modalidade = modalidade;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //this.competicao = new Competicao();
        this.aprovada = aprovada;
    }

    public Equipe(int idEquipe, String nome, ModalidadeColetiva modalidade, List<Atleta> atletas, List<Confronto> confrontosModalidadeColetiva, Competicao competicao, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.modalidade = modalidade;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = confrontosModalidadeColetiva;
        //this.competicao = competicao;
        this.aprovada = aprovada;
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
     * @return the modalidade
     */
    public ModalidadeColetiva getModalidade() {
        return modalidade;
    }

    /**
     * @param modalidade the modalidade to set
     */
    public void setModalidade(ModalidadeColetiva modalidade) {
        this.modalidade = modalidade;
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
     * @return the competicao
     */
    /*public Competicao getCompeticao() {
        return competicao;
    }*/

    /**
     * @param competicao the competicao to set
     */
    /*public void setCompeticao(Competicao competicao) {
        this.competicao = competicao;
    }*/

    /**
     * @return the aprovada
     */
    public boolean isAprovada() {
        return aprovada;
    }

    /**
     * @param aprovada the aprovada to set
     */
    public void setAprovada(boolean aprovada) {
        this.aprovada = aprovada;
    }

}
