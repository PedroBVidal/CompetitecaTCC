
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import org.hibernate.annotations.Proxy;

@Entity(name="paresconfronto")
@Proxy(lazy = false)
public class ParesConfronto implements Serializable{
    
    
    // FICAR DE OLHO!
    @Id
    private int idParConfronto;
    
    @OneToMany
    private List<Confronto> confrontos;

    public ParesConfronto() {
        this.idParConfronto = 0;
        this.confrontos = new ArrayList<>();
    }

    public ParesConfronto(int idParConfronto, List<Confronto> confrontos) {
        this.idParConfronto = idParConfronto;
        this.confrontos = confrontos;
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
     * @return the confrontos
     */
    public List<Confronto> getConfrontos() {
        return confrontos;
    }

    /**
     * @param confrontos the confrontos to set
     */
    public void setConfrontos(List<Confronto> confrontos) {
        this.confrontos = confrontos;
    }
    
    
    
    
    
    
}
