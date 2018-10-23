
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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Proxy;


@Entity(name="competicao")
@Proxy(lazy = false)
public class Competicao implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idCompeticao;
    
    @Column (name = "nome", nullable = false, length = 100)
    private String nome;
    
    @OneToMany
    private List<Atleta> atletas;
    
    @OneToMany
    private List<Equipe> equipes;
        
    @OneToMany
    private List<Confronto> confrontos;
    
    @Temporal(TemporalType.DATE)
    private Date dataInicio;
    
    @Temporal(TemporalType.DATE)
    private Date dataTermino;

    public Competicao() {
        idCompeticao = 0;
        equipes = new ArrayList<>();
        atletas = new ArrayList<>();
        confrontos = new ArrayList<>();
        dataInicio = new Date();
        dataTermino = new Date();
        
    }

    public Competicao(int idCompeticao, String nome, Date dataInicio, Date dataTermino) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        this.equipes = new ArrayList<>();
        this.atletas = new ArrayList<>();
        this.confrontos = new ArrayList<>();
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
    }

    public Competicao(int idCompeticao, String nome, List<Equipe> equipes, List<Atleta> atletas, List<Confronto> confrontos, Date dataInicio, Date dataTermino) {
        this.idCompeticao = idCompeticao;
        this.nome = nome;
        this.equipes = equipes;
        this.atletas = atletas;
        this.confrontos = confrontos;
        this.dataInicio = dataInicio;
        this.dataTermino = dataTermino;
    }
    
    
    public void adicionarConfronto(Confronto confronto){
        this.confrontos.add(confronto);
        
        
    }
    
    public void removerConfronto(Confronto confronto){
        this.confrontos.remove(confronto);
    }
    
    
    public void adcionarLocal(Local local){
        
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
    
    
    
    
    
    
}
