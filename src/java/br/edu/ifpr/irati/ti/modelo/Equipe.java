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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;

@Entity(name = "equipe")
@Proxy(lazy = false)
public class Equipe implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEquipe;

    @ManyToOne
    @JoinColumn(name = "idAdministrador")
    private UsuarioParticipante2 administrador;

    @Column(name = "nome", nullable = false)
    private String nome;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(value = FetchMode.SELECT)
    private List<Atleta> atletas;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(value = FetchMode.SUBSELECT)
    private List<Confronto> confrontosModalidadeColetiva;
    
    
    /*@OneToMany
    private List<MensagemRecebida> mensagens;
    */
    /*@ManyToOne
    //@JoinColumn(name = "competicao_idCompeticao")
    private Competicao competicao;
     */
    
    @OneToMany(mappedBy = "equipe",fetch = FetchType.LAZY)
    private List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas;

    @ManyToMany(fetch = FetchType.LAZY)
    private List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas;

    @OneToOne
    private ModalidadeColetiva modalidade;
    @OneToOne
    private Segmento segmento;
    
    public Equipe() {
        this.idEquipe = 0;
        this.nome = "";
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
//        this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
        this.administrador = new UsuarioParticipante2();
        this.modalidade = new ModalidadeColetiva();
      //  this.segmento = new Segmento();
    }

    public Equipe(int idEquipe, String nome, UsuarioParticipante2 administrador) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //      this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
        this.administrador = new UsuarioParticipante2();
        this.modalidade = new ModalidadeColetiva();
        //this.segmento = new Segmento();
    }

    public Equipe(int idEquipe, String nome, UsuarioParticipante2 administrador, Competicao competicao, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //    this.competicao = competicao;
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
        this.administrador = administrador;
        this.modalidade = new ModalidadeColetiva();
      //  this.segmento = new Segmento();
    }

    public Equipe(int idEquipe, String nome, UsuarioParticipante2 administrador, ModalidadeColetiva modalidade, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = new ArrayList<>();
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //  this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
        this.administrador = administrador;
        this.modalidade = modalidade;
       // this.segmento = new Segmento();
    }

    public Equipe(int idEquipe, String nome, UsuarioParticipante2 administrador, List<Atleta> atletas, ModalidadeColetiva modalidade, boolean aprovada) {
        this.idEquipe = idEquipe;
        this.nome = nome;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = new ArrayList<>();
        //this.competicao = new Competicao();
        this.inscricoesCompeticoesColetivas = new ArrayList<>();
        this.competicoesModalidadeColeivas = new ArrayList<>();
        this.modalidade = modalidade;
       // this.segmento = new Segmento();
    }

    public Equipe(int idEquipe, UsuarioParticipante2 administrador, String nome, List<Atleta> atletas, List<Confronto> confrontosModalidadeColetiva, List<InscricaoCompeticaoColetiva> inscricoesCompeticoesColetivas, List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas, ModalidadeColetiva modalidade) {
        this.idEquipe = idEquipe;
        this.administrador = administrador;
        this.nome = nome;
        this.atletas = atletas;
        this.confrontosModalidadeColetiva = confrontosModalidadeColetiva;
        this.inscricoesCompeticoesColetivas = inscricoesCompeticoesColetivas;
        this.competicoesModalidadeColeivas = competicoesModalidadeColeivas;
        this.modalidade = modalidade;
       // this.segmento = new Segmento();
    }

    public Segmento getSegmento() {
        return segmento;
    }

    public void setSegmento(Segmento segmento) {
        this.segmento = segmento;
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
     * @return the competicao
     */
    /* public Competicao getCompeticao() {
        return competicao;
    }

    /**
     * @param competicao the competicao to set
     */
 /* public void setCompeticao(Competicao competicao) {
        this.competicao = competicao;
    }*/
    /**
     * @return the inscricoesCompeticoesColetivas
     */
    public List<InscricaoCompeticaoColetiva> getInscricoesCompeticoesColetivas() {
        return inscricoesCompeticoesColetivas;
    }

    /**
     * @param inscricoesCompeticoesColetivas the inscricoesCompeticoesColetivas
     * to set
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
     * @param competicoesModalidadeColeivas the competicoesModalidadeColeivas to
     * set
     */
    public void setCompeticoesModalidadeColeivas(List<CompeticaoModalidadeColetiva> competicoesModalidadeColeivas) {
        this.competicoesModalidadeColeivas = competicoesModalidadeColeivas;
    }

    /**
     * @return the administrador
     */
    public UsuarioParticipante2 getAdministrador() {
        return administrador;
    }

    /**
     * @param administrador the administrador to set
     */
    public void setAdministrador(UsuarioParticipante2 administrador) {
        this.administrador = administrador;
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
    
    
    

}
