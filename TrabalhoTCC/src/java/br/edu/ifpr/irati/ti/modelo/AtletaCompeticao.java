
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;

@Entity(name="atletacompeticao")
@Proxy(lazy = false)
public class AtletaCompeticao implements Serializable {
    
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idAtletaCompeticao;
    
    @ManyToOne
    private Atleta atleta;
    
        
    @Column(name="pontosMarcados")
    private double pontosMarcados;
    
    @Column(name="pontosSofridos")
    private double pontosSofridos;
    
    @OneToMany
    private List<Atleta> adversariosQueOAtletaVenceu;
    
    @OneToMany
    private List<Atleta> adversariosQueOAtletaPerdeu;
    
    @OneToMany
    private List<Atleta> adversariosQueOAtletaEmpatou;

    public AtletaCompeticao() {        
        idAtletaCompeticao = 0;
        atleta = new Atleta();
        pontosMarcados = 0;
        pontosSofridos = 0;
        adversariosQueOAtletaVenceu = new ArrayList<>();
        adversariosQueOAtletaPerdeu = new ArrayList<>();
        adversariosQueOAtletaEmpatou = new ArrayList<>();
        
    }

    public AtletaCompeticao(int idAtletaCompeticao, Atleta atleta, double pontosMarcados, double pontosSofridos) {
        this.idAtletaCompeticao = idAtletaCompeticao;
        this.atleta = atleta;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
        this.adversariosQueOAtletaVenceu = new ArrayList<>();
        this.adversariosQueOAtletaPerdeu = new ArrayList<>();
        this.adversariosQueOAtletaEmpatou = new ArrayList<>();
    }

    public AtletaCompeticao(int idAtletaCompeticao, Atleta atleta, double pontosMarcados, double pontosSofridos, List<Atleta> adversariosQueOAtletaVenceu, List<Atleta> adversariosQueOAtletaPerdeu, List<Atleta> adversariosQueOAtletaEmpatou) {
        this.idAtletaCompeticao = idAtletaCompeticao;
        this.atleta = atleta;
        this.pontosMarcados = pontosMarcados;
        this.pontosSofridos = pontosSofridos;
        this.adversariosQueOAtletaVenceu = adversariosQueOAtletaVenceu;
        this.adversariosQueOAtletaPerdeu = adversariosQueOAtletaPerdeu;
        this.adversariosQueOAtletaEmpatou = adversariosQueOAtletaEmpatou;
    }

    /**
     * @return the idAtletaCompeticao
     */
    public int getIdAtletaCompeticao() {
        return idAtletaCompeticao;
    }

    /**
     * @param idAtletaCompeticao the idAtletaCompeticao to set
     */
    public void setIdAtletaCompeticao(int idAtletaCompeticao) {
        this.idAtletaCompeticao = idAtletaCompeticao;
    }

    /**
     * @return the atleta
     */
    public Atleta getAtleta() {
        return atleta;
    }

    /**
     * @param atleta the atleta to set
     */
    public void setAtleta(Atleta atleta) {
        this.atleta = atleta;
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
     * @return the adversariosQueOAtletaVenceu
     */
    public List<Atleta> getAdversariosQueOAtletaVenceu() {
        return adversariosQueOAtletaVenceu;
    }

    /**
     * @param adversariosQueOAtletaVenceu the adversariosQueOAtletaVenceu to set
     */
    public void setAdversariosQueOAtletaVenceu(List<Atleta> adversariosQueOAtletaVenceu) {
        this.adversariosQueOAtletaVenceu = adversariosQueOAtletaVenceu;
    }

    /**
     * @return the adversariosQueOAtletaPerdeu
     */
    public List<Atleta> getAdversariosQueOAtletaPerdeu() {
        return adversariosQueOAtletaPerdeu;
    }

    /**
     * @param adversariosQueOAtletaPerdeu the adversariosQueOAtletaPerdeu to set
     */
    public void setAdversariosQueOAtletaPerdeu(List<Atleta> adversariosQueOAtletaPerdeu) {
        this.adversariosQueOAtletaPerdeu = adversariosQueOAtletaPerdeu;
    }

    /**
     * @return the adversariosQueOAtletaEmpatou
     */
    public List<Atleta> getAdversariosQueOAtletaEmpatou() {
        return adversariosQueOAtletaEmpatou;
    }

    /**
     * @param adversariosQueOAtletaEmpatou the adversariosQueOAtletaEmpatou to set
     */
    public void setAdversariosQueOAtletaEmpatou(List<Atleta> adversariosQueOAtletaEmpatou) {
        this.adversariosQueOAtletaEmpatou = adversariosQueOAtletaEmpatou;
    }
    
    
    
    
    
    
    
    
    
    
    
}
