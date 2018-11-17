
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

/**
 *
 * @author Usuário
 */
@Entity(name = "inscricaocompeticaosolo")
@Proxy(lazy = false)
public class InscricaoCompeticaoSolo implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCompeticaoSolo;
    
    
    @ManyToOne
    @JoinColumn(name = "atleta_idAtleta")
    private Atleta atleta;
    
    @Column(name = "aprovada")
    @Type(type = "true_false")
    private boolean inscricaoAceita; 

    public InscricaoCompeticaoSolo() {
        idCompeticaoSolo = 0;
        atleta = new Atleta();
        inscricaoAceita = false;
    }

    public InscricaoCompeticaoSolo(int idCompeticaoSolo, Atleta atleta, boolean inscricaoAceita) {
        this.idCompeticaoSolo = idCompeticaoSolo;
        this.atleta = atleta;
        this.inscricaoAceita = inscricaoAceita;
    }

    /**
     * @return the idCompeticaoSolo
     */
    public int getIdCompeticaoSolo() {
        return idCompeticaoSolo;
    }

    /**
     * @param idCompeticaoSolo the idCompeticaoSolo to set
     */
    public void setIdCompeticaoSolo(int idCompeticaoSolo) {
        this.idCompeticaoSolo = idCompeticaoSolo;
    }

    /**
     * @return the atleta
     */
    public Atleta getAtleta() {
        return atleta;
    }

    /**
     * @return the inscricaoAceita
     */
    public boolean isInscricaoAceita() {
        return inscricaoAceita;
    }

    /**
     * @param inscricaoAceita the inscricaoAceita to set
     */
    public void setInscricaoAceita(boolean inscricaoAceita) {
        this.inscricaoAceita = inscricaoAceita;
    }
    
    
    
    
    
}
