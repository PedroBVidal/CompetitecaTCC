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
 * @author Aluno
 */
@Entity(name="sistemadecontagem")
@Proxy(lazy = false)
public class SistemaDeContagem implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idSistemaDeContagem;
    
    @Column(name="valorVitoria", nullable=false)
    private int valorVitoria;
    
    @Column(name="valorDerrota", nullable=false)
    private int valorDerrota;
    
    @Column(name="valorEmpate", nullable=false)
    private int valorEmpate;
    
    @Column(name="nome", nullable=false)
    private String nome;
    


    public SistemaDeContagem() {
        this.idSistemaDeContagem = 0;
        this.valorVitoria = 0;
        this.valorDerrota = 0;
        this.valorEmpate = 0;
        this.nome = "";
    }

    public SistemaDeContagem(int idSistemaDeContagem, int valorVitoria, int valorDerrota, int valorEmpate, String nome) {
        this.idSistemaDeContagem = idSistemaDeContagem;
        this.valorVitoria = valorVitoria;
        this.valorDerrota = valorDerrota;
        this.valorEmpate = valorEmpate;
        this.nome = nome;
    }

    
    

    
    
    public int getIdSistemaDeContagem() {
        return idSistemaDeContagem;
    }

    public void setIdSistemaDeContagem(int idSistemaDeContagem) {
        this.idSistemaDeContagem = idSistemaDeContagem;
    }

    public int getValorVitoria() {
        return valorVitoria;
    }

    public void setValorVitoria(int valorVitoria) {
        this.valorVitoria = valorVitoria;
    }

    public int getValorDerrota() {
        return valorDerrota;
    }

    public void setValorDerrota(int valorDerrota) {
        this.valorDerrota = valorDerrota;
    }

    public int getValorEmpate() {
        return valorEmpate;
    }

    public void setValorEmpate(int valorEmpate) {
        this.valorEmpate = valorEmpate;
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
