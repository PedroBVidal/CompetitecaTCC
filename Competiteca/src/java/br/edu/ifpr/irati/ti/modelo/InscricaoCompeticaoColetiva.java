/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
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
@Entity(name = "inscricaocompeticaocoletiva")
@Proxy(lazy = false)
public class InscricaoCompeticaoColetiva implements Serializable{
    

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idCompeticaoColetiva;
    
    
    @ManyToOne
    @JoinColumn(name = "equipe_idEquipe")
    private Equipe equipe;
    
    @Column(name = "aprovada")
    @Type(type = "true_false")
    private boolean inscricaoAceita; 

    public InscricaoCompeticaoColetiva() {
        idCompeticaoColetiva = 0;
        equipe = new Equipe();
        inscricaoAceita = false;
    }

    public InscricaoCompeticaoColetiva(int idCompeticaoColetiva, Equipe equipe, boolean inscricaoAceita) {
        this.idCompeticaoColetiva = idCompeticaoColetiva;
        this.equipe = equipe;
        this.inscricaoAceita = inscricaoAceita;
    }

    /**
     * @return the idCompeticaoColetiva
     */
    public int getIdCompeticaoColetiva() {
        return idCompeticaoColetiva;
    }

    /**
     * @param idCompeticaoColetiva the idCompeticaoColetiva to set
     */
    public void setIdCompeticaoColetiva(int idCompeticaoColetiva) {
        this.idCompeticaoColetiva = idCompeticaoColetiva;
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
