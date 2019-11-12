
package br.edu.ifpr.irati.ti.modelo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Proxy;

@Entity(name="posicaochave")
@Proxy(lazy = false)
//Classe referente à posição da equipe em um determinado confronto. Existem duas posições possíveis 1 ou 2;
public class PosicaoChave implements Serializable {
    
    @Id
    @GeneratedValue (strategy = GenerationType.AUTO)
    private int id;
    
    @ManyToOne
    private Confronto confronto;
    
    @Column(name="posicaochave", nullable = true)
    private int posicaoChave;

    public PosicaoChave() {
    }

    public PosicaoChave(int id, Confronto confronto, int posicaoChave) {
        this.id = id;
        this.confronto = confronto;
        this.posicaoChave = posicaoChave;
    }

    
    
    public int getId() {
        return id;
    }


    public Confronto getConfronto() {
        return confronto;
    }


    public void setConfronto(Confronto confronto) {
        this.confronto = confronto;
    }


    public int getPosicaoChave() {
        return posicaoChave;
    }

    public void setPosicaoChave(int posicaoChave) {
        this.posicaoChave = posicaoChave;
    }
    
    
    
}
