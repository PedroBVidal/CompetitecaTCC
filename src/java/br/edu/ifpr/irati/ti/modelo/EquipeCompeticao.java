
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
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;

@Entity(name="equipecompeticao")
@Proxy(lazy = false)
public class EquipeCompeticao implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idEquipeCompeticao;
    
    @OneToOne
    private Equipe equipe;
    
    @ManyToMany(fetch = FetchType.LAZY)
    private List<Atleta> atletasEquipe;
    
    @Column(name="pontosMarcados")
    private double pontosMarcados;
    
    @Column(name="pontosSofridos")
    private double pontosSofridos;
    
    @Column(name="vitorias")
    private int vitorias;
    
    @Column(name="empates")
    private int empates;
        
    @Column(name="derrotas")
    private int derrotas;
    
    @Column(name="jogos")
    private int jogos;
    
    @Column(name="pontos")
    private double pontos;
    

    
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeVenceu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipePerdeu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeEmpatou;

    public EquipeCompeticao() {
        idEquipeCompeticao = 0;
        equipe = new Equipe();
        atletasEquipe = new ArrayList<>();
        pontosMarcados = 0;
        pontosSofridos = 0;
        adversariosQueAEquipeVenceu = new ArrayList<>();
        adversariosQueAEquipePerdeu = new ArrayList<>();
        adversariosQueAEquipeEmpatou = new ArrayList<>();
        vitorias = 0;
        jogos = 0;
        pontos = 0;
        derrotas = 0;
        empates = 0;
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe,List<Atleta> atletasEquipe) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.pontosMarcados = 0;
        this.pontosSofridos = 0;
        this.atletasEquipe = atletasEquipe;
        this.adversariosQueAEquipeVenceu = new ArrayList<>();
        this.adversariosQueAEquipePerdeu = new ArrayList<>();
        this.adversariosQueAEquipeEmpatou = new ArrayList<>();
        this.vitorias = 0;
        this.jogos = 0;
        this.pontos = 0;
        this.derrotas = 0;
        this.empates = 0;
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe, List<Atleta> atletasEquipe, double pontosMarcados, double pontosSofridos, int vitorias, int empates, int derrotas, int jogos, double pontos, List<Equipe> adversariosQueAEquipeVenceu, List<Equipe> adversariosQueAEquipePerdeu, List<Equipe> adversariosQueAEquipeEmpatou) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.atletasEquipe = atletasEquipe;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
        this.vitorias = vitorias;
        this.empates = empates;
        this.derrotas = derrotas;
        this.jogos = jogos;
        this.pontos = pontos;
        this.adversariosQueAEquipeVenceu = adversariosQueAEquipeVenceu;
        this.adversariosQueAEquipePerdeu = adversariosQueAEquipePerdeu;
        this.adversariosQueAEquipeEmpatou = adversariosQueAEquipeEmpatou;
    }

    

    /**
     * @return the idEquipeCompeticao
     */
    public int getIdEquipeCompeticao() {
        return idEquipeCompeticao;
    }

    /**
     * @param idEquipeCompeticao the idEquipeCompeticao to set
     */
    public void setIdEquipeCompeticao(int idEquipeCompeticao) {
        this.idEquipeCompeticao = idEquipeCompeticao;
    }

    /**
     * @return the equipe
     */
    public Equipe getEquipe() {
        return equipe;
    }

    /**
     * @param equipe the equipe to set
     */
    public void setEquipe(Equipe equipe) {
        this.equipe = equipe;
    }

    /**
     * @return the atletasEquipe
     */
    public List<Atleta> getAtletasEquipe() {
        return atletasEquipe;
    }

    /**
     * @param atletasEquipe the atletasEquipe to set
     */
    public void setAtletasEquipe(List<Atleta> atletasEquipe) {
        this.atletasEquipe = atletasEquipe;
    }

    /**
     * @return the pontosMarcados
     */
    public double getPontosMarcados() {
        return pontosMarcados;
    }

    /**
     * @param pontosMarcados the pontosMarcados to set
     */
    public void setPontosMarcados(double pontosMarcados) {
        this.pontosMarcados = pontosMarcados;
    }

    /**
     * @return the pontosSofridos
     */
    public double getPontosSofridos() {
        return pontosSofridos;
    }

    /**
     * @param pontosSofridos the pontosSofridos to set
     */
    public void setPontosSofridos(double pontosSofridos) {
        this.pontosSofridos = pontosSofridos;
    }

    /**
     * @return the vitorias
     */
    public int getVitorias() {
        return vitorias;
    }

    /**
     * @param vitorias the vitorias to set
     */
    public void setVitorias(int vitorias) {
        this.vitorias = vitorias;
    }

    /**
     * @return the empates
     */
    public int getEmpates() {
        return empates;
    }

    /**
     * @param empates the empates to set
     */
    public void setEmpates(int empates) {
        this.empates = empates;
    }

    /**
     * @return the derrotas
     */
    public int getDerrotas() {
        return derrotas;
    }

    /**
     * @param derrotas the derrotas to set
     */
    public void setDerrotas(int derrotas) {
        this.derrotas = derrotas;
    }

    /**
     * @return the jogos
     */
    public int getJogos() {
        return jogos;
    }

    /**
     * @param jogos the jogos to set
     */
    public void setJogos(int jogos) {
        this.jogos = jogos;
    }

    /**
     * @return the pontos
     */
    public double getPontos() {
        return pontos;
    }

    /**
     * @param pontos the pontos to set
     */
    public void setPontos(double pontos) {
        this.pontos = pontos;
    }

    /**
     * @return the adversariosQueAEquipeVenceu
     */
    public List<Equipe> getAdversariosQueAEquipeVenceu() {
        return adversariosQueAEquipeVenceu;
    }

    /**
     * @param adversariosQueAEquipeVenceu the adversariosQueAEquipeVenceu to set
     */
    public void setAdversariosQueAEquipeVenceu(List<Equipe> adversariosQueAEquipeVenceu) {
        this.adversariosQueAEquipeVenceu = adversariosQueAEquipeVenceu;
    }

    /**
     * @return the adversariosQueAEquipePerdeu
     */
    public List<Equipe> getAdversariosQueAEquipePerdeu() {
        return adversariosQueAEquipePerdeu;
    }

    /**
     * @param adversariosQueAEquipePerdeu the adversariosQueAEquipePerdeu to set
     */
    public void setAdversariosQueAEquipePerdeu(List<Equipe> adversariosQueAEquipePerdeu) {
        this.adversariosQueAEquipePerdeu = adversariosQueAEquipePerdeu;
    }

    /**
     * @return the adversariosQueAEquipeEmpatou
     */
    public List<Equipe> getAdversariosQueAEquipeEmpatou() {
        return adversariosQueAEquipeEmpatou;
    }

    /**
     * @param adversariosQueAEquipeEmpatou the adversariosQueAEquipeEmpatou to set
     */
    public void setAdversariosQueAEquipeEmpatou(List<Equipe> adversariosQueAEquipeEmpatou) {
        this.adversariosQueAEquipeEmpatou = adversariosQueAEquipeEmpatou;
    }

    
    
    

    
}
