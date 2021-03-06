package br.edu.ifpr.irati.ti.modelo;

import br.ifpr.irati.ti.util.GerarCodigoAcessoPrivado;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

@Entity(name = "competicao")
@Proxy(lazy = false)

public class Competicao implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCompeticao;

    @Column(name = "nome", nullable = false, length = 100)
    private String nome;

    @Column(name = "informacaoExtra", nullable = true, length = 400)
    private String informacaoExtra;

    @ManyToMany(fetch = FetchType.LAZY)
    @Fetch(value = FetchMode.SELECT)
    private List<UsuarioParticipante> administradores;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "competicao")
    @Fetch(value = FetchMode.SELECT)
    private Set<CompeticaoModalidadeColetiva> cmodalidadecole;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "competicao")
    @Fetch(value = FetchMode.SELECT)
    private Set<CompeticaoModalidadeSolo> cmodalidadesolo;

    @Temporal(TemporalType.DATE)
    private Date dataInicio;

    @Temporal(TemporalType.DATE)
    private Date dataTermino;

    @Temporal(TemporalType.DATE)
    private Date dataInicioInsc;

    @Temporal(TemporalType.DATE)
    private Date dataTerminoInsc;
    @Column(nullable = false)
    private int interseries;

    @Column(name = "inativo")
    @Type(type = "true_false")
    private boolean inativo;

    @Column(name = "codigo")
    private String codPriv;

    @Column(name = "privado")
    @Type(type = "true_false")
    private boolean privado;

    public Competicao() {
        idCompeticao = 0;
        cmodalidadecole = new HashSet<>();
        cmodalidadesolo = new HashSet<>();
        administradores = new ArrayList<>();
        dataInicio = new Date();
        dataTermino = new Date();
        dataInicioInsc = new Date();
        dataTerminoInsc = new Date();
        inativo = false;
        privado = false;
        informacaoExtra = "";
        interseries = 0;
    }

    public Competicao(int idCompeticao, String nome, Date dataInicioInsc, Date dataTerminoInsc, Date dataInicio, Date dataTermino, int interseries) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        cmodalidadecole = new HashSet<>();
        cmodalidadesolo = new HashSet<>();
        administradores = new ArrayList<>();
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.dataInicioInsc = dataInicioInsc;
        this.dataTerminoInsc = dataTerminoInsc;
        this.inativo = false;
        this.privado = false;
        this.interseries = interseries;
    }

    public Competicao(int idCompeticao, String nome, Date dataInicioInsc, Date dataTerminoInsc, Date dataInicio, Date dataTermino, String informacaoExtra, int interseries) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        this.cmodalidadecole = new HashSet<>();
        this.cmodalidadesolo = new HashSet<>();
        this.administradores = new ArrayList<>();
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.dataInicioInsc = dataInicioInsc;
        this.dataTerminoInsc = dataTerminoInsc;
        this.inativo = false;
        this.privado = false;
        this.informacaoExtra = informacaoExtra;
        this.interseries = interseries;
    }

    public Competicao(int idCompeticao, String nome, String informacaoExtra, List<UsuarioParticipante> administradores, Set<CompeticaoModalidadeColetiva> cmodalidadecole, Set<CompeticaoModalidadeSolo> cmodalidadesolo, Date dataInicio, Date dataTermino, Date dataInicioInsc, Date dataTerminoInsc, boolean inativo, String codPriv, boolean privado, int interseries) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        this.informacaoExtra = informacaoExtra;
        this.administradores = administradores;
        this.cmodalidadecole = cmodalidadecole;
        this.cmodalidadesolo = cmodalidadesolo;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.dataInicioInsc = dataInicioInsc;
        this.dataTerminoInsc = dataTerminoInsc;
        this.inativo = inativo;
        this.codPriv = codPriv;
        this.privado = privado;
        this.interseries = interseries;
    }

    public int getInterseries() {
        return interseries;
    }

    public void setInterseries(int interseries) {
        this.interseries = interseries;
    }
    
    public Date getDataInicioInsc() {
        return dataInicioInsc;
    }

    public void setDataInicioInsc(Date dataInicioInsc) {
        this.dataInicioInsc = dataInicioInsc;
    }

    public Date getDataTerminoInsc() {
        return dataTerminoInsc;
    }

    public void setDataTerminoInsc(Date dataTerminoInsc) {
        this.dataTerminoInsc = dataTerminoInsc;
    }

    public void adcionarLocal(Local local) {

    }

    public void adcionarCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.getCmodalidadesolo().add(competicaoModalidadeSolo);
    }

    public void adicionarCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        this.getCmodalidadecole().add(competicaoModalidadeColetiva);
    }

    public void removerCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.getCmodalidadesolo().remove(competicaoModalidadeSolo);
    }

    public void removerCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        this.getCmodalidadecole().remove(competicaoModalidadeColetiva);
    }

    /**
     * @return the idCompeticao
     */
    public int getIdCompeticao() {
        return idCompeticao;
    }

    /**
     * @param idCompeticao the idCompeticao to set
     */
    public void setIdCompeticao(int idCompeticao) {
        this.idCompeticao = idCompeticao;
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
     * @return the dataInicio
     */
    public Date getDataInicio() {
        return dataInicio;
    }

    /**
     * @param dataInicio the dataInicio to set
     */
    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    /**
     * @return the dataTermino
     */
    public Date getDataTermino() {
        return dataTermino;
    }

    /**
     * @param dataTermino the dataTermino to set
     */
    public void setDataTermino(Date dataTermino) {
        this.dataTermino = dataTermino;
    }

    public void adicionarAdministrador(UsuarioParticipante up) {
        this.getAdministradores().add(up);
        //up.adicionarCompeticao(this);
    }

    public void removerAdministrador(UsuarioParticipante up) {
        this.getAdministradores().remove(up);
        up.removerCompeticao(this);
    }

    /* @return the inativo
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
     * @return the codPriv
     */
    public String getCodPriv() {
        return codPriv;
    }

    /**
     * @param codPriv the codPriv to set
     */
    public void setCodPriv(String codPriv) {
        this.codPriv = codPriv;
    }

    /**
     * @return the privado
     */
    public boolean isPrivado() {
        return privado;
    }

    /**
     * @param privado the privado to set
     */
    public void setPrivado(boolean privado) {

        if (privado == true) {
            GerarCodigoAcessoPrivado gcap = new GerarCodigoAcessoPrivado();
            this.codPriv = gcap.criptografar(Integer.toString(this.idCompeticao));
            this.privado = privado;
        } else {
            this.privado = privado;
        }

    }

    /**
     * @return the cmodalidadecole
     */
    public Set<CompeticaoModalidadeColetiva> getCmodalidadecole() {
        return cmodalidadecole;
    }

    /**
     * @param cmodalidadecole the cmodalidadecole to set
     */
    public void setCmodalidadecole(Set<CompeticaoModalidadeColetiva> cmodalidadecole) {
        this.cmodalidadecole = cmodalidadecole;
    }

    /**
     * @return the cmodalidadesolo
     */
    public Set<CompeticaoModalidadeSolo> getCmodalidadesolo() {
        return cmodalidadesolo;
    }

    /**
     * @param cmodalidadesolo the cmodalidadesolo to set
     */
    public void setCmodalidadesolo(Set<CompeticaoModalidadeSolo> cmodalidadesolo) {
        this.cmodalidadesolo = cmodalidadesolo;
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
     * @return the administradores
     */
    public List<UsuarioParticipante> getAdministradores() {
        return administradores;
    }

    /**
     * @param administradores the administradores to set
     */
    public void setAdministradores(List<UsuarioParticipante> administradores) {
        this.administradores = administradores;
    }

}
