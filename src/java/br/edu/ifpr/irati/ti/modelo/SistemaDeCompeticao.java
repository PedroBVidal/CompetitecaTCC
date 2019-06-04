
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
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;


@Entity(name="sistemadecompeticao")
@Inheritance(strategy = InheritanceType.JOINED)
//@Proxy(lazy = false)
public abstract class SistemaDeCompeticao implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    protected int idSistemaDeCompeticao;
    
    @Column(name="nome", nullable=false)
    protected String nome;
    
    @OneToMany
    protected List<Confronto> confrontosMarcados;
    
    @OneToOne
    @JoinColumn(name="competicaoModalidade_id", referencedColumnName="idCompeticaoModalidade")  
    protected CompeticaoModalidade competicaoModalidade;

    public SistemaDeCompeticao() {
        this.idSistemaDeCompeticao = 0;
        this.nome = "";
        this.confrontosMarcados = new ArrayList<>();
        this.competicaoModalidade = new CompeticaoModalidade() {
        };
    }

    public SistemaDeCompeticao(int idSistemaDeCompeticao, String nome, CompeticaoModalidade competicaoModalidade) {
        this.idSistemaDeCompeticao = idSistemaDeCompeticao;
        this.nome = nome;
        this.confrontosMarcados = new ArrayList<>();
        this.competicaoModalidade = competicaoModalidade;
    }

    public SistemaDeCompeticao(int idSistemaDeCompeticao, String nome, List<Confronto> confrontosMarcados, CompeticaoModalidade competicaoModalidade) {
        this.idSistemaDeCompeticao = idSistemaDeCompeticao;
        this.nome = nome;
        this.confrontosMarcados = confrontosMarcados;
        this.competicaoModalidade = competicaoModalidade;
    }
    
    
    /**
     * @return the idSistemaDeCompeticao
     */
    public int getIdSistemaDeCompeticao() {
        return idSistemaDeCompeticao;
    }

    /**
     * @param idSistemaDeCompeticao the idSistemaDeCompeticao to set
     */
    public void setIdSistemaDeCompeticao(int idSistemaDeCompeticao) {
        this.idSistemaDeCompeticao = idSistemaDeCompeticao;
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
     * @return the confrontosMarcados
     */
    public List<Confronto> getConfrontosMarcados() {
        return confrontosMarcados;
    }

    /**
     * @param confrontosMarcados the confrontosMarcados to set
     */
    public void setConfrontosMarcados(List<Confronto> confrontosMarcados) {
        this.confrontosMarcados = confrontosMarcados;
    }

    /**
     * @return the competicaoModalidade
     */
    public CompeticaoModalidade getCompeticaoModalidade() {
        return competicaoModalidade;
    }

    /**
     * @param competicaoModalidade the competicaoModalidade to set
     */
    public void setCompeticaoModalidade(CompeticaoModalidade competicaoModalidade) {
        this.competicaoModalidade = competicaoModalidade;
    }
}
