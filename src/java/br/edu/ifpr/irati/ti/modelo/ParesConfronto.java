
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.Proxy;

@Entity(name="paresconfronto")
@Proxy(lazy = false)
public class ParesConfronto implements Serializable{
    
    
    // FICAR DE OLHO!
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int idParConfronto;
    
    
    @Column(name="numParConfrontoRodada", nullable = true)
    private int numParConfrontoRodada;
    
    
    public ParesConfronto() {
        this.idParConfronto = 0;
        this.numParConfrontoRodada = 0;
    }

    public ParesConfronto(int idParConfronto, int numParConfrontoRodada) {
        this.idParConfronto = idParConfronto;
        this.numParConfrontoRodada = numParConfrontoRodada;
    }

    

    /**
     * @return the idParConfronto
     */
    public int getIdParConfronto() {
        return idParConfronto;
    }

    /**
     * @param idParConfronto the idParConfronto to set
     */
    public void setIdParConfronto(int idParConfronto) {
        this.idParConfronto = idParConfronto;
    }


    /**
     * @return the numParConfrontoRodada
     */
    public int getNumParConfrontoRodada() {
        return numParConfrontoRodada;
    }

    /**
     * @param numParConfrontoRodada the numParConfrontoRodada to set
     */
    public void setNumParConfrontoRodada(int numParConfrontoRodada) {
        this.numParConfrontoRodada = numParConfrontoRodada;
    }
    
    
    
    
    
    
}
