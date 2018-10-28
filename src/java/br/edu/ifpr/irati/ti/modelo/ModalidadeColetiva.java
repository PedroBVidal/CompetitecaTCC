
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


@Entity(name="modalidadeColetiva")
@Proxy(lazy = false)
public class ModalidadeColetiva implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idModColetiva;
    
    @Column(name="nome", nullable = false)
    private String nome;
    
    /*
    @OneToMany //(mappedBy = "modalidade")
    private List<Equipe> equipes;
    */
    
    @ManyToMany(mappedBy = "modalidadesColetivas", fetch=FetchType.EAGER)
    private List<Competicao> competicoes;
    
    
    
    // FICAR DE OLHO
    //@OneToOne
    //private CompeticaoModalidadeColetiva competicaoModalidadeColetiva;

    public ModalidadeColetiva() {
        idModColetiva = 0;
        nome = "";
        //equipes = new ArrayList<>();
        competicoes = new ArrayList<>();
       // competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva();
    }

    public ModalidadeColetiva(int idModColetiva, String nome) {
        this.idModColetiva = idModColetiva;
        this.nome = nome;
        //this.equipes = new ArrayList<>();
        competicoes = new ArrayList<>();
        //competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva();
    }

    public ModalidadeColetiva(int idModColetiva, String nome,List<Competicao> competicoes) {
        this.idModColetiva = idModColetiva;
        this.nome = nome;
        //this.equipes = equipes;
        this.competicoes = competicoes;
    }

    
    
    /*
    public void adicionarEquipe(Equipe equipe){
        this.getEquipes().add(equipe);
    }
    public void removerEquipe(Equipe equipe){
        this.getEquipes().remove(equipe);
    }
    */
    
    
    /**
     * @return the idModColetiva
     */
    public int getIdModColetiva() {
        return idModColetiva;
    }

    /**
     * @param idModColetiva the idModColetiva to set
     */
    public void setIdModColetiva(int idModColetiva) {
        this.idModColetiva = idModColetiva;
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
     * @return the competicoes
     */
    public List<Competicao> getCompeticoes() {
        return competicoes;
    }

    /**
     * @param competicoes the competicoes to set
     */
    public void setCompeticoes(List<Competicao> competicoes) {
        this.competicoes = competicoes;
    }

    /**
     * @return the competicaoModalidadeColetiva
     */
    /*public CompeticaoModalidadeColetiva getCompeticaoModalidadeColetiva() {
        return competicaoModalidadeColetiva;
    }*/

    /**
     * @param competicaoModalidadeColetiva the competicaoModalidadeColetiva to set
     */
    /*public void setCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        this.competicaoModalidadeColetiva = competicaoModalidadeColetiva;
    }*/

    
    
}
