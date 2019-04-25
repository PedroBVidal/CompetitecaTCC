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
 * @author user
 */
@Entity(name="local")
@Proxy(lazy = false)
public class Local implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int idLocal;
    
    @Column(name="nome", nullable = false)
    private String nome;
    
    @Column(name="endereco",nullable = false)
    private String endereco;
    @Column(name="numero",nullable=false)
    private int numero;
    @Column(name="cep", nullable=false)
    private String cep;
    @Column(name="estado", nullable=false)
    private String estado;
    @Column(name="cidade",nullable = false)
    private String cidade;
    @Column(name="bairro", nullable=false)
    private String bairro;

    public Local(int idLocal, String nome, String cep,String endereco, int numero, String bairro ,String cidade, String estado) {
        this.idLocal = idLocal;
        this.nome = nome;
        this.endereco = endereco;
        this.numero = numero;
        this.estado = estado;
        this.cidade = cidade;
        this.cep = cep;
        this.bairro = bairro;
    }
    public Local() {
        this.idLocal = 0;
        this.nome = "";
        this.endereco = "";
        this.cidade = "";
        this.estado = "";
        this.numero = 0;
        this.cep = "";
    }

    public int getIdLocal() {
        return idLocal;
    }

    public void setIdLocal(int idLocal) {
        this.idLocal = idLocal;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }
    
    
}
