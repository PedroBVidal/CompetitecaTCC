/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Proxy;

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
    @JoinColumn(name = "competicaoModalidadeColetiva_idCompeticaoModalidade")
    private CompeticaoModalidadeColetiva competicaoModalidadeColetiva;
    
    @ManyToOne
    @JoinColumn(name = "equipe_idEquipe")
    private Equipe equipe;
    
    @ManyToMany(fetch = FetchType.EAGER)
    private List<Atleta> atletas;
    
    
    @Column(name = "aprovada")
    private char inscricaoAceita; 

    public InscricaoCompeticaoColetiva() {
        idCompeticaoColetiva = 0;
        equipe = new Equipe();
        inscricaoAceita = ' ';
        competicaoModalidadeColetiva = new CompeticaoModalidadeColetiva();
        atletas = new ArrayList<>();
    }

    public InscricaoCompeticaoColetiva(int idCompeticaoColetiva, CompeticaoModalidadeColetiva competicaoModalidadeColetiva, Equipe equipe, List<Atleta> atletas, char inscricaoAceita) {
        this.idCompeticaoColetiva = idCompeticaoColetiva;
        this.competicaoModalidadeColetiva = competicaoModalidadeColetiva;
        this.equipe = equipe;
        this.inscricaoAceita = inscricaoAceita;
        this.atletas = atletas;
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
     * @return the competicaoModalidadeColetiva
     */
    public CompeticaoModalidadeColetiva getCompeticaoModalidadeColetiva() {
        return competicaoModalidadeColetiva;
    }

    /**
     * @param competicaoModalidadeColetiva the competicaoModalidadeColetiva to set
     */
    public void setCompeticaoModalidadeColetiva(CompeticaoModalidadeColetiva competicaoModalidadeColetiva) {
        this.competicaoModalidadeColetiva = competicaoModalidadeColetiva;
    }

    public List<Atleta> getAtletas() {
        return atletas;
    }

    public void setAtletas(List<Atleta> atletas) {
        this.atletas = atletas;
    }


    
    
    
}
