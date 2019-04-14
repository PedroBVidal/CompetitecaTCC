package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "atleta")
@Proxy(lazy = false)
public class Atleta implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idAtleta;

    @Temporal(TemporalType.DATE)
    private Date dataNascimento;

    @OneToOne
    private Segmento segmento;

    @Column(name = "cpf", nullable = true)
    private String cpf;

    @ManyToMany(mappedBy = "atletas", fetch = FetchType.EAGER)
    private List<Equipe> equipes;

    @OneToOne(fetch = FetchType.EAGER, mappedBy = "atleta")
    private UsuarioParticipante2 usuarioParticipante;

    @OneToMany(mappedBy = "atleta", fetch = FetchType.EAGER)
    private List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo;

    @OneToMany(fetch = FetchType.EAGER)
    private List<MensagemRecebida> mensagens;

    @ManyToMany(fetch = FetchType.EAGER)
    private List<CompeticaoModalidadeSolo> competicoesModalidadeSolo;

    //VER!
    //@ManyToMany(fetch=FetchType.EAGER)
    //private List<Confronto> confrontosModalidadeSolo;


    public Atleta() {
    }


    public Atleta(int idAtleta, Date dataNascimento,String cpf) {
        this.idAtleta = idAtleta;
        this.dataNascimento = dataNascimento;
        this.cpf = cpf;
        this.equipes = new ArrayList<>();
        this.usuarioParticipante = new UsuarioParticipante2();
        this.inscricoesCompeticaoSolo = new ArrayList<>();
        this.mensagens = new ArrayList<>();
        this.competicoesModalidadeSolo = new ArrayList<>();
    }

    public Atleta(int idAtleta, Date dataNascimento,String cpf, List<Equipe> equipes, UsuarioParticipante2 usuarioParticipante, List<InscricaoCompeticaoSolo> inscricoesCompeticaoSolo, List<MensagemRecebida> mensagens, List<CompeticaoModalidadeSolo> competicoesModalidadeSolo) {
        this.idAtleta = idAtleta;
        this.dataNascimento = dataNascimento;
        this.cpf = cpf;
        this.equipes = equipes;
        this.usuarioParticipante = usuarioParticipante;
        this.inscricoesCompeticaoSolo = inscricoesCompeticaoSolo;
        this.mensagens = mensagens;
        this.competicoesModalidadeSolo = competicoesModalidadeSolo;
    }
    
    

    

    public void adicionarCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.competicoesModalidadeSolo.add(competicaoModalidadeSolo);
    }

    public void removerCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.competicoesModalidadeSolo.remove(competicaoModalidadeSolo);
    }

    public void adicionarInscricaoCompeticaoSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo) {
        this.inscricoesCompeticaoSolo.add(inscricaoCompeticaoSolo);
    }

    public void removerInscricaoCompeticaoSolo(InscricaoCompeticaoSolo inscricaoCompeticaoSolo) {
        this.inscricoesCompeticaoSolo.remove(inscricaoCompeticaoSolo);
    }

    public void adicionarEquipe(Equipe equipe) {
        this.getEquipes().add(equipe);
    }

    public void removerEquipe(Equipe equipe) {
        this.getEquipes().remove(equipe);
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
    public List<MensagemRecebida> getMensagens() {
        return mensagens;
    }

    /**
     * @param mensagens the mensagens to set
     */
    public void setMensagens(List<MensagemRecebida> mensagens) {
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

    /**
     * @return the usuarioParticipante
     */
    public UsuarioParticipante2 getUsuarioParticipante() {
        return usuarioParticipante;
    }

    /**
     * @param usuarioParticipante the usuarioParticipante to set
     */
    public void setUsuarioParticipante(UsuarioParticipante2 usuarioParticipante) {
        this.usuarioParticipante = usuarioParticipante;
    }

    /**
     * @return the dataNascimento
     */
    public Date getDataNascimento() {
        return dataNascimento;
    }

    /**
     * @param dataNascimento the dataNascimento to set
     */
    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }



    /**
     * @return the cpf
     */
    public String getCpf() {
        return cpf;
    }

    /**
     * @param cpf the cpf to set
     */
    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    /**
     * @return the segmento
     */
    public Segmento getSegmento() {
        return segmento;
    }

    /**
     * @param segmento the segmento to set
     */
    public void setSegmento(Segmento segmento) {
        this.segmento = segmento;
    }

}
