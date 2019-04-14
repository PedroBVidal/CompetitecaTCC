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


@Entity(name="segmento")
@Proxy(lazy = false)
public class Segmento implements Serializable {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idSegmento;
    
    @Column (name = "nome", nullable = false, length = 100)
    private String nome;

    public Segmento() {
    }

    public Segmento(int idSegmento, String nome) {
        this.idSegmento = idSegmento;
        this.nome = nome;
    }

    /**
     * @return the idSegmento
     */
    public int getIdSegmento() {
        return idSegmento;
    }

    /**
     * @param idSegmento the idSegmento to set
     */
    public void setIdSegmento(int idSegmento) {
        this.idSegmento = idSegmento;
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
    
    
    
}
