
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    
        
    @Column(name="pontosMarcados")
    private double pontosMarcados;
    
    @Column(name="pontosSofridos")
    private double pontosSofridos;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeVenceu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipePerdeu;
    
    @OneToMany
    private List<Equipe> adversariosQueAEquipeEmpatou;

    public EquipeCompeticao() {
        idEquipeCompeticao = 0;
        equipe = new Equipe();
        pontosMarcados = 0;
        pontosSofridos = 0;
        adversariosQueAEquipeVenceu = new ArrayList<>();
        adversariosQueAEquipePerdeu = new ArrayList<>();
        adversariosQueAEquipeEmpatou = new ArrayList<>();
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe, double pontosMarcados, double pontosSofridos) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
        this.adversariosQueAEquipeVenceu = new ArrayList<>();
        this.adversariosQueAEquipePerdeu = new ArrayList<>();
        this.adversariosQueAEquipeEmpatou = new ArrayList<>();
    }

    public EquipeCompeticao(int idEquipeCompeticao, Equipe equipe, double pontosMarcados, double pontosSofridos, List<Equipe> adversariosQueAEquipeVenceu, List<Equipe> adversariosQueAEquipePerdeu, List<Equipe> adversariosQueAEquipeEmpatou) {
        this.idEquipeCompeticao = idEquipeCompeticao;
        this.equipe = equipe;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
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
