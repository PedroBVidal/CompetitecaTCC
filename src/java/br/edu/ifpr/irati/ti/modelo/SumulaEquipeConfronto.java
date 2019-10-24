/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Proxy;
import org.hibernate.annotations.Type;

/**
 *
 * @author Usuário
 */
@Entity(name="sumulaequipeconfronto")
@Proxy(lazy = false)
public class SumulaEquipeConfronto implements Serializable{
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    
    @Column(name="equipeVencedora")
    @Type(type="true_false")
    private boolean equipeVencedora;
    
    @Column(name="pontuacaoFinal", nullable = true)
    private double pontuacaoFinal;
    
    @OneToMany(fetch = FetchType.LAZY)
    private List<Etapa> etapas;
    
    @ManyToOne
    private ConfrontoModalidadeColetiva confronto;

    public SumulaEquipeConfronto() {
    }

    public SumulaEquipeConfronto(int id, ConfrontoModalidadeColetiva confronto) {
        this.id = id;
        this.confronto = confronto;
    }

    public SumulaEquipeConfronto(int id, boolean equipeVencedora, double pontuacaoFinal, List<Etapa> etapas, ConfrontoModalidadeColetiva confronto) {
        this.id = id;
        this.equipeVencedora = equipeVencedora;
        this.pontuacaoFinal = pontuacaoFinal;
        this.etapas = etapas;
        this.confronto = confronto;
    }

    
    
    public void adicionarEtapa(Etapa etapa){
        this.getEtapas().add(etapa);
    }
    
    public void removerEtapa(Etapa etapa){
        this.getEtapas().remove(etapa);
    }
    
    public void removerTodasEtapas(){
        this.getEtapas().removeAll(getEtapas());
    }
    
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @return the equipeVencedora
     */
    public boolean isEquipeVencedora() {
        return equipeVencedora;
    }

    /**
     * @param equipeVencedora the equipeVencedora to set
     */
    public void setEquipeVencedora(boolean equipeVencedora) {
        this.equipeVencedora = equipeVencedora;
    }

    /**
     * @return the pontuacaoFinal
     */
    public double getPontuacaoFinal() {
        return pontuacaoFinal;
    }

    /**
     * @param pontuacaoFinal the pontuacaoFinal to set
     */
    public void setPontuacaoFinal(double pontuacaoFinal) {
        this.pontuacaoFinal = pontuacaoFinal;
    }

    

    /**
     * @return the confronto
     */
    public ConfrontoModalidadeColetiva getConfronto() {
        return confronto;
    }

    /**
     * @param confronto the confronto to set
     */
    public void setConfronto(ConfrontoModalidadeColetiva confronto) {
        this.confronto = confronto;
    }

    /**
     * @return the etapas
     */
    public List<Etapa> getEtapas() {
        return etapas;
    }

    /**
     * @param etapas the etapas to set
     */
    public void setEtapas(List<Etapa> etapas) {
        this.etapas = etapas;
    }
    
    
    
    
    
}
