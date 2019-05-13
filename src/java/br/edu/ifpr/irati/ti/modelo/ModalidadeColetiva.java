
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
    
    @Column(name="lotacaoMaximaEquipe", nullable=false)
    private int lotacaoMaximaEquipe;


    public ModalidadeColetiva() {
        idModColetiva = 0;
        lotacaoMaximaEquipe = 0;
        nome = "";
        //equipes = new ArrayList<>();
       // competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva();
    }

    public ModalidadeColetiva(int idModColetiva, String nome, int lotacaoMaximaEquipe) {
        this.idModColetiva = idModColetiva;
        this.nome = nome;
        this.lotacaoMaximaEquipe = lotacaoMaximaEquipe;
    }
 
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
     * @return the lotacaoMaximaEquipe
     */
    public int getLotacaoMaximaEquipe() {
        return lotacaoMaximaEquipe;
    }

    /**
     * @param lotacaoMaximaEquipe the lotacaoMaximaEquipe to set
     */
    public void setLotacaoMaximaEquipe(int lotacaoMaximaEquipe) {
        this.lotacaoMaximaEquipe = lotacaoMaximaEquipe;
    }
    
    


    
    
}
