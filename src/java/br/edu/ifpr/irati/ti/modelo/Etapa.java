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
import org.hibernate.annotations.Proxy;

/**
 *
 * @author Usuário
 */
@Entity(name="etapa")
@Proxy(lazy = false)
public class Etapa implements Serializable{
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    
    @Column(name="pontuacaoEquipe", nullable = true)
    private double pontuacaoEquipe;

    public Etapa() {
    }

    public Etapa(int id, double pontuacaoEquipe) {
        this.id = id;
        this.pontuacaoEquipe = pontuacaoEquipe;
    }

    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @return the pontuacaoEquipe
     */
    public double getPontuacaoEquipe() {
        return pontuacaoEquipe;
    }

    /**
     * @param pontuacaoEquipe the pontuacaoEquipe to set
     */
    public void setPontuacaoEquipe(double pontuacaoEquipe) {
        this.pontuacaoEquipe = pontuacaoEquipe;
    }
    
    
    
}
