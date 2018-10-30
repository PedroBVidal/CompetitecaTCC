
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;

@Entity(name = "competicaomodalidade")

@Inheritance(strategy = InheritanceType.JOINED)
@Proxy(lazy = false)
public abstract class CompeticaoModalidade implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idCompeticaoModalidade;
    
    @Column(name = "nomecompeticao", nullable = false, length = 100)
    protected String nomeCompeticao;
    
   @OneToOne
   protected SistemaDeCompeticao sistemaDeCompeticao;
   
   @OneToMany
   protected List<Confronto> confrontos;

    public CompeticaoModalidade() {
        idCompeticaoModalidade = 0;
        nomeCompeticao = "";
        confrontos = new ArrayList<>();
        
    }

    public CompeticaoModalidade(int idCompeticaoModalidade, String nomeCompeticao) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
        this.nomeCompeticao = nomeCompeticao;
        this.confrontos = new ArrayList<>();
    }

    public CompeticaoModalidade(int idCompeticaoModalidade, String nomeCompeticao, SistemaDeCompeticao sistemaDeCompeticao, List<Confronto> confrontos) {
        this.idCompeticaoModalidade = idCompeticaoModalidade;
        this.nomeCompeticao = nomeCompeticao;
        this.sistemaDeCompeticao = sistemaDeCompeticao;
        this.confrontos = confrontos;
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

    
    
   
   
    
}
