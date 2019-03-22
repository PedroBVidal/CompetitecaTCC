package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;
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

    @ManyToMany(fetch = FetchType.EAGER)
    private List<UsuarioParticipante> administradores;
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<CompeticaoModalidadeColetiva> cmodalidadecole;
    
    
    @OneToMany(fetch = FetchType.EAGER)
    private List<CompeticaoModalidadeSolo> cmodalidadesolo;
    
    
    @Temporal(TemporalType.DATE)
    private Date dataInicio;

    @Temporal(TemporalType.DATE)
    private Date dataTermino;
    
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
        cmodalidadecole = new ArrayList<>();
        cmodalidadesolo = new ArrayList<>();
        administradores = new ArrayList<>();
        dataInicio = new Date();
        dataTermino = new Date();
        inativo = false;
        privado = false;
    }

    public Competicao(int idCompeticao, String nome, Date dataInicio, Date dataTermino) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        cmodalidadecole = new ArrayList<>();
        cmodalidadesolo = new ArrayList<>();
        administradores = new ArrayList<>();
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.inativo = false;
        this.privado = false;
    }

    public Competicao(int idCompeticao, String nome, List<UsuarioParticipante> administradores, List<CompeticaoModalidadeColetiva> cmodalidadecole, List<CompeticaoModalidadeSolo> cmodalidadesolo, Date dataInicio, Date dataTermino, boolean inativo, boolean privado) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        this.administradores = administradores;
        this.cmodalidadecole = cmodalidadecole;
        this.cmodalidadesolo = cmodalidadesolo;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
        this.inativo = inativo;
        this.privado = privado;
    }

    

    

    
    
    public void adcionarLocal(Local local) {

    }
    
    public void adcionarCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        this.cmodalidadesolo.add(competicaoModalidadeSolo);        
    }
    
    public void adicionarCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        this.cmodalidadecole.add(competicaoModalidadeColetiva);
    }
    
    public void removerCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo){
        this.cmodalidadesolo.remove(competicaoModalidadeSolo);        
    }
    
    public void removerCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva){
        this.cmodalidadecole.remove(competicaoModalidadeColetiva);
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

    /**
     * @return the cmodalidadecole
     */
    public List<CompeticaoModalidadeColetiva> getCmodalidadecole() {
        return cmodalidadecole;
    }

    /**
     * @param cmodalidadecole the cmodalidadecole to set
     */
    public void setCmodalidadecole(List<CompeticaoModalidadeColetiva> cmodalidadecole) {
        this.cmodalidadecole = cmodalidadecole;
    }

    /**
     * @return the cmodalidadesolo
     */
    public List<CompeticaoModalidadeSolo> getCmodalidadesolo() {
        return cmodalidadesolo;
    }

    /**
     * @param cmodalidadesolo the cmodalidadesolo to set
     */
    public void setCmodalidadesolo(List<CompeticaoModalidadeSolo> cmodalidadesolo) {
        this.cmodalidadesolo = cmodalidadesolo;
    }
    public void adicionarAdministrador(UsuarioParticipante up){
        this.administradores.add(up);
        up.adicionarCompeticao(this);
    }
    public void removerAdministrador(UsuarioParticipante up){
        this.administradores.remove(up);
        up.removerCompeticao(this);
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
        this.privado = privado;
    }


    

}
