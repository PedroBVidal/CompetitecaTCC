
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Usuário
 */
@Entity(name = "inscricaocompeticaosolo")
@Proxy(lazy = false)
public class InscricaoCompeticaoSolo implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idInscricao;
    
    @ManyToOne
    @JoinColumn(name = "competicaoModalidadeSolo_idCompeticaoModalidade")
    private CompeticaoModalidadeSolo competicaoModalidadeSolo;
        
    
    @ManyToOne
    @JoinColumn(name = "atleta_idAtleta")
    private Atleta atleta;
    
    @OneToOne
    private AtletaCompeticao atletaCompeticao;
    @Column(name = "aprovada")
    
    private char inscricaoAceita; 

    public InscricaoCompeticaoSolo() {
        idInscricao = 0;
        atleta = new Atleta();
        inscricaoAceita = ' ';
        competicaoModalidadeSolo = new CompeticaoModalidadeSolo();
        //atletaCompeticao = new AtletaCompeticao();
    }

    public InscricaoCompeticaoSolo(int idCompeticaoSolo, CompeticaoModalidadeSolo competicaoModalidadeSolo, Atleta atleta, char inscricaoAceita) {
        this.idInscricao = idCompeticaoSolo;
        this.competicaoModalidadeSolo = competicaoModalidadeSolo;
        this.atleta = atleta;
        this.inscricaoAceita = inscricaoAceita;
        //this.atletaCompeticao = new AtletaCompeticao();
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

    /**
     * @return the idInscricao
     */
    public int getIdInscricao() {
        return idInscricao;
    }

    /**
     * @param idInscricao the idInscricao to set
     */
    public void setIdInscricao(int idInscricao) {
        this.idInscricao = idInscricao;
    }
    
    
    
    
    
}
