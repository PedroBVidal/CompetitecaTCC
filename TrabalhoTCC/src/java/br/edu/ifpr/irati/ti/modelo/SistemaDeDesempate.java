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
@Entity(name = "sistemadedesempate")
@Proxy(lazy = false)
public class SistemaDeDesempate implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idSistemaDeDesempate;
    
    @Column(name = "tipoDesempate", nullable = false)
    private String tipoDesempate;
    
    @Column(name = "tipoDesempateSecundario", nullable = false)
    private String tipoDesempateSecundario;

    public SistemaDeDesempate() {
        this.idSistemaDeDesempate = 0;
        this.tipoDesempate = "";
        this.tipoDesempateSecundario = "";
    }
    
    

    public SistemaDeDesempate(int idSistemaDeDesempate, String tipoDesempate, String tipoDesempateSecundario) {
        this.idSistemaDeDesempate = idSistemaDeDesempate;
        this.tipoDesempate = tipoDesempate;
        this.tipoDesempateSecundario = tipoDesempateSecundario;
    }



    public int getIdSistemaDeDesempate() {
        return idSistemaDeDesempate;
    }

    public void setIdSistemaDeDesempate(int idSistemaDeDesempate) {
        this.idSistemaDeDesempate = idSistemaDeDesempate;
    }

    public String getTipoDesempate() {
        return tipoDesempate;
    }

    public void setTipoDesempate(String tipoDesempate) {
        this.tipoDesempate = tipoDesempate;
    }

    public String getTipoDesempateSecundario() {
        return tipoDesempateSecundario;
    }

    public void setTipoDesempateSecundario(String tipoDesempateSecundario) {
        this.tipoDesempateSecundario = tipoDesempateSecundario;
    }

}
