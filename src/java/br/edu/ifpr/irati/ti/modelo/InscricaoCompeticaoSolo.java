
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
    @JoinColumn(name = "competicaoModalidadeSolo_idCompeticaoModalidade")
    private CompeticaoModalidadeSolo competicaoModalidadeSolo;
        
    
    @ManyToOne
    @JoinColumn(name = "atleta_idAtleta")
    private Atleta atleta;
    
    @Column(name = "aprovada")
    
    private char inscricaoAceita; 

    public InscricaoCompeticaoSolo() {
        idCompeticaoSolo = 0;
        atleta = new Atleta();
        inscricaoAceita = ' ';
        competicaoModalidadeSolo = new CompeticaoModalidadeSolo();
    }

    public InscricaoCompeticaoSolo(int idCompeticaoSolo, CompeticaoModalidadeSolo competicaoModalidadeSolo, Atleta atleta, char inscricaoAceita) {
        this.idCompeticaoSolo = idCompeticaoSolo;
        this.competicaoModalidadeSolo = competicaoModalidadeSolo;
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
    public char getInscricaoAceita() {
        return inscricaoAceita;
    }

    /**
     * @param inscricaoAceita the inscricaoAceita to set
     */
    public void setInscricaoAceita(char inscricaoAceita) {
        this.inscricaoAceita = inscricaoAceita;
    }

    /**
     * @return the competicaoModalidadeSolo
     */
    public CompeticaoModalidadeSolo getCompeticaoModalidadeSolo() {
        return competicaoModalidadeSolo;
    }

    /**
     * @param competicaoModalidadeSolo the competicaoModalidadeSolo to set
     */
    public void setCompeticaoModalidadeSolo(CompeticaoModalidadeSolo competicaoModalidadeSolo) {
        this.competicaoModalidadeSolo = competicaoModalidadeSolo;
    }
    
    
    
    
    
}
