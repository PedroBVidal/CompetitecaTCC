package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "competicaomodalidade")

@Inheritance(strategy = InheritanceType.JOINED)
@Proxy(lazy = false)
public abstract class CompeticaoModalidade implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCompeticaoModalidade;

    @Column(name = "informacaoExtra", nullable = true)
    private String informacaoExtra;

    @Column(name = "nomecompeticao", nullable = false, length = 100)
    private String nomeCompeticao;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "sistemacomp_id", referencedColumnName = "idSistemaDeCompeticao", nullable = false)
    private SistemaDeCompeticao sistemaDeCompeticao;

    @OneToMany
    private List<Confronto> confrontos;

    @Column(name = "status_formulario_inscricao_publica")
    private boolean statusFormularioInscricaoPublica;

    @Column(name = "inativo")
    @Type(type = "true_false")
    private boolean inativo;

    @Column(name = "jogosemandamento")
    @Type(type = "true_false")
    private boolean jogosEmAndamento;

    @Column(name = "num_participantes")
    private int numParticipantes;
    @Column(name = "num_vagas")
    private int numVagas;
    @Column(name = "num_vagas_disp")
    private int numVagasDisp = numVagas - numParticipantes;

    public CompeticaoModalidade() {
        idCompeticaoModalidade = 0;
        nomeCompeticao = "";
        confrontos = new ArrayList<>();
        statusFormularioInscricaoPublica = false;
        informacaoExtra = "";
        jogosEmAndamento = false;
        numVagas = 0;
        numParticipantes = 0;
    }

    public CompeticaoModalidade(int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, int numVagas) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
        this.nomeCompeticao = nomeCompeticao;
        this.sistemaDeCompeticao = sistemaDeCompeticao;
        this.confrontos = new ArrayList<>();
        this.statusFormularioInscricaoPublica = false;
        this.jogosEmAndamento = false;
        this.numVagas = numVagas;
        this.numParticipantes = 0;
    }

    public CompeticaoModalidade(int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, String informacaoExtra, int numVagas) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
        this.nomeCompeticao = nomeCompeticao;
        this.sistemaDeCompeticao = sistemaDeCompeticao;
        this.informacaoExtra = informacaoExtra;
        this.confrontos = new ArrayList<>();
        this.statusFormularioInscricaoPublica = false;
        this.jogosEmAndamento = false;
        this.numVagas = numVagas;
        this.numParticipantes = 0;
    }

    public CompeticaoModalidade(int idCompeticaoModalidade, String informacaoExtra, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos, boolean statusFormularioInscricaoPublica, boolean inativo, boolean jogosEmAndamento, int numVagas) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
        this.informacaoExtra = informacaoExtra;
        this.nomeCompeticao = nomeCompeticao;
        this.sistemaDeCompeticao = sistemaDeCompeticao;
        this.confrontos = confrontos;
        this.statusFormularioInscricaoPublica = statusFormularioInscricaoPublica;
        this.inativo = inativo;
        this.jogosEmAndamento = jogosEmAndamento;
        this.numVagas = numVagas;
        this.numParticipantes = 0;
    }

    /**
     * @return the idCompeticaoModalidade
     */
    public int getIdCompeticaoModalidade() {
        return idCompeticaoModalidade;
    }

    /**
     * @param idCompeticaoModalidade the idCompeticaoModalidade to set
     */
    public void setIdCompeticaoModalidade(int idCompeticaoModalidade) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
    }

    /**
     * @return the nomeCompeticao
     */
    public String getNomeCompeticao() {
        return nomeCompeticao;
    }

    /**
     * @param nomeCompeticao the nomeCompeticao to set
     */
    public void setNomeCompeticao(String nomeCompeticao) {
        this.nomeCompeticao = nomeCompeticao;
    }

    /**
     * @return the sistemaDeCompeticao
     */
    public SistemaDeCompeticao getSistemaDeCompeticao() {
        return sistemaDeCompeticao;
    }

    /**
     * @param sistemaDeCompeticao the sistemaDeCompeticao to set
     */
    public void setSistemaDeCompeticao(SistemaDeCompeticao sistemaDeCompeticao) {
        this.sistemaDeCompeticao = sistemaDeCompeticao;
    }

    /**
     * @return the confrontos
     */
    public List<Confronto> getConfrontos() {
        return confrontos;
    }

    /**
     * @param confrontos the confrontos to set
     */
    public void setConfrontos(List<Confronto> confrontos) {
        this.confrontos = confrontos;
    }

    /**
     * @return the statusFormularioInscricaoPublica
     */
    public boolean isStatusFormularioInscricaoPublica() {
        return statusFormularioInscricaoPublica;
    }

    /**
     * @param statusFormularioInscricaoPublica the
     * statusFormularioInscricaoPublica to set
     */
    public void setStatusFormularioInscricaoPublica(boolean statusFormularioInscricaoPublica) {
        this.statusFormularioInscricaoPublica = statusFormularioInscricaoPublica;
    }

    /**
     * @return the inativo
     */
    public boolean isInativo() {
        return inativo;
    }

    /**
     * @param inativo the inativo to set
     */
    public void setInativo(boolean inativo) {
        this.inativo = inativo;
    }

    /**
     * @return the informacaoExtra
     */
    public String getInformacaoExtra() {
        return informacaoExtra;
    }

    /**
     * @param informacaoExtra the informacaoExtra to set
     */
    public void setInformacaoExtra(String informacaoExtra) {
        this.informacaoExtra = informacaoExtra;
    }

    /**
     * @return the jogosEmAndamento
     */
    public boolean isJogosEmAndamento() {
        return jogosEmAndamento;
    }

    /**
     * @param jogosEmAndamento the jogosEmAndamento to set
     */
    public void setJogosEmAndamento(boolean jogosEmAndamento) {
        this.jogosEmAndamento = jogosEmAndamento;
    }

    public int getNumParticipantes() {
        return numParticipantes;
    }

    public void setNumParticipantes(int numParticipantes) {
        this.numParticipantes = numParticipantes;
    }

    public int getNumVagas() {
        return numVagas;
    }

    public void setNumVagas(int numVagas) {
        this.numVagas = numVagas;
    }
    
}
